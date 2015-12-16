class SearchesController < ActionController::Base
  def show
    @search = Search.new(params['search-field'], params)
  end
end