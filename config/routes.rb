Rails.application.routes.draw do
  root "citizens#index"
  resources :addresses
  resources :citizens
  devise_for :users, :controllers => { registrations: 'registrations' }
end
