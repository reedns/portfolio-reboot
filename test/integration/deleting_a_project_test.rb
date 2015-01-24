require 'test_helper'

class DeletingAProjectTest < ActionDispatch::IntegrationTest
  test 'admin can delete a project' do
    project = create(:project)
    john = create(:admin)

    admin_sign_in(john)


    visit projects_path

    assert_difference('Project.count', difference = -1) do
      Capybara.match = :first
      click_link('Delete')
    end

    click_link('Sign Out')
  end
end
