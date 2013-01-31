Airbrake.configure do |config|
  config.api_key = Catarse::Configuration[:airbrake_key] if Catarse::Configuration[:airbrake_key].present?
  config.host    = Catarse::Configuration[:airbrake_host] if Catarse::Configuration[:airbrake_host].present?
end
