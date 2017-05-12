Rails.application.routes.draw do
  root 'home#index'

  get '/lost_articles'  => 'home#lost_articles' 
  get '/found_articles' => 'home#found_articles'

  resources :articles
end
