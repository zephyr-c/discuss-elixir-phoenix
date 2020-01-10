defmodule Discuss.TopicController do
    use Discuss.Web, :controller

    alias Discuss.Topic

    def new(conn, params) do
        changeset = Topic.changeset(%Topic{}, %{})

        render conn, "new.html", changeset: changeset
        # phoenix will look for this in the topic folder because we are in the topic controller
    end
end