require 'rails_helper'

RSpec.describe Admin, type: :model do
  it 'falso quando o domínio de administrador está incorreto' do
    admin = Admin.create(name: 'Lucas', email: 'lucas@gmail.com', password: '123456')
    result = admin.valid?
    expect(result).to eq(false)
    end
end
