Rails.application.routes.draw do
  namespace :admin do
    get 'searches/search'
  end
  namespace :admin do
    get 'end_users/index'
    get 'end_users/show'
    get 'end_users/edit'
    get 'end_users/update'
  end
  namespace :admin do
    get 'site_comments/destroy'
  end
  namespace :admin do
    get 'sites/index'
    get 'sites/show'
    get 'sites/edit'
    get 'sites/update'
    get 'sites/destroy'
  end
  namespace :public do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :public do
    get 'searches/search'
  end
  namespace :public do
    get 'site_comments/create'
    get 'site_comments/destroy'
  end
  namespace :public do
    get 'sites/show'
    get 'sites/new'
    get 'sites/create'
    get 'sites/index'
    get 'sites/edit'
    get 'sites/update'
    get 'sites/destroy'
  end
  namespace :public do
    get 'end_users/show'
    get 'end_users/edit'
    get 'end_users/update'
    get 'end_users/unsubscribe'
    get 'end_users/withdraw'
  end
  #利用者用
  devise_for :end_users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do
    root 'homes#top'
  end
  

  #管理者用
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
