class CreateResources < ActiveRecord::Migration[6.0]
  def change
    create_table :resources do |t|
      t.string :name
      t.string :media_type
      t.text :description

      t.timestamps
    end
  end
end
