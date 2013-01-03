PdmpSpike::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  get "people/:id/root" => "people#hdata_root", as: "hdata_root", :format => :xml

  match "people/:id/c32" => "sections#c32", as: "person_c32_section", via: :get
  match "people/:id/c32/c32" => "sections#c32", as: "person_c32_doc", via: :get
  match "people/:id/demographic" => "sections#demographic", as: "person_demographic_section", via: :get
  match "people/:id/demographic/demographic" => "sections#demographic", as: "person_demographic_doc", via: :get
  match "people/:id/medication" => "sections#medication", as: "person_medication_section", via: :get

  resources :people
  resources :prescriptions

  get "search/description" => "search#description", as: "description", :format => :opensearchdescription
  get "search" => "search#search", as: "searches"

  # land on the people list page (at least for the time being)
  root :to => 'people#index'

end
