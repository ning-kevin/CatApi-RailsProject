class CreateCats < ActiveRecord::Migration[5.2]
  def change
    create_table :cats do |t|
      t.string :name, null: false
      t.string :gender, null: false
      t.timestamps
    end
  end
end
