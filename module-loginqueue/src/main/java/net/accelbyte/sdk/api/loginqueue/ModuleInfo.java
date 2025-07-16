package net.accelbyte.sdk.api.loginqueue;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-loginqueue";
  }

  @Override
  public String getVersion() {
    return "0.2.0";
  }
}
