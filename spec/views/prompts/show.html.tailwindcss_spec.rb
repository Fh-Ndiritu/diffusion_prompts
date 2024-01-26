require 'rails_helper'

RSpec.describe "prompts/show", type: :view do
  before(:each) do
    assign(:prompt, Prompt.create!(
      split: nil,
      row_idx: 2,
      content: "MyText",
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Truncated Cells/)
    expect(rendered).to match(/false/)
  end
end
