Rails.application.routes.draw do
  # don't need to add only: then the rest of the restful routes because we're using all of them 
  resources :plants
end
