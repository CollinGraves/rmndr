class RemindersController < ApplicationController
  def index
    @reminders = @current_phone.reminders
  end

  def new
    @reminder = Reminder.new(phone_id: @current_phone.id)
  end

  def create
    @reminder = Reminder.new(reminder_params)
    @reminder.phone_id = @current_phone.id

    if @reminder.save
      ::ReminderDeliveryService.delay(run_at: params[:scheduled_for]).perform_job(@reminder, @current_phone.number)
      # ::ReminderDeliveryService.perform_job(@reminder, @current_phone.number)

      redirect_to phone_reminders_path(@current_phone)
    else
      redirect_to new_phone_reminder_path
    end
  end

  def show
  end

  private

  def reminder_params
    params.require(:reminder).permit(:title, :body, :phone_id, :scheduled_for)

  end
end
