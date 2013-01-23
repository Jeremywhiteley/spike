atom_feed({'xmlns:opensearch' => 'http://a9.com/-/spec/opensearch/1.1/'}) do |feed|
  feed.title "Search Results"
  feed.updated Time.now
  feed.opensearch :totalResults, @people.count
  feed.opensearch :startIndex, 1
  feed.opensearch :itemsPerPage, @people.count
  feed.opensearch :Query, role: "request", startPage: "1", searchTerms: params[:search]
  @people.each do |person|
    feed.entry(person, url: person_path(person)) do |entry|
      entry.link rel: "alternate", type: Mime::Atom, href: person_path(person)
      entry.link rel: "root", type: Mime::XML, href: hdata_root_path(person)
      entry.author {|a| a.name "n/a" }
      entry.title person.name
      xml.patientInformation 'xmlns' => 'urn:hl7-org:greenccda:ccd:pdmp' do
        xml << render(partial: "sections/patient_info", formats: [:xml], locals: {person: person})
      end
    end
  end
end
