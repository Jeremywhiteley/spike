atom_feed do |feed|
  feed.entry("c32", url: person_c32_section_path(@person), id: "/c32") do |entry|
    entry.link(rel: "alternate", type: Mime::Atom, href: person_c32_section_path(@person))
    entry.title("c32")
  end
  feed.entry("demographic", url: person_demographic_section_path(@person), id: "/demographic") do |entry|
    entry.link(rel: "alternate", type: Mime::Atom, href: person_demographic_section_path(@person))
    entry.title("demographic")
  end
  feed.entry("medication", url: person_medication_section_path(@person), id: "/medication") do |entry|
    entry.link(rel: "alternate", type: Mime::Atom, href: person_medication_section_path(@person))
    entry.title("medication")
  end
end
