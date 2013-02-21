module Catarse
class Reports::BaseController < Catarse::BaseController
  inherit_resources
  responders :csv
  respond_to :csv
  actions :index
end
end
