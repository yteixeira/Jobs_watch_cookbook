#
# Cookbook:: it-job-watch
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'it-job-watch::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md

    let(:chef_run) do
     # for a complete list of available platforms and versions see:
     # https://github.com/customink/fauxhai/blob/master/PLATFORMS.md
     runner = ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '18.04')
     runner.converge(described_recipe)
    end

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'should update'do
      expect(chef_run).to update_apt_update('update')
    end

    it 'should install pip' do
      expect(chef_run).to install_package('python3-pip')
    end

    it 'should install requirements' do
      expect(chef_run).to run_execute('requirements.txt')
    end

    it 'should create downloads folder' do
      expect(chef_run).to create_directory('/home/vagrant/Downloads')
    end

    it 'should create top30 file ' do
      expect(chef_run).to create_file('/home/vagrant/Downloads/ItJobsWatchTop30.csv')
    end

  end
end
