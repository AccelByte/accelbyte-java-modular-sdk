package net.accelbyte.sdk.api.dsmc;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-dsmc";
  }

  @Override
  public String getVersion() {
    return "0.2.0";
  }
}
