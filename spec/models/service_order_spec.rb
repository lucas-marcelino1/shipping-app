require 'rails_helper'

RSpec.describe ServiceOrder, type: :model do

  describe '#valid?' do
    it 'Verificando se a mensagem de erro do peso nulo está inclusa' do
      @s = ServiceOrder.create()
      @s.valid?

      expect(@s.errors.full_messages).to include('Peso não pode ficar em branco')
    end

    it 'Verificando se a mensagem de erro do endereço de entrega nulo está inclusa' do
      @s = ServiceOrder.create()
      @s.valid?

      expect(@s.errors.full_messages).to include('Endereço de entrega não pode ficar em branco')
    end

    it 'Verificando se a mensagem de erro do CPF nulo está inclusa' do
      @s = ServiceOrder.create()
      @s.valid?

      expect(@s.errors.full_messages).to include('CPF do destinatário não pode ficar em branco')
    end

    it 'Verificando se a mensagem de erro do peso não ser um número está inclusa' do
      @s = ServiceOrder.create(weight: 'Abcd')
      @s.valid?

      expect(@s.errors.full_messages).to include('Peso não é um número')
    end
  end


  describe '#generate_code' do
    it 'gera um código alfanumérico de 15 caracteres automaticamente ao criar o pedido' do 
    @service_order = ServiceOrder.create

    result = @service_order.order_code

    expect(result).not_to be_empty
    expect(result.length).to eq 15
    end
  end
end
