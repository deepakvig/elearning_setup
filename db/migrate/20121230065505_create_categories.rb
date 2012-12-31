class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :topic

      t.timestamps
    end
    add_index :categories, :topic_id
  end
end
