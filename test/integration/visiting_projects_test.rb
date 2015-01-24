require 'test_helper'

class VisitingProjectsTest < ActionDispatch::IntegrationTest
  test 'visiting the projects index page' do
    project = create(:project)

    visit root_path

    click_link 'Projects'
    assert page.has_content?(project.name)
    assert page.has_content?(project.url)
  end
end
