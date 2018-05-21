class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|

      t.integer :user_id
      t.string :job
      t.string :place
      t.datetime :start_date
      t.datetime :end_date
      t.text :content

      t.timestamps
    end
  end
end
