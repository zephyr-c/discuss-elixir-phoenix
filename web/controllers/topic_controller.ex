defmodule Discuss.TopicController do
    use Discuss.Web, :controller

    alias Discuss.Topic

    def index(conn, _params) do
        topics = Repo.all(Topic)
        render conn, "index.html", topics: topics
    end

    def new(conn, _params) do
        changeset = Topic.changeset(%Topic{}, %{})

        render conn, "new.html", changeset: changeset
        # phoenix will look for this in the topic folder because we are in the topic controller
    end

    def create(conn, %{"topic" => topic} = params) do
        changeset = Topic.changeset(%Topic{}, topic)

        case Repo.insert(changeset) do
            {:ok, post} ->
                conn
                |> put_flash(:info, "Topic Created")
                |> redirect(to: topic_path(conn, :index))
            {:error, changeset} ->
                render conn, "new.html", changeset: changeset
        end
    end
end