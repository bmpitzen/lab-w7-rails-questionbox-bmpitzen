Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :questions
  resources :answers

  get 'my_questions', action: :my_questions, controller: 'questions'

  root 'questions#index'
end
