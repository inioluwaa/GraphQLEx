=begin
module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false, description: 'An example field added by the generator'

    field :me, UserType, null: false, description: 'A current user'

    field :me, !types[UserType] do
      description 'An example field added by the generator'
      resolve ->(obj, args, ctx) { User.first }
    end

    def test_field
      'Hello World!'
    end
  end
end
=end

Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :me, Types::UserType do
    description 'The current user'
    resolve ->(obj, args, ctx) { User.first }
  end

  field :project, types[Types::ProjectType] do
    description 'The project for the current user'
    resolve ->(obj, args, ctx) { Project.all }
  end
end
