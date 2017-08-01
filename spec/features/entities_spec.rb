require 'rails_helper'

feature 'entities' do

  scenario 'Creating a entity' do
    visit entities_path
    click_link 'Hazte entidad colaboradora'
    fill_in 'entity_email', with: 'pepe@gmail.com'
    click_button 'Enviar'
    expect(page).to have_content "errors"
    fill_in 'entity_name', with: 'entidad 1'
    fill_in 'entity_user_attributes_password', with: '123456789'
    fill_in 'entity_user_attributes_password_confirmation', with: '123456789'
    select "Asociación", from: "entity_entity_type_id"
    fill_in 'entity_vat_number', with: '52755658y'
    select "Publicar proyectos", from: "entity_req_reason_id"
    fill_in 'entity_contact_name', with: 'pepe'
    fill_in 'entity_contact_last_name', with: 'pepe'
    fill_in 'entity_representative_name', with: 'pepe'
    fill_in 'entity_representative_last_name', with: 'pepe'
    fill_in 'entity_phone_number', with: '915133368'
    select "ACCESO", from: "entity_address_attributes_road_type"
    fill_in 'entity_address_attributes_road_name', with: 'pepe'
    select "Km", from: "entity_address_attributes_road_number_type"
    fill_in 'entity_address_attributes_road_number', with: 'pepe'
    fill_in 'entity_address_attributes_postal_code', with: 'pepe'
    select "ALBACETE", from: "entity_address_attributes_province"
    fill_in 'entity_address_attributes_town', with: 'pepe'
    #check 'Al registrarte aceptas las condiciones de uso'
    find('#entity_user_attributes_terms_of_service').click

    click_button 'Enviar'

    expect(page).to have_content "Le hemos enviado un correo para que confirme el alta en la comunidad del voluntariado."

    user = User.find_by_email('pepe@gmail.com')

    expect(user).to_not be_confirmed

    sent_token = /.*confirmation_token=(.*)".*/.match(ActionMailer::Base.deliveries.last.body.to_s)[1]
    visit user_confirmation_path(confirmation_token: sent_token)

    expect(page).to have_content "Your account has been confirmed."
    #click_link "Confirmar cuenta"

    #fill_in 'user_email', with: 'pepe@gmail.com'
    #fill_in 'user_password', with: '12345678'

    #click_button 'Iniciar sesión'

  end

end