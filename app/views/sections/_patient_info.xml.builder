xml.id person.id
xml.name do
  xml.title person.title
  xml.givenName person.given_name
  xml.familyName person.family_name
end
if person.address
  xml.address do
    xml.street person.address.street
    xml.city person.address.city
    xml.state person.address.state
    xml.postalCode person.address.postal_code
  end
end
xml.telecom "use" => "HP", "preferred" => "true", "value" => "FIXME"
xml.gender "codeSystem" => person.sex.code_system, "codeSystemName" => person.sex.code_system_name, "code" => person.sex.code, "displayName" => person.sex.display_name do
  xml.originalText person.sex.original_text
end
xml.dateOfBirth person.birthdate
