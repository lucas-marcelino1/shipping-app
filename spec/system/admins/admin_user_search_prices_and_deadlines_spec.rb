require 'rails_helper'

describe 'Administrador realiza orçamento prévio de preços e prazos' do

  it 'Somente das transportadoras ativas com sucesso' do
    @admin = Admin.create!(name: 'Adminzão', email: 'luck@sistemadefrete.com.br', password: 'password')
    @c = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
    @second_c = Carrier.create!(corporation_name: 'Expresso São Miguel LTDA', brand_name: 'São Miguel', registration_number: '21.385.678/1000-10', 
        email_domain: 'expsm.com', address: 'Rua Peregrino, 987 - Rio de Janeiro/RJ')
    @third_c = Carrier.create!(corporation_name: 'Jadlog Interstadual', brand_name: 'Jadlog', registration_number: '12.348.678/9800-10', 
          email_domain: 'jadlog.com', address: 'Rua Salvador Dali, 47 - São Paulo/SP', status: 5)

    Price.create!(initial_volume: 0.001, final_volume: 0.500, initial_weight: 0, final_weight: 200, price_per_km: 1.2, minimal_price: 5, minimal_distance: 2, carrier: @c)
    Deadline.create!(initial_distance: 0, final_distance: 15, days: 4, carrier: @c)

    Price.create!(initial_volume: 0.001, final_volume: 0.500, initial_weight: 0, final_weight: 200, price_per_km: 2.4, minimal_price: 8, minimal_distance: 11, carrier: @second_c)
    Deadline.create!(initial_distance: 0, final_distance: 20, days: 2, carrier: @second_c)

    Price.create!(initial_volume: 0.001, final_volume: 0.500, initial_weight: 0, final_weight: 200, price_per_km: 3.6, minimal_price: 10, minimal_distance: 4, carrier: @third_c)
    Deadline.create!(initial_distance: 0, final_distance: 12, days: 7, carrier: @third_c)

    login_as(@admin, :scope => :admin)
    visit(root_path)
    fill_in('Volume', with: '0.400')
    fill_in('Peso', with: '200')
    fill_in('Distância', with: '10')
    click_on('Consultar')

    expect(page).to have_content('Transportadora: Reunidas Brasil LTDA')
    expect(page).to have_content('Prazo: 4 dias')
    expect(page).to have_content('Preço: R$ 12,00')
    expect(page).to have_content('Transportadora: Expresso São Miguel LTDA')
    expect(page).to have_content('Prazo: 2 dias')
    expect(page).to have_content('Preço: R$ 8,00')
    expect(page).not_to have_content('Transportadora: Jadlog Interstadual')
    expect(page).not_to have_content('Prazo: 7 dias')
    expect(page).not_to have_content('Preço: R$ 36,00')
  end

  it 'com dados que não estão cadastrados por nenhuma transportadora' do
    @admin = Admin.create!(name: 'Adminzão', email: 'luck@sistemadefrete.com.br', password: 'password')
    @c = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
    Price.create!(initial_volume: 0.001, final_volume: 0.500, initial_weight: 0, final_weight: 200, price_per_km: 1.2, minimal_price: 5, minimal_distance: 2, carrier: @c)
    Deadline.create!(initial_distance: 0, final_distance: 15, days: 4, carrier: @c)

    login_as(@admin, :scope => :admin)
    visit(root_path)
    fill_in('Volume', with: '0.600')
    fill_in('Peso', with: '200')
    fill_in('Distância', with: '10')
    click_on('Consultar')

    expect(page).to have_content('Não foram encontradas transportadoras que atendem as especificações do produto!')
   
  end

end