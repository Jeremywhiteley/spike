xml.id person_url(person)
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
if !person.phone.blank?
  xml.telecom "use" => "WP", "value" => person.phone, "preferred" => "false"
end
xml.gender person.sex.code
xml.dateOfBirth person.birthdate
