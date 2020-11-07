class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user , foreign_key: true
      t.string :image 
      t.text :profiles
      t.string :favorite
      t.timestamps
    end
  end
end
