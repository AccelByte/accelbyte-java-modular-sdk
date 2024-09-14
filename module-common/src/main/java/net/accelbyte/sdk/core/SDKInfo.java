/*
 * Copyright (c) 2022 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 */

package net.accelbyte.sdk.core;

import java.util.ServiceLoader;
import lombok.Getter;

@Getter
public class SDKInfo {

  private static final SDKInfo instance = new SDKInfo();

  static {
    StringBuilder stringBuilder = new StringBuilder();
    ServiceLoader<BaseModuleInfo> loader = ServiceLoader.load(BaseModuleInfo.class);

    for (BaseModuleInfo moduleInfo : loader) {
      String moduleVersion =
          String.format("%s/%s", moduleInfo.getModuleName(), moduleInfo.getVersion());
      stringBuilder.append(" ").append(moduleVersion);
    }
    instance.moduleInformation = stringBuilder.toString();
  }

  private String sdkName = "ModularJavaSDK";

  private String moduleInformation = "";

  private SDKInfo() {}

  public static SDKInfo getInstance() {
    return instance;
  }
}
