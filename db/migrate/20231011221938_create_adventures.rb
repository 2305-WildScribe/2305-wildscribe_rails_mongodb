class CreateAdventures < ActiveRecord::Migration[7.0]
  def change
    create_table :adventures do |t|
      t.references :user, null: false, foreign_key: true
      t.string :activity
      t.string :notes
      t.string :image
      t.integer :stress_level
      t.integer :hydration
      t.string :diet

      t.timestamps
    end
  end
end
