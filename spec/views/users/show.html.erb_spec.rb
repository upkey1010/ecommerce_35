require "rails_helper"

RSpec.describe "users/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create :user}
  subject {user}

  it "displays user details correctly" do
    assign(:user, subject)
    assign(:current_user, subject)

    render

    expect(subject).to render_template("users/show")
    expect(rendered).to include(user.name)
    expect(rendered).to include(user.address)
    expect(rendered).to include(user.email)
    expect(rendered).to include(user.phone)
  end
end
