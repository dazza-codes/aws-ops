require_relative 'kafka_manager_helpers'

# Kafka Manager Installation
# https://github.com/yahoo/kafka-manager
#
namespace :kafka_manager do
  namespace :service do
    def install_kafka_manager
      install_java8
      sudo(ubuntu_helper.upstart)
      sudo(ubuntu_helper.kafka_manager)
    end

    desc 'Install Kafka Manager service'
    task :install do
      on roles(:kafka_manager), in: :parallel do |host|
        install_kafka_manager
        # reboot to enable the upstart service
        KafkaManagerHelpers.manager.reboot_node(host_settings)
      end
    end
  end
end
