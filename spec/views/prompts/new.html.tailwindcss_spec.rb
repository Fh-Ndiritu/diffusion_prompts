require 'rails_helper'

RSpec.describe "prompts/new", type: :view do
  before(:each) do
    assign(:prompt, Prompt.new(
      split: nil,
      row_idx: 1,
      content: "MyText",
    ))
  end

  it "renders new prompt form" do
    render

    assert_select "form[action=?][method=?]", prompts_path, "post" do

      assert_select "input[name=?]", "prompt[split_id]"

      assert_select "input[name=?]", "prompt[row_idx]"

      assert_select "textarea[name=?]", "prompt[content]"

    end
  end
end