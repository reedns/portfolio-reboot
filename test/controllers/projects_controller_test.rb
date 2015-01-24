require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test '#index' do
    project = create(:project)

    get :index
    assert_response :success
    assert assigns(:projects)
  end

  test '#new' do
    set_admin

    get :new
    assert_response :success
    assert assigns(:project)
  end

  test 'valid and authenticated #create' do
    set_admin

    assert_difference('Project.count') do
      post :create,  project: attributes_for(:project)
    end

    assert_redirected_to projects_path
    assert_equal 'Success! New project created.', flash[:notice]
  end

  test 'invalid and authenticated #create' do
    set_admin

    assert_no_difference('Project.count') do
      post :create, project: attributes_for(:invalid_project)
    end

    assert_template :new
    assert_equal 'Oops! Please fix the errors below.', flash[:error]
  end

  test 'unauthenticated #create' do
    assert_no_difference('Project.count') do
      post :create, project: attributes_for(:project)
    end
    assert_equal 'You must be an admin to do that.', flash[:error]
  end

  test '#edit' do
    project = create(:project)
    set_admin

    get :edit, id: project.id
    assert_response :success
    assert assigns(:project)
  end

  test 'valid #update' do
    project = create(:project)
    set_admin

    patch :update, id: project.id, project: { name: 'Best Project', tech: 'Rails'}
    assert_equal 'Best Project', project.reload.name
    assert_equal 'Rails', project.reload.tech
    assert_redirected_to projects_path
    assert_equal 'Success! Project updated.', flash[:notice]
  end

  test 'invalid #update' do
    project = create(:project)
    set_admin

    patch :update, id: project.id, project: { name: nil}
    assert_equal project.name, project.reload.name
    assert_template :edit
    assert_equal 'Oops! Please fix the errors below.', flash[:error]
  end

  test '#destroy' do
    project = create(:project)
    set_admin

    assert_difference('Project.count', difference = -1) do
      delete :destroy, id: project.id
    end
    assert_redirected_to projects_path
    assert_equal 'Success! Project deleted.', flash[:notice]
  end
end
