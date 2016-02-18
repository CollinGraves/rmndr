class Phone < ActiveRecord::Base
  validates_presence_of :number

  has_many :reminders, inverse_of: :phone
end
