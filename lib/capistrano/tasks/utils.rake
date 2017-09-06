# Capistrano task utility methods
# various capistrano variables should be accessible to these methods

def client_port
  host_settings['client_port']
end

def host_settings
  # the `host` object should be accessible to this method
  Settings.aws[host.hostname]
end

def install_java7
  sudo(ubuntu_helper.java_oracle_license)
  sudo(ubuntu_helper.java_7_oracle)
end

def install_java8
  sudo(ubuntu_helper.java_oracle_license)
  sudo(ubuntu_helper.java_8_oracle)
end

def ubuntu_helper
  # the `current_path` should be accessible to this method
  @ubuntu_helper ||= begin
    helper = UbuntuHelper.new(current_path)
    execute("mkdir -p #{helper.log_path}")
    helper
  end
end

# PRIVATE IPs for the /etc/hosts file with zookeeper nodes
# This utility method may be used by any services that depend on zookeeper.
# The PRIVATE IPs should persist when instances are stopped and restarted.
def zookeeper_etc_hosts
  zk_private_hosts = ZookeeperHelpers.manager.etc_hosts(false)
  # remove any existing server entries in /etc/hosts
  sudo("sed -i -e '/BEGIN_ZOO_SERVERS/,/END_ZOO_SERVERS/{ d; }' /etc/hosts")
  # append new entries to the /etc/hosts file (one line at a time)
  sudo("echo '### BEGIN_ZOO_SERVERS' | sudo tee -a /etc/hosts > /dev/null")
  zk_private_hosts.each do |etc_host|
    sudo("echo '#{etc_host}' | sudo tee -a /etc/hosts > /dev/null")
  end
  sudo("echo '### END_ZOO_SERVERS' | sudo tee -a /etc/hosts > /dev/null")
end

