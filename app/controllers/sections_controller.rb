class SectionsController < ApplicationController
  before_filter :find_person

  def c32
  end

  def medication
  end

  def demographic
  end

  def find_person
    @person = Person.find(params[:id])
  end
end
