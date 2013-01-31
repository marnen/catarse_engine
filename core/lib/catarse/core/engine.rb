module Catarse
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Catarse

      config.autoload_paths += %W(#{config.root}/lib #{config.root}/lib/** #{config.root}/app/presenters #{config.root}/app/presenters/** #{config.root}/app/business/ #{config.root}/app/business/**)

      config.after_initialize do
        Rails.application.routes_reloader.reload!
      end

    end
  end
end

