class StaticPagesController < ApplicationController
  def index
	@news_articles = NewsArticle.limit(5).all
  end

  def about
  end

  def company
  end
end
