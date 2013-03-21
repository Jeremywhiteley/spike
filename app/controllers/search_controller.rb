class SearchController < ApplicationController

  def search
    @search = Search.new(params)
    @people = Person.advanced_search(@search)

    flash.now[:alert] = "No Results Found" if @search.attributes_provided? && @people.blank?

    respond_to do |format|
      format.html
      format.atom
    end
  end

  def description
  end

end
