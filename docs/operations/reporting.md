[//]: # (Code generated. DO NOT EDIT.)

# Reporting Service Index

&nbsp;

## Operations

### Admin Extension Categories and Auto Moderation Actions Wrapper:  [AdminExtensionCategoriesAndAutoModerationActions](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/wrappers/AdminExtensionCategoriesAndAutoModerationActions.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/reporting/v1/admin/extensionActions` | GET | AdminFindActionList | [AdminFindActionList](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_extension_categories_and_auto_moderation_actions/AdminFindActionList.java) | [AdminFindActionList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_extension_categories_and_auto_moderation_actions/AdminFindActionList.java) |
| `/reporting/v1/admin/extensionActions` | POST | AdminCreateModAction | [AdminCreateModAction](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_extension_categories_and_auto_moderation_actions/AdminCreateModAction.java) | [AdminCreateModAction](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_extension_categories_and_auto_moderation_actions/AdminCreateModAction.java) |
| `/reporting/v1/admin/extensionCategories` | GET | AdminFindExtensionCategoryList | [AdminFindExtensionCategoryList](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_extension_categories_and_auto_moderation_actions/AdminFindExtensionCategoryList.java) | [AdminFindExtensionCategoryList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_extension_categories_and_auto_moderation_actions/AdminFindExtensionCategoryList.java) |
| `/reporting/v1/admin/extensionCategories` | POST | AdminCreateExtensionCategory | [AdminCreateExtensionCategory](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_extension_categories_and_auto_moderation_actions/AdminCreateExtensionCategory.java) | [AdminCreateExtensionCategory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_extension_categories_and_auto_moderation_actions/AdminCreateExtensionCategory.java) |

### Admin Configurations Wrapper:  [AdminConfigurations](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/wrappers/AdminConfigurations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/reporting/v1/admin/namespaces/{namespace}/configurations` | GET | Get | [Get](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_configurations/Get.java) | [Get](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_configurations/Get.java) |
| `/reporting/v1/admin/namespaces/{namespace}/configurations` | POST | Upsert | [Upsert](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_configurations/Upsert.java) | [Upsert](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_configurations/Upsert.java) |

### Admin Reasons Wrapper:  [AdminReasons](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/wrappers/AdminReasons.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/reporting/v1/admin/namespaces/{namespace}/reasonGroups` | GET | AdminListReasonGroups | [AdminListReasonGroups](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/AdminListReasonGroups.java) | [AdminListReasonGroups](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/AdminListReasonGroups.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasonGroups` | POST | CreateReasonGroup | [CreateReasonGroup](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/CreateReasonGroup.java) | [CreateReasonGroup](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/CreateReasonGroup.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasonGroups/{groupId}` | GET | GetReasonGroup | [GetReasonGroup](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/GetReasonGroup.java) | [GetReasonGroup](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/GetReasonGroup.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasonGroups/{groupId}` | DELETE | DeleteReasonGroup | [DeleteReasonGroup](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/DeleteReasonGroup.java) | [DeleteReasonGroup](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/DeleteReasonGroup.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasonGroups/{groupId}` | PATCH | UpdateReasonGroup | [UpdateReasonGroup](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/UpdateReasonGroup.java) | [UpdateReasonGroup](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/UpdateReasonGroup.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasons` | GET | AdminGetReasons | [AdminGetReasons](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/AdminGetReasons.java) | [AdminGetReasons](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/AdminGetReasons.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasons` | POST | CreateReason | [CreateReason](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/CreateReason.java) | [CreateReason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/CreateReason.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasons/all` | GET | AdminGetAllReasons | [AdminGetAllReasons](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/AdminGetAllReasons.java) | [AdminGetAllReasons](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/AdminGetAllReasons.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasons/unused` | GET | AdminGetUnusedReasons | [AdminGetUnusedReasons](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/AdminGetUnusedReasons.java) | [AdminGetUnusedReasons](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/AdminGetUnusedReasons.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasons/{reasonId}` | GET | AdminGetReason | [AdminGetReason](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/AdminGetReason.java) | [AdminGetReason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/AdminGetReason.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasons/{reasonId}` | DELETE | DeleteReason | [DeleteReason](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/DeleteReason.java) | [DeleteReason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/DeleteReason.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reasons/{reasonId}` | PATCH | UpdateReason | [UpdateReason](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reasons/UpdateReason.java) | [UpdateReason](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reasons/UpdateReason.java) |

### Admin Reports Wrapper:  [AdminReports](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/wrappers/AdminReports.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/reporting/v1/admin/namespaces/{namespace}/reports` | GET | ListReports | [ListReports](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reports/ListReports.java) | [ListReports](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reports/ListReports.java) |
| `/reporting/v1/admin/namespaces/{namespace}/reports` | POST | AdminSubmitReport | [AdminSubmitReport](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_reports/AdminSubmitReport.java) | [AdminSubmitReport](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_reports/AdminSubmitReport.java) |

### Admin Moderation Rule Wrapper:  [AdminModerationRule](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/wrappers/AdminModerationRule.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/reporting/v1/admin/namespaces/{namespace}/rule` | POST | CreateModerationRule | [CreateModerationRule](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_moderation_rule/CreateModerationRule.java) | [CreateModerationRule](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_moderation_rule/CreateModerationRule.java) |
| `/reporting/v1/admin/namespaces/{namespace}/rule/{ruleId}` | PUT | UpdateModerationRule | [UpdateModerationRule](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_moderation_rule/UpdateModerationRule.java) | [UpdateModerationRule](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_moderation_rule/UpdateModerationRule.java) |
| `/reporting/v1/admin/namespaces/{namespace}/rule/{ruleId}` | DELETE | DeleteModerationRule | [DeleteModerationRule](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_moderation_rule/DeleteModerationRule.java) | [DeleteModerationRule](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_moderation_rule/DeleteModerationRule.java) |
| `/reporting/v1/admin/namespaces/{namespace}/rule/{ruleId}/status` | PUT | UpdateModerationRuleStatus | [UpdateModerationRuleStatus](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_moderation_rule/UpdateModerationRuleStatus.java) | [UpdateModerationRuleStatus](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_moderation_rule/UpdateModerationRuleStatus.java) |
| `/reporting/v1/admin/namespaces/{namespace}/rules` | GET | GetModerationRules | [GetModerationRules](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_moderation_rule/GetModerationRules.java) | [GetModerationRules](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_moderation_rule/GetModerationRules.java) |
| `/reporting/v1/admin/namespaces/{namespace}/rules/{ruleId}` | GET | GetModerationRuleDetails | [GetModerationRuleDetails](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_moderation_rule/GetModerationRuleDetails.java) | [GetModerationRuleDetails](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_moderation_rule/GetModerationRuleDetails.java) |

### Admin Tickets Wrapper:  [AdminTickets](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/wrappers/AdminTickets.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/reporting/v1/admin/namespaces/{namespace}/tickets` | GET | ListTickets | [ListTickets](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_tickets/ListTickets.java) | [ListTickets](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_tickets/ListTickets.java) |
| `/reporting/v1/admin/namespaces/{namespace}/tickets/statistic` | GET | TicketStatistic | [TicketStatistic](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_tickets/TicketStatistic.java) | [TicketStatistic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_tickets/TicketStatistic.java) |
| `/reporting/v1/admin/namespaces/{namespace}/tickets/{ticketId}` | GET | GetTicketDetail | [GetTicketDetail](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_tickets/GetTicketDetail.java) | [GetTicketDetail](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_tickets/GetTicketDetail.java) |
| `/reporting/v1/admin/namespaces/{namespace}/tickets/{ticketId}` | DELETE | DeleteTicket | [DeleteTicket](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_tickets/DeleteTicket.java) | [DeleteTicket](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_tickets/DeleteTicket.java) |
| `/reporting/v1/admin/namespaces/{namespace}/tickets/{ticketId}/reports` | GET | GetReportsByTicket | [GetReportsByTicket](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_tickets/GetReportsByTicket.java) | [GetReportsByTicket](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_tickets/GetReportsByTicket.java) |
| `/reporting/v1/admin/namespaces/{namespace}/tickets/{ticketId}/resolutions` | POST | UpdateTicketResolutions | [UpdateTicketResolutions](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/admin_tickets/UpdateTicketResolutions.java) | [UpdateTicketResolutions](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/admin_tickets/UpdateTicketResolutions.java) |

### Public Reasons Wrapper:  [PublicReasons](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/wrappers/PublicReasons.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/reporting/v1/public/namespaces/{namespace}/reasonGroups` | GET | PublicListReasonGroups | [PublicListReasonGroups](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/public_reasons/PublicListReasonGroups.java) | [PublicListReasonGroups](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/public_reasons/PublicListReasonGroups.java) |
| `/reporting/v1/public/namespaces/{namespace}/reasons` | GET | PublicGetReasons | [PublicGetReasons](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/public_reasons/PublicGetReasons.java) | [PublicGetReasons](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/public_reasons/PublicGetReasons.java) |

### Public Reports Wrapper:  [PublicReports](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/wrappers/PublicReports.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/reporting/v1/public/namespaces/{namespace}/reports` | POST | SubmitReport | [SubmitReport](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/operations/public_reports/SubmitReport.java) | [SubmitReport](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/reporting/public_reports/SubmitReport.java) |


&nbsp;

## Models

| Model | Class |
|---|---|
| `restapi.AdminAllReasonsResponse` | [RestapiAdminAllReasonsResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiAdminAllReasonsResponse.java) |
| `restapi.BanAccountActionRequest` | [RestapiBanAccountActionRequest](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiBanAccountActionRequest.java) |
| `restapi.BanAccountActionResponse` | [RestapiBanAccountActionResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiBanAccountActionResponse.java) |
| `restapi.ModerationRuleActionsRequest` | [RestapiModerationRuleActionsRequest](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiModerationRuleActionsRequest.java) |
| `restapi.ModerationRuleActionsResponse` | [RestapiModerationRuleActionsResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiModerationRuleActionsResponse.java) |
| `restapi.ModerationRuleActiveRequest` | [RestapiModerationRuleActiveRequest](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiModerationRuleActiveRequest.java) |
| `restapi.ModerationRuleRequest` | [RestapiModerationRuleRequest](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiModerationRuleRequest.java) |
| `restapi.ModerationRuleResponse` | [RestapiModerationRuleResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiModerationRuleResponse.java) |
| `restapi.ModerationRulesList` | [RestapiModerationRulesList](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiModerationRulesList.java) |
| `restapi.UnusedReasonListResponse` | [RestapiUnusedReasonListResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiUnusedReasonListResponse.java) |
| `restapi.actionApiRequest` | [RestapiActionApiRequest](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiActionApiRequest.java) |
| `restapi.actionApiResponse` | [RestapiActionApiResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiActionApiResponse.java) |
| `restapi.actionListApiResponse` | [RestapiActionListApiResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiActionListApiResponse.java) |
| `restapi.adminReasonListResponse` | [RestapiAdminReasonListResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiAdminReasonListResponse.java) |
| `restapi.adminReasonResponse` | [RestapiAdminReasonResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiAdminReasonResponse.java) |
| `restapi.categoryLimit` | [RestapiCategoryLimit](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiCategoryLimit.java) |
| `restapi.configResponse` | [RestapiConfigResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiConfigResponse.java) |
| `restapi.createReasonGroupRequest` | [RestapiCreateReasonGroupRequest](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiCreateReasonGroupRequest.java) |
| `restapi.createReasonRequest` | [RestapiCreateReasonRequest](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiCreateReasonRequest.java) |
| `restapi.errorResponse` | [RestapiErrorResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiErrorResponse.java) |
| `restapi.extensionCategoryApiRequest` | [RestapiExtensionCategoryApiRequest](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiExtensionCategoryApiRequest.java) |
| `restapi.extensionCategoryApiResponse` | [RestapiExtensionCategoryApiResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiExtensionCategoryApiResponse.java) |
| `restapi.extensionCategoryListApiResponse` | [RestapiExtensionCategoryListApiResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiExtensionCategoryListApiResponse.java) |
| `restapi.pagination` | [RestapiPagination](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiPagination.java) |
| `restapi.publicReasonGroupResponse` | [RestapiPublicReasonGroupResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiPublicReasonGroupResponse.java) |
| `restapi.publicReasonListResponse` | [RestapiPublicReasonListResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiPublicReasonListResponse.java) |
| `restapi.publicReasonResponse` | [RestapiPublicReasonResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiPublicReasonResponse.java) |
| `restapi.reasonGroupListResponse` | [RestapiReasonGroupListResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiReasonGroupListResponse.java) |
| `restapi.reasonGroupResponse` | [RestapiReasonGroupResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiReasonGroupResponse.java) |
| `restapi.reportListResponse` | [RestapiReportListResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiReportListResponse.java) |
| `restapi.reportResponse` | [RestapiReportResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiReportResponse.java) |
| `restapi.reportingLimit` | [RestapiReportingLimit](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiReportingLimit.java) |
| `restapi.submitReportRequest` | [RestapiSubmitReportRequest](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiSubmitReportRequest.java) |
| `restapi.submitReportResponse` | [RestapiSubmitReportResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiSubmitReportResponse.java) |
| `restapi.ticketListResponse` | [RestapiTicketListResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiTicketListResponse.java) |
| `restapi.ticketResponse` | [RestapiTicketResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiTicketResponse.java) |
| `restapi.ticketStatisticResponse` | [RestapiTicketStatisticResponse](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiTicketStatisticResponse.java) |
| `restapi.updateReasonGroupRequest` | [RestapiUpdateReasonGroupRequest](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiUpdateReasonGroupRequest.java) |
| `restapi.updateTicketResolutionsRequest` | [RestapiUpdateTicketResolutionsRequest](../../module-reporting/src/main/java/net/accelbyte/sdk/api/reporting/models/RestapiUpdateTicketResolutionsRequest.java) |
