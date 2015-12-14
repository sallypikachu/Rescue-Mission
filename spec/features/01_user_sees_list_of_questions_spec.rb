require 'rails_helper'

feature 'sees list of all questions' do
  scenario 'sees all the questions' do
    question = Question.create(title: '01234567890012345678900123456789001234567890',
      description: '012345678900123456789001234567890012345678900123456789001234567890012345678900123456789001234567890012345678900123456789001234567890012345678900123456789001234567890')

    visit questions_path
    expect(page).to have_content(question.title)
  end
end
