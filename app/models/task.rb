class Task < ActiveRecord::Base
  has_and_belongs_to_many :contacts
  has_and_belongs_to_many :users
  belongs_to :customer
  attr_accessible :deadline, :details, :end, :start, :title, :customer_id, :contact_ids, :user_ids, :flag, :done, :billed

  def customer_name
    self.customer.name if self.customer
  end
end
