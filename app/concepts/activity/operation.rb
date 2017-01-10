class Activity::Create < Trailblazer::Operation
  include Model
  include Trailblazer::Operation::Policy

  model Activity, :create
  policy Activity::Policy, :show?

  contract do
    property :day, validates: { presence: true }
    property :detail

    validates_uniqueness_of :day
    validates :detail, length: { maximum: 100 }
  end

  def process(params)
    return invalid! unless policy.create?
    validate(params[:activity]) do |form|
      form.save
    end
  end
end

class Activity::Update < Activity::Create
  action :update

  def model!(params)
    Activity.find_by_day(params[:day] || params[:activity_day])
  rescue ActiveRecord::StatementInvalid
    Activity.find(params[:day])
  end
end

class Activity::Destroy < Trailblazer::Operation
  def process(params)
    return invalid! unless params[:id]

    Activity.find(params[:id]).destroy
    self
  end
end
