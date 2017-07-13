defmodule Web.CallController do
  use Web.Web, :controller

  def new(conn, _params) do
  if file_name = _params["original-file-name"] do
    {ok, response} = :erlcloud_ddb2.put_item("speech-recognition", Enum.map(_params, fn {k, v} -> {k, v} end))
  end
        json conn, %{answer: ok}
  end
    def get(conn, _params) do
    if file_name = _params["original-file-name"] do
      {ok, response} = :erlcloud_ddb2.get_item("speech-recognition", {"original-file-name", file_name})
      IO.inspect {ok, response}
    end
           json conn, %{answer: Enum.into(response, %{})}
    end
end