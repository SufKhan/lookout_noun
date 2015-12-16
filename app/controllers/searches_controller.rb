class SearchesController < ActionController::Base
  layout 'application'
  def show
    @search = Search.new(params['search-field'], params)
  end
end