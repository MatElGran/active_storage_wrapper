class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.references :imageable, null: false, polymorphic: true
      t.string :name, null: false
      t.string :alt_text
      t.string :caption

      t.timestamps
    end
  end
end
