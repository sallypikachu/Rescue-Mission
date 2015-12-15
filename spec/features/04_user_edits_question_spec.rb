require 'rails_helper'

feature 'edit question title and description' do
  let(:question) { Question.create(title: '01234567890012345678900123456789001234567890',
      description: '012345678900123456789001234567890012345678900123456789001234567890012345678900123456789001234567890012345678900123456789001234567890012345678900123456789001234567890')}

  scenario 'edits question title but fails' do
    question
    visit questions_path
    click_link(question.title)
    click_link("Edit Question")
    fill_in 'Title', with: 'Failure'
    click_button "Submit Changes"

    expect(page).to have_content("Question not updated")
    expect(page).to have_content('01234567890012345678900123456789001234567890')
  end

  scenario 'successfully edits question title' do
    question
    visit questions_path
    click_link(question.title)
    click_link("Edit Question")
    fill_in 'Title', with: 'FailureFailureFailureFailureFailureFailureFailureFailureFailureFailure'
    click_button "Submit Changes"

    expect(page).to have_content("Question updated")
    expect(page).to have_content('FailureFailureFailureFailureFailureFailureFailureFailureFailureFailure')
  end
end
