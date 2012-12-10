class SectionsController < ApplicationController
  before_filter :find_person

  def c32_index
  end

  def c32_show
  end

  def med_index
  end

  def med_show
  end

  def demo_index
  end

  def demo_show
  end

  def find_person
    @person = Person.find(params[:id])
  end
end
