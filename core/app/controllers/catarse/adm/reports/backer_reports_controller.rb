module Catarse
  class Adm::Reports::BackerReportsController < Catarse::Adm::Reports::BaseController
    def end_of_association_chain
      super.where(project_id: params[:project_id])
    end
  end
end
