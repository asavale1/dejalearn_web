class CreatePackets < ActiveRecord::Migration
  def change
    create_table :packets do |t|
      t.string :title
      t.text :description
      t.text :tag
      t.integer :xml_id

      t.timestamps
    end
  end
end
