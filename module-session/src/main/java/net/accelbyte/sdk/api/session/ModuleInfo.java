package net.accelbyte.sdk.api.session;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-session";
  }

  @Override
  public String getVersion() {
    return "0.17.0";
  }
}
