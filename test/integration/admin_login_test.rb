require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
  test 'admin logs in' do
    jimbo = create(:user)
    visit(root_path)
    click_link('Sign in')
    fill_in 'Username', with: jimbo.username
    fill_in 'Password', with: jimbo.password

    assert page.has_content?('Welcome Reed')
  end
end
