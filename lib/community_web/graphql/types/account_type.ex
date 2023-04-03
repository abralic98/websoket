
defmodule CommunityWeb.Graphql.Types.AccountType do

  use Absinthe.Schema.Notation

  object :account do
    field :id, non_null(:id)
    field :password, non_null(:string)
    field :email, non_null(:string)
  end

end
