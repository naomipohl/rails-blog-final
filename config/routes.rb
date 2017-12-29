Rails.application.routes.draw do
  devise_for :admins

  root 'welcome#index'

  get 'tags/:tag', to: 'posts#index', as: "tag", :constraints  => { :tag => /[^\/]+/ }

  resources :posts do
  	resources :reviews
  end
end
