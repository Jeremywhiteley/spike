class SectionsController < ApplicationController
  before_filter :find_person, except: [:medication_meta, :demographic_meta]

  def c32
  end

  def medication
  end

  def medication_meta
  end

  def demographic
  end

  def demographic_meta
  end

  def find_person
    @person = Person.find(params[:id])
  end
end
