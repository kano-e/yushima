class Activity::Create < Trailblazer::Operation
  include Model

  model Activity, :create

  contract do
    property :day, validates: { presence: true }
  end

  def process(params)
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