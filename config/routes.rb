Timetable::Application.routes.draw do

  resource :admin, :controller => :admin, :only => :show

  namespace :admin do
    resources :users, :only => [:index, :new, :create]
  end

  resources :users

  resource :session, :except => [:edit]

  resources :schedules do
    resources :teachers
    resources :audiences
    resources :groups
    resources :lessons
  end

  root :to => 'dashboard#index'

end
