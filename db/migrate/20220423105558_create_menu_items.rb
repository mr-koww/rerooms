class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :state
      t.string :color

      t.timestamps
    end
  end
end
