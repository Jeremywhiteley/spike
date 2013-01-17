atom_feed do |feed|
  feed.title "hData Record Feed for Patient \"#{@person.name}\""
  feed.updated @person.updated_at
  feed.entry("srpp", url: person_srpp_section_path(@person), id: person_srpp_section_url(@person)) do |entry|
    feed.updated @person.updated_at
    entry.link(rel: "alternate", type: Mime::Atom, href: person_srpp_section_path(@person))
    entry.title("srpp")
    entry.author {|a| a.name "n/a" }
  end
  feed.entry("c32", url: person_c32_section_path(@person), id: person_c32_section_url(@person)) do |entry|
    feed.updated @person.updated_at
    entry.link(rel: "alternate", type: Mime::Atom, href: person_c32_section_path(@person))
    entry.title("c32")
    entry.author {|a| a.name "n/a" }
  end
  feed.entry("demographic", url: person_demographic_section_path(@person), id: person_demographic_section_url(@person)) do |entry|
    feed.updated @person.updated_at
    entry.link(rel: "alternate", type: Mime::Atom, href: person_demographic_section_path(@person))
    entry.title("demographic")
    entry.author {|a| a.name "n/a" }
  end
  feed.entry("medication", url: person_medication_section_path(@person), id: person_medication_section_url(@person)) do |entry|
    feed.updated @person.updated_at
    entry.link(rel: "alternate", type: Mime::Atom, href: person_medication_section_path(@person))
    entry.title("medication")
    entry.author {|a| a.name "n/a" }
  end
end
