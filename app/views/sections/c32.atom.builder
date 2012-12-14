atom_feed do |feed|
  feed.entry(@person, url: person_c32_doc_path(@person)) do |entry|
    entry.link rel: "c32", type: Mime::XML, href: person_c32_doc_path(@person)
    entry.title @person.name + " c32"
  end
end
