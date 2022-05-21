require 'rails_helper'

RSpec.describe ServiceOrder, type: :model do

  describe '#valid?' do


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
