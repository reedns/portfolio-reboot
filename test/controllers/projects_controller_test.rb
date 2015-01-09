require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test '#index' do
    project = create(:project)

    get :index
    assert_response :success
    assert assigns(:projects)
  end

  test '#new' do
    get :new
    assert_response :success
    assert assigns(:project)
  end

  test 'with valid attributes #create should create a project' do
    assert_difference('Project.count') do
      post :create,  project: attributes_for(:project)
    end

    assert_redirected_to projects_path
    assert_equal 'Success! New project created.', flash[:notice]
  end

  test 'without valid attributes #create should not create a new project' do
    assert_no_difference('Project.count') do
      post :create, project: attributes_for(:invalid_project)
    end

    assert_template :new
    assert_equal 'Oops! Please fix errors below.', flash[:error]
  end
end
