class Item < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  validates_presence_of :title
  validates_inclusion_of :status, :in => %w(held checked_out overdue returned), :allow_nil => true
end
