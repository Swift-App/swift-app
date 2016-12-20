class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :emergency_first_name, :string
  	add_column :users, :emergency_last_name, :string
  	add_column :users, :emergency_relationship, :string
  	add_column :users, :emergency_address, :string
  	add_column :users, :emergency_phone, :string
  	add_column :users, :application_medium, :string
  	add_column :users, :request_picking, :boolean, default: false, null: false
  	add_column :users, :request_inspection, :boolean, default: false, null: false
  	add_column :users, :request_devanning, :boolean, default: false, null: false
  	add_column :users, :request_testing, :boolean, default: false, null: false
  	add_column :users, :request_food, :boolean, default: false, null: false
  	add_column :users, :request_packing, :boolean, default: false, null: false
  	add_column :users, :request_printing, :boolean, default: false, null: false
  	add_column :users, :request_line, :boolean, default: false, null: false
  	add_column :users, :request_moving_assistant, :boolean, default: false, null: false
  	add_column :users, :request_office_relocation, :boolean, default: false, null: false
  	add_column :users, :request_assistant_distribution, :boolean, default: false, null: false
  	add_column :users, :request_carry, :boolean, default: false, null: false
  	add_column :users, :request_filing, :boolean, default: false, null: false
  	add_column :users, :request_phone, :boolean, default: false, null: false
  	add_column :users, :request_voucher_organization, :boolean, default: false, null: false
  	add_column :users, :request_reception, :boolean, default: false, null: false
  	add_column :users, :request_debug, :boolean, default: false, null: false
  	add_column :users, :request_pc_setup, :boolean, default: false, null: false
  	add_column :users, :request_data_entry, :boolean, default: false, null: false
  	add_column :users, :request_other, :boolean, default: false, null: false
  	add_column :users, :request_director, :boolean, default: false, null: false
  	add_column :users, :request_event_organizer, :boolean, default: false, null: false
  	add_column :users, :request_event_setup, :boolean, default: false, null: false
  	add_column :users, :request_campaign, :boolean, default: false, null: false
  	add_column :users, :request_sampling, :boolean, default: false, null: false
  	add_column :users, :request_research, :boolean, default: false, null: false
  	add_column :users, :request_sales, :boolean, default: false, null: false
  	add_column :users, :request_register, :boolean, default: false, null: false
  	add_column :users, :request_hall, :boolean, default: false, null: false
  	add_column :users, :request_kitchen, :boolean, default: false, null: false
  	add_column :users, :request_dish_washing, :boolean, default: false, null: false

  	add_column :users, :daytime_student, :boolean, default: false, null: false
  	add_column :users, :elder, :boolean, default: false, null: false
  	add_column :users, :earnings_over_500, :boolean, default: false, null: false
  	add_column :users, :householder_present, :boolean, default: false, null: false
  end
end
