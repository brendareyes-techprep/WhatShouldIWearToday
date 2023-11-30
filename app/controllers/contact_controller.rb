class ContactController < ApplicationController
  class ContactController < ApplicationController
    def new
      @contact = Contact.new
    end
  
    def create
      @contact = Contact.new(contact_params)
      if @contact.save
        ContactMailer.contact_email(@contact).deliver_now
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
