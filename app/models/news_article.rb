class NewsArticle < ApplicationRecord
	default_scope {order('created_at DESC')}

  mount_uploader :featured_photo, NewsFeaturedPhotoUploader

  scope :recent, -> {order("created_at DESC").limit(5)}
end
