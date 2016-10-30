class StaticPagesController < ApplicationController
  def index
    render layout: "landing_page"
  end

  def about
  end

  def company
  end
end
