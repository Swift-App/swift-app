FactoryGirl.define do
  factory :weekly_payment_application do
		image_1 { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', 'test.jpg')) }
  end
end
