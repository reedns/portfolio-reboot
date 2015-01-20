require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def setup
    @sally = create(:admin)
  end

  test 'valid #create' do
    post :create, username: @sally.username, password: @sally.password
    assert_redirected_to root_path
    assert_equal @sally.id, session[:admin_id]
    assert_equal 'Success! You are signed in.', flash[:notice]
  end

  test 'invalid #create' do
    post :create, username: @sally.username, password: 'password'
    assert_template :new
    assert_not_equal @sally.id, session[:admin_id]
    assert_equal 'Oops! Looks like your username or password were incorrect.', flash[:error]
  end
end
