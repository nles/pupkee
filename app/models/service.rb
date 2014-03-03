class Service < ActiveRecord::Base
  has_and_belongs_to_many :customers
  attr_accessible :details, :name
end
