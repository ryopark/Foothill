class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :trackable, :database_authenticatable,
         :timeoutable, :omniauthable, omniauth_providers: [:facebook]
  has_many :sell_books, dependent: :destroy
  has_many :sell_book_comments, dependent: :destroy
  has_one :photo, as: :imageable
  has_many :api_keys, dependent: :destroy

  has_many :deal, dependent: :destroy

  validates :email, presence: true
  # errorがでる
  # VALID_FACEBOOK_URL = /\A(https:\/\/www.facebook.com\/)/
  # validates :facebook_url, format: {with: VALID_FACEBOOK_URL}

  acts_as_voter

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email']
      end
    end
  end

  def self.find_for_facebook_oauth(auth)
    user = User.find_by(provider: auth.provider, uid: auth.uid)
    unless user
      user = User.create(name: auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.info.email,
                         password: Devise.friendly_token[0, 20] )
      user.create_photo(image: auth.info.image)
    end
    user
  end

  def self.login?(access_token)
    api_key = ApiKey.find_by_access_token(access_token)
    return false if !api_key || !api_key.before_expired? || !api_key.active
    return !self.find(api_key.user_id).nil?
  end

  def activate
    if !api_key
      return ApiKey.create(user_id: self.id)
    else
      if !api_key.active
        api_key.set_active
        api_key.save
      end
      if !api_key.before_expired?
        api_key.set_expiration
        api_key.save
      end
      return api_key
    end
  end
  def inactivate
      api_key.active = false
      api_key.save
    end

    private

      def api_key
        @api_key ||= ApiKey.find_by_user_id(self.id)
      end
end
