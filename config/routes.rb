Rails.application.routes.draw do
  get '/report_by_category', to: 'reports#report_by_category', as: 'report_by_category'
  get '/report_by_date', to: 'reports#report_by_dates', as: 'report_by_date'
  get 'reports/index'
  get 'reports/report_by_category'
  get 'reports/report_by_dates'
  get 'main/index'
  resources :operations
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main#index"
end
