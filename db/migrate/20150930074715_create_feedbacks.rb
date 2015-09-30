class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|

      t.string :name

      t.text :content

      t.integer :event_id

      t.timestamps null: false
    end

    add_index :feedbacks, :event_id
  end
end
