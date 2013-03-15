xml.instruct!
xml.Message :xmlns => "http://www.ncpdp.org/schema/SCRIPT", "version" => "010", "release" => "006" do

  xml.Header do
    xml.To current_user.email
    xml.From root_url
    xml.MessageID
    xml.SentTime Time.now.xmlschema
  end
  xml.Body do
    xml.RxHistoryResponse
  end

end
