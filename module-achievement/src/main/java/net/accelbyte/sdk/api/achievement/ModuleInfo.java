package net.accelbyte.sdk.api.achievement;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-achievement";
  }

  @Override
  public String getVersion() {
    return "0.10.0";
  }
}
