require 'rails_helper'

RSpec.describe Carrier, type: :model do

  describe '#valid?' do

    it 'falso quando Razão Social está nulo' do
      c = Carrier.create(corporation_name: '', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
        email_domain: 'reunidas.com.br', address: 'Rua São Paulo, 6454 - Massaranduba/SC')

      result = c.valid?
      
      expect(result).to eq(false)
    end

    it 'falso quando Domínio de e-mail está nulo' do
      c = Carrier.create(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
        email_domain: '', address: 'Rua São Paulo, 6454 - Massaranduba/SC')

      result = c.valid?
      
      expect(result).to eq(false)
    end

    it 'falso quando CNPJ está nulo' do
      c = Carrier.create(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '', 
        email_domain: 'reunidas.com.br', address: 'Rua São Paulo, 6454 - Massaranduba/SC')

      result = c.valid?
      
      expect(result).to eq(false)
    end

    it 'falso quando CNPJ não está no formato adequado' do
      c = Carrier.create(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-1000', 
        email_domain: 'reunidas.com.br', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
      result = c.valid?
      expect(result).to eq(false)
    end

    it 'falso quando CNPJ já está cadastrado' do
      c = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
          email_domain: 'reunidas.com.br', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
      c_second = Carrier.create(corporation_name: 'Expresso São Miguel LTDA', brand_name: 'Miguel', registration_number: '12.345.678/1000-10', 
          email_domain: 'expsaomiguel.com.br', address: 'Rua Paraíba, 454 - São Paulo/SP')
      result = c_second.valid?
      expect(result).to eq(false)
    end

  end
  
  describe '#description' do
    it 'Gera uma descrição com o Nome e o CNPJ' do
      c = Carrier.create(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
        email_domain: 'reunidas.com.br', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
      result = c.description

      expect(result).to eq('Reunidas Brasil LTDA - 12.345.678/1000-10')
    end
  end
end
