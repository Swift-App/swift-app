require 'rails_helper'

RSpec.describe NewsArticlesController, type: :controller do
  describe "GET #show" do
    it "renders the show action" do
      article = FactoryGirl.create(:news_article)

      get :show, id: article.id

      expect(response).to render_template :show
    end
  end
end
