require 'rails_helper'

RSpec.describe Carrier, :type => :request do
  describe 'GET api/v1/carriers' do
    it 'successfully' do
      create(:carrier)
      create(:carrier, email_domain: 'carrier2@email.com', registration_number: "11.444.444/1494-47")
      create(:carrier, email_domain: 'carrier3@email.com', registration_number: "11.434.444/1494-47")

      get('/api/v1/carriers')

      expect(response).to have_http_status(:ok)
      expect(response.content_type).to include('application/json')
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq(3)
      expect(json_response.first["email_domain"]).to eq('carrier@email.com')
      expect(json_response.first["registration_number"]).to eq("11.444.444/1414-47")
      expect(json_response[1]["email_domain"]).to eq('carrier2@email.com')
      expect(json_response[1]["registration_number"]).to eq("11.444.444/1494-47")
      expect(json_response.last["email_domain"]).to eq('carrier3@email.com')
      expect(json_response.last["registration_number"]).to eq("11.434.444/1494-47")
    end
  end
end