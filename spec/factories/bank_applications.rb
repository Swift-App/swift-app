FactoryGirl.define do
  factory :bank_application do
		photo Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'fixtures', 'test.png'))
  end
end
