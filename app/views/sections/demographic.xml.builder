xml.instruct!
xml.record :xmlns => "urn:hl7-org:greencda:c32", "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "xsi:schemaLocation" => "urn:hl7-org:greencda:c32 FIXME" do

  xml.patientInformation do
    xml << render(partial: "patient_info", locals: {person: @person})
  end

end
