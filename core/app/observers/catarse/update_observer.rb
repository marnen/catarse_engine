class Catarse::UpdateObserver < ActiveRecord::Observer
  def after_create(update)
    NotifyUpdateWorker.perform_in(5.seconds, update.id)
  end
end
