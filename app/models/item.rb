class Item < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  validates_presence_of :title
  validates_inclusion_of :status, :in => ['Held', 'Checked out', 'Overdue', 'Returned', 'Ready for pickup'], :allow_nil => true
end
