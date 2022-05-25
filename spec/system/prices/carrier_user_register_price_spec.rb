require 'rails_helper'

describe 'Usuário de transportadora cadastra preços' do

  it 'com sucesso' do
    Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
    @user = CarrierUser.create(name: 'Lucas', email: 'lucas@reunidas.com', password: '123456')

    login_as(@user, :scope => :carrier_user)
    visit(root_path)
    click_on('Nossos preços')
    click_on('Cadastrar preço')
    fill_in('De [volume inicial (m³)]', with: '0.001')
    fill_in('até [volume final (m³)]', with: '0.500')
    fill_in('De [peso inicial (kg)]', with: '0')
    fill_in('até [peso final (kg)]', with: '50')
    fill_in('O preço (R$) por kilômetro é', with: '1.20')
    fill_in('Preço mínimo (R$)', with: '7')
    fill_in('distância mínima', with: '5')
    click_on('Cadastrar Preço')

    expect(page).to have_content('O preço foi cadastrado com sucesso!')
  end

  it 'com dados inválidos' do
    Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
    @user = CarrierUser.create(name: 'Lucas', email: 'lucas@reunidas.com', password: '123456')

    login_as(@user, :scope => :carrier_user)
    visit(root_path)
    click_on('Nossos preços')
    click_on('Cadastrar preço')
    fill_in('De [volume inicial (m³)]', with: 'Trezentos metros cúbicos')
    fill_in('até [volume final (m³)]', with: '0.500')
    fill_in('De [peso inicial (kg)]', with: '0')
    fill_in('até [peso final (kg)]', with: '50')
    fill_in('O preço (R$) por kilômetro é', with: '1.20')
    fill_in('Preço mínimo (R$)', with: '7')
    fill_in('distância mínima', with: '5')
    click_on('Cadastrar Preço')

    expect(page).to have_content('Não foi possível cadastrar o preço!')
    expect(page).to have_content('De [volume inicial (m³)] deve ser um número válido, use o . (ponto) como separador decimal.')

  end
end