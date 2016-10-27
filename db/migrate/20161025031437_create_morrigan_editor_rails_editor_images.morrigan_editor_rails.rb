# This migration comes from morrigan_editor_rails (originally 20140716133450)
class CreateMorriganEditorRailsEditorImages < ActiveRecord::Migration
  def change
    create_table :morrigan_editor_rails_editor_images do |t|
      t.string :image

      t.timestamps
    end
  end
end
