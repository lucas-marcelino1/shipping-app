FactoryBot.define do
  factory :carrier do
    corporation_name { "Carrier Corporation Name" }
    brand_name  { "Carrier Brand Name" }
    registration_number { "11.444.444/1414-47" }
    email_domain { 'carrier@email.com' }
    address { 'Dr. Antônio Haffner 540' }
    status { Carrier.statuses["able"] }
  end
end