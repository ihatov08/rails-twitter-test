class AddUserIdToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :user_id, :integer,       null: false
    add_reference :tweets, :tweet, index: true, foreign_key: true
  end
end
