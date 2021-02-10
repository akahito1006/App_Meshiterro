Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'post_images#index'
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  # 不要なルーティングが実行されないようにonlyを使う
  # 単数にすると、そのコントローラのidがリクエストに含まれなくなります。
  # 今回、いいねの詳細ページは作成しません。
  # favoritesのshowページが不要で、idの受け渡しも必要ないので、resourceとなっています。
  end
  
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end

