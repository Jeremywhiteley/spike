atom_feed do |feed|
  feed.title "hData Demographic Section Feed for Patient \"#{@person.name}\""
  feed.updated @person.updated_at
  feed.entry(@person, url: person_demographic_doc_path(@person)) do |entry|
    entry.link rel: "demo", type: Mime::XML, href: person_demographic_doc_path(@person)
    entry.title @person.name + " demographic"
    entry.author {|a| a.name "n/a" }
  end
end
