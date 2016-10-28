class AddIndexToVideos < ActiveRecord::Migration[5.0]
  def change
    add_index :videos, :account_id
  end
end
