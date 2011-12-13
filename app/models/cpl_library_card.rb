class CplLibraryCard < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :number
  validates_length_of :number, :is => 10
  validates_format_of :number, :with => /[A-Za-z]\d{9}/
  validates_presence_of :zip_code
  validates_format_of :zip_code, :with => /\d{5}/
  validates_presence_of :user
end
