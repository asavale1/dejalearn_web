class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
		t.string :tag
		t.integer :used
		t.timestamps
    end
  end
end
