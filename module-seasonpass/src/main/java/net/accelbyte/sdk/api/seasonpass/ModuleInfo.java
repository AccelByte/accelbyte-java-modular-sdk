package net.accelbyte.sdk.api.seasonpass;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-seasonpass";
  }

  @Override
  public String getVersion() {
    return "0.5.0";
  }
}
