class LandingsController < ApplicationController
  before_action :check_phone_cookie_value, only: [:index, :create, :show]
  def index

  end


  def check_phone_cookie_value
    if cookies.signed[:phone_number].nil?
      { flash: 'You need a valid phone phone number' }
    end
  end
end
