class Activity::Cell < Cell::ViewModel
  include ::Cell::Slim

  property :day
  property :activity_comments

  def index
    render :index
  end

  def show_link(text = nil)
    link_to text || day, model
  end

  def images
    [] if activity_comments.size.zero?
    activity_comments.select { |com| com.photo.present? }.first(3).map { |com| com.photo }
  end

  def show_images
    return if activity_comments.size.zero?

    activity_comments.select { |com| com.photo.present? }.first(3).map do |comment|
      content_tag(:div, class: 'column') do
        content_tag(:figure, class: 'image is-square') do
          image_tag comment.photo.url(:thumbnail)
        end
      end
    end.join
  end

  def games
    activity_comments.map(&:game).compact.uniq
  end

  def show_games
    activity_comments.map(&:game).compact.uniq.map { |game| game.title_ja }.join(
      content_tag(:span, '｜')
    )
  end

  def link_to_games
    activity_comments.map(&:game).compact.uniq.map do |game|
      link_to game.title_ja, game
    end.join(content_tag(:span, '｜'))
  end
end
