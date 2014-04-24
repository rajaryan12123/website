class ContactsController < ApplicationController
  before_action :load_tweet

  def new
    @title = 'Contact Us | Synergy Software Solutions Pte Ltd'
    @contact = Contact.new
  end

  def create
    @title = 'Contact Us | Synergy Software Solutions Pte Ltd'
    @contact = Contact.new params[:contact]
    #@contact.message = @contact.message[0..290]
    if @contact.valid?
      @contact.notify
      redirect_to thankyou_path and return
      #send_mail and display thankyou page
    else
      render 'new'
    end
  end
end
