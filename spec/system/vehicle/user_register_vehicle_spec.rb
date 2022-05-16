require 'rails_helper'

describe 'Usuário registra veículo de transportadora' do

  it 'com sucesso' do
    Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
                    email_domain: 'reunidascom', address: 'Rua São Paulo, 6454 - Massaranduba/SC')

    visit(root_path)
    click_on('Registrar veículo')
    fill_in('Placa', with: 'A5D534C4')
    fill_in('Marca', with: 'Volvo')
    fill_in('Modelo', with: 'CAM-3504')
    fill_in('Ano', with: '1996')
    fill_in('Capacidade máxima', with: '500')
    select('Reunidas', from: 'Transportadora')
    click_on('Criar Veículo')

    expect(page).to have_content('Veículo cadastrado com sucesso')
    expect(page).to have_content('Placa: A5D534C4')
    expect(page).to have_content('Marca: Volvo')
    expect(page).to have_content('Modelo: CAM-3504')
    expect(page).to have_content('Ano: 1996')
    expect(page).to have_content('Capacidade máxima: 500kg')
    expect(page).to have_content('Transportadora: Reunidas')
  end

end