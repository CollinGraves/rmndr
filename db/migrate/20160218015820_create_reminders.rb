class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.references :phone, index: true, null: false
      t.datetime :scheduled_for, null: false
    end
  end
end
