class CreateAdventures < ActiveRecord::Migration[7.0]
  def change
    create_table :adventures do |t|
      t.references :user, null: false, foreign_key: true
      t.string :activity
      t.string :date
      t.string :image_url
      t.string :stress_level
      t.string :hours_slept
      t.string :sleep_stress_notes
      t.string :hydration
      t.string :diet
      t.string :diet_hydration_notes
      t.string :beta_notes
      t.integer :adventure_id

      t.timestamps
    end
  end
end
