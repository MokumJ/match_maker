Rails.application.routes.draw do
	root to: 'pages#home'


	get 'pages/home'

	resources :pairs, :profiles
	
  devise_for :users

end
