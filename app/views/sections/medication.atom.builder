atom_feed do |feed|
  @person.prescriptions_received.each do |rx|
    feed.entry(rx, url: prescription_path(rx)) do |entry|
      entry.link rel: "med", type: Mime::XML, href: prescription_path(rx)
      entry.title "medication #{rx.id}"
    end
  end
end
