class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.attachment :image
      t.string :name
      t.string :kind

      t.timestamps null: false
    end
  end
end
