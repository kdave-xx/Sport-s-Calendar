class Admin::AdminUsersController < ApplicationController
  before_filter :require_admin
  layout 'admin'
  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(params[:admin_user])

    if @admin_user.save
      flash[:notice] = "Successfully registered!"
      redirect_to admin_dashboards_url
    else
      render :action => :new
    end
  end
end
