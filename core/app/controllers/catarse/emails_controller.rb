module Catarse
class EmailsController < BaseController
  def index
    render :text => 'teste', :layout => 'email'
  end
end
end
