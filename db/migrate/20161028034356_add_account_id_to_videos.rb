class AddAccountIdToVideos < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :account_id, :integer
  end
end
