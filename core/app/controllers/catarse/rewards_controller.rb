module Catarse
class RewardsController < BaseController
  load_and_authorize_resource :class => :reward
  inherit_resources
  actions :index, :create, :update, :destroy
  respond_to :html, :json

  def index
    @rewards = Reward.find_by_project_id(params[:project_id])
    render :json => @rewards
  end

  def show
    @reward = Reward.find params[:id]
    render json: @reward.to_json
  end

  def update
    update! do |format|
      format.html { redirect_to project_by_slug_path(permalink: resource.project.permalink) }
      format.json { render json: resource.to_json }
    end
  end

  def create
    create! do |success, failure|
      success.html { flash[:notice] = I18n.t('catarse.controllers.rewards.create.notice') }
      failure.html { flash[:alert] = I18n.t('catarse.controllers.rewards.create.alert') }
      return redirect_to project_by_slug_path(permalink: resource.project.permalink)
    end
  end

  def destroy
    destroy! { project_by_slug_path(permalink: resource.project.permalink) }
  end

  protected

  def begin_of_association_chain
    unless action_name == 'show'
      Project.find(params[:project_id])
    end
  end

end
end
