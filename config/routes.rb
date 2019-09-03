Rails.application.routes.draw do
<<<<<<< HEAD
	get 'controllername/new'
	get 'controllername/create'
	# get 'home_controller/index'
	root 'home#index'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	#ALL 7 ACTIONS = index, new, create, show, edit, update, destroy.
	#EDIT and NEW will not be used.
=======
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get 'controllername/new'
  get 'controllername/create'
  # get 'home_controller/index'
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #ALL 7 ACTIONS = index, new, create, show, edit, update, destroy. 
  #EDIT and NEW will not be used.
>>>>>>> 5fefa45c07df9e1b25a790bdc4049b96846782fc

	namespace :api do
		namespace :v1 do
			# restaurant details resource (nest under restaurants)
			resources :restaurant, only: %i[show]

			# restaurants list resource
			resources :restaurants, only: %i[index]

			# resources :home, only: [:index, :show]
			resources :users, except: %i[edit new] do
				resources :customers, only: %i[index create]
				resources :businesses, only: %i[index create]
			end

			resources :businesses, except: %i[create edit new] do
				resources :menus, only: %i[index create]
				resources :schedules, only: %i[index create]
			end

			resources :customers, except: %i[create edit new] do
				resources :reviews, only: %i[index create]
			end

			resources :menus, only: %i[show update destroy] do
				resources :items, only: %i[index create]
			end

			resources :items, only: %i[show destroy update]
			resources :reviews, only: %i[show destroy update]
			resources :schedules, only: %i[show destroy update]
		end
	end
end
