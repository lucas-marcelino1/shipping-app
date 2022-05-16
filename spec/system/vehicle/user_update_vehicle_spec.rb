require 'rails_helper'

describe 'Usuário atualiza o veículo' do
  it 'com sucesso' do
    @c = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidascom', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
    @vehicle = Vehicle.create!(license_plate:'A5D534C4', brand: 'Fiat', model: 'Uno caixinha', year: '1996', maximum_charge: 250, carrier: @c )

    visit(root_path)
    click_on('A5D534C4')
    fill_in('Placa', with: 'HJU12Y1D')
    fill_in('Modelo', with: 'Uno')
    click_on('Atualizar Veículo')

    expect(page).to have_content('HJU12Y1D')
  end

  it 'com dados inválidos e fracassa' do
    @c = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidascom', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
    @vehicle = Vehicle.create!(license_plate:'A5D534C4', brand: 'Fiat', model: 'Uno caixinha', year: '1996', maximum_charge: 250, carrier: @c )
    @vehicle2 = Vehicle.create!(license_plate:'HJU12Y1D', brand: 'Volkswagen', model: 'Gol', year: '1998', maximum_charge: 250, carrier: @c )

    visit(root_path)
    click_on('A5D534C4')
    fill_in('Placa', with: 'HJU12Y1D')
    fill_in('Capacidade máxima', with: '')
    click_on('Atualizar Veículo')

    expect(page).to have_content('Não foi possível atualizar o veículo!')
    expect(page).to have_content('Placa já está em uso')
    expect(page).to have_content('Capacidade máxima não pode ficar em branco')

  end
end