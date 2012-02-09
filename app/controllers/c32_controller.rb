class C32Controller < ApplicationController
  
  respond_to :xml, :json, :atom
  
  def index
    respond_to do |wants|
      wants.atom {}
    end
  end

  
  def show
    desc = "id:#{params[:id]}" if params[:id]
    AuditLog.doc("NONE", "USER_ACTION", desc, @record, @record.medical_record_number, @record.version)

    respond_with(@record)
  end
  
end
