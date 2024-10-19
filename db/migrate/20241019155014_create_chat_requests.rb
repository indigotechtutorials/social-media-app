class CreateChatRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :chat_requests do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.boolean :accepted

      t.timestamps
    end
  end
end
