atom_feed do |feed|
  feed.entry(@person, url: person_demo_path(@person)) do |entry|
    entry.link rel: "demo", type: Mime::XML, href: person_demo_path(@person)
    entry.title @person.name + " demographic"
  end
end
