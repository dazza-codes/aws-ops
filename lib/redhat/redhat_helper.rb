
# Bash commands for Redhat system packages etc.
class RedhatHelper

  attr_reader :current_path
  attr_reader :log_path
  attr_reader :script_path

  def initialize(current_path)
    @current_path = current_path
    @log_path = "#{current_path}/log/redhat"
    @script_path = "#{current_path}/lib/bash/redhat"
  end

  # yum update
  def yum_update
    "yum -y -q update > #{log_path}/yum_update.log 2>&1"
  end

  # yum upgrade
  def yum_upgrade
    "yum -y -q upgrade > #{log_path}/yum_upgrade.log 2>&1"
  end

  # yum auto remove
  def yum_auto_remove
    "yum -y -q autoremove > #{log_path}/yum_auto_remove.log 2>&1"
  end

  # def build
  #   "#{script_path}/build.sh > #{log_path}/build.log"
  # end
  #
  # def ctags
  #   "#{script_path}/ctags.sh > #{log_path}/ctags.log"
  # end
  #
  # def docker_add_user
  #   'sudo usermod -a -G docker $USER'
  # end
  #
  # def docker_ce
  #   "#{script_path}/docker_ce.sh > #{log_path}/docker_ce.log"
  # end
  #
  # def docker_hello_world
  #   "docker run hello-world | grep -A1 'Hello.*Docker'"
  # end
  #
  # def git
  #   "#{script_path}/git.sh > #{log_path}/git.log"
  # end
  #
  # def gradle
  #   "#{script_path}/gradle.sh > #{log_path}/gradle.log"
  # end
  #
  # def htop
  #   "#{script_path}/htop.sh > #{log_path}/htop.log"
  # end
  #
  # def java_oracle_license
  #   "#{script_path}/java_oracle_license.sh > #{log_path}/java_oracle_license.log"
  # end
  #
  # def java_oracle_repository
  #   "#{script_path}/java_oracle_repository.sh > #{log_path}/java_oracle_repository.log"
  # end
  #
  # def java_7_oracle
  #   "#{script_path}/java_7_oracle.sh > #{log_path}/java_7_oracle.log"
  # end
  #
  # def java_8_oracle
  #   "#{script_path}/java_8_oracle.sh > #{log_path}/java_8_oracle.log"
  # end
  #
  # def kafka_bin(kafka_ver = '')
  #   "#{script_path}/kafka_bin.sh #{kafka_ver} > #{log_path}/kafka_bin.log"
  # end
  #
  # def log_path_files
  #   "find #{log_path} -type f"
  # end
  #
  # def maven
  #   "#{script_path}/maven.sh > #{log_path}/maven.log"
  # end
  #
  # def network_tools
  #   "#{script_path}/network_tools.sh > #{log_path}/network_tools.log"
  # end

  def sbt
    "#{script_path}/sbt.sh > #{log_path}/sbt.log"
  end

  # def zookeeper
  #   "#{script_path}/zookeeper.sh > #{log_path}/zookeeper.log"
  # end
  #
  # def zookeeper_upgrade
  #   "yum install -y -q --only-upgrade zookeeper > #{log_path}/zookeeper_upgrade.log"
  # end

end

