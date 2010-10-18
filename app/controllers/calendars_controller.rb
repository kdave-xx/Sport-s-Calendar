class CalendarsController < ApplicationController
  
  def new
    @calendar = Calendar.new
    @global_images = Image.global
    @year = Date.today.year
    session[:image_id] = nil
  end


  def get_month
    @month = params[:text_value]
    respond_to do |format|
      format.js {
        render :update do |page|
#          page << "alert('hgjhdfjs')"
          page.replace_html 'toggle', :partial => 'image', :locals => {:calendar => @calendar, :month => @month}
          #page.hide 'tickerheadingedit_outer'
#          page.show 'comp_latest'
        end
        }
    end
  end
  def create
    @calendar = Calendar.new(params[:calendar])
    @global_images  = Image.global
    
    @calendar.transaction do
      if @calendar.save!
          12.times do |i|
            next if params["global_image_#{i+1}"].blank?
              @calendar.calendar_images.create!(:image_id => params["global_image_#{i+1}"].to_i, :page_id => i+1)
         end
      end
      session[:image_id] = nil
      redirect_to cart_url(@calendar)
      flash[:notice] = 'Calendar was successfully created.'
    end
  rescue Exception => exc
    logger.info "Something went wrong. #{exc}"
    render :action => :new
  end


  def preview_calendar
    @date = params[:month] ? Date.parse(params[:month]) : Date.today.next_year.beginning_of_year
    session[:image_id] ||= []
    session[:image_id] << params[:image_value]+","+params[:page_value] unless params[:image_value].blank? && params[:page_value].blank?

    session[:image_id].each do |i|
      image_id =  i.split(",")[0].to_i
      page_id = i.split(",")[1].to_i  
      if page_id == @date.month
        @image = Image.find_by_id(image_id)
      end
    end
    render :layout => 'calendar'
  end


end
