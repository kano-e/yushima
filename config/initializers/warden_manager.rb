require Rails.root.join('lib', 'warden', 'omniauth_strategy')
require Rails.root.join('lib', 'warden', 'socialplus_strategy')

Warden::Strategies.add(:omniauth, OmniauthStrategy)
Warden::Strategies.add(:socialplus, SocialplusStrategy)

Warden::Manager.serialize_into_session do |user|
  user.id
end

Warden::Manager.serialize_from_session do |id|
  User.readonly.find_by_id(id)
end

Rails.application.config.middleware.insert_after ActionDispatch::Flash, Warden::Manager do |manager|
  manager.default_strategies :socialplus
  manager.failure_app = UnauthorizedController
end
