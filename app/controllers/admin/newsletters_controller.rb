class Admin::NewslettersController < Admin::AdminController

  def index
    @newsletters = Newsletter.all
  end

  def delete
    newsletter = Newsletter.find(:id)
    newsletter.destroy ? flash[:success] = t('newsletter.flash.delete_success') : flash[:error] = t('newsletter.flash.delete_fail')
    redirect_to admin_newsletters_url
  end

end
