class ArticlesController < ApplicationController
  def index
    @articles = Article.published.order( "publish_date DESC" )
  end

  def show
    @article = Article.published.find_by_id(params[:id])
  end
end
