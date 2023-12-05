# NOTE: This file is auto generated by OpenAPI Generator 6.2.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.ExportPurchases do
  @moduledoc """
  API calls for all endpoints tagged `ExportPurchases`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """
  ## Export Product IDs

  > Use this endpoint to return a paginated lists of product IDs. 


  To use this endpoint, you’ll need to generate an API key with the `purchases.product_list` permission.

  ## Rate limit

  For customers who onboarded with Braze on or after September 16, 2021, we apply a shared rate limit of 1,000 requests per hour to this endpoint. This rate limit is shared with the `/events/list` endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Response

  ``` json
  Content-Type: application/json
  Authorization: Bearer YOUR-REST-API-KEY
  {
  "products": [
    "product_name" (string), the name of the product
  ],
  "message": "success"
  }

  ```

  > **Tip:** For help with CSV and API exports, visit [Export troubleshooting](https://www.braze.com/docs/user_guide/data_and_analytics/export_braze_data/export_troubleshooting/).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:Authorization` (String.t): 
    - `:page` (integer()): (Optional) Integer  The page of your product list that you would like to view.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec purchases_product_list_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def purchases_product_list_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :page => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/purchases/product_list")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  ## Export Number of Purchases

  > Use this endpoint to return the total number of purchases in your app over a time range. 


  To use this endpoint, you’ll need to generate an API key with the `purchases.quantity_series` permission.

  ## Rate limit

  For customers who onboarded with Braze on or after September 16, 2021, we apply a shared rate limit of 1,000 requests per hour to this endpoint. This rate limit is shared with the `/events/list` endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Example request

  ```
  curl --location --request GET 'https://rest.iad-01.braze.com/purchases/quantity_series?length=100' \
  --header 'Authorization: Bearer YOUR-REST-API-KEY'

  ```

  ## Response

  ``` json
  Content-Type: application/json
  Authorization: Bearer YOUR-REST-API-KEY
  {
  "message": (required, string) the status of the export, returns 'success' when completed without errors,
  "data" : [
    {
      "time" : (string) the date as ISO 8601 date,
      "purchase_quantity" : (int) the number of items purchased in the time period
      },
    ...
  ]
  }

  ```

  > **Tip:** For help with CSV and API exports, visit [Export troubleshooting](https://www.braze.com/docs/user_guide/data_and_analytics/export_braze_data/export_troubleshooting/).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:Authorization` (String.t): 
    - `:ending_at` (String.t): (Optional) Datetime (ISO 8601 string) Date on which the data series should end. Defaults to time of the request.
    - `:length` (integer()): (Required) Integer Maximum number of days before ending_at to include in the returned series. Must be between 1 and 100 (inclusive).
    - `:unit` (integer()): (Optional) String Unit of time between data points. Can be `day` or `hour`, defaults to `day`. 
    - `:app_id` (String.t): (Optional) String App API identifier retrieved from the [API Keys](https://www.braze.com/docs/user_guide/administrative/app_settings/api_settings_tab/) page. If excluded, results for all apps in the workspace will be returned.
    - `:product` (String.t): (Optional) String Name of product to filter response by. If excluded, results for all apps will be returned.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec purchases_quantity_series_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def purchases_quantity_series_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :ending_at => :query,
      :length => :query,
      :unit => :query,
      :app_id => :query,
      :product => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/purchases/quantity_series")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  ## Export Revenue Data by Time

  > Use this endpoint to return the total money spent in your app over a time range. 


  To use this endpoint, you’ll need to generate an API key with the `purchases.revenue_series` permission.

  ## Rate limit

  For customers who onboarded with Braze on or after September 16, 2021, we apply a shared rate limit of 1,000 requests per hour to this endpoint. This rate limit is shared with the `/events/list` endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Example request

  ```
  curl --location --request GET 'https://rest.iad-01.braze.com/purchases/revenue_series?length=100' \
  --header 'Authorization: Bearer YOUR-REST-API-KEY'

  ```

  ## Response

  ``` json
  Content-Type: application/json
  Authorization: Bearer YOUR-REST-API-KEY
  {
  "message": (required, string) the status of the export, returns 'success' when completed without errors,
  "data" : [
    {
      "time" : (string) the date as ISO 8601 date,
      "revenue" : (int) amount of revenue for the time period
      },
    ...
  ]
  }

  ```

  > **Tip:** For help with CSV and API exports, visit [Export troubleshooting](https://www.braze.com/docs/user_guide/data_and_analytics/export_braze_data/export_troubleshooting/).

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:Authorization` (String.t): 
    - `:ending_at` (String.t): (Optional) Datetime (ISO 8601 string) Date on which the data series should end. Defaults to time of the request.
    - `:length` (integer()): (Required) Integer Maximum number of days before ending_at to include in the returned series. Must be between 1 and 100 (inclusive).
    - `:unit` (integer()): (Optional) String Unit of time between data points. Can be `day` or `hour`, defaults to `day`. 
    - `:app_id` (String.t): (Optional) String App API identifier retrieved from the Settings > Setup and Testing > API Keys to limit analytics to a specific app.
    - `:product` (String.t): (Optional) String Name of product to filter response by. If excluded, results for all apps will be returned.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec purchases_revenue_series_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def purchases_revenue_series_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :ending_at => :query,
      :length => :query,
      :unit => :query,
      :app_id => :query,
      :product => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/purchases/revenue_series")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end
end
