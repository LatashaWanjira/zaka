# frozen_string_literal: true

class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new
    @contact.request = request
    respond_to do |format|
      if @contact.deliver
        # re-initialize Contacts object for cleared form
        @contact = Contacts.new
        redirect_to '/'
        format.js   { flash.now[:success] = @message = "Thank you for your message. I'll get back to you soon!" }
      else
        redirect_to '/'
        format.js   { flash.now[:error] = @message = 'Message did not send.' }
      end
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :nessage, :nickname)
  end
end
