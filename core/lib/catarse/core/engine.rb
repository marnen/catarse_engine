module Catarse
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Catarse

      YAML::ENGINE.yamler = 'syck' if defined?(YAML::ENGINE)

      initializer :assets do |config|
        Rails.application.config.assets.precompile += %w( catarse.js catarse.css )
      end

      config.autoload_paths += %W(#{config.root}/lib #{config.root}/lib/** #{config.root}/app/presenters #{config.root}/app/presenters/** #{config.root}/app/business/ #{config.root}/app/business/**)

      config.after_initialize do
        Rails.application.routes_reloader.reload!
      end

      config.active_record.observers = ['catarse/backer_observer',
                                        'catarse/user_observer',
                                        'catarse/notification_observer',
                                        'catarse/update_observer',
                                        'catarse/project_observer',
                                        'catarse/payment_notification_observer']

    end
  end
end

