require 'spec_helper'

describe 'nodejs_app' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "nodejs_app class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('nodejs_app::params') }
          it { is_expected.to contain_class('nodejs_app::install').that_comes_before('nodejs_app::config') }
          it { is_expected.to contain_class('nodejs_app::config') }
          it { is_expected.to contain_class('nodejs_app::service').that_subscribes_to('nodejs_app::config') }

          it { is_expected.to contain_service('nodejs_app') }
          it { is_expected.to contain_package('nodejs_app').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'nodejs_app class without any parameters on Solaris/Nexenta' do
      let(:facts) do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it { expect { is_expected.to contain_package('nodejs_app') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
