Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users
  # resources :posts do
  # resource :comments
  # end
  root 'posts#index'
        get '/signup' => 'users#new'
        post '/users' => 'users#create'
        get '/login' => 'session#new'
        post '/login' => 'session#create'
        get '/logout' => 'session#destroy'



        # get  '/posts/:post_id/comments/:id/edit'=>'comments#edit',as: :edit_post_comment
        # patch  '/posts/:post_id/comments/:id/edit'=>'comments#update',as: :update_post_comment
        # delete  '/posts/:post_id/comment/:id/delete'=> 'comments#destroy',as: :delete_post_comment
        
        # get '/posts/:post_id/comment/:id/like' =>'comments#like',as: :post_comment_like
        # get '/posts/:post_id/comment/:id/dislike' =>'comments#dislike',as: :post_comment_dislike



          resources :posts do 
            member do
                get 'like'
                get 'dislike'
              end 
             resources :comments do 
                member do
                get 'like'
                get 'dislike'
              end
              end 
            end

            # resources :posts do 
            #   # member do
            #   #   get 'like'
            #   #   get 'dislike'
            #   # end  
            # end
                 #  resources :friendships do 
                 #    member do
                 #     put 'friend_request' 
                 #   end 
                 # end

          


        get '/friendships/:friendable_id/requests/:friend_id/friend'=> 'friendships#invite' ,as: :send_friend_request
        get '/friendships/:friendable_id/requests/:friend_id/acceptefriendrequest'=> 'friendships#friend_request_accept' ,as: :accept_friend_request
        get '/friendships/:friendable_id/requests/:friend_id/acceptefriendrequest'=> 'friendships#friend_request_reject' ,as: :reject_friend_request

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
