require 'rails_helper'

describe 'Usuário visita os preços da sua transportadora' do

  it 'com sucesso' do
    @c = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
    @user = CarrierUser.create!(name: 'Lucas', email: 'lucas@reunidas.com', password: '123456')
    Price.create!(initial_volume: 0.001, final_volume: 0.500, initial_weight: 0, final_weight: 10, price_per_km: 1.2, minimal_price: 5, minimal_distance: 2, carrier: @c)

    login_as(@user, :scope => :carrier_user)
    visit(root_path)
    click_on('Nossos preços')
  
    expect(page).to have_content('Preços cadastrados')
    expect(page).to have_content('Volumes de 0.001 (m³) até 0.5 (m³)')
    expect(page).to have_content('Até 2.0 km o valor é R$ 5.0')

  end
end