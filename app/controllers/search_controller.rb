class SearchController < ApplicationController

  def search
    @search = Search.new(params[:search])
    @people = Person.advanced_search(params[:search])
  end

  def description
  end

end
