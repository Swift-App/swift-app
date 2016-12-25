class StaticPagesController < ApplicationController
  def index
		@news_articles = NewsArticle.limit(5).all
    render layout: "landing_page"
  end

  def about
  end

  def company
  end
end
