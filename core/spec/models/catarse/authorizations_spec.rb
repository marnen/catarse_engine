require 'spec_helper'

describe Catarse::Authorization do
  it{ should belong_to :user }
  it{ should belong_to :oauth_provider }
end
