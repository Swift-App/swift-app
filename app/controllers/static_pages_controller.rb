class StaticPagesController < ApplicationController
  def index
		@news_articles = NewsArticle.limit(5).all
    render layout: "landing_page"
  end

  def about
  end

  def company
  end

  def faq
    @faq_categories = FaqCategory.order(id: :asc)
  end

  def staff_registration
  end
end
