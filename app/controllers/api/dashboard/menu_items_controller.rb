class Api::Dashboard::MenuItemsController < ApplicationController
  before_action :load_resource, only: %i[disable activate]
  def index
    scope = MenuItem.all
    @manager = QueryBuilder.new(params, scope)
  end

  def disable
    if @resource.may_disable?
      @resource.disable!
      render json: { message: 'Disabled!' }
    else
      render json: { message: 'Already disabled' }, status: :unprocessable_entity
    end
  end

  def activate
    if @resource.may_activate?
      @resource.activate!
      render json: { message: 'Activated!' }
    else
      render json: { message: 'Cannot activate' }, status: :unprocessable_entity
    end
  end

  def reset
    MenuItem.update_all(state: :new)
  end

  private

  def load_resource
    @resource = MenuItem.find(params[:id])
  end
end
