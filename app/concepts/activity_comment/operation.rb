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
