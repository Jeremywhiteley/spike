  xml.id prescription_url(rx)
  xml.code "code" => rx.drug.rxnorm_code, "codeSystem" => "2.16.840.1.113883.6.88", "codeSystemName" => "RXNorm", "displayName" => rx.drug.rxnorm_name do
    xml.originalText "FIXME"
    xml.translation "code" => rx.drug.ndc_code, "codeSystem" => "2.16.840.1.113883.6.69", "codeSystemName" => "NDC", "displayName" => rx.drug.ndc_name
  end
  xml.status "FIXME"
  xml.freeTextSig rx.free_text_sig
  xml.effectiveTime do
    xml.start rx.effective_start
    xml.end rx.effective_end
  end
  xml.dose "amount" => rx.drug.dose_amount, "unit" => rx.drug.dose_unit
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
      if !fill.pharmacy.phone.blank?
        xml.telecom "use" => "WP", "value" => fill.pharmacy.phone, "preferred" => "false"
      end
    end
    xml.pharmacist do
      xml.id person_url(fill.pharmacist)
      xml.name do
        xml.title fill.pharmacist.title
        xml.givenName fill.pharmacist.given_name
        xml.familyName fill.pharmacist.family_name
      end
    end
  end
  end

  xml.orderInformation "orderNumber" => rx.order_number, "fills" => rx.fills_count do
    xml.quantityOrdered "amount" => rx.quantity_amount, "unit" => rx.quantity_units
    xml.orderedDateTime rx.when_written
    xml.expirationDateTime rx.expiration
    xml.prescriber do
      xml.id person_url(rx.prescriber)
      xml.name do
        xml.title rx.prescriber.title
        xml.givenName rx.prescriber.given_name
        xml.familyName rx.prescriber.family_name
      end
    end
  end
