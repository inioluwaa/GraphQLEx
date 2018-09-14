Types::ProjectType = GraphQL::ObjectType.define do
  name 'Project'
  description 'A project'

  field :id, !types.Int
  field :title, !types.String do
    resolve ->(obj, args, ctx) { obj.user.email.split('@')[0] + '-' + obj.title }
  end

  field :user, !Types::UserType
end