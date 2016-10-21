Rails.application.routes.draw do
 #  devise_for :users
	# root 'videos#index'
devise_for :users

devise_scope :user do
  authenticated :user do
    root 'videos#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end

	resources :videos, only: [] do 
		collection do
			get :csv
		end
	end
end


# , :id => /[A-Za-z0-9\.]+?/, :format => /json|csv|xml|yaml/