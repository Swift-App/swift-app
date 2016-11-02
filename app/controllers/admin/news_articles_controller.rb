class Admin::NewsArticlesController < ApplicationController
	def index
		@news_articles = NewsArticle.all
	end

	def new
		@news_article = NewsArticle.new
	end

	def create
		@news_article = NewsArticle.create(news_article_params)
	end

	def show
		@news_article = NewsArticle.find(params[:id])
	end

	private
	def news_article_params
		params.require(:news_article).permit(:title, :content)
	end
end
