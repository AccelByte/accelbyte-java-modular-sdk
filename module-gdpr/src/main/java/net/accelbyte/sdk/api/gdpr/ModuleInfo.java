package net.accelbyte.sdk.api.gdpr;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-gdpr";
  }

  @Override
  public String getVersion() {
    return "0.11.0";
  }
}
