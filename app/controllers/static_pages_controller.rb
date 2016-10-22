class StaticPagesController < ApplicationController
  def index
    if current_user.present?
      redirect_to staff_index_path
    end
  end

  def about
  end

  def company
  end
end
