include_recipe "git"
include_recipe "runit"

package "git-daemon" do
  case node[:platform]
  when "centos"
    package_name "git-daemon"
  when "ubuntu"
    package_name "git-daemon-run"
  end
  action :install
end

runit_service "git-daemon" do
  sv_templates false
end
