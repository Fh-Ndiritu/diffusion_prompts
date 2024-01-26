require 'rails_helper'

RSpec.describe "prompts/edit", type: :view do
  let(:prompt) {
    Prompt.create!(
      split: nil,
      row_idx: 1,
      content: "MyText",
    )
  }

  before(:each) do
    assign(:prompt, prompt)
  end

  it "renders the edit prompt form" do
    render

    assert_select "form[action=?][method=?]", prompt_path(prompt), "post" do

      assert_select "input[name=?]", "prompt[split_id]"

      assert_select "input[name=?]", "prompt[row_idx]"

      assert_select "textarea[name=?]", "prompt[content]"

    end
  end
end
