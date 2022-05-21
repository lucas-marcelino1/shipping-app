require 'rails_helper' 

describe 'Usuário de transportadora registra prazos de entrega' do
  
  it 'com sucesso' do 
    Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
    @user = CarrierUser.create(name: 'Lucas', email: 'lucas@reunidas.com', password: '123456')

    login_as(@user, :scope => :carrier_user)
    visit(root_path)
    click_on('Nossos prazos de entrega')
    click_on('Cadastrar prazo de entrega')
    fill_in('Distância inicial', with: '0')
    fill_in('Distância final', with: '50')
    fill_in('Prazo (dias úteis)', with: '3')
    click_on('Criar Prazo')

    expect(page).to have_content('Prazo cadastrado com sucesso')
    expect(page).to have_content('De 0km até 50km o prazo de entrega é 3 dias úteis')
  end

  it 'com dados inválidos e falha' do 
    Carrier.create!(corporation_name: 'Reunidas Brasil LTDA', brand_name: 'Reunidas', registration_number: '12.345.678/1000-10', 
      email_domain: 'reunidas.com', address: 'Rua São Paulo, 6454 - Massaranduba/SC')
    @user = CarrierUser.create(name: 'Lucas', email: 'lucas@reunidas.com', password: '123456')

    login_as(@user, :scope => :carrier_user)
    visit(root_path)
    click_on('Nossos prazos de entrega')
    click_on('Cadastrar prazo de entrega')
    fill_in('Distância inicial', with: '50')
    fill_in('Distância final', with: '3')
    fill_in('Prazo (dias úteis)', with: '-2')
    click_on('Criar Prazo')

    expect(page).to have_content('Não foi possível realizar o cadastro deste prazo')
    expect(page).to have_content('Distância inicial deve ser menor que a distância final.')
    expect(page).to have_content('Distância final deve ser maior que a distância inicial.')
    expect(page).to have_content('Prazo (dias úteis) deve ser maior ou igual a 1')
    
  end
end