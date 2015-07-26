Dejalearn::Application.routes.draw do
  devise_for :users
  root 'static_pages#home'
  match '/email', to: 'static_pages#email', via: 'post'
  match '/notify', to: 'static_pages#notify', via: 'get'
  match '/contact', to: 'static_pages#contact_email', via: 'post'
  
  match '/dashboard', to: 'packet_pages#dashboard', via: 'get'
  match '/dashboard/create', to: 'packet_pages#create_packet', via: 'get'
  match '/dashboard/render_question', to: 'packet_pages#render_question', via: 'get'
  match '/dashboard/check_title', to: 'packet_pages#check_title', via: 'get'
  match '/dashboard/submit_packet', to: 'packet_pages#submit_packet', via: 'post'
  match '/dashboard/kewoiaxihxlqveg', to: 'packet_pages#get_packet', via: 'post'
  match '/dashboard/sign_in', to: 'packet_pages#sign_in_dash', via: 'get'
  match '/dashboard/sign_up', to: 'packet_pages#sign_up', via: 'post'
  match '/dashboard/log_in', to: 'packet_pages#log_in', via: "post"
  match '/dashboard/feedback', to: 'packet_pages#feedback_email', via: 'post'
  

  #get 'static_pages/home'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
