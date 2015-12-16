class SearchesController < ActionController::Base
  layout 'application'
  def show
    @search = Search.new(params['search-field'], params)
    @results = @search.find_images

    if @results.empty?
      render 'home/search_again'
    end
  end
end