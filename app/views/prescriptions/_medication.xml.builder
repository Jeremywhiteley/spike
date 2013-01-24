  xml.id rx.id
  xml.code "code" => "FIXME", "codeSystem" => "2.16.840.1.113883.6.88", "codeSystemName" => "RXNorm", "displayName" => "FIXME" do
    xml.originalText "FIXME"
    xml.translation "code" => "FIXME", "codeSystem" => "2.16.840.1.113883.6.69", "codeSystemName" => "NDC", "displayName" => "FIXME"
  end
  xml.status "FIXME"
  xml.freeTextSig "FIXME"
  xml.effectiveTime do
    xml.start "FIXME date"
    xml.end "FIXME date"
  end
  xml.dose "amount" => "FIXME", "unit" => "FIXME"
  xml.administrationTiming "institutionSpecified" => "FIXME" do
    xml.period "amount" => "FIXME", "unit" => "FIXME"
  end
  xml.refillStatus do
    xml.refillNumber "FIXME"
  end
  xml.productForm "code" => "FIXME", "codeSystem" => "2.16.840.1.113883.3.26.1.1", "codeSystemName" => "NCI Thesaurus", "displayName" => "FIXME" do
    xml.originalText "FIXME"
  end

  rx.fulfillments.each do |fill|
  xml.fulfillmentHistory "fillStatus" => fill.fill_status do
    xml.prescriptionNumber fill.prescription_number
    xml.dispenseDate fill.when_filled
    xml.quantityDispensed "amount" => fill.quantity_amount, "unit" => fill.quantity_unit
    xml.pharmacy do
      xml.id fill.pharmacy.id
      xml.name fill.pharmacy.name
      if fill.pharmacy.address
      xml.address do
        xml.street fill.pharmacy.address.street
        xml.city fill.pharmacy.address.city
        xml.state fill.pharmacy.address.state
        xml.postalCode fill.pharmacy.address.postal_code
      end
      end
      if !fill.pharmacy.phone.empty?
        xml.telecom "use" => "WP", "value" => fill.pharmacy.phone, "preferred" => "false"
      end
    end
    xml.pharmacist do
      xml.id fill.pharmacist.id
      xml.name do
        xml.title fill.pharmacist.title
        xml.givenName fill.pharmacist.given_name
        xml.familyName fill.pharmacist.family_name
      end
    end
  end
  end

  xml.orderInformation "orderNumber" => "FIXME", "fills" => "FIXME" do
    xml.quantityOrdered "amount" => "FIXME", "unit" => "FIXME"
    xml.orderedDateTime "FIXME date"
    xml.expirationDateTime "FIXME date"
    xml.prescriber do
      xml.id rx.prescriber.id
      xml.name do
        xml.title rx.prescriber.title
        xml.givenName rx.prescriber.given_name
        xml.familyName rx.prescriber.family_name
      end
    end
  end
