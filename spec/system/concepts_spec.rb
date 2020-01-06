# frozen_string_literal: true

require 'rails_helper'

describe 'Concepts' do
  it 'allows navigation of concepts' do
    visit root_path

    expect(page).to have_css('.concept', text: 'Home Page')
    expect(page.all('.concept').count).to eq(1)

    within('.sidebar') do
      click_link 'A1'
    end
    expect(page).to have_css('.title', text: 'A1')
    expect(page).to have_css('.content', text: 'AAA')

    within('.references') do
      click_link('A2')
    end
    expect(page).to have_css('.title', text: 'A2')

    within('.referenced-by') do
      click_link('A1')
    end
    expect(page).to have_css('.concept', text: 'A1')

    within('.header') do
      click_link 'Home'
    end

    within('.sidebar') do
      click_link 'B1'
    end
  end

  it 'allows navigation via next/previous' do
    pending
    visit root_path

    click_link 'Next: A1'
    click_link 'Next: A2'
    click_link 'Next: B1'
  end
end
