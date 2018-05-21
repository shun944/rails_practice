Rails.application.routes.draw do
  
  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',   to: 'users#new'
  post '/signup',   to: 'users#create'
  get  '/login',     to: 'sessions#new'
  post '/login',     to: 'sessions#create'
  delete'/logout',   to: 'sessions#destroy'
  
  get  '/for_study', to: 'schedules#for_study'
  get  '/for_study_new', to: 'schedules#for_study_new'
  get  '/for_study_create', to: 'schedules#for_study_new'
  post '/for_study_create', to: 'schedules#for_study_create'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,   only: [:new, :create, :edit, :update]
  resources :microposts,        only: [:create, :destroy]
  resources :relationships,     only: [:create, :destroy]
  resources :schedules,         only: [:for_study_create, :for_study_new, :edit, :show]
end
