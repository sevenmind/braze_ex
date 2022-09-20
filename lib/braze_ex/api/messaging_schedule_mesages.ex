# NOTE: This file is auto generated by OpenAPI Generator 6.1.1-SNAPSHOT (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.MessagingScheduleMesages do
  @moduledoc """
  API calls for all endpoints tagged `MessagingScheduleMesages`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """
  Schedule API Triggered Campaigns
  Use this endpoint to trigger API-triggered campaigns, which are created on the dashboard and initiated via the API. You can pass in `trigger_properties` that will be templated into the message itself.  This endpoint allows you to send campaign messages (up to 90 days in advance) via API-triggered delivery, allowing you to decide what action should trigger the message to be sent. Note that to send messages with this endpoint, you must have a Campaign ID, created when you build an [API-Triggered Campaign](https://www.braze.com/docs/api/api_campaigns/).  ### Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  Braze endpoints support [batching API requests](https://www.braze.com/docs/api/api_limits/#batching-api-requests). A single request to the messaging endpoints can reach any of the following:  * Up to 50 specific external_ids, each with individual message parameters * A segment of any size created in the Braze dashboard, specified by its `segment_id` * An ad-hoc audience segment of any size, defined in the request as a [Connected Audience](https://www.braze.com/docs/api/objects_filters/connected_audience/) object  ### Request parameters  | Parameter | Required | Data Type | Description | | --------- | ---------| --------- | ----------- | |`campaign_id`|Required|String| See [campaign identifier](https://www.braze.com/docs/api/identifier_types/)| | `send_id` | Optional | String | See [send identifier](https://www.braze.com/docs/api/identifier_types/). |  | `recipients` | Optional | Array of recipient objects | See [recipients object](https://www.braze.com/docs/api/objects_filters/recipient_object/). | | `audience` | Optional | Connected audience object | See [connected audience](https://www.braze.com/docs/api/objects_filters/connected_audience/). | |`broadcast`| Optional | Boolean | See [broadcast](https://www.braze.com/docs/api/parameters/#broadcast). This parameter defaults to false (as of August 31, 2017). <br><br> If `recipients` is omitted, `broadcast` must be set to true. However, use caution when setting `broadcast: true`, as unintentionally setting this flag may cause you to send your message to a larger than expected audience. | | `trigger_properties` | Optional | Object | Personalization key-value pairs for all users in this send. See [trigger properties](https://www.braze.com/docs/api/objects_filters/trigger_properties_object/). | | `schedule` | Required | Schedule object | See [schedule object](https://www.braze.com/docs/api/objects_filters/schedule_object/). |

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
  @spec campaigns_trigger_schedule_create_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def campaigns_trigger_schedule_create_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/campaigns/trigger/schedule/create")
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
  Delete Scheduled API Triggered Campaigns
  The delete schedule endpoint allows you to cancel a message that you previously scheduled API Triggered Campaigns before it has been sent.  Scheduled messages or triggers that are deleted very close to or during the time they were supposed to be sent will be updated with best efforts, so last-second deletions could be applied to all, some, or none of your targeted users.  ### Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  ### Request parameters | Parameter | Required | Data Type | Description | | --------- | ---------| --------- | ----------- | | `campaign_id`| Required | String | See [campaign identifier](https://www.braze.com/docs/api/identifier_types/). | | `schedule_id` | Required | String | The `schedule_id` to delete (obtained from the response to create schedule). |

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
  @spec campaigns_trigger_schedule_delete_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def campaigns_trigger_schedule_delete_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/campaigns/trigger/schedule/delete")
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
  Update Scheduled API Triggered Campaigns
  Use this endpoint to update scheduled API Triggered Campaigns, which are created on the Dashboard and initiated via the API. You can pass in `trigger_properties` that will be templated into the message itself.  This endpoint allows you to send Campaign messages via API Triggered delivery, allowing you to decide what action should trigger the message to be sent. Please note that to send messages with this endpoint, you must have a Campaign ID, created when you build an [API-Triggered Campaign](https://www.braze.com/docs/api/api_campaigns/).  Any schedule will completely overwrite the one that you provided in the create schedule request or in previous update schedule requests. For example, if you originally provide `\"schedule\" : {\"time\" : \"2015-02-20T13:14:47\", \"in_local_time\" : true}` and then in your update you provide `\"schedule\" : {\"time\" : \"2015-02-20T14:14:47\"}`, your message will now be sent at the provided time in UTC, not in the user's local time. Scheduled triggers that are updated very close to or during the time they were supposed to be sent will be updated with best efforts, so last-second changes could be applied to all, some, or none of your targeted users.  ### Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  ### Request parameters | Parameter | Required | Data Type | Description | | --------- | ---------| --------- | ----------- | |`campaign_id`|Required|String| See [campaign identifier](https://www.braze.com/docs/api/identifier_types/)| | `schedule_id` | Optional | String | The `schedule_id` to update (obtained from the response to create schedule). | |`schedule` | Required | Object | See [schedule object](https://www.braze.com/docs/api/objects_filters/schedule_object/). |

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
  @spec campaigns_trigger_schedule_update_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def campaigns_trigger_schedule_update_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/campaigns/trigger/schedule/update")
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
  Schedule API Triggered Canvases
  Use this endpoint to trigger API Triggered Canvases, which are created on the Dashboard and initiated via the API. You can pass in `canvas_entry_properties` that will be templated into the messages sent by the first steps of the Canvas.  This endpoint allows you to schedule Canvas messages (up to 90 days in advance) via API Triggered delivery, allowing you to decide what action should trigger the message to be sent. Please note that to send messages with this endpoint, you must have a Canvas ID, created when you build a [Canvas](https://www.braze.com/docs/api/identifier_types/#canvas-api-identifier).  ### Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  Braze endpoints support [batching API requests](https://www.braze.com/docs/api/api_limits/#batching-api-requests). A single request to the messaging endpoints can reach any of the following:  * Up to 50 specific external_ids, each with individual message parameters * A segment of any size created in the Braze dashboard, specified by its `segment_id` * An ad-hoc audience segment of any size, defined in the request as a [Connected Audience](https://www.braze.com/docs/api/objects_filters/connected_audience/) object  ### Request parameters  | Parameter | Required | Data Type | Description | | --------- | ---------| --------- | ----------- | |`canvas_id`|Required|String| See [Canvas identifier](https://www.braze.com/docs/api/identifier_types/). | | `send_id` | Optional | String | See [send identifier](https://www.braze.com/docs/api/identifier_types/). |  | `recipients` | Optional | Array of recipient objects | See [recipients object](https://www.braze.com/docs/api/objects_filters/recipient_object/). | | `audience` | Optional | Connected audience object | See [connected audience](https://www.braze.com/docs/api/objects_filters/connected_audience/). | |`broadcast`| Optional | Boolean | See [broadcast](https://www.braze.com/docs/api/parameters/#broadcast). This parameter defaults to false (as of August 31, 2017). <br><br> If `recipients` is omitted, `broadcast` must be set to true. However, use caution when setting `broadcast: true`, as unintentionally setting this flag may cause you to send your message to a larger than expected audience. | | `trigger_properties` | Optional | Object | Personalization key-value pairs for all users in this send. See [trigger properties](https://www.braze.com/docs/api/objects_filters/trigger_properties_object/). | | `schedule` | Required | Schedule object | See [schedule object](https://www.braze.com/docs/api/objects_filters/schedule_object/). |

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
  @spec canvas_trigger_schedule_create_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def canvas_trigger_schedule_create_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/canvas/trigger/schedule/create")
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
  Delete Scheduled API-Triggered Canvases
  The delete schedule endpoint allows you to cancel a message that you previously scheduled API-triggered Canvases before it has been sent.  Scheduled messages or triggers that are deleted very close to or during the time they were supposed to be sent will be updated with best efforts, so last-second deletions could be applied to all, some, or none of your targeted users.  ### Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  | Parameter | Required | Data Type | Description | | --------- | ---------| --------- | ----------- | | `canvas_id`| Required | String | See [Canvas identifier](https://braze.com/docs/api/identifier_types/). | | `schedule_id` | Required | String | The `schedule_id` to delete (obtained from the response to create schedule). |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:content_type` (String.t): 
    - `:authorization` (String.t): 
    - `:body` (map()): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec canvas_trigger_schedule_delete_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def canvas_trigger_schedule_delete_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/canvas/trigger/schedule/delete")
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
  Update Scheduled API Triggered Canvases
  Use this endpoint to update scheduled API-Triggered Canvases, which are created on the dashboard and initiated via the API. You can pass in `trigger_properties` that will be templated into the message itself.  This endpoint allows you to update scheduled Canvas messages via API-Triggered delivery, allowing you to decide what action should trigger the message to be sent. Please note that to send messages with this endpoint, you must have a Canvas ID, created when you build a Canvas.  Any schedule will completely overwrite the one that you provided in the create schedule request or in previous update schedule requests. For example, if you originally provide `\"schedule\" : {\"time\" : \"2015-02-20T13:14:47\", \"in_local_time\" : true}` and then in your update you provide `\"schedule\" : {\"time\" : \"2015-02-20T14:14:47\"}`, your message will now be sent at the provided time in UTC, not in the user's local time. Scheduled triggers that are updated very close to or during the time they were supposed to be sent will be updated with best efforts, so last-second changes could be applied to all, some, or none of your targeted users.  ### Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  ### Request parameters | Parameter | Required | Data Type | Description | | --------- | ---------| --------- | ----------- | |`canvas_id`|Required|String| See [Canvas identifier](https://www.braze.com/docs/api/identifier_types/). | | `schedule_id` | Optional | String | The `schedule_id` to update (obtained from the response to create schedule). | |`schedule` | Required | Object | See [schedule object](https://www.braze.com/docs/api/objects_filters/schedule_object/). |

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
  @spec canvas_trigger_schedule_update_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def canvas_trigger_schedule_update_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/canvas/trigger/schedule/update")
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
  Create Scheduled Messages
  Use this endpoint to send messages directly from the API.  The create schedule endpoint allows you to schedule a Campaign, Canvas, or other message to be sent at a designated time (up to 90 days in the future) and provides you with an identifier to reference that message for updates. If you are targeting a segment, a record of your request will be stored in the [Developer Console](https://dashboard.braze.com/app_settings/developer_console/activitylog/) after all scheduled messages have been sent.  ### Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  Braze endpoints support [batching API requests](https://www.braze.com/docs/api/api_limits/#batching-api-requests). A single request to the messaging endpoints can reach any of the following:  *   Up to 50 specific external_ids, each with individual message parameters *   A segment of any size created in the Braze dashboard, specified by its `segment_id` *   An ad-hoc audience segment of any size, defined in the request as a [Connected Audience](https://www.braze.com/docs/api/objects_filters/connected_audience/) object       ### Request parameters  | Parameter | Required | Data Type | Description | | --- | --- | --- | --- | | `broadcast` | Optional | Boolean | See [broadcast](https://www.braze.com/docs/api/parameters/#broadcast). This parameter defaults to false (as of August 31, 2017).  <br>  <br>If `recipients` is omitted, `broadcast` must be set to true. However, use caution when setting `broadcast: true`, as unintentionally setting this flag may cause you to send your message to a larger than expected audience. | | `external_user_ids` | Optional | Array of strings | See [external user identifier](https://www.braze.com/docs/api/parameters/#external-user-id). | | `user_aliases` | Optional | Array of user alias objects | See [user alias object](https://www.braze.com/docs/api/objects_filters/user_alias_object/). | | `audience` | Optional | Connected audience object | See [connected audience](https://www.braze.com/docs/api/objects_filters/connected_audience/). | | `segment_id` | Optional | String | See [segment identifier](https://www.braze.com/docs/api/identifier_types/). | | `campaign_id` | Required | String | See [campaign identifier](https://www.braze.com/docs/api/identifier_types/). | | `recipients` | Optional | Array of recipients objects | See [recipients object](https://www.braze.com/docs/api/objects_filters/recipient_object/). | | `send_id` | Optional | String | See [send identifier](https://www.braze.com/docs/api/identifier_types/). | | `override_messaging_limits` | Optional | Boolean | Ignore global rate limits for campaigns, defaults to false | | `recipient_subscription_state` | Optional | String | Use this to send messages to only users who have opted in (`opted_in`), only users who have subscribed or are opted in (`subscribed`) or to all users, including unsubscribed users (`all`).  <br>  <br>Using `all` users is useful for transactional email messaging. Defaults to `subscribed`. | | `schedule` | Required | Schedule object | See [schedule object](https://www.braze.com/docs/api/objects_filters/schedule_object/) | | `messages` | Optional | Messaging object | See available [messaging objects](https://www.braze.com/docs/api/objects_filters/#messaging-objects). |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:body` (map()): 

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec messages_schedule_create_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def messages_schedule_create_post(connection, opts \\ []) do
    optional_params = %{
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/messages/schedule/create")
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
  Delete Scheduled Messages
  The delete scheduled messages endpoint allows you to cancel a message that you previously scheduled _before_ it has been sent.  ### Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  ### Request parameters | Parameter | Required | Data Type | Description | | --------- | ---------| --------- | ----------- | | `schedule_id` | Required | String | The schedule_id to delete (obtained from the response to create schedule). |

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
  @spec messages_schedule_delete_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def messages_schedule_delete_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/messages/schedule/delete")
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
  Update Scheduled Messages
  The messages update schedule endpoint accepts updates to either the `schedule` or `messages` parameter or both. Your request must contain at least one of those two keys.  ### Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  ### Request parameters  | Parameter | Required | Data Type | Description | | --- | --- | --- | --- | | `schedule_id` | Required | String | The `schedule_id` to update (obtained from the response to create schedule). | | `schedule` | Optional | Object | See [schedule object](https://www.braze.com/docs/api/objects_filters/schedule_object/). | | `messages` | Optional | Object | See available [message objects](https://www.braze.com/docs/api/objects_filters/#messaging-objects). |

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
  @spec messages_schedule_update_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def messages_schedule_update_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/messages/schedule/update")
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
  Get Upcoming Scheduled Campaigns and Canvases
  You can view a JSON list of upcoming and scheduled Campaigns and Canvases using the following information and parameters. The endpoint will return information about scheduled Campaigns and entry Canvases between now and the designated end_time (ISO 8601 format) specified in the request. Daily, recurring messages will only appear once with their next occurrence. Results returned in this endpoint are only for Campaigns and Canvases created and scheduled in Braze.  ### Rate limit  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).  ## Response  ```json Content-Type: application/json Authorization: Bearer YOUR-REST-API-KEY {     \"scheduled_broadcasts\": [       # Example Canvas       {         \"name\" => String,         \"id\" => String,         \"type\" => \"Canvas\",         \"tags\" => [String tag names],         \"next_send_time\" => \"YYYY-MM-DD HH:mm:ss\" (may also include time zone if not local/intelligent delivery)         \"schedule_type\" => one of \"local_time_zones\", \"intelligent_delivery\", or the name of your company's time zone       },       # Example Campaign       {         \"name\" => String,         \"id\" => String,         \"type\" => \"Campaign\",         \"tags\" => [String tag names],         \"next_send_time\" => \"YYYY-MM-DD HH:mm:ss\" (may also include time zone if not local/intelligent delivery)         \"schedule_type\" => one of \"local_time_zones\", \"intelligent_delivery\", or the name of your company's time zone       },     ] } ```

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:end_time` (String.t): (Required) String in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format  End date of the range to retrieve upcoming scheduled Campaigns and Canvases. This is treated as midnight in UTC time by the API.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec messages_scheduled_broadcasts_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def messages_scheduled_broadcasts_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :end_time => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/messages/scheduled_broadcasts")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end
end
