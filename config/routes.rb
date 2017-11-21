Rails.application.routes.draw do
	root to: 'pages#home'


	get 'pages/home'

	resources :pairs, :profiles
	put 'admin/:id' => 'profiles#make_admin', :as => "make_admin"
  devise_for :users

end
