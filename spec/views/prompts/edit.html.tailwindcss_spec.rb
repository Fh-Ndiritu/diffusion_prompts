require 'rails_helper'

RSpec.describe "prompts/edit", type: :view do
  let(:prompt) {
    Prompt.create!(
      split: nil,
      row_idx: 1,
      content: "MyText",
      truncated_cells: "MyString",
      partial: false
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

      assert_select "input[name=?]", "prompt[truncated_cells]"

      assert_select "input[name=?]", "prompt[partial]"
    end
  end
end
