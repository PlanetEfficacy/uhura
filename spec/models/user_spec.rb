require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many(:groups) }
  it { should have_many(:enrollments) }
  it { should have_many(:students) }
  it { should have_many(:messages) }

  describe "role" do
    let(:hierarchy) { [:teacher, :admin, :district_admin, :super_admin] }

    it "has the right index" do
      hierarchy.each_with_index do |role, index|
        expect(User.roles[role]).to eq(index)
      end
    end
  end

  it "creates or updates from an omniauth-google-oauth2 hash" do
    auth = {
      provider: "google",
      uid: "123456789101111213141",
      info: {
        name: "Jesse Spevack",
        email: "jspevack@mountainmantechnologies.com",
        first_name: "Jesse",
        last_name: "Spevack",
        image: "https://lh3.googleusercontent.com/-ZI4ojL91GxA/AAAAAAAAAAI/AAAAAAAAGVo/1F5PGMtlgHI/s50-c/photo.jpg",
        urls: "https://plus.google.com/123456789101111213141"
      },
      credentials: {
        token: "my_token",
        refresh_token: "another_token",
        expires_at: "1477945241",
        expires: "true"
      },
      extra: {
        local: "en"
      }
    }

    User.update_or_create(auth)
    new_user = User.first

    expect(new_user.role).to eq("teacher")
    expect(new_user.provider).to eq("google")
    expect(new_user.uid).to eq("123456789101111213141")
    expect(new_user.name).to eq("Jesse Spevack")
    expect(new_user.email).to eq("jspevack@mountainmantechnologies.com")
    expect(new_user.first_name).to eq("Jesse")
    expect(new_user.last_name).to eq("Spevack")
    expect(new_user.image).to eq("https://lh3.googleusercontent.com/-ZI4ojL91GxA/AAAAAAAAAAI/AAAAAAAAGVo/1F5PGMtlgHI/s50-c/photo.jpg")
    expect(new_user.urls).to eq("https://plus.google.com/123456789101111213141")
    expect(new_user.token).to eq("my_token")
    expect(new_user.refresh_token).to eq("another_token")
    expect(new_user.expires_at).to eq(Time.at(1477945241).to_datetime)
    expect(new_user.expires).to eq(true)
  end

end
