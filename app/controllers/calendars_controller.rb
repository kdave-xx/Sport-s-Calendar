class CalendarsController < ApplicationController
  
  def new
    @calendar = Calendar.new
    @global_images = Image.global
    i = 0
    12.times do
      i=i+1
        @calendar.images.build(:page_id => i)
    end
  end
  
  def create
    @calendar = Calendar.new(params[:calendar])
    @global_images  = Image.global
    
    @calendar.transaction do
      if @calendar.save!
#         if params[:global_images]
#          params[:global_images].each do |img_id|
#          image = Image.find(img_id)
#          @calendar.calendar_images.create!(:image_id => image.id, :page_id => params[:"calendar_image_#{image.id}"][:page_id])
#        end
#        end
        
        12.times do |i|
#          next if !params[:images] || params[:images][:"attachment_#{i}"].blank?
          if !params[:images] || params[:images][:"attachment_#{i+1}"].blank?
            next if params["global_image_#{i+1}"].blank?
            @calendar.calendar_images.create!(:image_id => params["global_image_#{i+1}"].to_i, :page_id => i+1)
          else
            image = Image.create!(:attachment => params[:images][:"attachment_#{i+1}"])
            @calendar.calendar_images.create!(:image_id => image.id, :page_id => i+1)
          end
        end
      end
      redirect_to cart_url(@calendar)
      flash[:notice] = 'Calendar was successfully created.'
    end
  rescue Exception => exc
    logger.info "Something went wrong. #{exc}"
    render :action => :new
  end


end
