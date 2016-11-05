class NewsArticlesController < ApplicationController
  def index
    @news_articles = NewsArticle.all.page(params[:page])
  end

  def show
    @news_article = NewsArticle.find(params[:id])
    @recent = NewsArticle.recent
  end
end
