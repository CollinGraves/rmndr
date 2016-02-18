Rails.application.routes.draw do
  root 'phones#new'

  resources :phones do
    resources :reminders
  end


end
