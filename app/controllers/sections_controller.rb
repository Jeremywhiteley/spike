class SectionsController < ApplicationController
  before_filter :find_person

  def c32
  end

  def medication
    respond_to do |format|
      format.html
      format.atom
      format.xml
    end
  end

  def demographic
    respond_to do |format|
      format.html
      format.atom
      format.xml
    end
  end

  def find_person
    @person = Person.find(params[:id])
  end
end
