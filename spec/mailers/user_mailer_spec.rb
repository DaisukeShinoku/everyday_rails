require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome_email" do
    let(:user) { FactoryBot.create(:user) }
    let(:mail) { UserMailer.welcome_email(user) }

    it "ウェルカムメールをユーザーのメールアドレスに送信すること" do
      expect(mail.to).to eq [user.email]
    end

    it "サポート用のメールアドレスから送信すること" do
      expect(mail.from).to eq ["support@example.com"]
    end

    it "正しい件名で送信すること" do
      expect(mail.subject).to eq "Welcome to Projects!" 
    end

    it "ユーザーにはファーストネームであいさつすること" do
      expect(mail.body).to match(/Hello #{user.first_name},/)
    end

    it "登録したユーザーのメールアドレスを残しておくこと" do
      expect(mail.body).to match user.email
    end
  end
end
