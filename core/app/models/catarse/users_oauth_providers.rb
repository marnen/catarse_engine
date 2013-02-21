module Catarse
class UsersOauthProviders < ActiveRecord::Base
  attr_accessible :oauth_provider, :uid, :user_id
end
end
