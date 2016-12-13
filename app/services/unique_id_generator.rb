class UniqueIdGenerator
	UNIQUE_ID_SIZE = 5
  CHARSET = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}

	def generate!
		begin
      unique_id = (0...UNIQUE_ID_SIZE).map{ CHARSET.to_a[rand(CHARSET.size)] }.join
    end while User.where(unique_id: unique_id).exists?

    unique_id
	end
end