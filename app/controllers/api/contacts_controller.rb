class Api::ContactsController < ApplicationController
  def create
    @contact = ContactForm.new_with_model
    @contact.submit params[:contact]
    if @contact.save
      redirect_to root_path(contact: :success), flash: :success
    else
      redirect_to root_path, flash: :error
    end
  end
end
