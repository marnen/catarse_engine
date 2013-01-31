if Rails.env.production?
  Catarse::Core::Engine.routes.default_url_options = {host: Catarse::Configuration[:host]}
else
  Catarse::Core::Engine.routes.default_url_options = {host: 'localhost:3000'}
end
