require 'rails_helper'


feature "User can view details of a question" do
  # As a user
  # I want to view a question's details
  # So that I can effectively understand the question
  #
  # Acceptance Criteria
  #
  # - I must be able to get to this page from the questions index
  # - I must see the question's title
  # - I must see the question's description

  it "can get to this page from the questions index" do
    visit '/questions/new'
    fill_in "question[title]", with: "What the fuck this is such a long question?"
    fill_in "question[description]", with: "What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shitWhat the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit"

    click_button "Submit"


    visit '/questions'

    click_link "What the fuck this is such a long question?"

    save_and_open_page

    expect(page).to have_content "What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shitWhat the fuck is up with this shit?What the fuck is up with this shit?What the fuck is up with this shit"
  end
end
