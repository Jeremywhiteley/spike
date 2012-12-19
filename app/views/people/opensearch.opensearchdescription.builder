xml.instruct!
xml.OpenSearchDescription(:xmlns => 'http://a9.com/-/spec/opensearch/1.1/', "xmlns:pdmp" => "http://pdmp.mitre.org/opensearchextensions/1.0/") do
  xml.ShortName "PDMP Patient Search"
  xml.LongName "PDMP Patient Search"
  xml.Description "Search the PDMP for patients"
  xml.Tags "pdmp patient"
  xml.Url type: 'application/opensearchdescription+xml', method: 'get', rel: 'self', template: opensearch_url
  xml.Url type: 'application/atom+xml', method: 'get', rel: 'results', template: search_url_template
  xml.Url type: 'text/html', method: 'get', template: search_url_template
  xml.Query role: "example", "pdmp:ln" => "smith", "pdmp:fn" => "john", "pdmp:location" => "boston", "pdmp:gen" => "male", "title" => "Sample search"
  xml.Developer "MITRE Corporation"
  xml.SyndicationRight "limited"
  xml.AdultContent "false"
  xml.Language "*"
  xml.OutputEncoding "UTF-8"
  xml.InputEncoding "UTF-8"
end
