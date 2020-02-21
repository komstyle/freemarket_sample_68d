require 'rails_helper'

describe User do
  describe 'user#create' do
    it "is valid with a nickname, first_name, last_name, first_furigana, last_furigana, birthday, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください。")
    end

    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください。")
    end

    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください。")
    end

    it "is invalid without a first_furigana" do
      user = build(:user, first_furigana: nil)
      user.valid?
      expect(user.errors[:first_furigana]).to include("を入力してください。")
    end

    it "is invalid without a last_furigana" do
      user = build(:user, last_furigana: nil)
      user.valid?
      expect(user.errors[:last_furigana]).to include("を入力してください。")
    end

    it "is invalid without a birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください。")
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください。")
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください。")
    end

    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません。")
    end

    it "is invalid with a password that has more than 7 characters " do
      user = build(:user, password: "11bbcc", password_confirmation: "11bbcc")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください。")
    end

    it "is valid with a password that has less than 7 characters " do
      user = build(:user, password: "11bbccd", password_confirmation: "11bbccd")
      expect(user).to be_valid
    end

    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します。")
    end

    it "first_furigana is invalid except Hiragana " do
      user = build(:user, first_furigana: "ひらがな")
      user.valid?
      expect(user.errors[:first_furigana]).to include("は全角カタカナのみで入力して下さい。")
    end

    it "last_furigana is invalid except Hiragana " do
      user = build(:user, last_furigana: "ひらがな")
      user.valid?
      expect(user.errors[:last_furigana]).to include("は全角カタカナのみで入力して下さい。")
    end

    it "first_furigana is valid only in Hiragana " do
      user = build(:user, first_furigana: "カタカナ")
      expect(user).to be_valid
    end

    it "last_furigana is valid only in Hiragana " do
      user = build(:user, last_furigana: "カタカナ")
      expect(user).to be_valid
    end

    it "password is invalid unless it contains both letters and numbers " do
      user = build(:user, password: "1111111", password_confirmation: "1111111")
      user.valid?
      expect(user.errors[:password]).to include("は英字と数字の両方を含めて下さい。")
    end

    it "email is invalid if the domain is incorrect " do
      user = build(:user, email: "111@1111")
      user.valid?
      expect(user.errors[:email]).to include("は正しく入力してください。")
    end
  end
end