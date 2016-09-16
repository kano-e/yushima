class Game::Create < Trailblazer::Operation
  contract do
    property :title_ja, validates: { presence: true }
    property :title_en
    property :min_players,
      validates: {
        allow_nil: true,
        numericality: {
          greater_than_or_equal_to: 1,
          less_than_or_equal_to: 99,
        },
      }
    property :max_players,
      validates: {
        allow_nil: true,
        numericality: {
          greater_than_or_equal_to: 1,
          less_than_or_equal_to: 99,
        },
      }
    property :min_minutes,
      validates: {
        allow_nil: true,
        numericality: {
          greater_than_or_equal_to: 1,
        },
      }
    property :max_minutes,
      validates: {
        allow_nil: true,
        numericality: {
          greater_than_or_equal_to: 1,
        },
      }
  end

  def process(params)
    @model = Game.new

    validate(params[:game], @model) do |f|
      f.save
    end
  end
end
