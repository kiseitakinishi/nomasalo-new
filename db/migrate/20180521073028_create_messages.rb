class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|

      t.integer :user_id
      t.integer :receiver_id
      t.text    :body

      t.timestamps
    end
  end
end
