require 'rails_helper'

feature 'Welcome' do


  scenario 'Index' do
    projects = [create(:pt_social)]

    visit 'welcome/index'

    expect(page).to have_selector('#projects', count: 1)
    projects.each do |project|
      within('#projects') do
        expect(page).to have_content project.name
        expect(page).to have_content project.description
        #expect(page).to have_css(".row destacadosWrapperHome", text: project.description)
      end
    end

  end



end