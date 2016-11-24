module ApplicationHelper
  def og_locale_tag
    og_tag(:locale, 'ja_JP')
  end

  def default_og_image_tag
    og_tag(:image, image_url('feedforce-boardgame-club.jpg'))
  end

  def og_tag(tag, content)
    meta_tag(content, property: "og:#{tag}")
  end

  def tw_card_tag
    tw_tag(:card, 'summary_large_image')
  end

  def tw_site_tag
    tw_tag(:site, '@ff_boardgame')
  end

  def default_tw_image_tag
    tw_tag(:image, image_url('feedforce-boardgame-club.jpg'))
  end

  def tw_tag(name, content)
    meta_tag(content, name: "twitter:#{name}")
  end

  def meta_tag(content, attrs = {})
    tag(:meta, attrs.merge(content: content))
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user
    warden.user
  end

  def warden
    request.env['warden']
  end

  def authenticate!
    warden.authenticate!
  end

  def socialplus_auth_url
    uri = URI.parse('https://api.socialplus.jp/ff_boardgame/ff_boardgame/twitter/authenticate')
    uri.query = { callback: callback_url, token_param: @auth_token_key }.to_query
    uri.to_s
  end
end
