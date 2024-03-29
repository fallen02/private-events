Rails.application.routes.draw do
  get 'users/events', to: 'users#show', as: :user_all_events
  get 'users/joined', to: 'bookings#showjoinedevents', as: :attended_events
  get 'attendees/:event_id', to: 'bookings#showattendees', as: :event_attendees
  devise_for :users, path: "auth", path_names: { sign_in: "login", sign_up: "register" }
  resources :events
  resources :events do
    post 'join', to: 'bookings#create'
  end
  get 'upcomingevents', to: 'events#upcoming', as: :upcoming_events
  get 'pastevents', to: 'events#past', as: :past_events

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "events#index"
end
