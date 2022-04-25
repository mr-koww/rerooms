menu_items_seeds = [
  {
    name: 'File',
    children: [
      {
        name: 'New',
        children: [
          name: 'Project'
        ]
      },
      {
        name: 'Open'
      }
    ]
  },
  {
    name: 'Edit',
    children: [
      {
        name: 'Undo'
      },
      {
        name: 'Redo'
      }
    ]
  }
]

def create_menu_item!(menu_item_seed, parent_id: nil)
  params = { name: menu_item_seed[:name], parent_id: parent_id }
  menu_item = MenuItem.create(params)

  return unless menu_item_seed[:children]

  menu_item_seed[:children].each do |child_seed|
    create_menu_item!(child_seed, parent_id: menu_item.id)
  end
end

menu_items_seeds.each do |menu_item_seed|
  create_menu_item!(menu_item_seed)
end
