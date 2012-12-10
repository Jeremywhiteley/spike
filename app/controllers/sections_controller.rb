class SectionsController < ApplicationController
  before_filter :find_person

  def c32_index
    respond_to do |format|
      format.html # index.html.erb
      format.atom
    end
  end

  def c32_show
  end

  def med_index
    respond_to do |format|
      format.html # index.html.erb
      format.atom
    end
  end

  def med_show
  end

  def demo_index
    respond_to do |format|
      format.html # index.html.erb
      format.atom
    end
  end

  def demo_show
  end

  def find_person
    @person = Person.find(params[:id])
  end
end
