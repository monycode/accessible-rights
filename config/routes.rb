Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :questions, only: %i[create] do
    resources :answers, only: %i[create]
  end

  get 'termination', to: 'rights#termination'
  get 'resignation', to: 'rights#resignation'
  get 'unpaid_bonus', to: 'rights#unpaid_bonus'
  get 'unpaid_hours', to: 'rights#unpaid_hours'
end
