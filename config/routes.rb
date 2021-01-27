Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    root to: 'stories#index'
    resources :stories, only: [:index, :show, :new, :create, :destroy]
    get '/users/:id/story_story', to: 'users#show_story', as: :show_story_user

end
