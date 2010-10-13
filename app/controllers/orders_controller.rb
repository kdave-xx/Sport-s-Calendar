class OrdersController < ApplicationController
  
  def show
    @calendar = Calendar.find(params[:calendar_id])
    @order = @calendar.order
  end

  
  def new
    @calendar = Calendar.find(params[:calendar_id])
    @order = Order.new
    @address = Address.new
    session[:quantity] = params[:quantity]
    session[:total_price] = params[:total_price]
  end

  
 def create
    @calendar = Calendar.find(params[:calendar_id])
    @order = @calendar.build_order(params[:order])
    @order.ip_address = request.remote_ip
    @address  = @order.build_address(params[:address])
    # Old Code
#    if @order.save
#      if @order.purchase
#        session[:quantity] = nil
#        session[:total_price] = nil
#        flash[:notice] = "Thank You!"
#        redirect_to calendar_order_url(@order)
#      else
#        render :action => "failure"
#      end
#    else
#      render :action => :new
#    end
# End
  if [@order, @address].all?(&:valid?)
    @order.transaction do
      if @order.save
        if @order.purchase
           flash[:notice] = "Thank You!"
           redirect_to calendar_order_url(@order)
        end
      end
    end
#    rescue Exception => exc
#    logger.info "Something went wrong. #{exc}"
  else
#    flash[:error] = 'Please fill your billing address correctly'
    render :action => :new
  end
  end

  
 def cart
    @calendar = Calendar.find(params[:calendar_id])
    @shipping = Shipping.find(:first)
   end

 def calendar
     @calendar = Calendar.find_by_id(params[:calendar_id])
     @date = params[:month] ? Date.parse(params[:month]) : Date.today.next_year.beginning_of_year
     @image = @calendar.calendar_images.find_by_page_id(@date.month)
     render :layout => 'calendar'
  end

 def images
   @calendar = Calendar.find(params[:calendar_id])
   @images = CalendarImage.find_by_calendar_id(@calendar.id)
   zip_path = @calendar.bundle
   send_file "public/photos/#{@calendar.id}/#{@calendar.id}-Picture.zip", :type => "application/zip"
 end
   
end
