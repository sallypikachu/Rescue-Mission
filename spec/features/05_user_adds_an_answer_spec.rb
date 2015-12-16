require 'rails_helper'

feature 'post new answer' do
  let(:question) { Question.create(title:     'FailureFailureFailureFailureFailureFailureFailureFailureFailureFailure',
    description:  'FailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailureFailure')}

  scenario 'fails to post a new answer' do
    visit question_path(question)

    fill_in "Answer", with: 'short'
    click_button "Submit Answer"

    expect(page).to have_content("Answer is too short")
  end

  scenario 'successfully posts a new question' do
    visit question_path(question)

    fill_in "Answer", with: 'Sufficiently long answer.Sufficiently long answer.Sufficiently long answer.Sufficiently long answer.Sufficiently long answer.Sufficiently long answer.Sufficiently long answer.Sufficiently long answer.'
    click_button "Submit Answer"

    expect(page).to have_content("Answer saved successfully")
    expect(page).to have_content("Sufficiently long answer.")
  end
end
