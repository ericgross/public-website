# frozen_string_literal: true

require 'rails_helper'

describe 'Concepts' do
  it 'allows navigation of concepts' do
    visit root_path

    within('.header') do
      click_link 'Home'
    end

    expect(page).to have_css('.concept', text: 'Quality')
    expect(page.all('.concept').count).to eq(2)

    within('.sidebar') do
      click_link 'Grow a tech org'
    end
    expect(page).to have_css('.title', text: 'Grow a tech org')
    expect(page).to have_css('.content')

    within('.references') do
      click_link('We are doctors')
    end
    expect(page).to have_css('.title', text: 'We are doctors')

    within('.referenced-by') do
      click_link('Grow a tech org')
    end
    expect(page).to have_css('.concept', text: 'Grow a tech org')
  end
end
