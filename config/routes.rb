Timetable::Application.routes.draw do

  resource :admin, :controller => :admin, :only => :show
  namespace :admin do
    resources :users, :only => [:index, :new, :create]
  end
  resources :users
  resource :session, :only => [:new, :create, :destroy]
  resources :schedules do
    resources :teachers
  end

  root :to => 'dashboard#index'

end
