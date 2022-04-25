class AddChildrenCountToMenuItems < ActiveRecord::Migration[6.0]
  def change
    add_column :menu_items, :children_count, :integer
  end
end
