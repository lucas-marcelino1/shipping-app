require 'rails_helper'

describe 'Administrador realiza orçamento prévio de preços e prazos' do

  it 'com sucesso' do
    @admin = Admin.create!(name: 'Adminzão', email: 'luck@sistemadefrete.com.br', password: 'password')
    @c = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
    Price.create!(initial_volume: 0.001, final_volume: 0.500, initial_weight: 0, final_weight: 200, price_per_km: 1.2, minimal_price: 5, minimal_distance: 2, carrier: @c)
    Deadline.create!(initial_distance: 0, final_distance: 15, days: 4, carrier: @c)

    login_as(@admin, :scope => :admin)
    visit(root_path)
    fill_in('Volume', with: '0.400')
    fill_in('Peso', with: '200')
    fill_in('Distância', with: '10')
    click_on('Consultar')

    expect(page).to have_content('Transportadora: Reunidas Brasil LTDA')
    expect(page).to have_content('Prazo: 4 dias')
    expect(page).to have_content('Preço: 12.0 Reais')
  end

end