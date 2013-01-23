xml.instruct!
xml.record :xmlns => "urn:hl7-org:greenccda:ccd:pdmp", "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "xsi:schemaLocation" => "urn:hl7-org:greenccda:ccd:pdmp /record.xsd" do

  xml.patientInformation do
    xml << render(partial: "patient_info", locals: {person: @person})
  end

  xml.medications do
    @person.prescriptions_received.each do |rx|
    xml.medication do

      xml << render(partial: "prescriptions/medication", locals: {rx: rx})

    end
    end
  end

end
