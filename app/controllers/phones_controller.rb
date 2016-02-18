class PhonesController < ApplicationController
  skip_before_action :get_current_phone, only: [:new, :create]
  def new
    @phone = Phone.new
  end

  def create
    @phone = Phone.create(phone_params)

    if @phone.valid?
      cookies.signed.permanent[:phone_number] = @phone.number
      redirect_to phone_reminders_path(@phone)
    else
      render :new, { flash: 'Saving failed...' }
    end
  end

  private

  def phone_params
    params.require(:phone).permit(:number)
  end
end
