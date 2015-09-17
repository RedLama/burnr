class NewslettersController < ApplicationController

  def create
    newsletter = Newsletter.new newsletter_params
    newsletter.save ? flash[:success] = t('newsletter.flash.create_success') : flash[:error] = t('newsletter.flash.create_fail')
    redirect_to root_url
  end

  private
    def newsletter_params
      params.require(:newsletter).permit(:email)
    end
end
