package net.accelbyte.sdk.api.challenge;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-challenge";
  }

  @Override
  public String getVersion() {
    return "0.10.0";
  }
}
