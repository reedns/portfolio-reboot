class ContactsMailer < ApplicationMailer
  def contact_email(contact)
    @contact = contact

    mail(
      from: @contact.email,
      to: ENV['CONTACT_EMAIL'],
      subject: 'Someone has contacted you!'
    )
  end
end
