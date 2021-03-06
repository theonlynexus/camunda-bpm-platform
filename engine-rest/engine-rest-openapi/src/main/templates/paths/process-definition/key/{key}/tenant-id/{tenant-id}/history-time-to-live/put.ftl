{

  <@lib.endpointInfo
      id = "updateHistoryTimeToLiveByProcessDefinitionKeyAndTenantId"
      tag = "Process Definition"
      summary = "Update History Time to Live"
      desc = "Updates history time to live for the latest version of the process definition for a tenant.
              The field is used within [History cleanup](${docsUrl}/user-guide/process-engine/history/#history-cleanup)." />

  "parameters" : [

    <@lib.parameter
        name = "key"
        location = "path"
        type = "string"
        required = true
        desc = "The key of the process definition to change history time to live."/>

    <@lib.parameter
        name = "tenant-id"
        location = "path"
        type = "string"
        required = true
        last = true
        desc = "The id of the tenant the process definition belongs to."/>
  ],

  <@lib.requestBody
      mediaType = "application/json"
      dto = "HistoryTimeToLiveDto"
      examples = ['"example-1": {
                     "summary": "PUT `/process-definition/key/aProcessDefinitionKey/tenant-id/aTenantId/history-time-to-live`",
                     "value": {
                       "historyTimeToLive" : 5
                     }
                   }'
                 ] />

  "responses" : {

    <@lib.response
        code = "204"
        desc = "Request successful."/>

    <@lib.response
        code = "400"
        dto = "ExceptionDto"
        desc = "Returned if some of the request parameters are invalid. See the
                [Introduction](${docsUrl}/reference/rest/overview/#error-handling)
                for the error response format." />

    <@lib.response
        code = "404"
        dto = "ExceptionDto"
        last = true
        desc = "Process definition with given id does not exist. See the
                [Introduction](${docsUrl}/reference/rest/overview/#error-handling)
                for the error response format." />

  }
}
