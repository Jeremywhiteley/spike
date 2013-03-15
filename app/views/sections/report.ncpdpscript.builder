xml.instruct!
xml.Message :xmlns => "http://www.ncpdp.org/schema/SCRIPT", "version" => "010", "release" => "006" do

  xml.Header do
    xml.To current_user.email
    xml.From root_url
    xml.MessageID request.uuid
    xml.SentTime Time.now.xmlschema
  end
  xml.Body do
    xml.RxHistoryResponse do
      xml.Response do
        xml.Approved
      end
      xml.Patient do
        xml.Name do
          xml.LastName @person.family_name
          xml.FirstName @person.given_name
          xml.Prefix @person.title if @person.title
        end
        xml.Gender @person.sex.code
        xml.DateOfBirth do
          xml.Date @person.birthdate.xmlschema
        end
        xml.Address do
          xml.AddressLine1 @person.address.street
          xml.City @person.address.city
          xml.State @person.address.state
          xml.ZipCode @person.address.postal_code
        end
      end
    end
  end

end
