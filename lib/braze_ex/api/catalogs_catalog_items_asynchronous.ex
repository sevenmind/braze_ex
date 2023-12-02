# NOTE: This file is auto generated by OpenAPI Generator 6.2.0 (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.CatalogsCatalogItemsAsynchronous do
  @moduledoc """
  API calls for all endpoints tagged `CatalogsCatalogItemsAsynchronous`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """
  ## Delete Multiple Catalog Items

  > Use this endpoint to delete multiple items in your catalog. 


  To use this endpoint, you’ll need to generate an API key with the `catalogs.delete_items` permission.

  Each request can support up to 50 items. This endpoint is asynchronous.

  ## Rate limit

  This endpoint has a shared rate limit of 16,000 requests per minute between all asynchronous catalog item endpoints, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Path parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `catalog_name` | Required | String | Name of the catalog. |

  ## Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `items` | Required | Array | An array that contains item objects. The item objects should contain an `id` referencing the items Braze should delete. Up to 50 item objects are allowed per request. |

  ## Example request

  ```
  curl --location --request DELETE 'https://rest.iad-03.braze.com/catalogs/restaurants/items' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer YOUR-REST-API-KEY' \
  --data-raw '{
  "items": [
    {"id": "restaurant1"},
    {"id": "restaurant2"},
    {"id": "restaurant3"}
  ]
  }'

  ```

  ## Response

  There are three status code responses for this endpoint: `202`, `400`, and `404`.

  ### Example success response

  The status code `202` could return the following response body.

  ``` json
  {
  "message": "success"
  }

  ```

  ### Example error response

  The status code `400` could return the following response body. Refer to [Troubleshooting](#troubleshooting) for more information about errors you may encounter.

  ``` json
  {
  "errors": [
    {
      "id": "items-missing-ids",
      "message": "There are 1 item(s) that do not have ids",
      "parameters": [],
      "parameter_values": []
    }
  ],
  "message": "Invalid Request",
  }

  ```

  ## Troubleshooting

  The following table lists possible returned errors and their associated troubleshooting steps.

  | Error | Troubleshooting |
  | --- | --- |
  | `catalog-not-found` | Check that the catalog name is valid. |
  | `ids-too-large` | Item IDs can't be more than 250 characters. |
  | `ids-not-unique` | Check that the item IDs are unique in the request. |
  | `ids-not-strings` | Item IDs must be of type string. |
  | `items-missing-ids` | There are items that do not have item IDs. Check that each item has an item ID. |
  | `invalid-ids` | Item IDs can only include letters, numbers, hyphens, and underscores. |
  | `request-includes-too-many-items` | Your request has too many items. The item limit per request is 50. |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `catalog_name` (String.t): 
  - `opts` (keyword): Optional parameters
    - `:"Content-Type"` (String.t): 
    - `:Authorization` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec catalogs_catalog_name_items_delete(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def catalogs_catalog_name_items_delete(connection, catalog_name, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers
    }

    request =
      %{}
      |> method(:delete)
      |> url("/catalogs/#{catalog_name}/items")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  ## Edit Multiple Catalog Items

  > Use this endpoint to delete multiple items in your catalog. 


  To use this endpoint, you’ll need to generate an API key with the `catalogs.delete_items` permission.

  Each request can support up to 50 items. This endpoint is asynchronous.

  ## Rate limit

  This endpoint has a shared rate limit of 16,000 requests per minute between all asynchronous catalog item endpoints, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Path parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `catalog_name` | Required | String | Name of the catalog. |

  ## Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `items` | Required | Array | An array that contains item objects. The item objects should contain an `id` referencing the items Braze should delete. Up to 50 item objects are allowed per request. |

  ## Example request

  ```
  curl --location --request DELETE 'https://rest.iad-03.braze.com/catalogs/restaurants/items' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer YOUR-REST-API-KEY' \
  --data-raw '{
  "items": [
    {"id": "restaurant1"},
    {"id": "restaurant2"},
    {"id": "restaurant3"}
  ]
  }'

  ```

  ## Response

  There are three status code responses for this endpoint: `202`, `400`, and `404`.

  ### Example success response

  The status code `202` could return the following response body.

  ``` json
  {
  "message": "success"
  }

  ```

  ### Example error response

  The status code `400` could return the following response body. Refer to [Troubleshooting](#troubleshooting) for more information about errors you may encounter.

  ``` json
  {
  "errors": [
    {
      "id": "items-missing-ids",
      "message": "There are 1 item(s) that do not have ids",
      "parameters": [],
      "parameter_values": []
    }
  ],
  "message": "Invalid Request",
  }

  ```

  ## Troubleshooting

  The following table lists possible returned errors and their associated troubleshooting steps.

  | Error | Troubleshooting |
  | --- | --- |
  | `catalog-not-found` | Check that the catalog name is valid. |
  | `ids-too-large` | Item IDs can't be more than 250 characters. |
  | `ids-not-strings` | Item IDs must be of type string. |
  | `ids-not-unique` | Item IDs must be unique in the request. |
  | `invalid-ids` | Item IDs can only include letters, numbers, hyphens, and underscores. |
  | `invalid-fields` | Confirm that all fields you are sending in the API request already exist in the catalog. This is not related to the ID field mentioned in the error. |
  | `invalid-keys-in-value-object` | Item object keys can't include `.` or `$`. |
  | `items-missing-ids` | There are items that do not have item IDs. Check that each item has an item ID. |
  | `item-array-invalid` | `items` must be an array of objects. |
  | `items-too-large` | Item values can't exceed 5,000 characters. |
  | `request-includes-too-many-items` | Your request has too many items. The item limit per request is 50. |
  | `too-deep-nesting-in-value-object` | Item objects can't have more than 50 levels of nesting. |
  | `unable-to-coerce-value` | Item types can't be converted. |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `catalog_name` (String.t): 
  - `opts` (keyword): Optional parameters
    - `:"Content-Type"` (String.t): 
    - `:Authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec catalogs_catalog_name_items_patch(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def catalogs_catalog_name_items_patch(connection, catalog_name, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:patch)
      |> url("/catalogs/#{catalog_name}/items")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  ## Create Multiple Catalog Items

  > Use this endpoint to create multiple items in your catalog. 


  To use this endpoint, you’ll need to generate an API key with the `catalogs.add_items` permission.

  Each request can support up to 50 items. This endpoint is asynchronous.

  ## Rate limit

  This endpoint has a shared rate limit of 16,000 requests per minute between all asynchronous catalog item endpoints, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Path parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `catalog_name` | Required | String | Name of the catalog. |

  ## Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `items` | Required | Array | An array that contains item objects. The item objects should contain all of the fields in the catalog. Up to 50 item objects are allowed per request. |

  ## Example request

  ```
  curl --location --request POST 'https://rest.iad-03.braze.com/catalogs/restaurants/items' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer YOUR-REST-API-KEY' \
  --data-raw '{
  "items": [
    {
      "id": "restaurant1",
      "Name": "Restaurant1",
      "City": "New York",
      "Cuisine": "American",
      "Rating": 5,
      "Loyalty_Program": true,
      "Created_At": "2022-11-01T09:03:19.967+00:00"
    },
    {
      "id": "restaurant2",
      "Name": "Restaurant2",
      "City": "New York",
      "Cuisine": "American",
      "Rating": 10,
      "Loyalty_Program": true,
      "Created_At": "2022-11-02T09:03:19.967+00:00"
    },
    {
      "id": "restaurant3",
      "Name": "Restaurant3",
      "City": "New York",
      "Cuisine": "American",
      "Rating": 3,
      "Loyalty_Program": false,
      "Created_At": "2022-11-03T09:03:19.967+00:00"
    }
  ]
  }'

  ```

  ## Response

  There are three status code responses for this endpoint: `202`, `400`, and `404`.

  ### Example success response

  The status code `202` could return the following response body.

  ``` json
  {
  "message": "success"
  }

  ```

  ### Example error response

  The status code `400` could return the following response body. Refer to [Troubleshooting](#troubleshooting) for more information about errors you may encounter.

  ``` json
  {
  "errors": [
    {
      "id": "fields-do-not-match",
      "message": "Fields do not match with fields on the catalog",
      "parameters": [
        "id"
      ],
      "parameter_values": [
        "restaurant2"
      ]
    }
  ],
  "message": "Invalid Request"
  }

  ```

  ## Troubleshooting

  The following table lists possible returned errors and their associated troubleshooting steps.

  | Error | Troubleshooting |
  | --- | --- |
  | `catalog-not-found` | Check that the catalog name is valid. |
  | `ids-not-strings` | Item IDs must be of type string. |
  | `ids-not-unique` | Item IDs must be unique in the request. |
  | `ids-too-large` | Item IDs can't be more than 250 characters. |
  | `invalid-ids` | Item IDs can only include letters, numbers, hyphens, and underscores. |
  | `invalid-fields` | Confirm that the fields in the request exist in the catalog. |
  | `invalid-keys-in-value-object` | Item object keys can't include `.` or `$`. |
  | `item-array-invalid` | `items` must be an array of objects. |
  | `items-missing-ids` | There are items that do not have item IDs. Check that each item has an item ID. |
  | `items-too-large` | Item values can't exceed 5,000 characters. |
  | `request-includes-too-many-items` | Your request has too many items. The item limit per request is 50. |
  | `too-deep-nesting-in-value-object` | Item objects can't have more than 50 levels of nesting. |
  | `unable-to-coerce-value` | Item types can't be converted. |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `catalog_name` (String.t): 
  - `opts` (keyword): Optional parameters
    - `:"Content-Type"` (String.t): 
    - `:Authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec catalogs_catalog_name_items_post(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def catalogs_catalog_name_items_post(connection, catalog_name, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/catalogs/#{catalog_name}/items")
      |> add_optional_params(optional_params, opts)
      |> ensure_body()
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """
  ## Update Multiple Catalog Items

  > Use this endpoint to update multiple items in your catalog. 


  To use this endpoint, you'll need to generate an API key with the `catalogs.replace_item` permission.

  If a catalog item doesn’t exist, this endpoint will create the item in your catalog. Each request can support up to 50 catalog items. This endpoint is asynchronous.

  ## Rate limit

  This endpoint has a shared rate limit of 16,000 requests per minute between all asynchronous catalog item endpoints, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ## Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `catalog_name` | Required | String | Name of the catalog. |
  | `item_id` | Required | String | The ID of the catalog item. |

  ## Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `items` | Required | Array | An array that contains item objects. The item objects should contain fields that exist in the catalog except for the `id` field. Only one item object is allowed per request. |

  ## Example request

  ``` json
  curl --location --request PUT 'https://rest.iad-03.braze.com/catalogs/restaurants/items' \
  --header 'Content-Type: application/json' \
  --header 'Authorization: Bearer YOUR-REST-API-KEY' \
  --data-raw '{
  "items": [
    {
      "id": "restaurant1",
      "Name": "Restaurant",
      "Loyalty_Program": false,
      "Location": {
        "Latitude": 33.6112,
        "Longitude": -117.8711
      },
      "Open_Time": "2021-09-03T09:03:19.967+00:00"
    },
    {
      "id": "restaurant3",
      "City": "San Francisco",
      "Rating": 2
    }
  ]
  }'

  ```

  ## Response

  There are three status code responses for this endpoint: `200`, `400`, and `404`.

  ### Example success response

  The status code `200` could return the following response body.

  ``` json
  {
  "message": "success"
  }

  ```

  ### Example error response

  The status code `400` could return the following response body. Refer to [Troubleshooting](https://www.braze.com/docs/api/endpoints/catalogs/catalog_items/asynchronous/put_update_catalog_items/#troubleshooting) for more information about errors you may encounter.

  ``` json
  {
  "errors": [
    {
      "id": "invalid-fields",
      "message": "Some of the fields given do not exist in the catalog",
      "parameters": [
        "id"
      ],
      "parameter_values": [
        "restaurant1"
      ]
    }
  ],
  "message": "Invalid Request"
  }

  ```

  ## Troubleshooting

  The following table lists possible returned errors and their associated troubleshooting steps.

  | Error | Troubleshooting |
  | --- | --- |
  | `catalog_not_found` | Check that the catalog name is valid. |
  | `ids_not_string` | Confirm that each item ID is a string. |
  | `ids_not_unique` | Check that each item ID is unique. |
  | `ids_too_large` | Character limit for each item ID is 250 characters. |
  | `item_array_invalid` | `items` must be an array of objects. |
  | `items_missing_ids` | Confirm that each item has an ID. |
  | `items_too_large` | Item values can't exceed 5,000 characters. |
  | `invalid_ids` | Supported characters for item ID names are letters, numbers, hyphens, and underscores. |
  | `invalid_fields` | Confirm that the fields in the request exist in the catalog. |
  | `invalid_keys_in_value_object` | Item object keys can't include `.` or `$`. |
  | `too_deep_nesting_in_value_object` | Item objects can't have more than 50 levels of nesting. |
  | `request_includes_too_many_items` | Your request has too many items. The item limit per request is 50. |
  | `unable_to_coerce_value` | Item types can't be converted. |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `catalog_name` (String.t): 
  - `opts` (keyword): Optional parameters
    - `:"Content-Type"` (String.t): 
    - `:Authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec catalogs_catalog_name_items_put(Tesla.Env.client(), String.t(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def catalogs_catalog_name_items_put(connection, catalog_name, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:put)
      |> url("/catalogs/#{catalog_name}/items")
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
