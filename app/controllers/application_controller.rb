# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  filter_parameter_logging :password, :password_confirmation
    helper_method :current_admin_session, :current_admin

    private
      def current_admin_session
        return @current_admin_session if defined?(@current_admin_session)
        @current_admin_session = AdminUserSession.find
      end

      def current_admin
        return @current_admin if defined?(@current_admin)
        @current_admin = current_admin_session && current_admin_session.admin_user
      end

       def require_admin
        unless current_admin
#        flash[:notice] = "You must be logged in to access this page"
        redirect_to admin_login_url
        return false
        end
      end
end
