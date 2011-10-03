Surgery::Application.routes.draw do

  get "pages/show"

  resources :blog, :controller => "posts"
  get "/blog/archives/:archive_date" => "posts#archives", :as => "blog_archive"
  
  get "welcome/index"
  
  root :to => 'welcome#index'
  
  # these typus routes normally dont have to be here, but they are here so that they take precendence over the routes below it
  scope "admin", :module => :admin, :as => "admin" do

    match "/" => "dashboard#show", :as => "dashboard"
    match "dashboard/:application" => "dashboard#show", :as => "dashboard"

    if Typus.authentication == :session
      resource :session, :only => [:new, :create], :controller => :session do
        get :destroy, :as => "destroy"
      end

      resources :account, :only => [:new, :create, :show] do
        collection do
          get :forgot_password
          post :send_password
        end
      end
    end

    Typus.models.map { |i| i.to_resource }.each do |resource|
      match "#{resource}(/:action(/:id))(.:format)", :controller => resource
    end

    Typus.resources.map { |i| i.underscore }.each do |resource|
      match "#{resource}(/:action(/:id))(.:format)", :controller => resource
    end
  end
  
  get ":id" => "pages#show"
  
  
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
