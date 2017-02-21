class CreateIdentityConfirmations < ActiveRecord::Migration[5.0]
  def change
    create_table :identity_confirmations do |t|
      t.integer :user_id, index: true
      t.string :face_photo
      t.string :certificate

      t.timestamps
    end
  end
end
