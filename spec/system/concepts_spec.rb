# frozen_string_literal: true

require 'rails_helper'

describe 'Concepts' do
  it 'shows a list of concepts' do
    visit root_path
    expect(page).to have_css('.concept', text: 'Quality')
  end
end
