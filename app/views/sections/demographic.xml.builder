xml.instruct!
xml.record :xmlns => "urn:hl7-org:greenccda:ccd:pdmp", "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "xsi:schemaLocation" => "urn:hl7-org:greenccda:ccd:pdmp /patient.xsd" do

  xml.patientInformation do
    xml << render(partial: "patient_info", locals: {person: @person})
  end

end
