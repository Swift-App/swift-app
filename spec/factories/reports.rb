FactoryGirl.define do
  factory :report do
    photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', 'test.jpg')) }
    comments "It was a good day."
  end
end
