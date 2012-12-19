atom_feed({'xmlns:opensearch' => 'http://a9.com/-/spec/opensearch/1.1/'}) do |feed|
  feed.opensearch :totalResults, @people.count
  feed.opensearch :startIndex, 1
  feed.opensearch :itemsPerPage, @people.count
  feed.opensearch :Query, role: "request", startPage: "1", searchTerms: params[:search]
  @people.each do |person|
    feed.entry(person, url: person_path(person)) do |entry|
      entry.link rel: "alternate", type: Mime::Atom, href: person_path(person)
      entry.link rel: "root", type: Mime::XML, href: root_document_path(person)
      entry.title person.name
    end
  end
end
