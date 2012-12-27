class SearchController < ApplicationController

  def search
    @search = Search.new(params)
    @people = Person.advanced_search(@search)

    respond_to do |format|
      format.html # show.html.erb
      format.atom
    end
  end

  def description
  end

end
