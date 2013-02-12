xml.instruct!
xml.medicationOrder :xmlns => "urn:hl7-org:greencda:ccd:pdmp:2", "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "xsi:schemaLocation" => "urn:hl7-org:greencda:ccd:pdmp:2 /medicationOrder.2.xsd" do

  xml << render(partial: "medication", locals: {rx: @prescription})

end
