class OmniauthStrategy < ::Warden::Strategies::Base
  def valid?
    auth_hash.present? && auth_hash['provider'].present? && auth_hash['uid'].present?
  end

  def authenticate!
    account = Account.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])
    if account.blank? || account.user.blank?
      fail! message: 'Not found your account.'
    else
      account.credentials = auth_hash['credentials']
      account.info = auth_hash['info']
      account.save
      account.user.nickname = auth_hash['info']['nickname']
      account.user.image_url = auth_hash['info']['image']
      account.user.save
      success! account.user
    end
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end

Warden::Strategies.add(:omniauth, OmniauthStrategy)

Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User.readonly.find_by_id(id)
end

Rails.application.config.middleware.insert_after ActionDispatch::Flash, Warden::Manager do |manager|
  manager.default_strategies :omniauth
  manager.failure_app = UnauthorizedController
end
