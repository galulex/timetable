Timetable::Application.routes.draw do

  resource :admin, :controller => "admin", :only => :show

  namespace :admin do
    resources :users, :only => [:index, :new, :create]
  end

  namespace :universal do
    resources :dashboard
  end

  root :to => 'universal/dashboard#index', :as => :home

end
