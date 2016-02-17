class Admin::ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = ContactForm.new_with_model
    if @contact.submit params[:contact]
      redirect_to show_contacts_path(@contact.slug), flash: :success
    else
      render action: :new
    end
  end

  def edit
    @contact = ContactForm.find_with_model params[:id]
  end

  def update
    @contact = ContactForm.find_with_model params[:id]
    if @contact.submit params[:contact]
      redirect_to show_contacts_path(@contact.slug), flash: :success
    else
      render action: :edit
    end
  end

  def destroy
    @contact = Contact.find params[:id]
    @contact.destroy
    redirect_to admin_contacts_path, flash: :success
  end
end
