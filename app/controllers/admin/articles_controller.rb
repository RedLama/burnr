class Admin::ArticlesController < Admin::AdminController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build article_params
    if @article.save
      redirect_to admin_articles_url, flash: {success: I18n.t('articles.flash.create_success')}
    else
      flash[:error] = I18n.t('articles.flash.create_fail')
      render :new
    end
  end

  def edit
    @article = Article.find_by_id( params[:id] )
    @article ? render(:edit) : redirect_to(admin_articles_url)
  end

  def update
    @article = Article.find_by_id( params[:id] )
    if @article && @article.update_attributes(article_params)
      redirect_to admin_articles_url, flash: {success: I18n.t('articles.flash.update_success')}
    else
      flash[:error] = I18n.t('articles.flash.update_fail')
      render :edit
    end
  end

  def destroy
    @article = Article.find_by_id( params[:id] )
    @article.destroy ? flash[:success] = I18n.t('articles.flash.delete_success') : flash[:error] = I18n.t('articles.flash.delete_fail')
    redirect_to admin_articles_url
  end

  def article_params
    params.require(:article).permit(:title, :content, :publish_date, :status)
  end
end
