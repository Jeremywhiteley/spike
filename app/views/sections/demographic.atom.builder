atom_feed do |feed|
  feed.entry(@person, url: person_demographic_path(@person)) do |entry|
    entry.link rel: "demo", type: Mime::XML, href: person_demographic_path(@person)
    entry.title @person.name + " demographic"
  end
end
