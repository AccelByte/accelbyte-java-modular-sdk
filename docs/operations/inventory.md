[//]: # (Code generated. DO NOT EDIT.)

# Inventory Service Index

&nbsp;

## Operations

### Admin Chaining Operations Wrapper:  [AdminChainingOperations](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/wrappers/AdminChainingOperations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/admin/namespaces/{namespace}/chainingOperations` | POST | AdminCreateChainingOperations | [AdminCreateChainingOperations](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_chaining_operations/AdminCreateChainingOperations.java) | [AdminCreateChainingOperations](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_chaining_operations/AdminCreateChainingOperations.java) |

### Admin Integration Configurations Wrapper:  [AdminIntegrationConfigurations](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/wrappers/AdminIntegrationConfigurations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/admin/namespaces/{namespace}/integrationConfigurations` | GET | AdminListIntegrationConfigurations | [AdminListIntegrationConfigurations](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_integration_configurations/AdminListIntegrationConfigurations.java) | [AdminListIntegrationConfigurations](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_integration_configurations/AdminListIntegrationConfigurations.java) |
| `/inventory/v1/admin/namespaces/{namespace}/integrationConfigurations` | POST | AdminCreateIntegrationConfiguration | [AdminCreateIntegrationConfiguration](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_integration_configurations/AdminCreateIntegrationConfiguration.java) | [AdminCreateIntegrationConfiguration](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_integration_configurations/AdminCreateIntegrationConfiguration.java) |
| `/inventory/v1/admin/namespaces/{namespace}/integrationConfigurations/{integrationConfigurationId}` | PUT | AdminUpdateIntegrationConfiguration | [AdminUpdateIntegrationConfiguration](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_integration_configurations/AdminUpdateIntegrationConfiguration.java) | [AdminUpdateIntegrationConfiguration](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_integration_configurations/AdminUpdateIntegrationConfiguration.java) |
| `/inventory/v1/admin/namespaces/{namespace}/integrationConfigurations/{integrationConfigurationId}/status` | PUT | AdminUpdateStatusIntegrationConfiguration | [AdminUpdateStatusIntegrationConfiguration](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_integration_configurations/AdminUpdateStatusIntegrationConfiguration.java) | [AdminUpdateStatusIntegrationConfiguration](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_integration_configurations/AdminUpdateStatusIntegrationConfiguration.java) |

### Admin Inventories Wrapper:  [AdminInventories](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/wrappers/AdminInventories.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/admin/namespaces/{namespace}/inventories` | GET | AdminListInventories | [AdminListInventories](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventories/AdminListInventories.java) | [AdminListInventories](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventories/AdminListInventories.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventories` | POST | AdminCreateInventory | [AdminCreateInventory](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventories/AdminCreateInventory.java) | [AdminCreateInventory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventories/AdminCreateInventory.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventories/{inventoryId}` | GET | AdminGetInventory | [AdminGetInventory](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventories/AdminGetInventory.java) | [AdminGetInventory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventories/AdminGetInventory.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventories/{inventoryId}` | PUT | AdminUpdateInventory | [AdminUpdateInventory](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventories/AdminUpdateInventory.java) | [AdminUpdateInventory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventories/AdminUpdateInventory.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventories/{inventoryId}` | DELETE | DeleteInventory | [DeleteInventory](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventories/DeleteInventory.java) | [DeleteInventory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventories/DeleteInventory.java) |
| `/inventory/v1/admin/namespaces/{namespace}/users/{userId}/inventoryConfigurations/{inventoryConfigurationCode}/inventories` | PUT | AdminUpdateUserInventoriesByInventoryCode | [AdminUpdateUserInventoriesByInventoryCode](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventories/AdminUpdateUserInventoriesByInventoryCode.java) | [AdminUpdateUserInventoriesByInventoryCode](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventories/AdminUpdateUserInventoriesByInventoryCode.java) |
| `/inventory/v1/admin/namespaces/{namespace}/users/{userId}/purchaseable` | POST | AdminPurchasable | [AdminPurchasable](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventories/AdminPurchasable.java) | [AdminPurchasable](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventories/AdminPurchasable.java) |

### Admin Items Wrapper:  [AdminItems](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/wrappers/AdminItems.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/admin/namespaces/{namespace}/inventories/{inventoryId}/items` | GET | AdminListItems | [AdminListItems](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminListItems.java) | [AdminListItems](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminListItems.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventories/{inventoryId}/slots/{slotId}/sourceItems/{sourceItemId}` | GET | AdminGetInventoryItem | [AdminGetInventoryItem](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminGetInventoryItem.java) | [AdminGetInventoryItem](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminGetInventoryItem.java) |
| `/inventory/v1/admin/namespaces/{namespace}/users/{userId}/inventories/{inventoryId}/consume` | POST | AdminConsumeUserItem | [AdminConsumeUserItem](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminConsumeUserItem.java) | [AdminConsumeUserItem](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminConsumeUserItem.java) |
| `/inventory/v1/admin/namespaces/{namespace}/users/{userId}/inventories/{inventoryId}/items` | PUT | AdminBulkUpdateMyItems | [AdminBulkUpdateMyItems](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminBulkUpdateMyItems.java) | [AdminBulkUpdateMyItems](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminBulkUpdateMyItems.java) |
| `/inventory/v1/admin/namespaces/{namespace}/users/{userId}/inventories/{inventoryId}/items` | POST | AdminSaveItemToInventory | [AdminSaveItemToInventory](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminSaveItemToInventory.java) | [AdminSaveItemToInventory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminSaveItemToInventory.java) |
| `/inventory/v1/admin/namespaces/{namespace}/users/{userId}/inventories/{inventoryId}/items` | DELETE | AdminBulkRemoveItems | [AdminBulkRemoveItems](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminBulkRemoveItems.java) | [AdminBulkRemoveItems](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminBulkRemoveItems.java) |
| `/inventory/v1/admin/namespaces/{namespace}/users/{userId}/inventories/{inventoryId}/items/bulk` | POST | AdminBulkSaveItemToInventory | [AdminBulkSaveItemToInventory](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminBulkSaveItemToInventory.java) | [AdminBulkSaveItemToInventory](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminBulkSaveItemToInventory.java) |
| `/inventory/v1/admin/namespaces/{namespace}/users/{userId}/items` | POST | AdminSaveItem | [AdminSaveItem](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminSaveItem.java) | [AdminSaveItem](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminSaveItem.java) |
| `/inventory/v1/admin/namespaces/{namespace}/users/{userId}/items/bulk` | POST | AdminBulkSaveItem | [AdminBulkSaveItem](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminBulkSaveItem.java) | [AdminBulkSaveItem](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminBulkSaveItem.java) |
| `/inventory/v1/admin/namespaces/{namespace}/users/{userId}/items/entitlements/sync` | PUT | AdminSyncUserEntitlements | [AdminSyncUserEntitlements](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_items/AdminSyncUserEntitlements.java) | [AdminSyncUserEntitlements](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_items/AdminSyncUserEntitlements.java) |

### Admin Inventory Configurations Wrapper:  [AdminInventoryConfigurations](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/wrappers/AdminInventoryConfigurations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/admin/namespaces/{namespace}/inventoryConfigurations` | GET | AdminListInventoryConfigurations | [AdminListInventoryConfigurations](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventory_configurations/AdminListInventoryConfigurations.java) | [AdminListInventoryConfigurations](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventory_configurations/AdminListInventoryConfigurations.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventoryConfigurations` | POST | AdminCreateInventoryConfiguration | [AdminCreateInventoryConfiguration](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventory_configurations/AdminCreateInventoryConfiguration.java) | [AdminCreateInventoryConfiguration](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventory_configurations/AdminCreateInventoryConfiguration.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventoryConfigurations/{inventoryConfigurationId}` | GET | AdminGetInventoryConfiguration | [AdminGetInventoryConfiguration](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventory_configurations/AdminGetInventoryConfiguration.java) | [AdminGetInventoryConfiguration](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventory_configurations/AdminGetInventoryConfiguration.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventoryConfigurations/{inventoryConfigurationId}` | PUT | AdminUpdateInventoryConfiguration | [AdminUpdateInventoryConfiguration](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventory_configurations/AdminUpdateInventoryConfiguration.java) | [AdminUpdateInventoryConfiguration](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventory_configurations/AdminUpdateInventoryConfiguration.java) |
| `/inventory/v1/admin/namespaces/{namespace}/inventoryConfigurations/{inventoryConfigurationId}` | DELETE | AdminDeleteInventoryConfiguration | [AdminDeleteInventoryConfiguration](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_inventory_configurations/AdminDeleteInventoryConfiguration.java) | [AdminDeleteInventoryConfiguration](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_inventory_configurations/AdminDeleteInventoryConfiguration.java) |

### Admin Item Types Wrapper:  [AdminItemTypes](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/wrappers/AdminItemTypes.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/admin/namespaces/{namespace}/itemtypes` | GET | AdminListItemTypes | [AdminListItemTypes](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_item_types/AdminListItemTypes.java) | [AdminListItemTypes](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_item_types/AdminListItemTypes.java) |
| `/inventory/v1/admin/namespaces/{namespace}/itemtypes` | POST | AdminCreateItemType | [AdminCreateItemType](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_item_types/AdminCreateItemType.java) | [AdminCreateItemType](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_item_types/AdminCreateItemType.java) |
| `/inventory/v1/admin/namespaces/{namespace}/itemtypes/{itemTypeName}` | DELETE | AdminDeleteItemType | [AdminDeleteItemType](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_item_types/AdminDeleteItemType.java) | [AdminDeleteItemType](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_item_types/AdminDeleteItemType.java) |

### Admin Tags Wrapper:  [AdminTags](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/wrappers/AdminTags.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/admin/namespaces/{namespace}/tags` | GET | AdminListTags | [AdminListTags](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_tags/AdminListTags.java) | [AdminListTags](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_tags/AdminListTags.java) |
| `/inventory/v1/admin/namespaces/{namespace}/tags` | POST | AdminCreateTag | [AdminCreateTag](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_tags/AdminCreateTag.java) | [AdminCreateTag](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_tags/AdminCreateTag.java) |
| `/inventory/v1/admin/namespaces/{namespace}/tags/{tagName}` | DELETE | AdminDeleteTag | [AdminDeleteTag](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/admin_tags/AdminDeleteTag.java) | [AdminDeleteTag](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/admin_tags/AdminDeleteTag.java) |

### Public Inventory Configurations Wrapper:  [PublicInventoryConfigurations](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/wrappers/PublicInventoryConfigurations.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/public/namespaces/{namespace}/inventoryConfigurations` | GET | PublicListInventoryConfigurations | [PublicListInventoryConfigurations](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/public_inventory_configurations/PublicListInventoryConfigurations.java) | [PublicListInventoryConfigurations](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_inventory_configurations/PublicListInventoryConfigurations.java) |

### Public Item Types Wrapper:  [PublicItemTypes](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/wrappers/PublicItemTypes.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/public/namespaces/{namespace}/itemtypes` | GET | PublicListItemTypes | [PublicListItemTypes](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/public_item_types/PublicListItemTypes.java) | [PublicListItemTypes](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_item_types/PublicListItemTypes.java) |

### Public Tags Wrapper:  [PublicTags](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/wrappers/PublicTags.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/public/namespaces/{namespace}/tags` | GET | PublicListTags | [PublicListTags](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/public_tags/PublicListTags.java) | [PublicListTags](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_tags/PublicListTags.java) |

### Public Inventories Wrapper:  [PublicInventories](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/wrappers/PublicInventories.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/public/namespaces/{namespace}/users/me/inventories` | GET | PublicListInventories | [PublicListInventories](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/public_inventories/PublicListInventories.java) | [PublicListInventories](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_inventories/PublicListInventories.java) |

### Public Items Wrapper:  [PublicItems](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/wrappers/PublicItems.java)
| Endpoint | Method | ID | Class | Example |
|---|---|---|---|---|
| `/inventory/v1/public/namespaces/{namespace}/users/me/inventories/{inventoryId}/consume` | POST | PublicConsumeMyItem | [PublicConsumeMyItem](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/public_items/PublicConsumeMyItem.java) | [PublicConsumeMyItem](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_items/PublicConsumeMyItem.java) |
| `/inventory/v1/public/namespaces/{namespace}/users/me/inventories/{inventoryId}/items` | GET | PublicListItems | [PublicListItems](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/public_items/PublicListItems.java) | [PublicListItems](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_items/PublicListItems.java) |
| `/inventory/v1/public/namespaces/{namespace}/users/me/inventories/{inventoryId}/items` | PUT | PublicBulkUpdateMyItems | [PublicBulkUpdateMyItems](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/public_items/PublicBulkUpdateMyItems.java) | [PublicBulkUpdateMyItems](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_items/PublicBulkUpdateMyItems.java) |
| `/inventory/v1/public/namespaces/{namespace}/users/me/inventories/{inventoryId}/items` | DELETE | PublicBulkRemoveMyItems | [PublicBulkRemoveMyItems](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/public_items/PublicBulkRemoveMyItems.java) | [PublicBulkRemoveMyItems](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_items/PublicBulkRemoveMyItems.java) |
| `/inventory/v1/public/namespaces/{namespace}/users/me/inventories/{inventoryId}/items/movement` | POST | PublicMoveMyItems | [PublicMoveMyItems](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/public_items/PublicMoveMyItems.java) | [PublicMoveMyItems](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_items/PublicMoveMyItems.java) |
| `/inventory/v1/public/namespaces/{namespace}/users/me/inventories/{inventoryId}/slots/{slotId}/sourceItems/{sourceItemId}` | GET | PublicGetItem | [PublicGetItem](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/operations/public_items/PublicGetItem.java) | [PublicGetItem](../../samples/cli/src/main/java/net/accelbyte/sdk/cli/api/inventory/public_items/PublicGetItem.java) |


&nbsp;

## Models

| Model | Class |
|---|---|
| `apimodels.AdminUpdateItemReq` | [ApimodelsAdminUpdateItemReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsAdminUpdateItemReq.java) |
| `apimodels.BulkSaveItemError` | [ApimodelsBulkSaveItemError](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsBulkSaveItemError.java) |
| `apimodels.BulkSaveItemResp` | [ApimodelsBulkSaveItemResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsBulkSaveItemResp.java) |
| `apimodels.ChainingOperationReq` | [ApimodelsChainingOperationReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsChainingOperationReq.java) |
| `apimodels.ChainingOperationResp` | [ApimodelsChainingOperationResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsChainingOperationResp.java) |
| `apimodels.ConsumeItem` | [ApimodelsConsumeItem](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsConsumeItem.java) |
| `apimodels.ConsumeItemReq` | [ApimodelsConsumeItemReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsConsumeItemReq.java) |
| `apimodels.CreateIntegrationConfigurationReq` | [ApimodelsCreateIntegrationConfigurationReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsCreateIntegrationConfigurationReq.java) |
| `apimodels.CreateInventoryConfigurationReq` | [ApimodelsCreateInventoryConfigurationReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsCreateInventoryConfigurationReq.java) |
| `apimodels.CreateInventoryReq` | [ApimodelsCreateInventoryReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsCreateInventoryReq.java) |
| `apimodels.CreateItem` | [ApimodelsCreateItem](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsCreateItem.java) |
| `apimodels.CreateItemTypeReq` | [ApimodelsCreateItemTypeReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsCreateItemTypeReq.java) |
| `apimodels.CreateItemTypeResp` | [ApimodelsCreateItemTypeResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsCreateItemTypeResp.java) |
| `apimodels.CreateTagReq` | [ApimodelsCreateTagReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsCreateTagReq.java) |
| `apimodels.CreateTagResp` | [ApimodelsCreateTagResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsCreateTagResp.java) |
| `apimodels.DeleteInventoryReq` | [ApimodelsDeleteInventoryReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsDeleteInventoryReq.java) |
| `apimodels.ErrorResponse` | [ApimodelsErrorResponse](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsErrorResponse.java) |
| `apimodels.IntegrationConfigurationResp` | [ApimodelsIntegrationConfigurationResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsIntegrationConfigurationResp.java) |
| `apimodels.InventoryConfig` | [ApimodelsInventoryConfig](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsInventoryConfig.java) |
| `apimodels.InventoryConfigurationReq` | [ApimodelsInventoryConfigurationReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsInventoryConfigurationReq.java) |
| `apimodels.InventoryConfigurationResp` | [ApimodelsInventoryConfigurationResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsInventoryConfigurationResp.java) |
| `apimodels.InventoryResp` | [ApimodelsInventoryResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsInventoryResp.java) |
| `apimodels.ItemResp` | [ApimodelsItemResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsItemResp.java) |
| `apimodels.ListIntegrationConfigurationsResp` | [ApimodelsListIntegrationConfigurationsResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsListIntegrationConfigurationsResp.java) |
| `apimodels.ListInventoryConfigurationsResp` | [ApimodelsListInventoryConfigurationsResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsListInventoryConfigurationsResp.java) |
| `apimodels.ListInventoryResp` | [ApimodelsListInventoryResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsListInventoryResp.java) |
| `apimodels.ListItemResp` | [ApimodelsListItemResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsListItemResp.java) |
| `apimodels.ListItemTypesResp` | [ApimodelsListItemTypesResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsListItemTypesResp.java) |
| `apimodels.ListTagsResp` | [ApimodelsListTagsResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsListTagsResp.java) |
| `apimodels.MoveItemsReq` | [ApimodelsMoveItemsReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsMoveItemsReq.java) |
| `apimodels.MoveItemsResp` | [ApimodelsMoveItemsResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsMoveItemsResp.java) |
| `apimodels.Operation` | [ApimodelsOperation](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsOperation.java) |
| `apimodels.Paging` | [ApimodelsPaging](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsPaging.java) |
| `apimodels.PurchaseValidationItemReq` | [ApimodelsPurchaseValidationItemReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsPurchaseValidationItemReq.java) |
| `apimodels.PurchaseValidationReq` | [ApimodelsPurchaseValidationReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsPurchaseValidationReq.java) |
| `apimodels.RemoveInventoryItemReq` | [ApimodelsRemoveInventoryItemReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsRemoveInventoryItemReq.java) |
| `apimodels.RemoveItem` | [ApimodelsRemoveItem](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsRemoveItem.java) |
| `apimodels.SaveItemReq` | [ApimodelsSaveItemReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsSaveItemReq.java) |
| `apimodels.SaveItemToInventoryReq` | [ApimodelsSaveItemToInventoryReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsSaveItemToInventoryReq.java) |
| `apimodels.TradeItem` | [ApimodelsTradeItem](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsTradeItem.java) |
| `apimodels.TradeItemResp` | [ApimodelsTradeItemResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsTradeItemResp.java) |
| `apimodels.UpdateIntegrationConfigurationReq` | [ApimodelsUpdateIntegrationConfigurationReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsUpdateIntegrationConfigurationReq.java) |
| `apimodels.UpdateInventoryReq` | [ApimodelsUpdateInventoryReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsUpdateInventoryReq.java) |
| `apimodels.UpdateItem` | [ApimodelsUpdateItem](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsUpdateItem.java) |
| `apimodels.UpdateItemReq` | [ApimodelsUpdateItemReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsUpdateItemReq.java) |
| `apimodels.UpdateItemResp` | [ApimodelsUpdateItemResp](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsUpdateItemResp.java) |
| `apimodels.UpdateStatusIntegrationConfigurationReq` | [ApimodelsUpdateStatusIntegrationConfigurationReq](../../module-inventory/src/main/java/net/accelbyte/sdk/api/inventory/models/ApimodelsUpdateStatusIntegrationConfigurationReq.java) |
