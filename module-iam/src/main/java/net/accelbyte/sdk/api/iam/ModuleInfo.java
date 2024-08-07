package net.accelbyte.sdk.api.iam;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-iam";
  }

  @Override
  public String getVersion() {
    return "0.9.0";
  }
}
