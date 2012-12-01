atom_feed do |feed|
  @people.each do |person|
    feed.entry(person, url: root_feed_url(person)) do |entry|
      entry.link rel: "alternate", type: Mime::Atom, href: root_feed_url(person)
      entry.link rel: "root", type: Mime::XML, href: root_document_url(person)
      entry.title person.name
    end
  end
end
