ActionController::Routing::Routes.draw do |map|
  
  map.resources :calendars do |calendar|
    calendar.resource :order, :member => {:images => :get}
  end
  map.cart '/calendars/:calendar_id/order/cart', :controller => "orders", :action => "cart"
  map.contact 'contactus', :controller => "welcome", :action => "contactus"
  map.testimonial 'testimonial', :controller => "welcome", :action => "testimonial"
  map.calendar '/calendars/:calendar_id/calendar', :controller => "orders", :action => "calendar"
  map.preview_calendar '/preview_calendars/', :controller => "calendars", :action => "preview_calendar"
  map.get_month '/get_month/', :controller => "calendars", :action => "get_month"
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  map.namespace :admin do |admin|
    admin.resources :admin_users
    admin.resource :admin_user_sessions
    admin.resources :dashboards, :member => {:images => :get}
    admin.login '/login', :controller => "admin_user_sessions", :action => "new"
    admin.root :controller => "dashboards", :action => "index"
    admin.details '/dashboard/:id/details', :controller => "dashboards", :action => "details"
    admin.settings '/dashboard/settings', :controller => "dashboards", :action => "settings"
    admin.calendar '/order/:id/calendar', :controller => "dashboards", :action => "admin_calendar"
    admin.update_status '/dashboards/:id', :controller => "dashboards", :action => "update_status"
    admin.update_shipping '/update_setting/:id', :controller => "dashboards", :action => "update_shipping"
    admin.update_password '/update_password/:id', :controller => "dashboards", :action => "update_password"
    admin.delete_image '/delete_image/:id', :controller => "dashboards", :action => "delete_image"
  end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
   map.root :controller => "welcome", :action => "index"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
