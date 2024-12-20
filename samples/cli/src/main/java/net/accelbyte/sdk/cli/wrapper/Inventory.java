/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */

package net.accelbyte.sdk.cli.wrapper;

import net.accelbyte.sdk.cli.api.inventory.admin_chaining_operations.*;
import net.accelbyte.sdk.cli.api.inventory.admin_integration_configurations.*;
import net.accelbyte.sdk.cli.api.inventory.admin_inventories.*;
import net.accelbyte.sdk.cli.api.inventory.admin_items.*;
import net.accelbyte.sdk.cli.api.inventory.admin_inventory_configurations.*;
import net.accelbyte.sdk.cli.api.inventory.admin_item_types.*;
import net.accelbyte.sdk.cli.api.inventory.admin_tags.*;
import net.accelbyte.sdk.cli.api.inventory.public_inventory_configurations.*;
import net.accelbyte.sdk.cli.api.inventory.public_item_types.*;
import net.accelbyte.sdk.cli.api.inventory.public_tags.*;
import net.accelbyte.sdk.cli.api.inventory.public_inventories.*;
import net.accelbyte.sdk.cli.api.inventory.public_items.*;

import picocli.CommandLine.Command;

@Command(name = "inventory",
        mixinStandardHelpOptions = true,
        subcommands = {
                AdminCreateChainingOperations.class,
                AdminListIntegrationConfigurations.class,
                AdminCreateIntegrationConfiguration.class,
                AdminUpdateIntegrationConfiguration.class,
                AdminUpdateStatusIntegrationConfiguration.class,
                AdminListInventories.class,
                AdminCreateInventory.class,
                AdminGetInventory.class,
                AdminUpdateInventory.class,
                DeleteInventory.class,
                AdminListItems.class,
                AdminGetInventoryItem.class,
                AdminListInventoryConfigurations.class,
                AdminCreateInventoryConfiguration.class,
                AdminGetInventoryConfiguration.class,
                AdminUpdateInventoryConfiguration.class,
                AdminDeleteInventoryConfiguration.class,
                AdminListItemTypes.class,
                AdminCreateItemType.class,
                AdminDeleteItemType.class,
                AdminListTags.class,
                AdminCreateTag.class,
                AdminDeleteTag.class,
                AdminConsumeUserItem.class,
                AdminBulkUpdateMyItems.class,
                AdminSaveItemToInventory.class,
                AdminBulkRemoveItems.class,
                AdminBulkSaveItemToInventory.class,
                AdminUpdateUserInventoriesByInventoryCode.class,
                AdminSaveItem.class,
                AdminBulkSaveItem.class,
                AdminSyncUserEntitlements.class,
                AdminPurchasable.class,
                PublicListInventoryConfigurations.class,
                PublicListItemTypes.class,
                PublicListTags.class,
                PublicListInventories.class,
                PublicConsumeMyItem.class,
                PublicListItems.class,
                PublicBulkUpdateMyItems.class,
                PublicBulkRemoveMyItems.class,
                PublicMoveMyItems.class,
                PublicGetItem.class,
        }
)
public class Inventory implements Runnable {

    @Override
    public void run() {

    }
}