class ActivityComment::OperationBase < Trailblazer::Operation
  include Model

  model ActivityComment, :create

  contract do
    property :game_id
    property :photo
    property :detail
  end

  def games
    [Game.pluck(:id, :title_ja), :first, :last]
  end

  def process(params)
    validate(params[:activity_comment]) do |form|
      model.public_str ||= SecureRandom.urlsafe_base64
      form.save
    end
  end
end

class ActivityComment::Create < ActivityComment::OperationBase
  def model!(params)
    case params[:controller]
    when 'activities'
      Activity.find(params[:id]).activity_comments.build
    else
      Activity.find(params[:activity_id]).activity_comments.build
    end
  end
end

class ActivityComment::Destroy < Trailblazer::Operation
  def process(params)
    return invalid! unless params[:id]

    model = ActivityComment.find(params[:id])
    model.remove_photo!
    model.destroy
    self
  end
end
