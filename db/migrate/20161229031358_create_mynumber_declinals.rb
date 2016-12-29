class CreateMynumberDeclinals < ActiveRecord::Migration[5.0]
  def change
    create_table :mynumber_declinals do |t|
      t.integer :user_id
      t.integer :reason
      t.text :other

      t.timestamps
    end
    add_index :mynumber_declinals, :user_id
    add_index :mynumber_applications, :user_id
  end
end
