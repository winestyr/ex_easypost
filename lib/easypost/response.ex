defmodule EasyPost.Response do
  alias EasyPost.{ Helpers }

  @type t ::
          %__MODULE__{
            body: map,
            headers: EasyPost.http_headers_t(),
            status_code: pos_integer
          }

  defstruct [:body, :headers, :status_code]

  @spec new(EasyPost.HTTP.response_t(), EasyPost.Config.t()) :: t
  def new(response, config) do
    body =  Helpers.JSON.decode(Map.get(response, :body), config)

    headers = Map.get(response, :headers)

    status_code = Map.get(response, :status_code)

    %__MODULE__{}
    |> Map.put(:body, body)
    |> Map.put(:headers, headers)
    |> Map.put(:status_code, status_code)
  end
end
