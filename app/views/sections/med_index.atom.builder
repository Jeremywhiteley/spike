atom_feed do |feed|
  feed.entry(@person, url: person_med_path(@person)) do |entry|
    entry.link rel: "med", type: Mime::XML, href: person_med_path(@person)
    entry.title @person.name + " medication"
  end
end
