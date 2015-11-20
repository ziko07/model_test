Rails.application.routes.draw do
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  mathjax 'mathjax'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  namespace :admin do
    get 'user_payments', to: "payments#index"
    get ':payment_id/user_payment_approve/:status', to: "payments#payment_approval", as: :approve_payment
    resources :exams do
      resources :subjects
    end
    resources :subjects do
      resources :questions
    end

    resources :questions do
      get 'update_correct_answer', to: "questions#update_correct_answer"
      resources :answers
    end
  end

  # get '/users/:user_id/payments/new', to: 'payments#new', as: :new_user_payments
  # post '/users/:user_id/payments', to: 'payments#create', as: :user_payments

  resources :payments
  get 'payment_list', to: 'payments#payment_list', as: :payment_list

  get 'remove_rejected_payment', to: 'payments#remove_rejected_payment'
  resources :exams, only: ['index', 'show']
  get '/exams/:exam_id/subject/:id', to: 'subjects#test', as: :start_test
  get '/test/start/:id', to: 'model_tests#start', as: :start_model_test
  get '/my_test', to: 'welcome#my_test', as: :my_test
  post '/test/:test_id/answer', to: 'model_tests#answer', as: :test_answer
  get '/test/:id/result', to: 'model_tests#result', as: :test_result
  get '/profile', to: 'welcome#profile', as: :user_profile




  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
