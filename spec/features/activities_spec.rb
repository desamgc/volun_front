require 'rails_helper'

feature 'Activities' do


  scenario 'Index no publish evento' do
    @timetables = [create(:timetable)]
    @events = [create(:event, publish: false, timetables: @timetables ), create(:event), create(:event)]
    activities = [create(:activity, events: @events )]

    visit activities_path

    expect(page).to have_selector('#activities', count: 1)
    activities.each do |activity|
      within('#activities') do
        expect(page).to_not have_content activity.name
        expect(page).to_not have_css("a[href='#{activity_path(activity)}']")
      end
    end
  end


  scenario 'Index no publish activity' do
    @timetables = [create(:timetable)]
    @events = [create(:event, timetables: @timetables ), create(:event), create(:event)]
    activities = [create(:activity, publish: false, events: @events )]

    visit activities_path

    expect(page).to have_selector('#activities', count: 1)
    activities.each do |activity|
      within('#activities') do
        expect(page).to_not have_content activity.name
        expect(page).to_not have_css("a[href='#{activity_path(activity)}']")
      end
    end
  end


  scenario 'Index publish activity y evento'   do
    @timetables = [create(:timetable)]
    @events = [create(:event, publish:true, timetables: create_list(:timetable, 2) ), create(:event), create(:event)]
    activities = [create(:activity, publish: true, events: @events )]

    visit activities_path

    expect(page).to have_selector('#activities', count: 1)
    activities.each do |activity|
      within('#activities') do
        expect(page).to have_content activity.name
        activity.addresses.each do |address|
          expect(page).to have_content address.district
        end
        expect(page).to have_css("a[href='#{activity_path(activity)}']")
      end

    end
  end



  scenario 'Paginated Index', js: false do
    per_page = Kaminari.config.default_per_page_activity
    (per_page + 2).times { create(:activity, events: create_list(:event, 2, timetables: create_list(:timetable,2))) }
      visit activities_path
      save_and_open_page
      expect(page).to have_selector('#activities', count: 1)
      expect(page).to have_css("a[href='/activities?page=2']", text: "Ver Más")
  end

  scenario 'show' do
    @timetables = [create(:timetable)]
    @events = [create(:event, publish:true, timetables: create_list(:timetable, 2) ), create(:event), create(:event)]
    activity = create(:activity, publish: true, events: @events )
    visit activity_path(activity)
    expect(page).to have_content activity.name

  end


end