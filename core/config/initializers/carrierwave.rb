CarrierWave.configure do |config|
  if Rails.env.production? and Catarse::Configuration[:aws_access_key]
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => Catarse::Configuration[:aws_access_key],
      :aws_secret_access_key  => Catarse::Configuration[:aws_secret_key]
    }
    config.fog_directory  = Catarse::Configuration[:aws_bucket]
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  else
    config.enable_processing = false if Rails.env.test? or Rails.env.cucumber?
  end
end
