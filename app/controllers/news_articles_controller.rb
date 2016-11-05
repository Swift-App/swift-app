class NewsArticlesController < ApplicationController
  def show
    @news_article = NewsArticle.find(params[:id])
  end
end
