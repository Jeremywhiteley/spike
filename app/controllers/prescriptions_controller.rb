class PrescriptionsController < ApplicationController
  # GET /prescriptions
  def index
    @prescriptions = Prescription.all
  end

  # GET /prescriptions/1
  # GET /prescriptions/1.xml
  def show
    @prescription = Prescription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml
    end
  end

  # GET /prescriptions/new
  def new
    @prescription = Prescription.new
  end

  # GET /prescriptions/1/edit
  def edit
    @prescription = Prescription.find(params[:id])
  end

  # POST /prescriptions
  def create
    @prescription = Prescription.new(params[:prescription])

    respond_to do |format|
      if @prescription.save
        format.html { redirect_to @prescription, notice: 'Prescription was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /prescriptions/1
  def update
    @prescription = Prescription.find(params[:id])

    respond_to do |format|
      if @prescription.update_attributes(params[:prescription])
        format.html { redirect_to @prescription, notice: 'Prescription was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /prescriptions/1
  def destroy
    @prescription = Prescription.find(params[:id])
    @prescription.destroy

    respond_to do |format|
      format.html { redirect_to prescriptions_url }
    end
  end
end
