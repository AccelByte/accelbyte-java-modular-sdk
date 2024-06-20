<a name="v0.64.0"></a>
## [v0.64.0] - 2024-06-20

### BREAKING CHANGE


### Inventory
The following models have been updated:
- Model `ApimodelsPurchaseValidationReq` have existing fields now marked as `NON_NULL`:
  - `stackable`

The following operations have been updated:
- Operation `net.accelbyte.sdk.api.inventory.operations.admin_items.AdminListItems` and `net.accelbyte.sdk.api.inventory.operations.public_items.PublicListItems`
  - field `qtyGte` has been removed
  - enum `SortBy` has removed the following enum constants:
    - `Qty`
    - `Qtyasc`
    - `Qtydesc`