xml.root xmlns: "http://projecthdata.org/hdata/schemas/2009/06/core" do
  xml.id @person.id
  xml.version @person.updated_at.to_s(:xsd)
  xml.created @person.created_at.to_s(:xsd)
  xml.lastModified @person.updated_at.to_s(:xsd)

  xml.extensions do
    xml.extension "http://projecthdata.org/extension/record", extensionId: "1"
    xml.extension "http://projecthdata.org/extension/medication", extensionId: "2"
  end
  xml.sections do
    xml.section path: "record", name: "Patient Demographics", extensionId: "1"
    xml.section path: "medications", name: "Medications", extensionId: "2"
  end
end
