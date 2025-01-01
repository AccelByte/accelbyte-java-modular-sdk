package net.accelbyte.sdk.api.group;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-group";
  }

  @Override
  public String getVersion() {
    return "0.6.0";
  }
}
