Rails.application.routes.draw do
  devise_for :admins
  mount Ckeditor::Engine => '/ckeditor'

  root 'welcome#index'

  get 'tags/:tag', to: 'posts#index', as: "tag"

  resources :posts do
  	resources :reviews
  end
end
