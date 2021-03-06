class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      user.update_attribute(:oauth_token, auth.credentials.token)
      user.update_attribute(:oauth_expires_at, Time.at(auth.credentials.expires_at))
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        registered_user.update_attribute(:oauth_token, auth.credentials.token)
        registered_user.update_attribute(:oauth_expires_at, Time.at(auth.credentials.expires_at))
        registered_user.update_attribute(:provider, auth.provider)
        registered_user.update_attribute(:uid, auth.uid)
        return registered_user
      else
        user = User.create(name: auth.extra.raw_info.name,
                           provider: auth.provider,
                           uid: auth.uid,
                           email: auth.info.email,
                           password: Devise.friendly_token[0, 20],
                           oauth_token: auth.credentials.token,
                           oauth_expires_at: Time.at(auth.credentials.expires_at),
        )
      end
    end
  end
end
