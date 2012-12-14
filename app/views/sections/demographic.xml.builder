xml.instruct!
xml.record :xmlns => "urn:hl7-org:greencda:c32", "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance", "xsi:schemaLocation" => "urn:hl7-org:greencda:c32 FIXME" do
  xml.patientInformation do
    xml.id @person.id
    xml.name do
      xml.title @person.title
      xml.givenName @person.given_name
      xml.familyName @person.family_name
    end
    xml.address do
      xml.street "FIXME"
      xml.city "FIXME"
      xml.state "FIXME"
      xml.postalCode "FIXME"
    end
    xml.telecom "use" => "HP", "preferred" => "true", "value" => "FIXME"
    xml.gender "codeSystem" => @person.sex.code_system, "codeSystemName" => @person.sex.code_system_name, "code" => @person.sex.code, "displayName" => @person.sex.display_name do
      xml.originalText @person.sex.original_text
    end
    xml.dateOfBirth "FIXME"
  end
end
