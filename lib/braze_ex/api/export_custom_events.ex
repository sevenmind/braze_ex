# NOTE: This file is auto generated by OpenAPI Generator 6.2.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.ExportCustomEvents do
  @moduledoc """
  API calls for all endpoints tagged `ExportCustomEvents`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """

  ## Custom Events Analytics

  This endpoint allows you to retrieve a series of the number of occurrences of a custom event in your app over a designated time period.

  ## Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Response

  ``` json
  Content-Type: application/json
  Authorization: Bearer YOUR-REST-API-KEY
  {
    "message": (required, string) the status of the export, returns 'success' when completed without errors,
    "data" : [
        {
            "time" : (string) point in time - as ISO 8601 extended when unit is "hour" and as ISO 8601 date when unit is "day",
            "count" : (int)
        },
        ...
    ]
  }

  ```

  ### Fatal error response codes

  The following status codes and associated error messages will be returned if your request encounters a fatal error. Any of these error codes indicate that no data will be processed.

  | Error Code | Reason / Cause |
  | --- | --- |
  | 400 Bad Request | Bad Syntax |
  | 401 Unauthorized | Unknown or missing REST API Key |
  | 429 Rate Limited | Over rate limit |
  | 5XX | Internal server error, you should retry with exponential backoff |

  > **Tip:** For help with CSV and API exports, visit [Export troubleshooting](https://www.braze.com/docs/user_guide/data_and_analytics/export_braze_data/export_troubleshooting/).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:event` (String.t): (Required) String  The name of the custom event for which to return analytics. 
    - `:length` (integer()): (Required) Integer  Maximum number of units (days or hours) before `ending_at` to include in the returned series. Must be between 1 and 100 (inclusive).
    - `:unit` (String.t): (Optional) String  Unit of time between data points - can be `day` or `hour`, defaults to `day`.
    - `:ending_at` (String.t): (Optional) Datetime ([ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) string)  Date on which the data series should end. Defaults to time of the request.
    - `:app_id` (String.t): (Optional) String  App API identifier retrieved from the **Developer Console** to limit analytics to a specific app.
    - `:segment_id` (String.t): (Optional) String  See [Segment API identifier](https://www.braze.com/docs/api/identifier_types/). Segment ID indicating the analytics-enabled segment for which event analytics should be returned.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec events_data_series_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def events_data_series_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :event => :query,
      :length => :query,
      :unit => :query,
      :ending_at => :query,
      :app_id => :query,
      :segment_id => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/events/data_series")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end

  @doc """

  ## Custom Events List

  This endpoint allows you to export a list of custom events that have been recorded for your app. The event names are returned in groups of 250, sorted alphabetically.

  ## Rate limit

  For customers who onboarded with Braze on or after September 16, 2021, we apply a shared rate limit of 1,000 requests per hour to this endpoint. This rate limit is shared with the `/purchases/product_list` endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Response

  ``` json
  Content-Type: application/json
  Authorization: Bearer YOUR-REST-API-KEY
  {
    "message": (required, string) the status of the export, returns 'success' when completed without errors,
    "events" : [
        "Event A",
        "Event B",
        "Event C",
        ...
    ]
  }

  ```

  ### Fatal error response codes

  The following status codes and associated error messages will be returned if your request encounters a fatal error. Any of these error codes indicate that no data will be processed.

  | Error Code | Reason / Cause |
  | --- | --- |
  | 400 Bad Request | Bad Syntax |
  | 401 Unauthorized | Unknown or missing REST API Key |
  | 429 Rate Limited | Over rate limit |
  | 5XX | Internal server error, you should retry with exponential backoff |

  > **Tip:** For help with CSV and API exports, visit [Export troubleshooting](https://www.braze.com/docs/user_guide/data_and_analytics/export_braze_data/export_troubleshooting/).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:page` (integer()): (Optional) Integer  The page of event names to return, defaults to 0 (returns the first set of up to 250).

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec events_list_get(Tesla.Env.client(), keyword()) :: {:ok, nil} | {:error, Tesla.Env.t()}
  def events_list_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :page => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/events/list")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
  end
end
