Flashbang::Application.routes.draw do
  get "places/create"
  devise_for :users

  root 'static_pages#home'

  # root-level routes -------

  get 'latest' => 'posts#latest'
  get 'following' => 'followedtags#index', :as => "followed_tags"
  get 'following/edit' => 'followedtags#show', :as => "followed_tags_show"

  get 'tag/:name' => 'tags#show', :as => "tag"
  post 'tag/:name/follow' => 'followedtags#create', :as => "follow_tag"
  post 'tag/:name/unfollow' => 'followedtags#destroy', :as => "unfollow_tag"
  
  get 'posts/:id' => 'posts#show', :as => "post"

  resources :exchanges, only: [:show, :create] do
    post '/saveplace' => 'places#create', :as => "exchange_places"
    get '/removeplace' => 'places#destroy'
  end

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
