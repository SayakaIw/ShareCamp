Rails.application.routes.draw do

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #namespaceはURLにも変更影響(URLにadminが入る)
  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    get 'searches/search'

    resources :end_users, only: [:index, :show, :edit, :update]

    resources :site_comments, only: [:destroy]

    resources :sites, only: [:index, :show, :edit, :update, :destroy]
  end



  #利用者用
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #scopeはURL変えない
  scope module: :public do
    root to: "homes#top"

    resources :favorites, only: [:create, :destroy]

    get 'searches/search'

    resources :site_comments, only: [:create, :destroy]

    resources :sites, only: [:show, :new, :create, :index, :edit, :update, :destroy]

    resources :end_users, only: [:show, :edit, :update, :unsubscribe, :withdraw]

    get 'end_users/my_page' => 'end_users#show',as:'my_page'
    get 'end_users/information/edit' => 'end_users#edit',as:'my_page_edit'
    get 'about'=>'homes#about' ,as:'about'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
