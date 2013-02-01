class Catarse::UserObserver < ActiveRecord::Observer
  def before_save(user)
    user.fix_twitter_user
  end
end
