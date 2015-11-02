Rails.application.routes.draw do
  root :to => 'messages#index'
  resources :messages, :only => [:index, :new, :create, :show]
end
