class CreateCareerInterests < ActiveRecord::Migration
  def change
    create_table :career_interests do |t|

      t.references :candidate, index: true
      t.references :event, index: true
      t.boolean :confirmed
      t.date :confirmed_at

      t.timestamps null: false
    end
    add_foreign_key :career_interests, :candidates
    add_foreign_key :career_interests, :events
  end
end
