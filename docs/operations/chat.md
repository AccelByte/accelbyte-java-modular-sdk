[//]: # (Code generated. DO NOT EDIT.)

# Chat Service Index

&nbsp;

## Operations

### topic Wrapper:  [Topic](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/wrappers/Topic.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/chat/admin/namespaces/{namespace}/chat/filter` | POST | AdminFilterChatMessage | [AdminFilterChatMessage](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminFilterChatMessage.java) | [AdminFilterChatMessage](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminFilterChatMessage.java) |
| `/chat/admin/namespaces/{namespace}/chats` | GET | AdminChatHistory | [AdminChatHistory](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminChatHistory.java) | [AdminChatHistory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminChatHistory.java) |
| `/chat/admin/namespaces/{namespace}/namespace-topic` | POST | AdminCreateNamespaceTopic | [AdminCreateNamespaceTopic](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminCreateNamespaceTopic.java) | [AdminCreateNamespaceTopic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminCreateNamespaceTopic.java) |
| `/chat/admin/namespaces/{namespace}/topic` | GET | AdminTopicList | [AdminTopicList](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminTopicList.java) | [AdminTopicList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminTopicList.java) |
| `/chat/admin/namespaces/{namespace}/topic` | POST | AdminCreateTopic | [AdminCreateTopic](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminCreateTopic.java) | [AdminCreateTopic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminCreateTopic.java) |
| `/chat/admin/namespaces/{namespace}/topic/channel` | GET | AdminChannelTopicList | [AdminChannelTopicList](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminChannelTopicList.java) | [AdminChannelTopicList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminChannelTopicList.java) |
| `/chat/admin/namespaces/{namespace}/topic/channel/summary` | GET | AdminChannelTopicSummary | [AdminChannelTopicSummary](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminChannelTopicSummary.java) | [AdminChannelTopicSummary](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminChannelTopicSummary.java) |
| `/chat/admin/namespaces/{namespace}/topic/log` | GET | AdminQueryTopicLog | [AdminQueryTopicLog](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminQueryTopicLog.java) | [AdminQueryTopicLog](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminQueryTopicLog.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}` | PUT | AdminUpdateTopic | [AdminUpdateTopic](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminUpdateTopic.java) | [AdminUpdateTopic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminUpdateTopic.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}` | DELETE | AdminDeleteTopic | [AdminDeleteTopic](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminDeleteTopic.java) | [AdminDeleteTopic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminDeleteTopic.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/ban-members` | POST | AdminBanTopicMembers | [AdminBanTopicMembers](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminBanTopicMembers.java) | [AdminBanTopicMembers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminBanTopicMembers.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/channel` | GET | AdminChannelTopicInfo | [AdminChannelTopicInfo](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminChannelTopicInfo.java) | [AdminChannelTopicInfo](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminChannelTopicInfo.java) |
| [DEPRECATED] `/chat/admin/namespaces/{namespace}/topic/{topic}/chats` | GET | AdminTopicChatHistory | [AdminTopicChatHistory](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminTopicChatHistory.java) | [AdminTopicChatHistory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminTopicChatHistory.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/chats` | POST | AdminSendChat | [AdminSendChat](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminSendChat.java) | [AdminSendChat](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminSendChat.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/chats/{chatId}` | DELETE | AdminDeleteChat | [AdminDeleteChat](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminDeleteChat.java) | [AdminDeleteChat](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminDeleteChat.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/members` | GET | AdminTopicMembers | [AdminTopicMembers](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminTopicMembers.java) | [AdminTopicMembers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminTopicMembers.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/shards` | GET | AdminTopicShards | [AdminTopicShards](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminTopicShards.java) | [AdminTopicShards](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminTopicShards.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/unban-members` | POST | AdminUnbanTopicMembers | [AdminUnbanTopicMembers](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminUnbanTopicMembers.java) | [AdminUnbanTopicMembers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminUnbanTopicMembers.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/user/{userId}` | POST | AdminAddTopicMember | [AdminAddTopicMember](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminAddTopicMember.java) | [AdminAddTopicMember](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminAddTopicMember.java) |
| `/chat/admin/namespaces/{namespace}/topic/{topic}/user/{userId}` | DELETE | AdminRemoveTopicMember | [AdminRemoveTopicMember](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminRemoveTopicMember.java) | [AdminRemoveTopicMember](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminRemoveTopicMember.java) |
| `/chat/admin/namespaces/{namespace}/topics` | GET | AdminQueryTopic | [AdminQueryTopic](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminQueryTopic.java) | [AdminQueryTopic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminQueryTopic.java) |
| `/chat/admin/namespaces/{namespace}/users/{userId}/topics` | GET | AdminQueryUsersTopic | [AdminQueryUsersTopic](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/AdminQueryUsersTopic.java) | [AdminQueryUsersTopic](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/AdminQueryUsersTopic.java) |
| `/chat/public/namespaces/{namespace}/muted` | GET | PublicGetMutedTopics | [PublicGetMutedTopics](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/PublicGetMutedTopics.java) | [PublicGetMutedTopics](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/PublicGetMutedTopics.java) |
| `/chat/public/namespaces/{namespace}/topic` | GET | PublicTopicList | [PublicTopicList](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/PublicTopicList.java) | [PublicTopicList](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/PublicTopicList.java) |
| `/chat/public/namespaces/{namespace}/topic/{topic}/ban-members` | POST | PublicBanTopicMembers | [PublicBanTopicMembers](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/PublicBanTopicMembers.java) | [PublicBanTopicMembers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/PublicBanTopicMembers.java) |
| `/chat/public/namespaces/{namespace}/topic/{topic}/chats` | GET | PublicChatHistory | [PublicChatHistory](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/PublicChatHistory.java) | [PublicChatHistory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/PublicChatHistory.java) |
| `/chat/public/namespaces/{namespace}/topic/{topic}/chats/{chatId}` | DELETE | PublicDeleteChat | [PublicDeleteChat](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/PublicDeleteChat.java) | [PublicDeleteChat](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/PublicDeleteChat.java) |
| `/chat/public/namespaces/{namespace}/topic/{topic}/mute` | PUT | PublicMuteUser | [PublicMuteUser](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/PublicMuteUser.java) | [PublicMuteUser](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/PublicMuteUser.java) |
| `/chat/public/namespaces/{namespace}/topic/{topic}/unban-members` | POST | PublicUnbanTopicMembers | [PublicUnbanTopicMembers](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/PublicUnbanTopicMembers.java) | [PublicUnbanTopicMembers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/PublicUnbanTopicMembers.java) |
| `/chat/public/namespaces/{namespace}/topic/{topic}/unmute` | PUT | PublicUnmuteUser | [PublicUnmuteUser](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/topic/PublicUnmuteUser.java) | [PublicUnmuteUser](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/topic/PublicUnmuteUser.java) |

### config Wrapper:  [Config](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/wrappers/Config.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/chat/v1/admin/config` | GET | AdminGetAllConfigV1 | [AdminGetAllConfigV1](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/config/AdminGetAllConfigV1.java) | [AdminGetAllConfigV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/config/AdminGetAllConfigV1.java) |
| `/chat/v1/admin/config/log` | GET | AdminGetLogConfig | [AdminGetLogConfig](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/config/AdminGetLogConfig.java) | [AdminGetLogConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/config/AdminGetLogConfig.java) |
| `/chat/v1/admin/config/log` | PATCH | AdminPatchUpdateLogConfig | [AdminPatchUpdateLogConfig](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/config/AdminPatchUpdateLogConfig.java) | [AdminPatchUpdateLogConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/config/AdminPatchUpdateLogConfig.java) |
| `/chat/v1/admin/config/namespaces/{namespace}` | GET | AdminGetConfigV1 | [AdminGetConfigV1](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/config/AdminGetConfigV1.java) | [AdminGetConfigV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/config/AdminGetConfigV1.java) |
| `/chat/v1/admin/config/namespaces/{namespace}` | PUT | AdminUpdateConfigV1 | [AdminUpdateConfigV1](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/config/AdminUpdateConfigV1.java) | [AdminUpdateConfigV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/config/AdminUpdateConfigV1.java) |
| `/chat/v1/admin/config/namespaces/{namespace}/export` | GET | ExportConfig | [ExportConfig](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/config/ExportConfig.java) | [ExportConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/config/ExportConfig.java) |
| `/chat/v1/admin/config/namespaces/{namespace}/import` | POST | ImportConfig | [ImportConfig](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/config/ImportConfig.java) | [ImportConfig](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/config/ImportConfig.java) |
| `/chat/v1/public/config/namespaces/{namespace}` | GET | PublicGetConfigV1 | [PublicGetConfigV1](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/config/PublicGetConfigV1.java) | [PublicGetConfigV1](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/config/PublicGetConfigV1.java) |

### inbox Wrapper:  [Inbox](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/wrappers/Inbox.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/chat/v1/admin/inbox/namespaces/{namespace}/categories` | GET | AdminGetInboxCategories | [AdminGetInboxCategories](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminGetInboxCategories.java) | [AdminGetInboxCategories](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminGetInboxCategories.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/categories` | POST | AdminAddInboxCategory | [AdminAddInboxCategory](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminAddInboxCategory.java) | [AdminAddInboxCategory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminAddInboxCategory.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/categories/{category}` | DELETE | AdminDeleteInboxCategory | [AdminDeleteInboxCategory](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminDeleteInboxCategory.java) | [AdminDeleteInboxCategory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminDeleteInboxCategory.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/categories/{category}` | PATCH | AdminUpdateInboxCategory | [AdminUpdateInboxCategory](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminUpdateInboxCategory.java) | [AdminUpdateInboxCategory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminUpdateInboxCategory.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/categories/{category}/schema.json` | GET | AdminGetCategorySchema | [AdminGetCategorySchema](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminGetCategorySchema.java) | [AdminGetCategorySchema](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminGetCategorySchema.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/message/{messageId}` | DELETE | AdminDeleteInboxMessage | [AdminDeleteInboxMessage](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminDeleteInboxMessage.java) | [AdminDeleteInboxMessage](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminDeleteInboxMessage.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/messages` | GET | AdminGetInboxMessages | [AdminGetInboxMessages](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminGetInboxMessages.java) | [AdminGetInboxMessages](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminGetInboxMessages.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/messages` | POST | AdminSaveInboxMessage | [AdminSaveInboxMessage](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminSaveInboxMessage.java) | [AdminSaveInboxMessage](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminSaveInboxMessage.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/messages/{inbox}/unsend` | POST | AdminUnsendInboxMessage | [AdminUnsendInboxMessage](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminUnsendInboxMessage.java) | [AdminUnsendInboxMessage](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminUnsendInboxMessage.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/messages/{inbox}/users` | GET | AdminGetInboxUsers | [AdminGetInboxUsers](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminGetInboxUsers.java) | [AdminGetInboxUsers](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminGetInboxUsers.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/messages/{messageId}` | PATCH | AdminUpdateInboxMessage | [AdminUpdateInboxMessage](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminUpdateInboxMessage.java) | [AdminUpdateInboxMessage](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminUpdateInboxMessage.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/messages/{messageId}/send` | POST | AdminSendInboxMessage | [AdminSendInboxMessage](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminSendInboxMessage.java) | [AdminSendInboxMessage](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminSendInboxMessage.java) |
| `/chat/v1/admin/inbox/namespaces/{namespace}/stats` | GET | AdminGetInboxStats | [AdminGetInboxStats](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/inbox/AdminGetInboxStats.java) | [AdminGetInboxStats](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/inbox/AdminGetInboxStats.java) |

### moderation Wrapper:  [Moderation](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/wrappers/Moderation.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/chat/v1/admin/namespaces/{namespace}/snapshot/{chatId}` | GET | AdminGetChatSnapshot | [AdminGetChatSnapshot](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/moderation/AdminGetChatSnapshot.java) | [AdminGetChatSnapshot](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/moderation/AdminGetChatSnapshot.java) |
| `/chat/v1/admin/namespaces/{namespace}/snapshot/{chatId}` | DELETE | AdminDeleteChatSnapshot | [AdminDeleteChatSnapshot](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/moderation/AdminDeleteChatSnapshot.java) | [AdminDeleteChatSnapshot](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/moderation/AdminDeleteChatSnapshot.java) |
| `/chat/v1/public/namespaces/{namespace}/topic/{topic}/snapshot/{chatId}` | GET | PublicGetChatSnapshot | [PublicGetChatSnapshot](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/moderation/PublicGetChatSnapshot.java) | [PublicGetChatSnapshot](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/moderation/PublicGetChatSnapshot.java) |

### profanity Wrapper:  [Profanity](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/wrappers/Profanity.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/chat/v1/admin/profanity/namespaces/{namespace}/dictionary` | GET | AdminProfanityQuery | [AdminProfanityQuery](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/profanity/AdminProfanityQuery.java) | [AdminProfanityQuery](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/profanity/AdminProfanityQuery.java) |
| `/chat/v1/admin/profanity/namespaces/{namespace}/dictionary` | POST | AdminProfanityCreate | [AdminProfanityCreate](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/profanity/AdminProfanityCreate.java) | [AdminProfanityCreate](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/profanity/AdminProfanityCreate.java) |
| `/chat/v1/admin/profanity/namespaces/{namespace}/dictionary/bulk` | POST | AdminProfanityCreateBulk | [AdminProfanityCreateBulk](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/profanity/AdminProfanityCreateBulk.java) | [AdminProfanityCreateBulk](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/profanity/AdminProfanityCreateBulk.java) |
| `/chat/v1/admin/profanity/namespaces/{namespace}/dictionary/export` | GET | AdminProfanityExport | [AdminProfanityExport](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/profanity/AdminProfanityExport.java) | [AdminProfanityExport](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/profanity/AdminProfanityExport.java) |
| `/chat/v1/admin/profanity/namespaces/{namespace}/dictionary/group` | GET | AdminProfanityGroup | [AdminProfanityGroup](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/profanity/AdminProfanityGroup.java) | [AdminProfanityGroup](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/profanity/AdminProfanityGroup.java) |
| `/chat/v1/admin/profanity/namespaces/{namespace}/dictionary/import` | POST | AdminProfanityImport | [AdminProfanityImport](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/profanity/AdminProfanityImport.java) | [AdminProfanityImport](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/profanity/AdminProfanityImport.java) |
| `/chat/v1/admin/profanity/namespaces/{namespace}/dictionary/{id}` | PUT | AdminProfanityUpdate | [AdminProfanityUpdate](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/profanity/AdminProfanityUpdate.java) | [AdminProfanityUpdate](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/profanity/AdminProfanityUpdate.java) |
| `/chat/v1/admin/profanity/namespaces/{namespace}/dictionary/{id}` | DELETE | AdminProfanityDelete | [AdminProfanityDelete](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/profanity/AdminProfanityDelete.java) | [AdminProfanityDelete](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/profanity/AdminProfanityDelete.java) |

### Operations Wrapper:  [Operations](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/wrappers/Operations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/chat/v1/messages` | GET | PublicGetMessages | [PublicGetMessages](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/operations/operations/PublicGetMessages.java) | [PublicGetMessages](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/chat/operations/PublicGetMessages.java) |


&nbsp;

## Models

| Model | Class |
|---|---|
| `api.AddMemberParams` | [ApiAddMemberParams](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ApiAddMemberParams.java) |
| `api.CreateNamespaceTopicParams` | [ApiCreateNamespaceTopicParams](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ApiCreateNamespaceTopicParams.java) |
| `api.CreateTopicParams` | [ApiCreateTopicParams](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ApiCreateTopicParams.java) |
| `api.CreateTopicResponse` | [ApiCreateTopicResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ApiCreateTopicResponse.java) |
| `api.MuteUserRequest` | [ApiMuteUserRequest](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ApiMuteUserRequest.java) |
| `api.MutedTopicResponse` | [ApiMutedTopicResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ApiMutedTopicResponse.java) |
| `api.SendChatParams` | [ApiSendChatParams](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ApiSendChatParams.java) |
| `api.UnmuteUserRequest` | [ApiUnmuteUserRequest](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ApiUnmuteUserRequest.java) |
| `api.UpdateTopicParams` | [ApiUpdateTopicParams](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ApiUpdateTopicParams.java) |
| `log.AppMessageDeclaration` | [LogAppMessageDeclaration](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/LogAppMessageDeclaration.java) |
| `logconfig.Configuration` | [LogconfigConfiguration](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/LogconfigConfiguration.java) |
| `message.ActionAddUserToTopicResult` | [MessageActionAddUserToTopicResult](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/MessageActionAddUserToTopicResult.java) |
| `message.ActionDeleteTopicResult` | [MessageActionDeleteTopicResult](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/MessageActionDeleteTopicResult.java) |
| `models.AddInboxCategoryRequest` | [ModelsAddInboxCategoryRequest](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsAddInboxCategoryRequest.java) |
| `models.AddInboxCategoryResponse` | [ModelsAddInboxCategoryResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsAddInboxCategoryResponse.java) |
| `models.BanTopicMemberParam` | [ModelsBanTopicMemberParam](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsBanTopicMemberParam.java) |
| `models.BanTopicMemberResult` | [ModelsBanTopicMemberResult](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsBanTopicMemberResult.java) |
| `models.CategoryHook` | [ModelsCategoryHook](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsCategoryHook.java) |
| `models.ChannelTopicResponse` | [ModelsChannelTopicResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsChannelTopicResponse.java) |
| `models.ChannelTopicSummaryResponse` | [ModelsChannelTopicSummaryResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsChannelTopicSummaryResponse.java) |
| `models.ChannelTopicWithPaginationResponse` | [ModelsChannelTopicWithPaginationResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsChannelTopicWithPaginationResponse.java) |
| `models.ChatMessageResponse` | [ModelsChatMessageResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsChatMessageResponse.java) |
| `models.ChatMessageWithPaginationResponse` | [ModelsChatMessageWithPaginationResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsChatMessageWithPaginationResponse.java) |
| `models.ChatSnapshotMessage` | [ModelsChatSnapshotMessage](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsChatSnapshotMessage.java) |
| `models.ChatSnapshots` | [ModelsChatSnapshots](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsChatSnapshots.java) |
| `models.Config` | [ModelsConfig](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsConfig.java) |
| `models.ConfigExport` | [ModelsConfigExport](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsConfigExport.java) |
| `models.ConfigList` | [ModelsConfigList](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsConfigList.java) |
| `models.ConfigResponse` | [ModelsConfigResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsConfigResponse.java) |
| `models.Dictionary` | [ModelsDictionary](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionary.java) |
| `models.DictionaryChild` | [ModelsDictionaryChild](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryChild.java) |
| `models.DictionaryExport` | [ModelsDictionaryExport](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryExport.java) |
| `models.DictionaryExportItem` | [ModelsDictionaryExportItem](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryExportItem.java) |
| `models.DictionaryGroup` | [ModelsDictionaryGroup](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryGroup.java) |
| `models.DictionaryImportResult` | [ModelsDictionaryImportResult](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryImportResult.java) |
| `models.DictionaryInsertBulkRequest` | [ModelsDictionaryInsertBulkRequest](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryInsertBulkRequest.java) |
| `models.DictionaryInsertRequest` | [ModelsDictionaryInsertRequest](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryInsertRequest.java) |
| `models.DictionaryQueryResult` | [ModelsDictionaryQueryResult](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryQueryResult.java) |
| `models.DictionaryUpdateRequest` | [ModelsDictionaryUpdateRequest](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryUpdateRequest.java) |
| `models.DictionaryWithChildren` | [ModelsDictionaryWithChildren](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryWithChildren.java) |
| `models.DictionaryWordChanges` | [ModelsDictionaryWordChanges](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsDictionaryWordChanges.java) |
| `models.GetInboxCategoriesResponseItem` | [ModelsGetInboxCategoriesResponseItem](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsGetInboxCategoriesResponseItem.java) |
| `models.GetInboxMessagesResponse` | [ModelsGetInboxMessagesResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsGetInboxMessagesResponse.java) |
| `models.GetInboxMessagesResponseData` | [ModelsGetInboxMessagesResponseData](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsGetInboxMessagesResponseData.java) |
| `models.GetInboxStatsResponse` | [ModelsGetInboxStatsResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsGetInboxStatsResponse.java) |
| `models.GetInboxUsersResponse` | [ModelsGetInboxUsersResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsGetInboxUsersResponse.java) |
| `models.ImportConfigResponse` | [ModelsImportConfigResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsImportConfigResponse.java) |
| `models.JSONSchemaType` | [ModelsJSONSchemaType](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsJSONSchemaType.java) |
| `models.MessageRequest` | [ModelsMessageRequest](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsMessageRequest.java) |
| `models.MessageResultWithAttributes` | [ModelsMessageResultWithAttributes](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsMessageResultWithAttributes.java) |
| `models.MessageStats` | [ModelsMessageStats](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsMessageStats.java) |
| `models.Pagination` | [ModelsPagination](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsPagination.java) |
| `models.PublicBanTopicMembersRequest` | [ModelsPublicBanTopicMembersRequest](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsPublicBanTopicMembersRequest.java) |
| `models.PublicBanTopicMembersResponse` | [ModelsPublicBanTopicMembersResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsPublicBanTopicMembersResponse.java) |
| `models.PublicConfigResponse` | [ModelsPublicConfigResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsPublicConfigResponse.java) |
| `models.PublicUnbanTopicMembersRequest` | [ModelsPublicUnbanTopicMembersRequest](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsPublicUnbanTopicMembersRequest.java) |
| `models.PublicUnbanTopicMembersResponse` | [ModelsPublicUnbanTopicMembersResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsPublicUnbanTopicMembersResponse.java) |
| `models.SaveInboxMessageRequest` | [ModelsSaveInboxMessageRequest](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsSaveInboxMessageRequest.java) |
| `models.SaveInboxMessageResponse` | [ModelsSaveInboxMessageResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsSaveInboxMessageResponse.java) |
| `models.SendInboxMessageRequest` | [ModelsSendInboxMessageRequest](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsSendInboxMessageRequest.java) |
| `models.SendInboxMessageResponse` | [ModelsSendInboxMessageResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsSendInboxMessageResponse.java) |
| `models.TopicInfo` | [ModelsTopicInfo](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsTopicInfo.java) |
| `models.TopicLogItem` | [ModelsTopicLogItem](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsTopicLogItem.java) |
| `models.TopicLogWithPaginationResponse` | [ModelsTopicLogWithPaginationResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsTopicLogWithPaginationResponse.java) |
| `models.TopicMemberResponse` | [ModelsTopicMemberResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsTopicMemberResponse.java) |
| `models.TopicMemberWithPaginationResponse` | [ModelsTopicMemberWithPaginationResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsTopicMemberWithPaginationResponse.java) |
| `models.TopicResponse` | [ModelsTopicResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsTopicResponse.java) |
| `models.UnbanTopicMemberParam` | [ModelsUnbanTopicMemberParam](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsUnbanTopicMemberParam.java) |
| `models.UnbanTopicMemberResult` | [ModelsUnbanTopicMemberResult](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsUnbanTopicMemberResult.java) |
| `models.UnsendInboxMessageRequest` | [ModelsUnsendInboxMessageRequest](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsUnsendInboxMessageRequest.java) |
| `models.UnsendInboxMessageResponse` | [ModelsUnsendInboxMessageResponse](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsUnsendInboxMessageResponse.java) |
| `models.UpdateInboxCategoryRequest` | [ModelsUpdateInboxCategoryRequest](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsUpdateInboxCategoryRequest.java) |
| `models.UpdateInboxMessageRequest` | [ModelsUpdateInboxMessageRequest](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsUpdateInboxMessageRequest.java) |
| `models.UserInbox` | [ModelsUserInbox](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ModelsUserInbox.java) |
| `response.Error` | [ResponseError](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/ResponseError.java) |
| `restapi.ErrorResponseBody` | [RestapiErrorResponseBody](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/RestapiErrorResponseBody.java) |
| `topic.InfoMember` | [TopicInfoMember](../../module-chat/src/main/java/net/accelbyte/sdk/api/chat/models/TopicInfoMember.java) |
