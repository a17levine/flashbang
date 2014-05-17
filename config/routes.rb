Flashbang::Application.routes.draw do
  devise_for :users

  root 'posts#latest'

  get 'posts/:id' => 'posts#show', :as => "post"

  resources :users do
    resources :posts do
      resources :comments #, :only => [:create]
      resources :offers do
        get 'accept', :on => :member
      end
    end
  end

  get 'tag/:name' => 'tags#show', :as => "tag"
  get 'following' => 'followedtags#show', :as => "followed_tags"
  
end
