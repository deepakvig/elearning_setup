class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :description
      t.references :topic

      t.timestamps
    end
    add_index :chapters, :topic_id
  end
end
