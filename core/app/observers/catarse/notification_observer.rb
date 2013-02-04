module Catarse
class NotificationObserver < ActiveRecord::Observer
  def after_create(notification)
    notification.send_email
  end
end
end
