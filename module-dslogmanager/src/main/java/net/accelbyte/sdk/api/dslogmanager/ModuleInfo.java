package net.accelbyte.sdk.api.dslogmanager;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-dslogmanager";
  }

  @Override
  public String getVersion() {
    return "0.33.0";
  }
}
