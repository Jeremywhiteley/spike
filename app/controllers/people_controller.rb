class PeopleController < ApplicationController
  # GET /people
  # GET /people.atom
  def index
    @people = Person.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.atom { render template: "search/search" }
    end
  end

  def hdata_root
    @person = Person.find(params[:id])
  end

  # GET /people/1
  # GET /people/1.atom
  def show
    @person = Person.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.atom
    end
  end

  # GET /people/new
  def new
    @person = Person.new
    @person.address = Address.new
  end

  # GET /people/1/edit
  def edit
    @person = Person.find(params[:id])

    # if the person doesn't have an address then give the user a
    # chance to add one
    if !@person.address
      @person.address = Address.new
    end
  end

  # POST /people
  def create
    @person = Person.new(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /people/1
  def update
    @person = Person.find(params[:id])

    # if all the address form parameters are empty then "disconnect"
    # the person from the address
    addr = params[:person][:address_attributes]
    if (addr && ""==addr[:street] && ""==addr[:city] && ""==addr[:state] && ""==addr[:postal_code])
      @person.address = nil
      params[:person].delete :address_attributes
    end

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /people/1
  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url }
    end
  end

end
