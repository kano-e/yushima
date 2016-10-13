module ApplicationHelper
  def og_locale_tag
    og_tag(:locale, 'ja_JP')
  end

  def default_og_image_tag
    og_tag(:image, image_url('feedforce-boardgame-club.jpg'))
  end

  def og_tag(tag, content)
    meta_tag("og:#{tag}", content)
  end

  def meta_tag(property, content)
    tag(:meta, property: property, content: content)
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
end
