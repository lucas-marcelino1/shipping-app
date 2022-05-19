require 'rails_helper'

RSpec.describe Deadline, type: :model do
  describe '#valid?' do

    it 'falso quando distância inicial é maior que a distância final' do
      @carrier = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
        email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
      @deadline = Deadline.create(initial_distance: 10, final_distance: 5, days: 2, carrier: @carrier)

      result = @deadline.valid?
  
      expect(result).to eq(false)
    end

    it 'falso quando o prazo de dias é 0' do
      @carrier = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
        email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
      @deadline = Deadline.create(initial_distance: 50, final_distance: 500, days: 0, carrier: @carrier)

      result = @deadline.valid?
  
      expect(result).to eq(false)
    end

    it 'falso quando atributo está vazio' do
      @carrier = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
        email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
      @deadline = Deadline.create(initial_distance: '', final_distance: 500, days: 5, carrier: @carrier)

      result = @deadline.valid?
  
      expect(result).to eq(false)
    end
  end
end
