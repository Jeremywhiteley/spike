atom_feed do |feed|
  feed.title "hData c32 Section Feed for Patient \"#{@person.name}\""
  feed.updated @person.updated_at
  feed.entry(@person, url: person_c32_doc_path(@person)) do |entry|
    entry.link rel: "c32", type: Mime::XML, href: person_c32_doc_path(@person)
    entry.title @person.name + " c32"
    entry.author {|a| a.name "n/a" }
  end
end
