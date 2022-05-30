require 'rails_helper'

describe 'Admin cadastra ordem de serviço' do
  it 'com sucesso' do
    @admin = Admin.create!(name: 'Lucas', email: 'admin2@sistemadefrete.com.br', password: '123456')
    @c = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Rnias', registration_number: '12.345.678/1000-10', 
                    email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
    login_as(@admin, :scope => :admin)
    visit(root_path)
    click_on('Cadastrar ordem de serviço')
    select('Reunidas Brasil LTDA - 12.345.678/1000-10', from: 'Transportadora')
    fill_in('Código do item', with: 'ABCDEFG')
    fill_in('Volume', with: '0.50')
    fill_in('Peso', with: '30')
    fill_in('Nome do destinatário', with: 'Júlia')
    fill_in('CPF do destinatário', with: '114.834.329-63')
    fill_in('Endereço de coleta', with: 'Rua Jordão, 504')
    fill_in('Endereço de entrega', with: 'Rua Avenópolis, 137')
    click_on('Criar Ordem de Serviço')

    expect(page).to have_content('Ordem de serviço cadastrada com sucesso')
  end

  it 'com dados inválidos e fracassa' do
    @admin = Admin.create!(name: 'Lucas', email: 'admin2@sistemadefrete.com.br', password: '123456')
    @c = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Rnias', registration_number: '12.345.678/1000-10', 
                    email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
    login_as(@admin, :scope => :admin)
    visit(root_path)
    click_on('Cadastrar ordem de serviço')
    select('Reunidas Brasil LTDA - 12.345.678/1000-10', from: 'Transportadora')
    fill_in('Código do item', with: '')
    fill_in('Volume', with: '-50')
    fill_in('Peso', with: '30')
    fill_in('Nome do destinatário', with: '')
    fill_in('CPF do destinatário', with: '114.834.329-63')
    fill_in('Endereço de coleta', with: '')
    fill_in('Endereço de entrega', with: 'Rua Avenópolis, 137')
    click_on('Criar Ordem de Serviço')

    expect(page).to have_content('Não foi possível cadastrar a ordem de serviço')
    expect(page).to have_content('Volume deve ser maior que 0')
    expect(page).to have_content('Endereço de coleta não pode ficar em branco')
    expect(page).to have_content('Nome do destinatário não pode ficar em branco')
    expect(page).to have_content('Código do item não pode ficar em branco')
    
  end
end