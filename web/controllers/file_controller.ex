defmodule Web.FileController do
  use Web.Web, :controller

  def index(conn, _params) do
  if upload = _params["file"] do
    {:ok, ram_file}  = File.read(upload.path)
    :erlcloud_s3.put_object('speech-recognition-uploaded-files', String.to_charlist(upload.filename), ram_file)
    :erlcloud_sqs.send_message('speech-recognition-records', String.to_charlist(upload.filename))
  end
        json conn, %{fileName: upload.filename}
  end
end