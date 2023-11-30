class ContactController < ApplicationController
  class ContactController < ApplicationController
    def new
      @contact = Contact.new
    end
  
    def create
      @contact = Contact.new(contact_params)
      if @contact.valid?
        # You can add logic here to send an email or store the contact information
        # For now, let's just print the information to the console
        puts "Email: #{@contact.email}"
        puts "Description: #{@contact.description}"
        redirect_to root_path, notice: "Message sent successfully!"
      else
        render :new
      end
    end
  
    private
  
    def contact_params
      params.require(:contact).permit(:email, :description)
    end
  end
end
