require 'test_helper'

class CreatingAProjectTest < ActionDispatch::IntegrationTest
  test 'admin creates a new project' do
    sally = create(:admin)
    admin_sign_in(sally)
    click_link 'Projects'
    click_link 'New Project'
    fill_in 'Project name', with: 'Fun project'
    fill_in 'Technologies used', with: 'Rails'
    fill_in 'Project URL', with: 'www.project.com'
    fill_in 'Project description', with: 'I made a project that is fun!'

    assert_difference('Project.count') do
      click_button 'Create Project'
    end

    click_link 'Sign Out'
  end

  test 'only the admin can see link to create a new project' do
    visit root_path
    click_link 'Projects'
    assert page.has_no_content?('New Project')
  end
end
