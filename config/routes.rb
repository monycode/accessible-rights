Rails.application.routes.draw do
  get 'questions/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :questions, only: %i[create] do
    resources :answers, only: %i[create]
  end

  #Juan comment: Not sure if it shoulf be this way, because we
  # don't have a 'rights' model (because it's static info):

  # resources :rights, only: %i[show]

  #So for the moment I'm going to do it this way:

  get 'termination', to: 'rights#termination'
  get 'resignation', to: 'rights#resignation'
  get 'unpaid_bonus', to: 'rights#unpaid_bonus'
  get 'unpaid_hours', to: 'rights#unpaid_hours'
end
