class Admin::AdminUserSessionsController < ApplicationController
  before_filter :require_admin, :only => [:destroy]
  layout 'admin'
  def new
    @admin_user_session = AdminUserSession.new
  end

  def create
    @admin_user_session = AdminUserSession.new(params[:admin_user_session])
    if @admin_user_session.save
#      flash[:notice] = "Login successful!"
        redirect_to admin_dashboards_path
    else
      render :action => :new
    end
  end

  def destroy
    current_admin_session.destroy
#    flash[:notice] = "Logout successful!"
    redirect_to new_admin_admin_user_sessions_path
  end
end
