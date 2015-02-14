class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|

      t.string :name, :null => false, limit: 255
      t.string :email, :null => false, limit: 128
      t.string :phone, :null => true, :limit=>16

      t.string :current_city, :null => true, :limit=>128
      t.string :current_state, :null => true, :limit=>128
      t.string :current_country, :null => true, :limit=>128

      t.string :native_city, :null => true, :limit=>128
      t.string :native_state, :null => true, :limit=>128
      t.string :native_country, :null => true, :limit=>128

      t.integer :year_of_passing, :null => true
      t.integer :experience_in_years, :null => true

      t.string :skills, :null => true, :limit=>512
      t.string :resume, :limit=>512
      t.string :type, :limit=>16

      t.timestamps null: false
    end
  end
end
