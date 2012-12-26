class SearchController < ApplicationController

  def search
    @people = Person.advanced_search(params)
  end

  def description
  end

end
