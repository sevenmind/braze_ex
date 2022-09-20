# NOTE: This file is auto generated by OpenAPI Generator 6.1.1-SNAPSHOT (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.UserDataExternalIDMigration do
  @moduledoc """
  API calls for all endpoints tagged `UserDataExternalIDMigration`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """

  # External ID Remove

  # Notes 
  > **Note:** For security purposes, this feature is disabled by default. To enable this feature, reach out to your customer success manager.

  Use this endpoint to remove your users' old deprecated external IDs. This endpoint completely removes the deprecated ID and cannot be undone.

  > You can send up to 50 external IDs per request.

  You will need to create a new [API key](https://www.braze.com/docs/api/api_key/) with permissions for this endpoint.

  ## Rate limit

  We apply a rate limit of 1,000 requests per minute to this endpoint, as documented in [API rate limits](http://braze.com/docs/api/api_limits/).

  ### Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `external_ids` | Required | Array of strings | External identifiers for the users to remove |

  > **Important:** Only deprecated IDs can be removed; attempting to remove a primary external ID will result in an error.

  ## Response

  The response will confirm all successful removals, as well as unsuccessful removals with the associated errors. Error messages in the `removal_errors` field will reference the index in the array of the original request.

  ``` json
  {
  "message" : (string) status message,
  "removed_ids" : (array of successful Remove Operations),
  "removal_errors": (array of any )
  }

  ```

  The `message` field will return `success` for any valid request. More specific errors are captured in the `removal_errors` array. The `message` field returns an error in the case of:

  *   Invalid API key
  *   Empty `external_ids` array
  *   `external_ids` array with more than 50 items
  *   Rate limit hit (>1,000 requests/minute)

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec users_external_ids_remove_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def users_external_ids_remove_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/users/external_ids/remove")
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

  # External ID Rename

  # Notes 
  > **Note:** For security purposes, this feature is disabled by default. To enable this feature, reach out to your customer success manager.

  Use this endpoint to “rename” your users’ external IDs. This endpoint sets a new (primary) `external_id` for the user and deprecates their existing `external_id`. This means that the user can be identified by either `external_id` until the deprecated one is removed. The deprecated ID can be removed using the [External ID remove](https://www.braze.com/docs/api/endpoints/user_data/external_id_migration/post_external_ids_remove) endpoint. Having multiple external IDs allows for a migration period whereby older versions of your apps still in the wild that use the previous external ID naming schema don’t break. We highly recommend removing deprecated external IDs once your old naming schema is no longer in use.

  > **Note:** You can send up to 50 external IDs per request.

  You will need to create a new [API key](https://www.braze.com/docs/api/api_key/) with permissions for this endpoint.

  ## Rate limit

  We apply a rate limit of 1,000 requests per minute to this endpoint, as documented in [API rate limits](http://braze.com/docs/api/api_limits/).

  ### Request parameters

  | Parameter | Required | Data Type | Description |
  | --- | --- | --- | --- |
  | `external_id_renames` | Required | Array of external ID rename objects | View request example and the following limitations for structure of external ID rename object |

  *   The `current_external_id` must be the user’s primary ID, and cannot be a deprecated ID
  *   The `new_external_id` must not already be in use as either a primary ID or a deprecated ID
  *   The `current_external_id` and `new_external_id` cannot be the same
    

  ## Response

  The response will confirm all successful renames, as well as unsuccessful renames with any associated errors. Error messages in the `rename_errors` field will reference the index of the object in the array of the original request.

  ``` json
  {
  "message" : (string) status message,
  "external_ids" : (array of successful Rename Operations),
  "rename_errors": (array of any )
  }

  ```

  The `message` field will return `success` for any valid request. More specific errors are captured in the `rename_errors` array. The `message` field returns an error in the case of:

  *   Invalid API key
  *   Empty `external_id_renames` array
  *   `external_id_renames` array with more than 50 objects
  *   Rate limit hit (>1,000 requests/minute)
    

  ## Frequently Asked Questions

  **Does this impact MAU?**  
  No, since the number of users will stay the same, they’ll just have a new `external_id`.

  **Does user behavior change historically?**  
  No, since the user is still the same user, and all their historical behavior is still connected to them.

  **Can it be run on dev/staging app groups?**  
  Yes. In fact, we highly recommend running a test migration on a staging or development app group, and ensuring everything has gone smoothly before executing on production data.

  **Does this consume data points?**  
  This feature does not cost data points.

  **What is the recommended deprecation period?**  
  We have no hard limit on how long you can keep deprecated external IDs around, but we highly recommend removing them once there is no longer a need to reference users by the deprecated ID.

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:authorization` (String.t): 
    - `:body` (String.t): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec users_external_ids_rename_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def users_external_ids_rename_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/users/external_ids/rename")
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
