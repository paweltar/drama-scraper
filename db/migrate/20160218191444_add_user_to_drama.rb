class AddUserToDrama < ActiveRecord::Migration
  def change
    add_reference :dramas, :user, index: true, foreign_key: true
  end
end
