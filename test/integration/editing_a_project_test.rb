require 'test_helper'

class EditingAProjectTest < ActionDispatch::IntegrationTest
 test 'admin can delete a project' do
    mary = create(:admin)
    admin_sign_in(mary)

    visit projects_path
    Capybara.match = :first
    click_link('Edit')
    fill_in 'Project name', with: 'Crazy Project'
    click_button 'Update'

    assert page.has_content?('Crazy Project')

    click_link('Sign Out')
  end
end
