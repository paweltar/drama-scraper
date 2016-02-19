class AddLastRefreshToDramas < ActiveRecord::Migration
  def change
    add_column :dramas, :last_refresh, :datetime
  end
end
