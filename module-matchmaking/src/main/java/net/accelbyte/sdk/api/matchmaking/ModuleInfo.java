package net.accelbyte.sdk.api.matchmaking;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-matchmaking";
  }

  @Override
  public String getVersion() {
    return "0.1.0";
  }
}
