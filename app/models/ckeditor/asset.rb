class Ckeditor::Asset < ActiveRecord::Base
include Ckeditor::Backend::Refile
  include Ckeditor::Orm::ActiveRecord::AssetBase

  delegate :url, :current_path, :content_type, to: :data

  validates :data, presence: true
end
