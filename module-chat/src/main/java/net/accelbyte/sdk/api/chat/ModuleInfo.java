package net.accelbyte.sdk.api.chat;

import net.accelbyte.sdk.core.BaseModuleInfo;

public class ModuleInfo implements BaseModuleInfo {
  @Override
  public String getModuleName() {
    return "module-chat";
  }

  @Override
  public String getVersion() {
    return "0.14.0";
  }
}
