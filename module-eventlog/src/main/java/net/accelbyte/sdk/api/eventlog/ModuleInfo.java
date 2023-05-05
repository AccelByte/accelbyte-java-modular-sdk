package net.accelbyte.sdk.api.eventlog;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-eventlog";
  }

  @Override
  public String getVersion() {
    return "0.33.0";
  }
}
