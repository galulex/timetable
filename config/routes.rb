Timetable::Application.routes.draw do

  resource :admin, :controller => :admin, :only => :show

  namespace :admin do
    resources :users, :only => [:index, :update]
  end

  resources :users

  resource :session, :except => [:edit]

  resources :schedules do
    get :print, :on => :member
    resources :teachers
    resources :audiences
    resources :groups
    resources :lessons do
      get :copy, :on => :member
      post :paste, :on => :collection
    end
    resources :schedule_calls
    resources :replacements
  end

  root :to => 'dashboard#index'

end
