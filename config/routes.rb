Timetable::Application.routes.draw do

  resource :admin, :only => :show
  namespace :admin do
    resources :users, :only => [:index, :new, :create]
  end

  root :to => 'home#index'

end
