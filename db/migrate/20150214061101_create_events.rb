class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.string :name, :null => false, limit: 255
      t.date   :date
      t.string :venue, :null => false
      t.string :description, :null => true, limit: 2056

      t.timestamps null: false

    end
  end
end
