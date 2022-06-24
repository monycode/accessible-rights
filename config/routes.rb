Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :questions, only: %i[show] do
    resources :answers, only: %i[create]
  end


  resources :forums, param: :name, only: :show


  post 'forums/:forum_id/questions', to: 'questions#create', as: 'forum_questions'


  get 'termination', to: 'rights#termination'
  get 'resignation', to: 'rights#resignation'
  get 'unpaid_bonus', to: 'rights#unpaid_bonus'
  get 'unpaid_hours', to: 'rights#unpaid_hours'
  get 'profile', to: 'profiles#show'

  resources :calculations, only: %i[create new]
end
