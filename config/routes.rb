Rails.application.routes.draw do
  get 'questions/create'
  devise_for :users
  root to: 'pages#home'

  resources :questions, only: %i[create] do
    resources :answers, only: %i[create]
  end

   resources :forums, param: :name, only: :show do
    resources :questions, only: :create
  end

  get 'termination', to: 'rights#termination'
  get 'resignation', to: 'rights#resignation'
  get 'unpaid_bonus', to: 'rights#unpaid_bonus'
  get 'unpaid_hours', to: 'rights#unpaid_hours'

  resources :calculations, only: %i[create new]
end
