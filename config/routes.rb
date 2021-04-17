Rails.application.routes.draw do
  root :to => 'homes#top'
  get 'homes/top' #homesコントローラーのTopアクションへ
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books #アクション・ビュー・をまとめて定義
  
end
