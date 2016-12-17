class UniqueIdGenerator
	UNIQUE_ID_SIZE = 5
  CHARSET = [*('a'..'z'), *('0'..'9'), *('A'..'Z')]

	def generate!
		begin
      unique_id = (0...UNIQUE_ID_SIZE).map{ CHARSET.to_a[rand(CHARSET.size)] }.join
    end while User.where(unique_id: unique_id).exists?

    unique_id
	end
end