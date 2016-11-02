class Ckeditor::Picture < Ckeditor::Asset
  attachment :data, extension: image_file_types

  def url_content
    url
  end

  def url_thumb
    url(:fill, 118, 100)

  mount_uploader :data, CkeditorPictureUploader, mount_on: :data_file_name

  def url_content
    url(:content)
  end
end
