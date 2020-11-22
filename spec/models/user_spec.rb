require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
    @user.family_name = "佐藤"
    @user.first_name = "太郎"
    @user.family_name_kana = "サトウ"
    @user.first_name_kana = "タロウ"
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname, email, password, password_confirmation, family_name, first_name, family_name_kana, first_name_kana, birthday が存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "password が 半角英数含めて6文字以上 あれば登録できる" do
        @user.password = "abc123"
        @user.password_confirmation = "abc123"
        expect(@user).to be_valid
      end
      it "family_name が 全角 であれば登録できる" do
        @user.family_name = "佐藤"
        expect(@user).to be_valid
      end
      it "first_name が 全角 であれば登録できる" do
        @user.first_name = "太郎"
        expect(@user).to be_valid
      end
      it "family_name_kana が 全角カタカナ であれば登録できる" do
        @user.first_name_kana = "サトウ"
        expect(@user).to be_valid
      end
      it "family_name_kana が 全角カタカナ であれば登録できる" do
        @user.family_name_kana = "タロウ"
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "nickname が 空 だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "email が 空 だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "email が 重複して存在する と登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "password が 空 だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "password が 6文字 未満だと登録できない" do
        @user.password = "abc12"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "password が 半角英数混合 でないと登録できない" do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it "password が 確認用と同じ でないと登録できない" do
        @user.password = "abc123"
        @user.password_confirmation = "def456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "family_name が 空 だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", "Family name Full-width characters")
      end
      it "family_name が 全角でない と登録できない" do
        @user.family_name = "sato"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name Full-width characters")
      end
      it "first_name が 空 だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_name が 全角でない だと登録できない" do
        @user.first_name = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Full-width characters")
      end
      it "family_name_kana が 空 だと登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it "family_name_kana が カタカナでない と登録できない" do
        @user.family_name_kana = "佐藤"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana Full-width katakana characters")
      end
      it "first_name_kana が 空 だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "first_name_kana が カタカナでない と登録できない" do
        @user.first_name_kana = "太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana Full-width katakana characters")
      end
      it 'birthday が 空 だと登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
   end
end