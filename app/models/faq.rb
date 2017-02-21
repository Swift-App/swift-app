class Faq < ApplicationRecord
  acts_as_list scope: :faq_category

  belongs_to :faq_category
end
