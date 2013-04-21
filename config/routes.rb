Timetable::Application.routes.draw do

  resources :users

  resource :session, except: :edit

  resources :schedules do
    get :print, on: :member
    resources :teachers
    resources :audiences
    resources :groups
    resources :lessons do
      get :copy, on: :member
      post :paste, on: :collection
    end
    resources :schedule_calls
    resources :replacements
  end

  get 'schedule' => 'dashboard#show', as: :view_schedule
  root to: 'dashboard#index'

end
