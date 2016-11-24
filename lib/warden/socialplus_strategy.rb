class SocialplusStrategy < ::Warden::Strategies::Base
  def valid?
    authorized? && auth_token.present?
  end

  def authenticate!
    response = JSON.parse(open(authenticated_user_uri.to_s, &:read))
    if response['status'] != 'ok'
      fail! message: 'Authorization failed.'
    else
      user_data = response['user']
      user = User.find_by_socialplus_uid(user_data['identifier'])

      if user
        profile = response['profile']
        user.nickname = profile['user_name']
        user.image_url = profile['image_url']
        user.save
        success! user
      else
        fail! message: 'Not found your account.'
      end
    end
  end

  private

  def authenticated_user_uri
    uri = URI.parse('https://api.socialplus.jp/api/authenticated_user')
    uri.query = {
      key: Rails.application.secrets.socialplus_api_key,
      token: auth_token,
      add_profile: 'true',
    }.to_query
    uri
  end

  def user_attribute_uri(identifier)
    uri = URI.parse('https://api.socialplus.jp/api/user_attribute')
    uri.query = {
      key: Rails.application.secrets.socialplus_api_key,
      identifier: identifier,
    }
  end

  def authorized?
    auth_status == 'authorized'
  end

  def auth_status
    params['status']
  end

  def auth_token
    params[auth_token_key]
  end

  def auth_token_key
    session[:auth_token_key]
  end
end
