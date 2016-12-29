FactoryGirl.define do
  factory :mynumber_application do
    user_id 1
		photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', 'test.jpg')) }
  end
end
