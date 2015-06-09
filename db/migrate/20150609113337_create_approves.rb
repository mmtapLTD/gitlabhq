class CreateApproves < ActiveRecord::Migration
  def change
    create_table :approves do |t|
      t.integer :merge_request_id, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
