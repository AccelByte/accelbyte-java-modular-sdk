package net.accelbyte.sdk.api.sessionhistory;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-sessionhistory";
  }

  @Override
  public String getVersion() {
    return "0.2.0";
  }
}
