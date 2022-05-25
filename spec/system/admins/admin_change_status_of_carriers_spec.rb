require 'rails_helper' 

describe 'Administrador altera o status da transportadora' do
  it 'para desativado' do
    @admin = Admin.create!(name: 'Admin', email: "admin2@sistemadefrete.com.br", password: 'senha1')
    @c = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')

    login_as(@admin, :scope => :admin)
    visit(root_path)
    click_on('Desativar transportadora')

    expect(page).to have_content('A transportadora foi desativada com sucesso!')
  end

  it 'para ativado' do
    @admin = Admin.create!(name: 'Admin', email: "admin2@sistemadefrete.com.br", password: 'senha1')
    @c = Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC', status: 5)

    login_as(@admin, :scope => :admin)
    visit(root_path)
    click_on('Ativar transportadora')

    expect(page).to have_content('A transportadora foi ativada com sucesso!')
  end
end