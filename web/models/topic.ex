defmodule Discuss.Topic do
    use Discuss.Web, :model


    schema "topics" do
        field :title, :string
    end

# changeset tells us how we want to update the database
# Also describes any validation errors that might occur
# take changeset from cast and send to however many validators are defined
# eventually returns a new changeset after all validators
# final result represents how we're trying to update our database
    def changeset(struct, params \\ %{}) do
        struct
        |> cast(params, [:title])
        |> validate_required([:title])
    end
end