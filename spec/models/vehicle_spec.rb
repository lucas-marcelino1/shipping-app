require 'rails_helper'

RSpec.describe Vehicle, type: :model do

  describe '#valid?' do 

    it 'falso quando a placa está nula' do
      @c = Carrier.create!(corporation_name: 'Exp São Miguel', brand_name: 'São Miguel', registration_number: '12.145.256/1000-10', email_domain: 'treinadev.com.br', address: 'Rua Leopoldino, 415 - Rio de Janeiro/RJ')
      @vehicle = Vehicle.create(license_plate:'', brand: 'Fiat', model: 'Uno caixinha', year: '1996', maximum_charge: 250, carrier: @c )
      result = @vehicle.valid?
      expect(result).to eq(false)
    end

    it 'falso quando a placa já existe' do
      @c = Carrier.create!(corporation_name: 'Exp São Miguel', brand_name: 'São Miguel', registration_number: '12.145.256/1000-10', email_domain: 'treinadev.com.br', address: 'Rua Leopoldino, 415 - Rio de Janeiro/RJ')
      @vehicle = Vehicle.create!(license_plate:'1234ABC', brand: 'Fiat', model: 'Uno caixinha', year: '1996', maximum_charge: 250, carrier: @c )
      @vehicle2 = Vehicle.create(license_plate:'1234ABC', brand: 'Fiat', model: 'Uno caixinha', year: '1996', maximum_charge: 250, carrier: @c )
      result = @vehicle2.valid?
      expect(result).to eq(false)
    end

    it 'falso quando a capacidade máxima está nula' do
      @c = Carrier.create!(corporation_name: 'Exp São Miguel', brand_name: 'São Miguel', registration_number: '12.145.256/1000-10', email_domain: 'treinadev.com.br', address: 'Rua Leopoldino, 415 - Rio de Janeiro/RJ')
      @vehicle = Vehicle.create(license_plate:'1234ABC', brand: 'Fiat', model: 'Uno caixinha', year: '1996', maximum_charge: '', carrier: @c )
      result = @vehicle.valid?
      expect(result).to eq(false)
    end

  end
 
end
