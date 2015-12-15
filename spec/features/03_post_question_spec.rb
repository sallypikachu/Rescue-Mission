require 'rails_helper'

feature 'post new question' do

  scenario 'fails to post a new question' do
    visit questions_path
    click_link('Submit a new question')
    fill_in 'Title', with: 'Failure'
    click_button "Submit Question"

    expect(page).to have_content("Question not created")
  end

  scenario 'successfully posts a new question' do
    visit questions_path
    click_link('Submit a new question')
    fill_in 'Title', with: 'FailureFailureFailureFailureFailureFailureFailureFailureFailureFailure'
    fill_in 'Description', with: 'FailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailure'
    click_button "Submit Question"

    expect(page).to have_content("Question created")
    expect(page).to have_content('FailureFailureFailureFailureFailureFailureFailureFailureFailureFailure')
  end
end
