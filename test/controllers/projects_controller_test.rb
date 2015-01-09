require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test '#index' do
    project = Project.create!(name: 'New', description: 'Cool',
                              tech: 'Rails', url: 'project.com')
    get :index
    assert_response :success
    assert assigns(:projects)
  end

  test '#new' do
    get :new
    assert_response :success
    assert assigns(:project)
  end
end
