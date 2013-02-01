class Catarse::Adm::Reports::BaseController < Catarse::Adm::BaseController
  inherit_resources
  responders :csv
  respond_to :csv
  actions :index
end
