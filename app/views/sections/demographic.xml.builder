xml.instruct!
xml.record :xmlns => "urn:hl7-org:greencda:c32", "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "xsi:schemaLocation" => "urn:hl7-org:greencda:c32 FIXME" do
  xml.patientInformation do
    xml.id @person.id
    xml.name do
      xml.title "FIXME"
      xml.givenName "FIXME"
      xml.familyName @person.name
    end
    xml.address do
      xml.street "FIXME"
      xml.city "FIXME"
      xml.state "FIXME"
      xml.postalCode "FIXME"
    end
    xml.telecom "use" => "HP", "preferred" => "true", "value" => "FIXME"
    xml.gender "codeSystem" => "2.16.840.1.113883.5.1", "codeSystemName" => "AdministrativeGender", "code" => "FIXME", "displayName" => "FIXME" do
      xml.originalText "FIXME"
    end
    xml.dateOfBirth "FIXME"
  end
end
