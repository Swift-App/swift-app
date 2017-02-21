class FaqCategoriesController < ApplicationController
  def show
    @faq_category = FaqCategory.includes(:faqs).find(params[:id])
  end
end
