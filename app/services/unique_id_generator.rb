class UniqueIdGenerator
	UNIQUE_ID_SIZE = 5
  CHARSET = [*('a'..'z'), *('0'..'9'), *('A'..'Z')]
  MALE_UNIQUE_ID_START = "3"
  FEMALE_UNIQUE_ID_START = "6"

  def initialize(user:)
    @user = user
    @id = ""
  end

	def generate!
    if @user.gender == "男性"
      @id << MALE_UNIQUE_ID_START
      (UNIQUE_ID_SIZE - next_male_id.length).times { @id << "0" }
      @id << next_male_id
      unique_id_store.update(male: next_male_id)
    else
      @id << FEMALE_UNIQUE_ID_START
      (UNIQUE_ID_SIZE - next_female_id.length).times { @id << "0" }
      @id << next_female_id
      unique_id_store.update(female: next_female_id)
    end

    return @id
	end

  private

  def next_female_id
    (unique_id_store.female + 1).to_s
  end

  def next_male_id
    (unique_id_store.male + 1).to_s
  end

  def unique_id_store
    UniqueIdStore.first
  end
end