require 'rails_helper'

describe 'Usuário de transportadora' do

  it 'Visualiza rota ao aceitar ordem de serviço' do
    @c = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
    @user = CarrierUser.create!(name: 'Lucas', email: 'lucas@reunidas.com', password: '123456')
    @vehicle = Vehicle.create!(license_plate:'A5D534C4', brand: 'Fiat', model: 'Uno caixinha', year: '1996', maximum_charge: 250, carrier: @c)
    allow(SecureRandom).to receive(:alphanumeric).with(15).and_return('ABCDEFGHJK15236')
    ServiceOrder.create!(weight: '50', volume: '10', pickup_address: 'Rua 34', delivery_address: 'Bairro 72', recipient_CPF: '11483432963', recipient_name: 'Lucas', item_code: 'A4D54B', carrier: @c)

    login_as(@user, :scope => :carrier_user)
    visit(root_path)
    click_on('Ordens de Serviço')
    click_on('ABCDEFGHJK15236')
    select('A5D534C4', from: 'Veículo')
    click_on('Aceitar Ordem de Serviço')
    click_on('Ordens de Serviço')
    click_on('Atualizar rota')
  
    expect(page).to have_content('Atualizar Rota da OS: ABCDEFGHJK15236')
    expect(page).to have_content('Dia')
    expect(page).to have_content('Hora')
    expect(page).to have_content('Local')

  end

  it 'atualiza rota com sucesso' do
    @c = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
    @user = CarrierUser.create!(name: 'Lucas', email: 'lucas@reunidas.com', password: '123456')
    @vehicle = Vehicle.create!(license_plate:'A5D534C4', brand: 'Fiat', model: 'Uno caixinha', year: '1996', maximum_charge: 250, carrier: @c)
    allow(SecureRandom).to receive(:alphanumeric).with(15).and_return('ABCDEFGHJK15236')
    ServiceOrder.create!(weight: '50', volume: '10', pickup_address: 'Rua 34', delivery_address: 'Bairro 72', recipient_CPF: '11483432963', recipient_name: 'Lucas', item_code: 'A4D54B', carrier: @c)

    login_as(@user, :scope => :carrier_user)
    visit(root_path)
    click_on('Ordens de Serviço')
    click_on('ABCDEFGHJK15236')
    select('A5D534C4', from: 'Veículo')
    click_on('Aceitar Ordem de Serviço')
    click_on('Ordens de Serviço')
    click_on('Atualizar rota')
    fill_in('Hora', with: '05:05')
    fill_in('Dia', with: '05-25-22')
    fill_in('Local', with: 'Curitiba')
    click_on('Atualizar Rota')

    expect(page).to have_content('Rota atualizada com sucesso!')
  end

  it 'finaliza entrega da encomenda' do
    @c = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
    @user = CarrierUser.create!(name: 'Lucas', email: 'lucas@reunidas.com', password: '123456')
    @vehicle = Vehicle.create!(license_plate:'A5D534C4', brand: 'Fiat', model: 'Uno caixinha', year: '1996', maximum_charge: 250, carrier: @c)
    allow(SecureRandom).to receive(:alphanumeric).with(15).and_return('ABCDEFGHJK15236')
    ServiceOrder.create!(weight: '50', volume: '10', pickup_address: 'Rua 34', delivery_address: 'Bairro 72', recipient_CPF: '11483432963', recipient_name: 'Lucas', item_code: 'A4D54B', carrier: @c)

    login_as(@user, :scope => :carrier_user)
    visit(root_path)
    click_on('Ordens de Serviço')
    click_on('ABCDEFGHJK15236')
    select('A5D534C4', from: 'Veículo')
    click_on('Aceitar Ordem de Serviço')
    click_on('Ordens de Serviço')
    click_on('Atualizar rota')
    fill_in('Hora', with: '05:05 PM')
    fill_in('Dia', with: '05-25-22')
    fill_in('Local', with: 'Bairro 72')
    click_on('Atualizar Rota')
    click_on('Pacote Entregue: Finalizar Encomenda')
    
    expect(page).to have_content('A ordem de serviço foi finalizada!')
  end
end