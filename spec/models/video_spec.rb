require 'rails_helper'

RSpec.describe Video, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :url }
    it { should validate_presence_of :views }
  end

  describe "relationships" do
    it { should belong_to(:user) }
  end

  describe "methods" do
    describe "#valid_url?" do
      before do
        @user = User.create(email: "user@email.com", password: "password", password_confirmation:"password")
        @video = Video.create(title: "new video", url:"http://some.url/", user: @user)
      end
      it "should be a valid url" do
        @video.url = "https://content.jwplatform.com/manifests/yp34SRmf.m3u8"

        expect(@video.valid?).to eql(true)
      end

      it { expect(@video.valid?).to eql(false) }
    end
  end
end
