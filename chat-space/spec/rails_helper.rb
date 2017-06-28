# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
RSpec.configure do |config|
  #下記の記述を追加
  config.include FactoryGirl::Syntax::Methods

  #省略

end
