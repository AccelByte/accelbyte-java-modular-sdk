package net.accelbyte.sdk.api.platform;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-platform";
  }

  @Override
  public String getVersion() {
    return "0.18.0";
  }
}
