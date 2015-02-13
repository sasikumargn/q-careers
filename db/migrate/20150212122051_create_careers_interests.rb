class CreateCareersInterests < ActiveRecord::Migration
  def change
    create_table :careers_interests do |t|

    	t.string :first_name, :null => true
      t.string :last_name, :null => true
      t.string :city,   :null => true
      t.string :state,  :null => true
      t.string :email,  :null => false, :default => ""
      
      # Contact Details
      t.string :phone, :null => true, :limit=>16

      t.string :skills, :null => true, :limit=>2056
 
      t.timestamps null: false
    end
  end
end
