require 'rails_helper'

describe 'Usuário registra administrador' do
  it 'com sucesso' do

    visit(root_path)
    click_on('Administrador')
    click_on('Se inscrever')
    fill_in('E-mail', with: 'newadmin@sistemadefrete.com.br')
    fill_in('Senha', with: '123456')
    fill_in('Confirme sua senha', with: '123456')
    click_on('Se inscrever')

    expect(page).to have_content('Boas vindas! Você realizou seu registro com sucesso.')
  
  end

  it 'com e-mail corporativo inválido' do

    visit(root_path)
    click_on('Administrador')
    click_on('Se inscrever')
    fill_in('E-mail', with: 'newadmin@fretedetransportadoras.com.br')
    fill_in('Senha', with: '123456')
    fill_in('Confirme sua senha', with: '123456')
    click_on('Se inscrever')

    expect(page).to have_content('Não foi possível salvar administrador do sistema')
    expect(page).to have_content('E-mail de administrador inválido.')
  end

end