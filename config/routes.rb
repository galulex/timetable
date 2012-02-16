Timetable::Application.routes.draw do

  resource :admin, :controller => :admin, :only => :show

  namespace :admin do
    resources :users, :only => [:index, :update]
  end

  resources :users

  resource :session, :except => [:edit]

  resources :schedules do
    resources :teachers
    resources :audiences
    resources :groups
    resources :lessons do
      member do
        get :copy
        post :paste
      end
    end
    resources :schedule_calls
    resources :replacements
  end

  root :to => 'dashboard#index'

end
