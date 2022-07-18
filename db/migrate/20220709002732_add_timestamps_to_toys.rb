class AddTimestampsToToys < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :toys
  end
end
