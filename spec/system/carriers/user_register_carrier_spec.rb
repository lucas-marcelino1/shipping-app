require 'rails_helper'

describe 'Usuário admin registra transportadora' do
    it 'com sucesso' do
        @admin = Admin.create!(name: 'Lucas', email: 'admin2@sistemadefrete.com.br', password: '123456')
        
        login_as(@admin, :scope => :admin)
        visit(root_path)
        click_on('Registrar transportadora')
        fill_in('Razão Social', with: 'Expresso São Miguel LTDA')
        fill_in('Nome Fantasia', with: 'São Miguel')
        fill_in('Domínio de e-mail', with: 'saomiguel.com.br')
        fill_in('CNPJ', with: '12.345.678/1000-10')
        fill_in('Endereço', with: 'Rua Estanislau, 1001 - Blumenau/SC')
        click_on('Criar Transportadora')

        expect(page).to have_content('Transportadora cadastrada com sucesso')
        expect(page).to have_content('Expresso São Miguel LTDA')
        expect(page).to have_content('São Miguel')
        expect(page).to have_content('12.345.678/1000-10')
        expect(page).to have_content('saomiguel.com.br')
        expect(page).to have_content('Rua Estanislau, 1001 - Blumenau/SC')
    end

    it 'com dados inválidos e fracassa' do
        @admin = Admin.create!(name: 'Lucas', email: 'admin2@sistemadefrete.com.br', password: '123456')
        
        login_as(@admin, :scope => :admin)
        visit(root_path)
        click_on('Registrar transportadora')
        fill_in('Razão Social', with: '')
        fill_in('Nome Fantasia', with: 'São Miguel')
        fill_in('Domínio de e-mail', with: 'saomiguel.com.br')
        fill_in('CNPJ', with: '12.345.678/10-10')
        fill_in('Endereço', with: 'Rua Estanislau, 1001 - Blumenau/SC')
        click_on('Criar Transportadora')

        expect(page).to have_content('Não foi possível cadastrar a transportadora')
        expect(page).to have_content('Razão Social não pode ficar em branco')
        expect(page).to have_content('CNPJ deve ter o formato')
    end
end