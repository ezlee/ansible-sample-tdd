require 'spec_helper'

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled   }
  it { should be_running   }
end

describe package('firewalld') do
  it { should be_installed }
end

describe service('firewalld') do
  it { should be_enabled   }
  it { should be_running   }
end

describe port(property['www_port']) do
  it { should be_listening }
end

describe file('/etc/nginx/nginx.conf') do
  it { should be_file }
  it { should contain "worker_connections  #{property['worker_connections']};" }
end
