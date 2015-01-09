require 'test_helper'

class VisitFrontPageTest < ActionDispatch::IntegrationTest
  test 'visit front page and use nav bar' do
    visit(root_path)
    assert page.has_content?('Reed Nelson-Saunders')

    click_link('Projects')
    assert_equal page.current_path, projects_path

    click_link('About')
    assert page.current_path, root_path
  end
end
