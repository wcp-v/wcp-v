Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
    }


  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
    }


  root to: 'homes#top'
  get 'home/about' => 'homes#about'


  resource :customers, only: [:show, :edit, :update]
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  patch 'customers/withdraw' => 'customers#withdraw'
  resources :items, only: [:index, :show]

  resources :orders, only: [:new, :create, :index, :show]
  get 'orders/confirm' => 'orders#confirm'
  get 'orders/thanks' => 'orders#thanks'

  resources :cart_items, only: [:index, :update, :destroy, :create]
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'

  resources :addresses, only: [:index, :create, :edit, :update, :destroy]


  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]

    root to: 'homes#top'

    resources :items, only: [:index, :new, :create, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :orders, only: [:show, :update] do
      resources :order_items, only: [:update]
    end

  end

end
