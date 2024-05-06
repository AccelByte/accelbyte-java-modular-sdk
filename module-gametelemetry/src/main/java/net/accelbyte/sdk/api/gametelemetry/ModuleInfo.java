package net.accelbyte.sdk.api.gametelemetry;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-gametelemetry";
  }

  @Override
  public String getVersion() {
    return "0.4.0";
  }
}
