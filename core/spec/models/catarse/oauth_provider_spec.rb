require 'spec_helper'

describe Catarse::OauthProvider do
  describe "Associations" do
    it{ should have_many :authorizations }
  end
end
