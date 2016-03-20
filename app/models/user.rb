class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :trackable,
         :timeoutable, :omniauthable, omniauth_providers: [:facebook]
  has_many :sell_books, dependent: :destroy

  validates :email, presence: true

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email']
      end
    end
  end

  def self.find_for_facebook_oauth(auth, _signed_in_resource = nil)
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    unless user
      user = User.create(name: auth.extra.raw_info.name, provider: auth.provider, uid: auth.uid, email: auth.info.email, password: Devise.friendly_token[0, 20])
    end
    user
  end
end
