FactoryGirl.define do
  factory :identity_confirmation do
    user_id 1
    face_photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', 'test.jpg')) }
    certificate { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', 'test.jpg')) }
  end
end
