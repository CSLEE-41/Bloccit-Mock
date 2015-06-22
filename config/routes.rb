Rails.application.routes.draw do
 


 resources :advertisements

 get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
