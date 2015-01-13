require 'test_helper'

class AdminLoginTest < ActionDispatch::IntegrationTest
  setup do
    jimbo = create(:admin)
    admin_sign_in(jimbo)
  end

  test 'admin logs in' do
    assert page.has_content?('Success! You are signed in.')
    click_link 'Sign Out'
  end

  test 'admin signs out' do
    click_link 'Sign Out'
    assert page.has_content?('Success! You are signed out.')
  end
end
