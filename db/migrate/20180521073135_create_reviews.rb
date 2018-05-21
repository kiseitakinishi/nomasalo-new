class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|

        t.integer :user_id
        t.integer :receiver_id
        t.float :star
        t.text :comment

        t.timestamps

        t.timestamps
    end
  end
end
