class AddMoreColumnsToVideo < ActiveRecord::Migration[5.0]
  def change
    add_column :videos, :title, :string
    add_column :videos, :publish_date, :string
    add_column :videos, :duration, :integer
    add_column :videos, :captioned?, :boolean
    add_column :videos, :privacy_status, :string
    add_column :videos, :url, :string
    add_column :videos, :HD?, :boolean
    add_column :videos, :total_views, :integer
    add_column :videos, :description, :text
  end
end
