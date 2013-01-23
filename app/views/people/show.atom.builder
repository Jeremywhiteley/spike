atom_feed do |feed|
  feed.title "hData Record Feed for Patient \"#{@person.name}\""
  feed.updated @person.updated_at
  feed.entry("srpp", url: person_srpp_section_path(@person), id: person_srpp_section_url(@person)) do |entry|
    feed.updated @person.updated_at
    entry.link(rel: "alternate", type: Mime::Atom, href: person_srpp_section_path(@person))
    entry.title("srpp")
    entry.author {|a| a.name "n/a" }
  end
end
