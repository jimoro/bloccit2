Rails.application.routes.draw do

  resources :topics do
    resources :posts, except: [:index]   # Equivalent, more succint syntax replacing the four below entries (and all RESTful controller actions), PRIOR TO refactoring to nest under topics
  end
  # get 'posts/index'  # posts controller, index action
  # get 'posts/show'   # posts controller, show action
  # get 'posts/new'    # etc...
  # get 'posts/edit'

  resources :users, only: [:new, :create]

  get 'about' => 'welcome#about'  # allow users to visit '/about', rather than '/welcome/about'
  get 'faq' => 'welcome#faq'    # allow users to visit '/faq', rather than '/welcome/faq'
  # Above two entries shorten the URI while still mapping to the welcome controller's actions

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
