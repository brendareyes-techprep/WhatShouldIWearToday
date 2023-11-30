class ContactMailer < ApplicationMailer
  def contact_email(contact)
    @contact = contact
    mail(to: 'brereyes2@gmail.com', subject: 'New Contact Form Submitted')
  end
end
