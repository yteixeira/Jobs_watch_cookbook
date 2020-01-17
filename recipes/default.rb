
apt_update "update" do
  action :update
end

package 'python3-pip'

execute 'requirements.txt' do
  cwd '/home/ubuntu'
  command 'pip3 install -r job-watch/requirements.txt'
end

directory 'Downloads' do
  path '/home/vagrant/Downloads'
  action :create
end

file 'top30file' do
  path '/home/vagrant/Downloads/ItJobsWatchTop30.csv'
  action :create
end
