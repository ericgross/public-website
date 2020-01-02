# frozen_string_literal: true

require 'rails_helper'

describe 'Concepts' do
  it 'shows a list of concepts' do
    visit root_path
    click_link 'Concepts'
    expect(page).to have_css('.concept', text: 'Quality')
    expect(page.all('.concept').count).to be > 50
  end
end
