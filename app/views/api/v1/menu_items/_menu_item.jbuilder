json.(menu_item, :id, :name, :state)

json.set! :children do
  json.array! sub_items do |menu_item, sub_items|
    json.partial!('menu_item', menu_item: menu_item, sub_items: sub_items)
  end
end
