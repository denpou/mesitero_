class CreateResipis < ActiveRecord::Migration[5.2]
  def change
    create_table :resipis do |t|
      t.string :name, null: false
      t.string :image_id
      t.integer :user_id
      t.text :material, null: false
      t.text :introduction, null: false

      t.timestamps
    end
  end
end
