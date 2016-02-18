class Reminder < ActiveRecord::Base
  validates_presence_of :title, :body, :phone_id, :scheduled_for

  belongs_to :phone
end
