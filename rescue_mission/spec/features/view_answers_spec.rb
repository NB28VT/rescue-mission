require 'rails_helper'
require_relative 'test_feed'

feature "User visits the question page" do
#
#
# # As a user
# # I want to view the answers for a question
# # So that I can learn from the answer
# #
# # Acceptance Criteria
# #
# # - I must be on the question detail page
# # - I must only see answers to the question I'm viewing
# # - I must see all answers listed in order, most recent last
# #
it " and sees all of the question answers in order, most recent last" do
    visit new_question_path
    fill_in "question[title]", with: QUESTION_TITLE
    fill_in "question[description]", with: QUESTION_DESCRIPTION
    click_button "Submit"

    visit questions_path

    click_link QUESTION_TITLE

    fill_in "answer[description]", with: ANSWER_DESCRIPTION
    click_button "Submit"

    fill_in "answer[description]", with: ANSWER_DESCRIPTION_II
    click_button "Submit"

    (ANSWER_DESCRIPTION_II).should appear_before(ANSWER_DESCRIPTION)


  end



end
