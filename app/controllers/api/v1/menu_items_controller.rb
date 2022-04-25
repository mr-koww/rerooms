class Api::V1::MenuItemsController < ApplicationController
  def index
    @menu_items = MenuItem.all.arrange
  end
end
