PdmpSpike::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  get "extension/medication" => "sections#medication_meta", as: "medication_meta"
  get "extension/demographic" => "sections#demographic_meta", as: "demographic_meta"

  get "people/:id/root" => "people#hdata_root", as: "hdata_root", :format => :xml

  get "people/:id/srpp" => "sections#srpp", as: "person_srpp_section"
  get "people/:id/srpp/report" => "sections#report", as: "person_report_doc"
  get "people/:id/srpp/demographic" => "sections#demographic", as: "person_demographic_doc"

  resources :people
  resources :prescriptions

  get "search/description" => "search#description", as: "description", :format => :opensearchdescription
  get "search" => "search#search", as: "searches"

  # land on the search page
  root :to => "search#search"

  # these routes are deprecated
  get "people/:id/c32" => "sections#c32", as: "person_c32_section"
  get "people/:id/c32/c32" => "sections#c32", as: "person_c32_doc"
  get "people/:id/demographic" => "sections#demographic", as: "person_demographic_section"
  get "people/:id/demographic/demographic" => "sections#demographic"
  get "people/:id/medication" => "sections#medication", as: "person_medication_section"

end
