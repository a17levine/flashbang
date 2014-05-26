Flashbang::Application.routes.draw do
  devise_for :users

  root 'static_pages#home'

  get 'posts/:id' => 'posts#show', :as => "post"

  get '/latest' => 'posts#latest'

  resources :users do
    resources :posts do
      resources :comments #, :only => [:create]
      resources :offers do
        get 'accept', :on => :member
      end
    end
  end

  resources :exchanges

  get 'tag/:name' => 'tags#show', :as => "tag"
  get 'following' => 'followedtags#show', :as => "followed_tags"
  
end
