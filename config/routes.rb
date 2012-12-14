PdmpSpike::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  resources :prescriptions
  resources :people

  # The priority is based upon order of creation:
  # first created -> highest priority.

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

  match "people/:id" => "people#show", :as => "root_feed", :via=> :get
  match "people/:id/root.xml" => "people#root", :as => :root_document, :format => :xml, :via => :get
  match "people/:id" => "people#options", :as => :root_options, :via => :options

  match "people/:id/c32" => "sections#c32", as: "person_c32_section", via: :get
  match "people/:id/c32/c32" => "sections#c32", as: "person_c32_doc", via: :get
  match "people/:id/demographic" => "sections#demographic", as: "person_demographic_section", via: :get
  match "people/:id/demographic/demographic" => "sections#demographic", as: "person_demographic_doc", via: :get
  match "people/:id/medication" => "sections#medication", as: "person_medication_section", via: :get

  # land on the people list page (at least for the time being)
  root :to => 'people#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
