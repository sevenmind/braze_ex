# NOTE: This file is auto generated by OpenAPI Generator 6.1.1-SNAPSHOT (https://openapi-generator.tech).
# Do not edit this file manually.

defmodule BrazeEx.Api.TemplatesContentBlocks do
  @moduledoc """
  API calls for all endpoints tagged `TemplatesContentBlocks`.
  """

  alias BrazeEx.Connection
  import BrazeEx.RequestBuilder

  @doc """

  # Create Content Block

  # Notes 
  This endpoint will create a [Content Block](https://www.braze.com/docs/user_guide/engagement_tools/templates_and_media/content_blocks/).

  ### Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ### Request parameters

  | Parameter | Required | Data Type | Description |
  |---|---|---|---|
  | `name` | Required | String | Name of the content block. Must be less than 100 characters. |
  | `description` | Optional | String | Description of the content block. Must be less than 250 characters. |
  | `content` | Required | String | HTML or text content within the Content Block. |
  | `state` | Optional | String | Choose `active` or `draft`. Defaults to `active` if not specified. |
  | `tags` | Optional | Array of strings | [Tags](https://www.braze.com/docs/user_guide/administrative/app_settings/manage_app_group/tags/) must already exist. |

  ### Response

  ```json
  {
  "content_block_id": "newly-generated-block-id",
  "liquid_tag": "generated-block-tag-from-name",
  "created_at": "time-created-in-iso",
  "message": success
  }
  ```

  ### Possible errors

  The following table lists possible returned errors and their associated troubleshooting steps, if applicable.

  | Error | Troubleshooting |
  | --- | --- |
  | Content cannot be blank |
  | Content must be a string | Make sure your content is encapsulated in quotes (`""`). |
  | Content must be smaller than 50kb | The content in your Content Block must be less than 50kb total. |
  | Content contains malformed liquid | The Liquid provided is not valid or parsable. Try again with valid Liquid or reach out to support. |
  | Content Block cannot be referenced within itself |
  | Content Block description cannot be blank |
  | Content Block description must be a string | Make sure your Content Block description is encapsulated in quotes (`""`). |
  | Content Block description must be shorter than 250 characters |
  | Content Block name cannot be blank |
  | Content Block name must be shorter than 100 characters |
  | Content Block name can only contain alphanumeric characters | Content Block names can include any of the following characters: the letters (capitalized or lowercase) `A` through `Z`, the numbers `0` through `9`, dashes `-`, and underscores `_`. It cannot contain non-alphanumeric characters like emojis, `!`, `@`, `~`, `&`, and other "special" characters. |
  | Content Block with this name already exists | Try a different name. |
  | Content Block state must be either active or draft |
  | Tags must be an array | Tags must be formatted as an array of strings, for example `["marketing", "promotional", "transactional"]`. |
  | All tags must be strings | Make sure your tags are encapsulated in quotes (`""`). |
  | Some tags could not be found | To add a tag when creating a Content Block, the tag must already exist in Braze. |

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
  @spec content_blocks_create_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def content_blocks_create_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/content_blocks/create")
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

  # See Content Block Information

  # Notes 
  This endpoint will call information for an existing [Content Block](https://www.braze.com/docs/user_guide/engagement_tools/templates_and_media/content_blocks/).

  ### Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ### Response
  ```json
  Content-Type: application/json
  Authorization: Bearer YOUR_REST_API_KEY
  {
  "content_block_id": "string",
  "name": "string",
  "content": "string",
  "description": "string",
  "content_type": "html or text",
  "tags":  "array of strings",
  "created_at": "time-in-iso",
  "last_edited": "time-in-iso",
  "inclusion_count" : "integer",
  "message": "success"
  }
  ```

  ### Possible errors

  The following table lists possible returned errors and their associated troubleshooting steps.

  | Error | Troubleshooting |
  | --- | --- |
  | Content Block ID cannot be blank | Make sure that a Content Block is listed in your request and is encapsulated in quotes (`""`). |
  | Content Block ID is invalid for this App Group | This Content Block doesn't exist or is in a different company account or app group. |
  | Content Block has been deleted—content not available | This Content Block, though it may have existed earlier, has been deleted. |
  | Include Inclusion Data—error | This parameter only accepts boolean values (true or false). Make sure the value for `include_inclusion_data` is not encapsulated in quotes (`""`), which causes the value to be sent as a string instead. See request parameters for details. |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:content_block_id` (String.t): (Required) String  The content block identifier.   You can find this by either listing content block information through an API call or going to **Developer Console** > **API Settings**, then scrolling to the bottom and searching for your content block API identifier.
    - `:include_inclusion_data` (boolean()): (Optional) Boolean  When set to `true`, the API returns back the Message Variation API identifier of campaigns and Canvases where this content block is included, to be used in subsequent calls. The results exclude archived or deleted Campaigns or Canvases.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec content_blocks_info_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def content_blocks_info_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :content_block_id => :query,
      :include_inclusion_data => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/content_blocks/info")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """

  # List Available Content Blocks

  # Notes 
  This endpoint will list your existing [Content Blocks](https://www.braze.com/docs/user_guide/engagement_tools/templates_and_media/content_blocks/) information.

  ### Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/).

  ### Response
  ```json
  Content-Type: application/json
  Authorization: Bearer YOUR_REST_API_KEY
  {
  "count": "integer",
  "content_blocks": [
    {
      "content_block_id": "string",
      "name": "string",
      "content_type": "html or text",
      "liquid_tag": "string",
      "inclusion_count" : "integer",
      "created_at": "time-in-iso",
      "last_edited": "time-in-iso",
      "tags" : "array of strings"
    }
  ]
  }
  ```

  ### Possible errors

  The following table lists possible returned errors and their associated troubleshooting steps.

  | Error | Troubleshooting |
  | --- | --- |
  | Modified after time is invalid | The provided date is not a valid or parsable date. Reformat this value as a string in ISO 8601 format (`yyyy-mm-ddThh:mm:ss.ffffff`). |
  | Modified before time is invalid | The provided date is not a valid or parsable date. Reformat this value as a string in ISO 8601 format (`yyyy-mm-ddThh:mm:ss.ffffff`). |
  | Modified after time must be earlier than or the same as modified before time. | Change the `modified_after` value to a time that is earlier than the `modified_before` time. |
  | Content Block number limit is invalid | The `limit` parameter must be an integer (positive number) greater than 0. |
  | Content Block number limit must be greater than 0 | Change the `limit` parameter to an integer greater than 0. |
  | Content Block number limit exceeds maximum of 1000 | Change the `limit` parameter to an integer less than 1000. |
  | Offset is invalid | The `offset` parameter must be an integer greater than 0. |
  | Offset must be greater than 0 | Change the `offset` parameter to an integer greater than 0. |

  ### Parameters

  - `connection` (BrazeEx.Connection): Connection to server
  - `opts` (keyword): Optional parameters
    - `:authorization` (String.t): 
    - `:modified_after` (String.t): (Optional) String in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)  Retrieve only content blocks updated at or after the given time.
    - `:modified_before` (String.t): (Optional) String in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)  Retrieve only content blocks updated at or before the given time.
    - `:limit` (integer()): (Optional) Positive Number  Maximum number of content blocks to retrieve. Default to 100 if not provided, with a maximum acceptable value of 1000.
    - `:offset` (integer()): (Optional) Positive Number  Number of content blocks to skip before returning rest of the templates that fit the search criteria.

  ### Returns

  - `{:ok, nil}` on success
  - `{:error, Tesla.Env.t}` on failure
  """
  @spec content_blocks_list_get(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def content_blocks_list_get(connection, opts \\ []) do
    optional_params = %{
      :Authorization => :headers,
      :modified_after => :query,
      :modified_before => :query,
      :limit => :query,
      :offset => :query
    }

    request =
      %{}
      |> method(:get)
      |> url("/content_blocks/list")
      |> add_optional_params(optional_params, opts)
      |> Enum.into([])

    connection
    |> Connection.request(request)
    |> evaluate_response([
      {200, false}
    ])
  end

  @doc """

  # Update Content Block

  # Notes 
  This endpoint will update a [Content Block](https://www.braze.com/docs/user_guide/engagement_tools/templates_and_media/content_blocks/).

  ### Rate limit

  We apply the default Braze rate limit of 250,000 requests per hour to this endpoint, as documented in [API rate limits](https://www.braze.com/docs/api/api_limits/)

  ### Request parameters
  | Parameter | Required | Data Type | Description |
  |---|---|---|---|
  | `content_block_id`|	Required |	String | Your content block's API identifier.|
  | `name` | Required | String | Name of the content block. Must be less than 100 characters. |
  | `description` | Optional | String | Description of the content block. Must be less than 250 characters. |
  | `content` | Required | String | HTML or text content within content blocks.
  | `state` | Optional | String | Choose `active` or `draft`. Defaults to `active` if not specified. |
  | `tags` | Optional | Array of strings | [Tags](https://www.braze.com/docs/user_guide/administrative/app_settings/manage_app_group/tags/) must already exist. |

  ### Response

  ```json
  {
  "content_block_id": "newly-generated-block-id",
  "liquid_tag": "generated-block-tag-from-content_block_name",
  "created_at": "time-created-in-iso",
  "message": "success"
  }
  ```

  ### Possible errors

  The following table lists possible returned errors and their associated troubleshooting steps, if applicable.

  | Error | Troubleshooting |
  | --- | --- |
  | Content cannot be blank |
  | Content must be a string | Make sure your content is encapsulated in quotes (`""`). |
  | Content must be smaller than 50kb | The content in your Content Block must be less than 50kb total. |
  | Content contains malformed liquid | The Liquid provided is not valid or parsable. Try again with valid Liquid or reach out to support. |
  | Content Block cannot be referenced within itself |
  | Content Block description cannot be blank |
  | Content Block description must be a string | Make sure your Content Block description is encapsulated in quotes (`""`). |
  | Content Block description must be shorter than 250 characters |
  | Content Block name cannot be blank |
  | Content Block name must be shorter than 100 characters |
  | Content Block name can only contain alphanumeric characters | Content Block names can include any of the following characters: the letters (capitalized or lowercase) `A` through `Z`, the numbers `0` through `9`, dashes `-`, and underscores `_`. It cannot contain non-alphanumeric characters like emojis, `!`, `@`, `~`, `&`, and other "special" characters. |
  | Content Block with this name already exists | Try a different name. |
  | Content Block name cannot be updated for active Content Blocks |
  | Content Block state must be either active or draft |
  | Active Content Block can not be updated to Draft. Create a new Content Block |
  | Tags must be an array | Tags must be formatted as an array of strings, for example `["marketing", "promotional", "transactional"]`. |
  | All tags must be strings | Make sure your tags are encapsulated in quotes (`""`). |
  | Some tags could not be found | To add a tag when creating a Content Block, the tag must already exist in Braze. |

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
  @spec content_blocks_update_post(Tesla.Env.client(), keyword()) ::
          {:ok, nil} | {:error, Tesla.Env.t()}
  def content_blocks_update_post(connection, opts \\ []) do
    optional_params = %{
      :"Content-Type" => :headers,
      :Authorization => :headers,
      :body => :body
    }

    request =
      %{}
      |> method(:post)
      |> url("/content_blocks/update")
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
