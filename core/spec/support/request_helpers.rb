module RequestHelpers
  def current_user
    @user ||= Catarse::User.where(uid: 'fake_login').first
  end
end

RSpec.configure do |config|
  config.include RequestHelpers, type: :request
  config.include Catarse::Core::Engine.routes.url_helpers, type: :request
end
