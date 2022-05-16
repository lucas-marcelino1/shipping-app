require 'rails_helper'

describe 'Usuário de transportadora se cadastra' do
  it 'com sucesso' do
    @c = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')

    visit(root_path)
    click_on('Entrar')
    click_on('Cadastrar usuário')
    fill_in('Nome', with: 'Lucas')
    fill_in('E-mail', with: 'lucas@reunidas.com')
    fill_in('Senha', with: '123456')
    fill_in('Confirme sua senha', with: '123456')
    click_on('Cadastrar Usuário de Transportadora')

    expect(page).to have_content('Boas vindas! Você realizou seu registro com sucesso.')

  end

  it 'com domínio inexistente e falha' do
   
    visit(root_path)
    click_on('Entrar')
    click_on('Cadastrar usuário')
    fill_in('Nome', with: 'Lucas')
    fill_in('E-mail', with: 'lucas@reunidas.com')
    fill_in('Senha', with: '123456')
    fill_in('Confirme sua senha', with: '123456')
    click_on('Cadastrar Usuário de Transportadora')

    expect(page).to have_content('Não foi possível salvar usuário de transportadora')

  end


end