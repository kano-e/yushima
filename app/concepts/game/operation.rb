class Game::Create < Trailblazer::Operation
  include Model
  include Trailblazer::Operation::Policy

  model Game, :create
  policy Game::Policy, :show?

  contract do
    property :title_ja, validates: { presence: true }
    property :title_en
    property :photo
    property :min_players,
      validates: {
        allow_blank: true,
        numericality: {
          greater_than_or_equal_to: 1,
          less_than_or_equal_to: 99,
        },
      }
    property :max_players,
      validates: {
        allow_blank: true,
        numericality: {
          greater_than_or_equal_to: 1,
          less_than_or_equal_to: 99,
        },
      }
    property :min_minutes,
      validates: {
        allow_blank: true,
        numericality: {
          greater_than_or_equal_to: 1,
        },
      }
    property :max_minutes,
      validates: {
        allow_blank: true,
        numericality: {
          greater_than_or_equal_to: 1,
        },
      }
  end

  def process(params)
    return invalid! unless policy.create?

    validate(params[:game]) do |form|
      model.public_str ||= SecureRandom.urlsafe_base64
      form.save
    end
  end
end

class Game::Update < Game::Create
  action :update
end

class Game::Destroy < Trailblazer::Operation
  def process(params)
    return invalid! unless params[:id]

    model = Game.find(params[:id])
    model.remove_photo!
    model.destroy
    self
  end
end
