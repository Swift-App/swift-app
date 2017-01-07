class AddApplicationReasons < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :from_a, :boolean, default: false, null: false
    add_column :users, :baitoru, :boolean, default: false, null: false
    add_column :users, :townwork, :boolean, default: false, null: false
    add_column :users, :enjapan, :boolean, default: false, null: false
    add_column :users, :mynavi, :boolean, default: false, null: false
    add_column :users, :shotworks, :boolean, default: false, null: false
    add_column :users, :an, :boolean, default: false, null: false
    add_column :users, :friend, :boolean, default: false, null: false
    add_column :users, :other_application_reason, :string
  end
end
