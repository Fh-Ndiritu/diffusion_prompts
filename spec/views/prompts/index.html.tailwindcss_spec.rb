require 'rails_helper'

RSpec.describe "prompts/index", type: :view do
  before(:each) do
    assign(:prompts, [
      Prompt.create!(
        split: nil,
        row_idx: 2,
        content: "MyText",
        truncated_cells: "Truncated Cells",
        partial: false
      ),
      Prompt.create!(
        split: nil,
        row_idx: 2,
        content: "MyText",
        truncated_cells: "Truncated Cells",
        partial: false
      )
    ])
  end

  it "renders a list of prompts" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Truncated Cells".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(false.to_s), count: 2
  end
end
