class User < ActiveRecord::Base
  belongs_to :tweet
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    validates :name,
    presence: { message: "ユーザーネームを入力して下さい。"},
    length: {minimum: 8, too_short: "ユーザーネームは８文字以上で入力してください。"},
    uniqueness: { message: "既にそのユーザーネームは使われています。"}

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX,:message => '正しいメールアドレスの形式で入力してください。' },

    uniqueness: { message: "既にそのメールアドレスは登録されています。"}

    validates :password,
    presence: { message: "パスワードを入力して下さい。"},
    confirmation: { message: "パスワードが一致しません。"}

    validates :password_confirmation, presence: { message: "パスワードが一致しません。"}
end
