require 'rails_helper'

describe 'Usuário atualiza a transportadora' do
  it 'com sucesso' do
    Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Rnias', registration_number: '12.345.678/1000-10', 
                    email_domain: 'reunidascom', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
    
    visit(root_path)
    click_on('Reunidas Brasil LTDA')
    fill_in('Nome Fantasia', with: 'Reunidas')
    fill_in('Domínio de e-mail', with: 'reunidas.com.br')
    click_on('Atualizar Transportadora')

    expect(page).to have_content('Transportadora atualizada com sucesso')
    expect(page).to have_content('Reunidas Brasil LTDA')
    expect(page).to have_content('Reunidas')
    expect(page).to have_content('12.345.678/1000-10')
    expect(page).to have_content('reunidas.com.br')
    expect(page).to have_content('Rua São Paulo, 6454 - Massaranduba/SC')
  end

  it 'com dados inválidos e fracassa' do
    Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Rnias', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidascom', address: 'Rua São Paulo, 6454 - Massaranduba/SC')

    visit(root_path)
    click_on('Reunidas Brasil LTDA')
    fill_in('Nome Fantasia', with: '')
    fill_in('CNPJ', with: '184884184')
    fill_in('Domínio de e-mail', with: 'reunidas.com.br')
    click_on('Atualizar Transportadora')
    
    expect(page).to have_content('Não foi possível atualizar a transportadora')
    expect(page).to have_content('Nome Fantasia não pode ficar em branco')
    expect(page).to have_field('Razão Social', with: 'Reunidas Brasil LTDA')
    expect(page).to have_field('Nome Fantasia', with: '')
    expect(page).to have_field('Domínio de e-mail', with: 'reunidas.com.br')
  
  end
end