class SearchController < ApplicationController

  def search
    @search = Search.new(params)
    @people = Person.advanced_search(@search)
  end

  def description
  end

end
