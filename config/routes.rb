Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      
      resources:smartlock
    end
  end
  devise_for :renters
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :agents
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources:companies
  resources:welcome
  resources:login do
  get '/index' => 'login#index',:as=> 'login_index'
  end
  resources:properties do
    get '/add_smartlock/:id(.:format)' => "properties#add_smartlock" ,:as => 'add_smartlock'
    match '/add_smartlock/:id(.:format)' , to: "properties#add_smartlock" , via: [:patch]
    
  end 
  get '/remove_smartlock', action: :remove_smartlock,controller: :properties, as: :remove_smartlock
  match '/remove_smartlock' , to: "properties#remove_smartlock" , via: [:post]

  delete '/properties/:id(.:format)', action: :destroy,controller: :properties, as: :destroy_property
  match '/properties/:id(.:format)' , to: "properties#destroy" , via: [:delete]
  
  root to: "welcome#index"

  resources:smartlock do
    delete '/agents/:id' => 'devise/sessions#destroy'
  end
  resources:codes
  get 'agents/:id' => 'agents#destroy', :via => :delete, :as => :admin_destroy_user
  match 'agents/:id' , to: "agents#destroy" , via: [:delete]
  post '/agentscreate', action: :create, controller: :agents
  get '/agents/new' => 'agents#new' 
  get '/checkin' => 'checkin#index'
get '/checkin/new' => 'checkin#new'
post '/checkins' => 'checkin#create'
get '/addsubagents', action: :addagents,controller: :agents, as: :addagents
end


# render json:{status: 'SUCCESS' ,message:"Loaded companies",data: @companies},status: :ok