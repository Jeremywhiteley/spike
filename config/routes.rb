PdmpSpike::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  get "people/:id/root.xml" => "people#root", :as => :root_document, :format => :xml

  get "people/:id/c32" => "sections#c32", as: "person_c32_section"
  get "people/:id/c32/c32" => "sections#c32", as: "person_c32_doc"
  get "people/:id/demographic" => "sections#demographic", as: "person_demographic_section"
  get "people/:id/demographic/demographic" => "sections#demographic", as: "person_demographic_doc"
  get "people/:id/medication" => "sections#medication", as: "person_medication_section"

  resources :people
  resources :prescriptions

  get "search/description" => "search#description", as: "description", :format => :opensearchdescription
  get "search" => "search#search", as: "searches"

  # land on the search page
  root :to => "search#search"

end
