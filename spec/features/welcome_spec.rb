require 'rails_helper'

feature 'Welcome' do


  scenario 'Index with featured' do
    projects = [create(:project, :featured),create(:project, :featured),create(:project, :featured)]

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

  scenario 'Index without featured' do
    projects = [create(:project),create(:project),create(:project)]

    visit 'welcome/index'

    expect(page).to have_selector('#projects', count: 1)
    projects.each do |project|
      within('#projects') do
        expect(page).not_to have_content project.name
        expect(page).not_to have_content project.description
        #expect(page).to have_css(".row destacadosWrapperHome", text: project.description)
      end
    end

  end

  scenario 'user no validado' do

    visit 'welcome/index'

    click_link 'Iniciar sesión'
    fill_in 'user_email', with: 'pereekdkdk@madrid.es'
    fill_in 'user_password', with: 'Testing'
    click_button 'Iniciar sesión'
    expect(page).to have_content 'Invalid email or password.'

  end

  scenario 'user' do
    login_as(create(:user, :user_entity))

    visit 'welcome/index'

    expect(page).to have_content 'Area personal'

  end


end