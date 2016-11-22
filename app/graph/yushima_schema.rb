module YushimaSchema
  Schema = GraphQL::Schema.define do
    query Query::Type
    mutation Mutation::Type

    max_depth 8
  end

  def self.execute(*args)
    Schema.execute(*args)
  end
end
