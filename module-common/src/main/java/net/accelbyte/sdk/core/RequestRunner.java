package net.accelbyte.sdk.core;

public interface RequestRunner {
  HttpResponse runRequest(Operation operation) throws Exception;
  AccelByteConfig getSdkConfiguration();
}
