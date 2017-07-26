require 'rails_helper'

feature 'Projects' do



  scenario 'Index' do
    projects = [create(:project), create(:project), create(:project), create(:project)]

    visit projects_path

    expect(page).to have_selector('#projects', count: 1)
    projects.each do |project|
      within('#projects') do
        expect(page).to have_content project.name
        expect(page).to have_content project.description
      end
    end
  end

  scenario 'Paginated Index' do
    per_page = Kaminari.config.default_per_page
    (per_page + 2).times { create(:project) }

    visit projects_path

    expect(page).to have_selector('#projects', count: 1)

    #within("ul") do
    #  click_link "Next", exact: false
    #end
    expect(page).to have_css("a[href='/projects?page=2']", text: "Ver Más")
    #expect(page).to have_selector('#debates .debate', count: 2)
  end

  scenario 'Show' do
    project = create(:project)

    visit project_path(project)

    expect(page).to have_content project.name
    expect(page).to have_content project.description

    within('.redesWrapProject') do
      expect(page.all('a').count).to be(3) # Twitter, Facebook, Google+
    end
  end


  context "Search" do

    context "Basic search" do

      scenario 'Search by text' do
        project1 = create(:project, name: "Get Schwifty")
        project2 = create(:project, name: "Schwifty Hello")
        project3 = create(:project, name: "Do not show me")

        visit projects_path

        within ".cajaBusqueda" do
          fill_in "q_name_or_description_cont", with: "Schwifty"
          click_button "buscar"
        end

        within("#projects") do

          expect(page).to have_content(project1.name)
          expect(page).to have_content(project2.name)
          expect(page).to_not have_content(project3.name)
        end
      end
    end
  end


end