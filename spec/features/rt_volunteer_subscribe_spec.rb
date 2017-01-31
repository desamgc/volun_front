require 'rails_helper'
include Devise::TestHelpers
feature 'rt volunteer subscribe' do

  

  context "Projects" do


    scenario "create request" do
      visit new_rt_volunteer_subscribe_path
      fill_in 'rt_volunteer_subscribe_name', with: 'A name'
      
      click_button 'button button4'
      expect(page).to_not have_content 'Request sent successfully.'
    
      
    end

    scenario "Shows project in projects" do
      project = create(:project)
      visit index_i_projects_path
      within("#projects") do
        expect(page).to have_content(project.name)
      end
    end

    scenario "Shows login" do
      current_user = login_as(create(:user))	
      #project = create(:project)
      visit index_i_projects_path
      #click_link new_user_session_path
      expect(page).to have_content('Modificar contraseña')
      
    end

    scenario "not Shows login" do
      visit index_i_projects_path
      expect(page).to_not have_content('Modificar contraseña')
      
    end

    
  end  
          
  

end