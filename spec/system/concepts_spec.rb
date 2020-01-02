# frozen_string_literal: true

require 'rails_helper'

describe 'Concepts' do
  it 'allows navigation of concepts' do
    visit root_path
    click_link 'Concepts'
    expect(page).to have_css('.concept', text: 'Quality')
    expect(page.all('.concept').count).to be > 50
    click_link 'Quality'
    expect(page).to have_css('.title', text: 'Quality')
    expect(page).to have_css('.content')
    expect(page).to have_css('.references')
  end
end
