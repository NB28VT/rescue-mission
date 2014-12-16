require 'rails_helper'
require_relative 'test_feed'


feature "User can view all questions" do
  # As a user
  # I want to view recently posted questions
  # So that I can help others
  #
  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first



# USE VARIABLES, FACTORIES, USE ROUTES

  it "can see the title of each question" do
    visit new_question_path
    fill_in "question[title]", with: QUESTION_TITLE
    fill_in "question[description]", with: QUESTION_DESCRIPTION
    click_button "Submit"

    visit new_question_path
    fill_in "question[title]", with: (QUESTION_TITLE + "Solutions")
    fill_in "question[description]", with: QUESTION_DESCRIPTION
    click_button "Submit"

    visit questions_path

    expect(page).to have_content(QUESTION_TITLE)
    expect(page).to have_content(QUESTION_TITLE + "Solutions")

  end


  it "can see the list of questions in order" do
    visit new_question_path
    fill_in "question[title]", with: SECOND_QUESTION_TITLE
    fill_in "question[description]", with: QUESTION_DESCRIPTION
    click_button "Submit"

    visit new_question_path
    fill_in "question[title]", with: (QUESTION_TITLE)
    fill_in "question[description]", with: QUESTION_DESCRIPTION
    click_button "Submit"

    visit questions_path

    (QUESTION_TITLE).should appear_before(SECOND_QUESTION_TITLE)
  end
end
