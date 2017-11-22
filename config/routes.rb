Rails.application.routes.draw do
	root to: 'pages#home'


	get 'pages/home'

	resources :pairs, :profiles
	put 'admin/:id' => 'profiles#make_admin', :as => "make_admin"
	put 'student/:id' => 'profiles#make_student', :as => "make_student"
	post 'pairs' => 'pairs#save_into_db', :as => "save_into_db"
	
  devise_for :users

end
