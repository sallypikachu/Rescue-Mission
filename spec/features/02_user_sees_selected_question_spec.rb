require 'rails_helper'

feature 'sees question title and description' do
  scenario 'sees question details' do
    question = Question.create(title: '01234567890012345678900123456789001234567890',
      description: '012345678900123456789001234567890012345678900123456789001234567890012345678900123456789001234567890012345678900123456789001234567890012345678900123456789001234567890')

    visit questions_path
    click_link(question.title)

    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end
end
