module YushimaSchema
  Schema = GraphQL::Schema.define do
    query Query::Type
    mutation Mutation::Type
  end

  def self.execute(*args)
    Schema.execute(*args)
  end
end
