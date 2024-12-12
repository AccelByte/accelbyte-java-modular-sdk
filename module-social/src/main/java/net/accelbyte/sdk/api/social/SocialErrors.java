/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */
package net.accelbyte.sdk.api.social;

import net.accelbyte.sdk.core.ApiError;

public class SocialErrors
{
    public static ApiError error12021 = new ApiError("12021", "{totalUser} users is requested. Cannot retrieve more than {limitUser} users at once");
    public static ApiError error12022 = new ApiError("12022", "Game profile attribute name [{attrName1}] passed in request url mismatch the name [{attrName2}] in body");
    public static ApiError error12041 = new ApiError("12041", "Game profile with id [{profileId}] is not found");
    public static ApiError error12121 = new ApiError("12121", "Checksum mismatch for [{filename}]");
    public static ApiError error12122 = new ApiError("12122", "[{filename}] exceeds the upload limit size of [{sizeLimit}] bytes");
    public static ApiError error12141 = new ApiError("12141", "Slot [{slotId}] not found in namespace [{namespace}]");
    public static ApiError error12171 = new ApiError("12171", "User [{userId}] exceed max slot count [{maxCount}] in namespace [{namespace}]");
    public static ApiError error12221 = new ApiError("12221", "Invalid stat operator, expect [{expected}] but actual [{actual}]");
    public static ApiError error12222 = new ApiError("12222", "Stats data for namespace [{namespace}] is invalid");
    public static ApiError error12223 = new ApiError("12223", "Invalid stat codes in namespace [{namespace}]: [{statCodes}]");
    public static ApiError error12225 = new ApiError("12225", "Invalid time range");
    public static ApiError error12226 = new ApiError("12226", "Invalid date [{date}] of month [{month}]");
    public static ApiError error12241 = new ApiError("12241", "Stat [{statCode}] cannot be found in namespace [{namespace}]");
    public static ApiError error12242 = new ApiError("12242", "Stat item of [{statCode}] of user [{profileId}] cannot be found in namespace [{namespace}]");
    public static ApiError error12243 = new ApiError("12243", "Stats cannot be found in namespace [{namespace}]");
    public static ApiError error12244 = new ApiError("12244", "Global stat item of [{statCode}] cannot be found in namespace [{namespace}]");
    public static ApiError error12245 = new ApiError("12245", "Stat cycle [{id}] cannot be found in namespace [{namespace}]");
    public static ApiError error12271 = new ApiError("12271", "Stat template with code [{statCode}] already exists in namespace [{namespace}]");
    public static ApiError error12273 = new ApiError("12273", "Stat [{statCode}] is not decreasable");
    public static ApiError error12274 = new ApiError("12274", "Stat item with code [{statCode}] of user [{profileId}] already exists in namespace [{namespace}]");
    public static ApiError error12275 = new ApiError("12275", "[{action}] value: [{value}] of stat [{statCode}] is out of range while minimum [{minimum}] and maximum [{maximum}] in namespace [{namespace}]");
    public static ApiError error12276 = new ApiError("12276", " Stat template with code [{statCode}] in namespace [{namespace}] not deletable due it is in an INIT status ");
    public static ApiError error12277 = new ApiError("12277", "Stat cycle [{id}] in namespace [{namespace}] with status [{status}] cannot be updated");
    public static ApiError error12279 = new ApiError("12279", "Invalid stat cycle status: Stat cycle [{id}], namespace [{namespace}], status [{status}]");
    public static ApiError error20000 = new ApiError("20000", "Internal server error");
    public static ApiError error20001 = new ApiError("20001", "unauthorized access");
    public static ApiError error20002 = new ApiError("20002", "validation error");
    public static ApiError error20013 = new ApiError("20013", "insufficient permission");
}