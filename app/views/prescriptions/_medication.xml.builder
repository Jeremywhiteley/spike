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
  xml.fulfillmentHistory "fillStatus" => "FIXME" do
    xml.prescriptionNumber "FIXME"
    xml.dispenseDate "FIXME date"
    xml.quantityDispensed "amount" => "FIXME", "unit" => "FIXME"
    xml.pharmacy do
      xml.id "FIXME"
      xml.name "FIXME"
      xml.address do
        xml.street "FIXME"
        xml.city "FIXME"
        xml.state "FIXME"
        xml.postalCode "FIXME"
      end
      xml.telecom "use" => "WP", "value" => "FIXME", "preferred" => "false"
    end
    xml.pharmacist do
      xml.id "FIXME"
      xml.name do
        xml.title "FIXME"
        xml.givenName "FIXME"
        xml.familyName "FIXME"
      end
    end
  end
  xml.orderInformation "orderNumber" => "FIXME", "fills" => "FIXME" do
    xml.quantityOrdered "amount" => "FIXME", "unit" => "FIXME"
    xml.orderedDateTime "FIXME date"
  end
