json.array! @menu_items do |menu_item, sub_items|
  json.(menu_item, :id, :name, :state)
  json.partial!('menu_item', menu_item: menu_item, sub_items: sub_items)
end
