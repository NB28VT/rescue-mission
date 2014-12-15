require 'rails_helper'


feature "User can view all questions" do
  # As a user
  # I want to view recently posted questions
  # So that I can help others
  #
  # Acceptance Criteria
  #
  # - I must see the title of each question
  # - I must see questions listed in order, most recently posted first


  it "can see the title of each question" do
    visit '/questions/new'
    fill_in "question[title]", with: "What the fuck this is such a long question?"
    fill_in "question[description]", with: "What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shitWhat the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit??"
    click_button "Submit"

    visit '/questions/new'
    fill_in "question[title]", with: "What the frick this is such a long-ass question?"
    fill_in "question[description]", with: "What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shitWhat the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit??"
    click_button "Submit"

    visit '/questions'


    expect(page).to have_content ("What the fuck this is such a long question?")
    expect(page).to have_content( "What the frick this is such a long-ass question?")

  end


  it "can see the list of questions in order" do
    visit '/questions/new'
    fill_in "question[title]", with: "What the fuck this is such a long question?"
    fill_in "question[description]", with: "What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shitWhat the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit??"
    click_button "Submit"

    visit '/questions/new'
    fill_in "question[title]", with: "What the frick this is such a long-ass question?"
    fill_in "question[description]", with: "What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shitWhat the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit??"
    click_button "Submit"

    visit '/questions'



    ("What the frick this is such a long-ass question?").should appear_before("What the fuck this is such a long question?")

  end





end
