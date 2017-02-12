Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount_devise_token_auth_for 'User', at: 'auth'
  %w(posts categories pages tags).each do |resource_name|
    resources resource_name do
      collection do
        get 'new'
      end
    end
  end
end
