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
    expect(page).to have_css("a[href='/projects?page=2']", text: "Ver Más")
  end

  scenario 'Show' do
    @volunteers = [create(:volunteer), create(:volunteer)]
    project = create(:project, volunteers: @volunteers)

    visit project_path(project)

    expect(page).to have_content project.name
    expect(page).to have_content project.description
    expect(page).to have_content "2 voluntarios"
    within('.redesWrapProject') do
      expect(page.all('a').count).to be(2) # Twitter, Facebook
    end
  end


  scenario 'Show as login participando' do
    @volunteer = create(:volunteer)
    @user = create(:user, loggable: @volunteer)
    login_as(@user)
    @volunteers = [@volunteer]

    project = create(:project, volunteers: @volunteers)

    visit project_path(project)

    expect(page).to have_content I18n.t('project.subscribed')

  end

  scenario 'Show as inscribirse' do
    @volunteer = create(:volunteer)
    @user = create(:user, loggable: @volunteer)
    login_as(@user)
    @volunteers = [@volunteer]

    project = create(:project)

    visit project_path(project)

    expect(page).to have_content I18n.t('project.interesting')

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

      scenario 'Search by area' do
        @areaCultura = Area.where("name='CULTURA'")
        @areaDeportes = [create(:area, :deportes)]
        project1 = create(:project, areas: @areaCultura)
        project2 = create(:project, areas: @areaDeportes)
        project3 = create(:project)

        visit projects_path

        check 'Cultura'
        click_button "buscar"

        within("#projects") do
          expect(page).to have_content(project1.name)
          expect(page).to_not have_content(project2.name)
          expect(page).to_not have_content(project3.name)
        end
      end

      scenario 'Search all' do
        @areaCultura = [create(:area, :cultura)]
        @areaDeportes = [create(:area, :deportes)]
        project1 = create(:project, areas: @areaCultura)
        project2 = create(:project, areas: @areaDeportes)
        project3 = create(:project)

        visit projects_path

        click_link "Ver todos"

        within("#projects") do
          expect(page).to have_content(project1.name)
          expect(page).to have_content(project2.name)
          expect(page).to have_content(project3.name)
        end
      end

    end
  end


end