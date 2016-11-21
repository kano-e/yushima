module YushimaSchema::Query
  Type = GraphQL::ObjectType.define do
    name 'Query'
    description 'The query root of this schema'

    field :games do
      type Game::Graph::Type.to_list_type
      description 'Game list order'
      argument :limit, types.Int
      argument :offset, types.Int
      resolve ->(obj, args, ctx) do
        rel = Game.order(title_en: :asc, title_ja: :asc).
          limit(args['limit']).offset(args['offset']).
          to_a
      end
    end

    field :game do
      type Game::Graph::Type
      argument :id, !types.ID
      description 'Find a Game by ID'
      resolve ->(obj, args, ctx) { Game.find(args['id']) }
    end
  end
end
