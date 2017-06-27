Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'
  root 'articles#index'
  get 'search' => 'articles#search'
  get 'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面
  resources :articles, only:[:index, :show, :new, :create]
end
