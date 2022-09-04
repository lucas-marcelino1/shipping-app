class Api::V1::CarrierResource < JSONAPI::Resource
  attributes :email_domain, :registration_number, :brand_name, :corporation_name, :address
end
