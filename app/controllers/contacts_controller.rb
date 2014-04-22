class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash.now[:success] = I18n.t :success, :scope => [:contact, :create]
      redirect_to contacts_path
    else
      flash.now[:fail] = I18n.t :fail, :scope => [:contact, :create]
      render "new"
    end
  end
  def index
   @contacts = Contact.all
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def show
    
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url }
  end
  end

  def update
    @contact = Contact.find(params[:id])
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to root_path, notice: 'Contact form was successfully updated'}
      else
        format.html {render action: 'edit'}
      end
    end
  end
  def new
  @contact = Contact.new
  end
  def contact_params
    params.require(:contact).permit(:designation, :person, :telephone, :email)
  end
end
