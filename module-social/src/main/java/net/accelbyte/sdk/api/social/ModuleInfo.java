package net.accelbyte.sdk.api.social;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-social";
  }

  @Override
  public String getVersion() {
    return "0.12.0";
  }
}
