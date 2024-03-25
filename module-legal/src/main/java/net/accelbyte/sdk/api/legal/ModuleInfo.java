package net.accelbyte.sdk.api.legal;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-legal";
  }

  @Override
  public String getVersion() {
    return "0.2.0";
  }
}
