Rails.application.routes.draw do
  root 'static_pages#index'

  get '/sequences/:sequence_name/first/:n' => 'sequences#show'
  get '/sequences/:sequence_name/:n' => 'sequence_terms#show'
end
