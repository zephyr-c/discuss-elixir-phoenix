defmodule Discuss.Topic do
    user Discuss.Web, :model


    schema "topics" do
        field :title, :string
    end
end