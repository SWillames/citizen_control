Rails.application.routes.draw do
  resources :addresses
  resources :citizens
  devise_for :users, :controllers => { registrations: 'registrations' }
end
