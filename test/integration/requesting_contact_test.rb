require 'test_helper'

class RequestingContactTest < ActionDispatch::IntegrationTest
  test 'site visitor requests contact' do
    visit(root_path)

    click_link 'Contact'

    fill_in 'Name', with: 'John Doe'
    fill_in 'Email', with: 'jd@example.com'
    fill_in 'Message', with: 'Hi I would like to talk more'

    assert_difference('Contact.count') do
      click_button 'Send Message'
    end

    assert page.has_content?('Your email was sent!')
    assert_equal page.current_path, root_path
  end

  test 'site visitor requests contact with missing fields' do
    visit root_path

    click_link 'Contact'

    assert_no_difference('Contact.count') do
      click_button 'Send Message'
    end

    assert page.has_content?('Please fix these errors:')
  end
end
