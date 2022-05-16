require 'rails_helper'

RSpec.describe CarrierUser, type: :model do

  describe '#valid?' do
    it 'falso quando não existe domínio de transportadora' do
    user = CarrierUser.create(name: 'Lucas', email: 'lucas@gmail.com', password: '123456')
    result = user.valid?
    expect(result).to eq(false)
    end
  end
end
