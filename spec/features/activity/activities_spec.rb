require 'rails_helper'

feature 'Activities' do


  scenario 'Index' do
    Activities = [create(:activity), create(:activity), create(:activity)]

    visit debates_path

    expect(page).to have_selector('#debates .debate', count: 3)
    debates.each do |debate|
      within('#debates') do
        expect(page).to have_content debate.title
        expect(page).to have_css("a[href='#{debate_path(debate)}']", text: debate.description)
      end
    end
  end


end