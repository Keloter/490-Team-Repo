class AnnouncementsController < ApplicationController
	def new
      @announcement = Announcement.new
	end

  def edit
      @announcement = Announcement.find(params[:id])
  end

	def index
    	@announcement = Announcement.all
  end

	def show
    	@announcement = Announcement.find(params[:id])
  end

	def create
  		@announcement = Announcement.new(announcement_params)
 
  		if @announcement.save
        redirect_to @announcement
      else
        render 'new'
	end
end
 
	private
  	def announcement_params
    	params.require(:announcement).permit(:title, :text)
  	end
end
