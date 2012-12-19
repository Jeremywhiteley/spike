xml.instruct!
xml.OpenSearchDescription(:xmlns => 'http://a9.com/-/spec/opensearch/1.1/') do
  xml.ShortName "PDMP People Search"
  xml.Description "PDMP Search for People"
  xml.Url type: 'application/opensearchdescription+xml', method: 'get', rel: 'self', template: opensearch_url
  xml.Url type: 'application/atom+xml', method: 'get', rel: 'results', template: search_url_template
  xml.Url type: 'text/html', method: 'get', template: search_url_template
end
