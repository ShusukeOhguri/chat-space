require 'spec_helper'
require 'devise'
require 'rspec/rails'
require File.expand_path("spec/support/controller_macros.rb")

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include ControllerMacros, type: :controller
end

