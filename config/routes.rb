Flashbang::Application.routes.draw do
  devise_for :users

  root 'static_pages#home'

  # root-level routes -------

  get 'latest' => 'posts#latest'
  get 'following' => 'followedtags#index', :as => "followed_tags"

  get 'tag/:name' => 'tags#show', :as => "tag"
  
  get 'posts/:id' => 'posts#show', :as => "post"

  resources :exchanges, only: [:show, :create]

  # user-level routes -------

  resources :users do
    resources :posts do
      resources :comments #, :only => [:create]
      resources :offers do
        get 'accept', :on => :member
      end
    end
    # this becomes the user_exchanges path
    # it shows users their exchanges
    get 'exchanges' => 'exchanges#index'
  end

end
