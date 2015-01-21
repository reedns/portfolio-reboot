require 'test_helper'

class ContactsMailerTest < ActionMailer::TestCase
  test 'contact email' do
    contact = create(:contact)
    email = ContactsMailer.contact_email(contact).deliver_now

    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal [contact.email], email.from
    assert_equal [ENV['CONTACT_EMAIL']] , email.to
    assert_equal 'Someone has contacted you!', email.subject
  end
end
