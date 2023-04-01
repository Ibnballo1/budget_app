class DropEntitiesGroups < ActiveRecord::Migration[7.0]
  def change
    drop_table :entities_groups
  end
end
