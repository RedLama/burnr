class Admin::SlideshowsController < Admin::AdminController
  def index
    @slideshows = Slideshow.all
    @slideshow = Slideshow.new
  end

  def create
    slideshow = Slideshow.new slideshow_params
    slideshow.save ? flash[:success] = t('slideshow.flash.create_success') : flash[:error] = t('slideshow.flash.create_fail')
    redirect_to admin_slideshows_url
  end

  def destroy
    slideshow = Slideshow.find_by_id params[:id]
    slideshow && slideshow.destroy ? flash[:success] = t('slideshow.flash.delete_success') : flash[:error] = t('slideshow.flash.delete_fail')
    redirect_to admin_slideshows_url
  end

  private
    def slideshow_params
      params.require(:slideshow).permit(:picture, :url)
    end
end
