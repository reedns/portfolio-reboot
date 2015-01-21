class ContactsMailer < ApplicationMailer
  def contact_email(contact)
    @contact = contact

    mail(
      from: @contact.email,
      to: 'reedness3000@gmail.com',
      subject: 'Someone has contacted you!'
    )
  end
end
