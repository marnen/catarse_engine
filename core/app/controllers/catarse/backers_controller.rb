module Catarse
class BackersController < BaseController
  inherit_resources
  defaults :resource_class => Backer, :collection_name => 'backs', :instance_name => 'back'
  belongs_to :user, :parent_class => User
  actions :index
  respond_to :json, :only => [:index]

  def index
    index! do |format|
      format.json{ return render :json => @backs.includes(:user, :reward, project: [:user, :category, :project_total]).to_json({:include_project => true, :can_manage => (can? :manage, @user)}) }
      format.html{ return render :nothing => true, :status => 404 }
    end
  end

  protected
  def collection
    @backs = end_of_association_chain.confirmed.order("confirmed_at DESC")
    @backs = @backs.not_anonymous unless @user == current_user or (current_user and current_user.admin)
    @backs = @backs.page(params[:page]).per(10)
  end
end
end
