class Contact < ActiveRecord::Base
  has_and_belongs_to_many :tasks
  belongs_to :customer
  attr_accessible :date, :details, :task_ids, :customer_id

  validates :customer_id, :presence => true

  def tasks_list
    self.tasks.map{|t| t.title }.join(", ")
  end
end
