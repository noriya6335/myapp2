class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user , foreign_key: true
      t.references :item , foreign_key: true
      t.float      :rate 
      t.timestamps
    end
  end
end
