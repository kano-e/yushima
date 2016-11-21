module YushimaSchema::Query
  Type = GraphQL::ObjectType.define do
    name 'Query'
    description 'The query root of this schema'

    field :games do
      type Game::Graph::Type.to_list_type
      description 'Game list'
      resolve ->(obj, args, ctx) { Game.order(title_en: :asc, title_ja: :asc).to_a }
    end

    field :game do
      type Game::Graph::Type
      argument :id, !types.ID
      description 'Find a Game by ID'
      resolve ->(obj, args, ctx) { Game.find(args['id']) }
    end
  end
end
