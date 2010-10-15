class Admin::DashboardsController < ApplicationController
   before_filter :require_admin
   layout 'admin'

  def index
    @orders = Order.all
    @orders = @orders.paginate :page => params[:page], :per_page => 10
  end

  def new
    @dashboard = Dashboard.new
    @global_images = Image.global
    5.times do
      @dashboard.images.build
    end
  end

  def create
    @dashboard = Dashboard.new(params[:dashboard])
    if @dashboard.save
      5.times do |i|
          next if !params[:images] || params[:images][:"attachment_#{i}"].blank?
          image = Image.create!(:attachment => params[:images][:"attachment_#{i}"], :is_admin => true)
        end
      redirect_to new_admin_dashboard_url
      flash[:notice] = "Successfully Uploaded!"
    else
      render :action => "new"
    end
  end

  def details
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
    @address = @order.address
    
  end

   def update
     @order = Order.find(params[:id])
     @address = @order.address
     if @order.update_attributes(params[:order]) && @address.update_attributes(params[:address])
        redirect_to admin_dashboards_url
        flash[:notice] = 'Order was successfully updated.'
     else
       render :action => "edit"
     end
   end

   def update_status
     @order = Order.find(params[:id])
     @address = @order.address
     if @order.update_attributes(params[:order])
        redirect_to admin_dashboards_url
        flash[:notice] = 'Order status was successfully updated.'
     else
       render :action => "details"
     end
   end

   def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to admin_dashboards_url
   end

   def settings
      @shipping = Shipping.find(:first)
      @admin_user = current_admin
   end

   def admin_calendar
    @order = Order.find(params[:id])
    @calendar = @order.calendar
    @date = params[:month] ? Date.parse(params[:month]) : Date.today.next_year.beginning_of_year
    @image = @calendar.calendar_images.find_by_page_id(@date.month)
    render :layout => 'calendar'
  end

    def images
      @order = Order.find(params[:id])
      @calendar = @order.calendar
      @images = CalendarImage.find_by_calendar_id(@calendar.id)
      zip_path = @calendar.bundle
      send_file "public/photos/#{@calendar.id}/#{@calendar.id}-Picture.zip", :type => "application/zip"
   end

    def update_shipping
      @shipping = Shipping.find(params[:id])
      if @shipping.update_attributes(params[:shipping])
        redirect_to admin_dashboards_url
        flash[:notice] = 'Setting was successfully updated.'
     else
       render :action => "settings"
     end
    end


    def update_password
      @admin_user = current_admin
      
      @admin_user.password = params[:admin_user][:password]
      @admin_user.password_confirmation = params[:admin_user][:password_confirmation]
      if @admin_user.save
        flash[:notice] = "Password successfully updated"
        redirect_to admin_dashboards_url
      else
        render :action => :settings
      end
    end

    def delete_image
      @image = Image.find(params[:id])
      @image.update_attribute(:is_admin, false)
        flash[:notice] = "Image was successfully removed"
        redirect_to new_admin_dashboard_url
    end

end
