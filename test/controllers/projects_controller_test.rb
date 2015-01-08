require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  test 'should get index' do
    project = Project.new(name: 'New', description: 'Cool',
                          tech: 'Rails', url: 'project.com')
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end
end
