if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end

  PhotoUploader

  # config/initializers/carrierwave.rb
  CarrierWave::Uploader::Base.descendants.each do |klass|
	  next if klass.anonymous?
	  klass.class_eval do
	    def cache_dir
	      "#{Rails.root}/spec/support/uploads/tmp"
	    end

	    def store_dir
	      "#{Rails.root}/spec/support/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
	    end
	  end
	end
else
  CarrierWave.configure do |config|
    config.storage = :fog

    config.fog_credentials = {
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => ENV["AWS_ACCESS_KEY"],                        # required
      :aws_secret_access_key  => ENV["AWS_SECRET_KEY"]                         # required
    }
    config.fog_directory  = ENV["AWS_BUCKET"]                     # required
    
    config.asset_host = ActionController::Base.asset_host
  end
end


