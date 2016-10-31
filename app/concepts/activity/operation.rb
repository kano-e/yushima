class Activity::Create < Trailblazer::Operation
  include Model
  include Trailblazer::Operation::Policy

  model Activity, :create
  policy Activity::Policy, :show?

  contract do
    property :day, validates: { presence: true }
    validates_uniqueness_of :day
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
end

class Activity::Destroy < Trailblazer::Operation
  def process(params)
    return invalid! unless params[:id]

    Activity.find(params[:id]).destroy
    self
  end
end
