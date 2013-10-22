require 'sidekiq/web'

Maven::Application.routes.draw do

  constraint = lambda { |request| request.env["warden"].authenticate? and request.env['warden'].user.instance_of?(Admin) }
  constraints constraint do
    mount Sidekiq::Web => '/admin/sidekiq'
  end

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users, :controllers => { :registrations => :registrations }



  resources :invitations, :only => [:new, :create, :index]

  get 'faqs' => 'home#faqs', as: :faqs
  get 'meetings' => 'home#meetings', as: :meetings
  get 'apply' => 'home#apply', as: :apply
  get 'manifesto' => 'home#manifesto', as: :manifesto
  get 'membership' => 'home#membership', as: :membership
  get 'about' => 'home#about', as: :about
  get 'meetings_10_9' => 'home#meetings_10_9', as: :meetings_10_9
  get 'events' => 'home#events', as: :events
  get 'membersonly' => 'home#membersonly', as: :membersonly
  get 'meetingone' => 'home#meetingone', as: :meetingone
  get 'meetingtwo' => 'home#meetingtwo', as: :meetingtwo
  get 'meetingthree' => 'home#meetingthree', as: :meetingthree
  get 'meetingfour' => 'home#meetingfour', as: :meetingfour
  get 'annualmembership' => 'home#annualmembership', as: :annualmembership
  get 'update' => 'home#update', as: :update
  get 'bios' => 'home#bios', as: :bios
  get 'monthly' => 'home#monthly', as: :monthly

  get '/r/:marketing_campaign_slug' => 'home#marketing', :as => :marketing_campaign
  get '/r' => redirect('/')

  root to: "home#index"

  match 'landing_page' => 'home#landing_page'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
