class Effort < ActiveRecord::Base
  belongs_to :user
  belongs_to :task
  attr_accessible :from, :to, :description, :task_id, :user_id, :paid_at

  scope :unpaid, where(:paid_at => nil)

  def ammount
    if self.to and self.from 
      then ((self.to - self.from) / 1.hour).round(2)
      else 0
    end
  end

  def span
    self.from.to_formatted_s(:short) + " - " + self.to.to_formatted_s(:short)
  end

  def user
    User.find(self.user_id).email if self.user_id
  end

  # DOES NOT WORK! use draper...
  def mark_as_paid_button
    @template.button_to 'Mark as paid', mark_as_paid_effort_path(self, :uid => self.id), :method => :post, data: { confirm: 'Are you sure?' }
  end
end
