ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end

def admin_sign_in(admin)
  visit(root_path)
  click_link('Sign In')
  fill_in 'Username', with: admin.username
  fill_in 'Password', with: admin.password
  click_button('Sign In')
end

def set_admin
  admin = create(:admin)
  session[:admin_id] = admin.id
end
