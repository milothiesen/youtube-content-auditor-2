Rails.application.routes.draw do
  devise_for :users
	root 'videos#index'

	resources :videos, only: [] do 
		collection do
			get :csv
		end
	end
end


# , :id => /[A-Za-z0-9\.]+?/, :format => /json|csv|xml|yaml/