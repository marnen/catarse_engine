module Catarse
class Adm::FinancialsController < Catarse::Adm::BaseController
  inherit_resources
  defaults  resource_class: Project, collection_name: 'projects', instance_name: 'project'
  menu I18n.t("catarse.adm.financials.index.menu") => Catarse::Core::Engine.routes.url_helpers.adm_financials_path
  has_scope :by_permalink, :name_contains, :user_name_contains, :financial
  actions :index

  def collection
    @search = apply_scopes(Project).includes(:project_total, :user)
    @projects = @search.order("CASE state WHEN 'successful' THEN 1 WHEN 'waiting_funds' THEN 2 ELSE 3 END, expires_at::date").page(params[:page])
  end
end
end
