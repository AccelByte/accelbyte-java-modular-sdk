package net.accelbyte.sdk.api.qosm;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-qosm";
  }

  @Override
  public String getVersion() {
    return "0.3.0";
  }
}
