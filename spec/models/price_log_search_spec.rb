require 'rails_helper'

RSpec.describe PriceLogSearch, type: :model do
  describe '#valid?' do
    it 'verifica se o erro de volume está incluso' do
      @price_log = PriceLogSearch.new()
      @price_log.valid?
      expect(@price_log.errors.full_messages).to include('Volume não pode ficar em branco')
    end

    it 'verifica se o erro de peso está incluso' do
      @price_log = PriceLogSearch.new()
      @price_log.valid?
      expect(@price_log.errors.full_messages).to include('Peso não pode ficar em branco')
    end

    it 'verifica se o erro de preço está incluso' do
      @price_log = PriceLogSearch.new()
      @price_log.valid?
      expect(@price_log.errors.full_messages).to include('Preço não pode ficar em branco')
    end

    it 'verifica se o erro de transportadora está incluso' do
      @price_log = PriceLogSearch.new()
      @price_log.valid?
      expect(@price_log.errors.full_messages).to include('Transportadora é obrigatório(a)')
    end
  end
end
