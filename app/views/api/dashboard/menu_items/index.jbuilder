json.array! @manager.resources do |menu_item|
  json.(menu_item, :id, :name, :state, :depth, :parent_name)
end
