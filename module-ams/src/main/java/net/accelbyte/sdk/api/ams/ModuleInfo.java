package net.accelbyte.sdk.api.ams;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-ams";
  }

  @Override
  public String getVersion() {
    return "0.8.0";
  }
}
