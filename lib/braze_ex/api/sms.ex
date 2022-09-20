# NOTE: This file is auto generated by OpenAPI Generator 6.1.1-SNAPSHOT (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.SMS do
  @moduledoc """
  API calls for all endpoints tagged `SMS`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """

  # Query Invalid Phone Numbers

  # Notes 
  This endpoint allows you to pull a list of phone numbers that have been deemed “invalid” within a certain time frame.

  *   If you provide a `start_date`, an `end_date`, and `phone_numbers`, we prioritize the given phone numbers and disregard the date range.
  *   If your date range has more than the `limit` number of invalid phone numbers, you will need to make multiple API calls with increasing the `offset` each time until a call returns either fewer than `limit` or zero results.
    

  ## Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Response

  Entries are listed in descending order.

  ``` json
  Content-Type: application/json
  Authorization: Bearer YOUR-REST-API-KEY
  {
  "sms": [
    {
      "phone": "12345678900",
      "invalid_detected_at": "2016-08-25 15:24:32 +0000"
    },
    {
      "phone": "12345678901",
      "invalid_detected_at": "2016-08-24 17:41:58 +0000"
    },
    {
      "phone": "12345678902",
      "invalid_detected_at": "2016-08-24 12:01:13 +0000"
    }
  ],
  "message": "success"
  }

  ```

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:start_date` (String.t): (Optional*) String in YYYY-MM-DD format  Start date of the range to retrieve invalid phone numbers, must be earlier than `end_date`. This is treated as midnight in UTC time by the API. 
    - `:end_date` (String.t): (Optional*) String in YYYY-MM-DD format  End date of the range to retrieve invalid phone numbers. This is treated as midnight in UTC time by the API. 
    - `:limit` (integer()): (Optional) Integer Optional field to limit the number of results returned. Defaults to 100, maximum is 500.
    - `:offset` (integer()): (Optional) Integer Optional beginning point in the list to retrieve from.
    - `:phone_numbers` (integer()): (Optional*) Array of Strings in e.164 format If provided, we will return the phone number if it has been found to be invalid. 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec sms_invalid_phone_numbers_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def sms_invalid_phone_numbers_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :start_date => :query,
      :end_date => :query,
      :limit => :query,
      :offset => :query,
      :phone_numbers => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/sms/invalid_phone_numbers")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """

  # Remove Invalid Phone Numbers

  # Notes 
  This endpoint allows you to remove “invalid” phone numbers from Braze’s invalid list. This can be used to re-validate phone numbers after they have been marked as invalid.

  ## Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `phone_number` | Required | Array of strings in e.164 format | An array of up to 50 phone numbers to modify. |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:content_type` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec sms_invalid_phone_numbers_remove_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def sms_invalid_phone_numbers_remove_post(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :"Content-Type" => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/sms/invalid_phone_numbers/remove")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end
end
