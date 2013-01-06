atom_feed do |feed|
  feed.title "hData Medication Section Feed for Patient \"#{@person.name}\""
  feed.updated @person.updated_at
  @person.prescriptions_received.each do |rx|
    feed.entry(rx, url: prescription_path(rx)) do |entry|
      entry.link rel: "med", type: Mime::XML, href: prescription_path(rx)
      entry.title "medication #{rx.id}"
      entry.author {|a| a.name "n/a" }
    end
  end
end
