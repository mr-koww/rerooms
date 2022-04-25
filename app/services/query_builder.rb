class QueryBuilder
  attr_reader :params, :initial_scope, :resources, :total_pages

  def initialize(params, initial_scope)
    @params, @initial_scope = params, initial_scope
    @resources = @initial_scope
    perform
  end

  private

  def perform
    perform_filter
    perform_pagination
  end

  def perform_filter
    @resources = @resources.ransack(params[:q]).result
  end

  def perform_pagination
    page = (@params[:page] || 1).to_i
    per_page = (@params[:per_page] || 50).to_i
    @resources = @resources.page(page).per(per_page)
    @total_pages = @resources.total_pages
  end
end
