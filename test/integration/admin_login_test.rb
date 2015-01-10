require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
  test 'admin logs in' do
    jimbo = create(:admin)
    visit(root_path)
    click_link('Sign in')
    fill_in 'Username', with: jimbo.username
    fill_in 'Password', with: jimbo.password
    click_button('Sign In')
    assert page.has_content?('Success! You are signed in.')
  end
end
