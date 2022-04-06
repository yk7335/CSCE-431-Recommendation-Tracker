require 'rails_helper'

RSpec.describe "images/index", type: :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        uin: "Uin",
        photo: "Photo"
      ),
      Image.create!(
        uin: "Uin",
        photo: "Photo"
      )
    ])
  end

  it "renders a list of images" do
    render
    assert_select "tr>td", text: "Uin".to_s, count: 2
    assert_select "tr>td", text: "Photo".to_s, count: 2
  end
end
