package net.accelbyte.sdk.api.reporting;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-reporting";
  }

  @Override
  public String getVersion() {
    return "0.1.0";
  }
}
