Rails.application.routes.draw do

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  #namespaceはURLにも変更影響(URLにadminが入る)
  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    get 'searches/search'
    get 'searches/index'

    resources :end_users, only: [:index, :show, :edit, :update]

    resources :site_comments, only: [:destroy]

    resources :sites, only: [:index, :show, :edit, :update, :destroy]
  end



  #利用者用
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :end_user do
    post 'end_users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  #scopeはURL変えない
  scope module: :public do
    root to: "homes#top"

    get 'searches/search'
    get 'searches/index'

    resources :sites, only: [:show, :new, :create, :index, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :site_comments, only: [:create, :destroy]
    end

    # resources :end_users do
    #   collection do
    #     get 'unsubscribe' => 'end_users#unsubscribe', as: 'confirm_unsubscribe'
    #     patch 'withdraw' => 'end_users#withdraw', as: 'withdraw_end_user'
    #   end
    #   member do
    #     get :my_page
    #   end
    # end

    get 'end_users/my_page' => 'end_users#show',as:'my_page'
    get 'end_users/information/edit' => 'end_users#edit',as:'my_page_edit'
    patch 'end_users/information' => 'end_users#update', as:'my_page_update'
    get 'end_users/unsubscribe' => 'end_users#unsubscribe', as: 'confirm_unsubscribe'
    put 'end_users/information' => 'end_users#update'
    patch 'end_users/withdraw' => 'end_users#withdraw', as: 'withdraw_end_user'

    get 'about'=>'homes#about' ,as:'about'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
