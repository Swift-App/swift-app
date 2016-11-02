class ChangeJobContentToText < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :content, :text
  end
end
