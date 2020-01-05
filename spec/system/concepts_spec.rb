# frozen_string_literal: true

require 'rails_helper'

describe 'Concepts' do
  it 'allows navigation of concepts' do
    visit root_path

    within('.header') do
      click_link 'Home'
    end

    expect(page).to have_css('.concept', text: 'Quality')
    expect(page.all('.concept').count).to eq(1)

    within('.sidebar') do
      click_link 'Create a software product'
    end
    expect(page).to have_css('.title', text: 'Create a software product')
    expect(page).to have_css('.content')

    within('.references') do
      click_link('Structured logging')
    end
    expect(page).to have_css('.title', text: 'Structured logging')

    within('.referenced-by') do
      click_link('Create a software product')
    end
    expect(page).to have_css('.concept', text: 'Create a software product')
  end
end
