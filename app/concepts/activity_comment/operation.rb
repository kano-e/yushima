class ActivityComment::OperationBase < Trailblazer::Operation
  include Model
  include Trailblazer::Operation::Policy

  model ActivityComment, :create
  policy ActivityComment::Policy, :show?

  contract do
    property :game_id
    property :photo
    property :detail, validates: { presence: true, length: { maximum: 100 } }

    def games
      [Game.pluck(:id, :title_ja), :first, :last]
    end
  end

  def games
    [Game.pluck(:id, :title_ja), :first, :last]
  end

  def form_save(form, params)
    model.user = params[:current_user].presence
    model.public_str ||= SecureRandom.urlsafe_base64
    form.save
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

  def process(params)
    return invalid! unless policy.create?

    validate(params[:activity_comment]) do |form|
      form_save(form, params)
    end
  end
end

class ActivityComment::Update < ActivityComment::OperationBase
  action :update

  def model!(params)
    if params[:activity_id]
      ActivityComment.where(activity_id: params[:activity_id]).includes(:activity, :game).find(params[:id])
    else
      ActivityComment.all.includes(:activity, :game).find(params[:id])
    end
  end

  def process(params)
    return invalid! unless policy.update?

    validate(params[:activity_comment]) do |form|
      form_save(form, params)
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
