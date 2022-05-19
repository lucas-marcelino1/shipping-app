require 'rails_helper'

RSpec.describe Price, type: :model do

  describe '#valid?' do
    it 'falso quando o volume inicial não é um número' do
      @c = Carrier.create!(corporation_name: 'Exp São Miguel', brand_name: 'São Miguel', registration_number: '12.145.256/1000-10', email_domain: 'treinadev.com.br', address: 'Rua Leopoldino, 415 - Rio de Janeiro/RJ')
      @price = Price.create(initial_volume: 'Zero ponto 1', final_volume: 0.500, initial_weight: 0, final_weight: 10, price_per_km: 1.2, minimal_price: 5, minimal_distance: 2, carrier: @c)

      result = @price.valid?

      expect(result).to eq(false)
    end

    it 'falso quando o volume final é menor que o peso inicial' do
      @c = Carrier.create!(corporation_name: 'Exp São Miguel', brand_name: 'São Miguel', registration_number: '12.145.256/1000-10', email_domain: 'treinadev.com.br', address: 'Rua Leopoldino, 415 - Rio de Janeiro/RJ')
      @price = Price.create(initial_volume: '0.500', final_volume: 0.400, initial_weight: 0, final_weight: 10, price_per_km: 1.2, minimal_price: 5, minimal_distance: 2, carrier: @c)

      result = @price.valid?

      expect(result).to eq(false)
    end

    it 'falso quando o peso inicial é maior que o peso final' do
      @c = Carrier.create!(corporation_name: 'Exp São Miguel', brand_name: 'São Miguel', registration_number: '12.145.256/1000-10', email_domain: 'treinadev.com.br', address: 'Rua Leopoldino, 415 - Rio de Janeiro/RJ')
      @price = Price.create(initial_volume: '0.500', final_volume: 0.600, initial_weight: 10, final_weight: 0, price_per_km: 1.2, minimal_price: 5, minimal_distance: 2, carrier: @c)

      result = @price.valid?

      expect(result).to eq(false)
    end
  end
  
end
