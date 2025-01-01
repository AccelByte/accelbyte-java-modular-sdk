package net.accelbyte.sdk.api.cloudsave;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-cloudsave";
  }

  @Override
  public String getVersion() {
    return "0.9.0";
  }
}
