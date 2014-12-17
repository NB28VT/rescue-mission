require 'rails_helper'
require_relative 'test_feed'

feature "User can delete question" do

  # ```no-highlight
  # As a user
  # I want to delete a question
  # So that I can delete duplicate questions
  #
  # Acceptance Criteria
  #
  # - I must be able delete a question from the question edit page
  # - I must be able delete a question from the question details page
  # - All answers associated with the question must also be deleted
  # ```

  it "can delete question" do
    visit new_question_path
    fill_in "question[title]", with: QUESTION_TITLE
    fill_in "question[description]", with: QUESTION_DESCRIPTION
    click_button "Submit"

    visit questions_path
    click_link QUESTION_TITLE

    click_link "Delete"

    visit questions_path
    expect(page).not_to have_content(QUESTION_TITLE)
    save_and_open_page

  end

end
