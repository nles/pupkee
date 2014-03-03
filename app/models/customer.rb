class Customer < ActiveRecord::Base
  has_and_belongs_to_many :services
  has_many :contacts
  has_many :tasks
  attr_accessible :address, :contact_person, :details, :email, :name, :phone, :town, :website, :service_ids
end
