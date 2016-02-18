class AddLastEpNumToDramas < ActiveRecord::Migration
  def change
    add_column :dramas, :last_ep, :string
  end
end
