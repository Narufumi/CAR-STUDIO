Rails.application.routes.draw do
  devise_for :users
   root 'categories#show'

   # get  '/articles/add_text'   => 'articles#add_text'
   # get  '/articles/add_header' => 'articles#add_header'
   # get  '/articles/add_quote'  => 'articles#add_quote'
   # get  '/articles/add_button' => 'articles#add_button'
   # get  '/articles/add_image'  => 'articles#add_image'
   # get  '/articles/save'       => 'articles#save'

   get  '/cars/add_text'   => 'cars#add_text'
   get  '/cars/add_header' => 'cars#add_header'
   get  '/cars/add_quote'  => 'cars#add_quote'
   get  '/cars/add_button' => 'cars#add_button'
   get  '/cars/add_image'  => 'cars#add_image'
   get  '/cars/save'       => 'cars#save'

   get 'makers/index'

   get  '/items/destroy'       => 'items#destroy'
   resources :articles
   resources :categories
   resources :items
   resources :cars
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
