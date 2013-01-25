xml.instruct!
xml.medication :xmlns => "urn:hl7-org:greencda:ccd:pdmp", "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "xsi:schemaLocation" => "urn:hl7-org:greencda:ccd:pdmp /medication.xsd" do

  xml << render(partial: "medication", locals: {rx: @prescription})

end
