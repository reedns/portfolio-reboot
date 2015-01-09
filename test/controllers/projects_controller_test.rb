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

  test 'valid #create' do
    assert_difference('Project.count') do
      post :create,  project: attributes_for(:project)
    end

    assert_redirected_to projects_path
    assert_equal 'Success! New project created.', flash[:notice]
  end

  test 'invalid #create' do
    assert_no_difference('Project.count') do
      post :create, project: attributes_for(:invalid_project)
    end

    assert_template :new
    assert_equal 'Oops! Please fix the errors below.', flash[:error]
  end

  test '#edit' do
    project = create(:project)

    get :edit, id: project.id
    assert_response :success
    assert assigns(:project)
  end

  test 'valid #update' do
    project = create(:project)

    patch :update, id: project.id, project: { name: 'Best Project', tech: 'Rails'}
    assert_equal 'Best Project', project.reload.name
    assert_equal 'Rails', project.reload.tech
    assert_redirected_to projects_path
    assert_equal 'Success! Project updated.', flash[:notice]
  end

  test 'invalid #update' do
    project = create(:project)

    patch :update, id: project.id, project: { name: nil}
    assert_equal project.name, project.reload.name
    assert_template :edit
    assert_equal 'Oops! Please fix the errors below.', flash[:error]
  end
end





