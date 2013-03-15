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
          unless @person.title.blank?
            xml.Prefix @person.title
          end
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
      xml.BenefitsCoordination
      @person.prescriptions_received.each do |rx|
        rx.fulfillments.each do |fill|
          xml.MedicationDispensed do
            xml.DrugDescription rx.drug.rxnorm_name
            xml.Quantity do
              xml.Value fill.quantity_amount
              xml.CodeListQualifier "FIXME"
              xml.UnitSourceCode "FIXME"
              xml.PotencyUnitCode "FIXME"
            end
            unless rx.free_text_sig.blank?
              xml.Directions rx.free_text_sig
            end
            xml.Refills do
              xml.Qualifier "FIXME"
              xml.Value rx.fills_count
            end
            xml.WrittenDate do
              xml.DateTime rx.when_written.xmlschema
            end if rx.when_written
            xml.ExpirationDate do
              xml.DateTime rx.expiration.xmlschema
            end if rx.expiration
            xml.DeliveredOnDate do
              xml.DateTime fill.when_filled.xmlschema
            end
            xml.Pharmacy do
              xml.Identification fill.pharmacy.id
              xml.Pharmacist do
                xml.LastName fill.pharmacist.family_name
                xml.FirstName fill.pharmacist.given_name
                unless fill.pharmacist.title.blank?
                  xml.Prefix(fill.pharmacist.title)
                end
              end
              xml.StoreName fill.pharmacy.name
              unless fill.pharmacy.address.nil?
                xml.Address do
                  xml.AddressLine1 fill.pharmacy.address.street
                  xml.City fill.pharmacy.address.city
                  xml.State fill.pharmacy.address.state
                  xml.ZipCode fill.pharmacy.address.postal_code
                end
              end
              unless fill.pharmacy.phone.blank?
                xml.CommunicationNumbers do
                    xml.Communication do
                    xml.Number fill.pharmacy.phone
                    xml.Qualifier "FIXME"
                  end
                end
              end
            end
            xml.Prescriber do
              xml.Name do
                xml.LastName rx.prescriber.family_name
                xml.FirstName rx.prescriber.given_name
                unless rx.prescriber.title.blank?
                  xml.Prefix(rx.prescriber.title)
                end
              end
            end
          end
        end
      end
    end
  end

end
