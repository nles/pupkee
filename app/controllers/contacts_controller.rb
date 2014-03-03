class ContactsController < InheritedResources::Base
  before_filter :authenticate_user!
  respond_to :html

  def index
    @contacts = Contact.order("date DESC");
    index!
  end
end
