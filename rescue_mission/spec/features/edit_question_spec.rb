require 'rails_helper'
require_relative 'test_feed'

feature "User can edit question with corrections" do
# ```no-highlight
# As a user
# I want to edit a question
# So that I can correct any mistakes or add updates
#
# Acceptance Criteria
#
# - I must provide valid information
# - I must be presented with errors if I fill out the form incorrectly
# - I must be able to get to the edit page from the question details page
# ```

  it "Can edit question" do
    visit new_question_path
    fill_in "question[title]", with: QUESTION_TITLE
    fill_in "question[description]", with: QUESTION_DESCRIPTION
    click_button "Submit"

    visit questions_path
    click_link QUESTION_TITLE

    click_link "Edit"

    fill_in "question[title]", with: QUESTION_TITLE
    fill_in "question[description]", with: QUESTION_DESCRIPTION_II
    click_button "Submit"
    expect(page).to have_content(QUESTION_DESCRIPTION_II)

  end
end
