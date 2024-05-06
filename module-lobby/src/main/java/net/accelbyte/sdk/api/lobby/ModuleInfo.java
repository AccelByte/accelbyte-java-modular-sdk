package net.accelbyte.sdk.api.lobby;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-lobby";
  }

  @Override
  public String getVersion() {
    return "0.5.0";
  }
}
