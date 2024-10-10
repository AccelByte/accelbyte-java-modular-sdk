package net.accelbyte.sdk.api.inventory;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-inventory";
  }

  @Override
  public String getVersion() {
    return "0.8.0";
  }
}
