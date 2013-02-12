atom_feed do |feed|
  feed.title "SRPP hData Feed for Patient \"#{@person.name}\""
  feed.updated @person.updated_at
  feed.entry(@person, url: person_report_doc_path(@person)) do |entry|
    entry.link rel: "report", type: "application/vnd.mitre.pdmp+xml", href: person_report_doc_path(@person)
    entry.link rel: "report", type: "application/vnd.mitre.pdmp.2+xml", href: person_report_doc_path(@person)
    entry.title @person.name + " report"
    entry.author {|a| a.name "n/a" }
  end
  feed.entry(@person, url: person_demographic_doc_path(@person)) do |entry|
    entry.link rel: "demo", type: "application/vnd.mitre.pdmp+xml", href: person_demographic_doc_path(@person)
    entry.link rel: "demo", type: "application/vnd.mitre.pdmp.2+xml", href: person_demographic_doc_path(@person)
    entry.title @person.name + " demographic"
    entry.author {|a| a.name "n/a" }
  end
  @person.prescriptions_received.each do |rx|
    feed.entry(rx, url: prescription_path(rx)) do |entry|
      entry.link rel: "med", type: "application/vnd.mitre.pdmp+xml", href: prescription_path(rx)
      entry.link rel: "med", type: "application/vnd.mitre.pdmp.2+xml", href: prescription_path(rx)
      entry.title "medication #{rx.id}"
      entry.author {|a| a.name "n/a" }
    end
  end
end
