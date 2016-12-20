FactoryGirl.define do
  factory :bank_application do  	
		photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'fixtures', 'files', 'test.jpg')) }
  end
end
