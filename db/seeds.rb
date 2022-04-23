menu_items_seeds = [
  {
    name: 'File',
    color: '#1976d2',
    children: [
      {
        name: 'New',
        color: '#1976d2',
        children: [
          name: 'Project',
          color: '#1976d2'
        ]
      },
      {
        name: 'Open',
        color: '#1976d2'
      }
    ]
  },
  {
    name: 'Edit',
    color: '#c10015',
    children: [
      {
        name: 'Undo',
        color: '#c10015'
      },
      {
        name: 'Redo',
        color: '#c10015'
      }
    ]
  }
]

def create_menu_item!(menu_item_seed, parent_id: nil)
  params = { name: menu_item_seed[:name], color: menu_item_seed[:color], parent_id: parent_id }
  menu_item = MenuItem.create(params)

  return unless menu_item_seed[:children]

  menu_item_seed[:children].each do |child_seed|
    create_menu_item!(child_seed, parent_id: menu_item.id)
  end
end

menu_items_seeds.each do |menu_item_seed|
  create_menu_item!(menu_item_seed)
end
