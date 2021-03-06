Rails.application.routes.draw do


  devise_for :users, controllers: {registrations: 'wootregistration'}
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Session
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sessions, :only => [:create, :destroy]
    end
  end

end
