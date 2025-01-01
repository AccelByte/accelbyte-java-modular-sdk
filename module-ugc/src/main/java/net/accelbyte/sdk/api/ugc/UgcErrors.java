/*
 * Copyright (c) 2024 AccelByte Inc. All Rights Reserved
 * This is licensed software from AccelByte Inc, for limitations
 * and restrictions contact your company contract manager.
 *
 * Code generated. DO NOT EDIT.
 */
package net.accelbyte.sdk.api.ugc;

import net.accelbyte.sdk.core.ApiError;

public class UgcErrors {
  public static ApiError error20001 = new ApiError("20001", "unauthorized access");
  public static ApiError error20013 = new ApiError("20013", "insufficient permission");
  public static ApiError error770100 =
      new ApiError("770100", "Malformed request/Invalid request body/channel do not exist");
  public static ApiError error770102 =
      new ApiError(
          "770102",
          "Unable to check user ban status/Unable to save ugc content: unable to get channel");
  public static ApiError error770103 =
      new ApiError("770103", "Unable to save ugc content: shareCode exceed the limit");
  public static ApiError error770104 =
      new ApiError("770104", "User has been banned to create content");
  public static ApiError error770105 =
      new ApiError("770105", "Unable to save ugc content: failed generate upload URL");
  public static ApiError error770106 = new ApiError("770106", "channel doesn't exist");
  public static ApiError error770107 =
      new ApiError("770107", "Unable to update ugc content: invalid shareCode format");
  public static ApiError error770200 = new ApiError("770200", "Content not found");
  public static ApiError error770300 = new ApiError("770300", "ugc content not found");
  public static ApiError error770301 =
      new ApiError("770301", "Unable to get ugc content/Unable to get creator");
  public static ApiError error770303 = new ApiError("770303", "Failed generate download URL");
  public static ApiError error770500 = new ApiError("770500", "Invalid request body");
  public static ApiError error770502 = new ApiError("770502", "Unable to save channel");
  public static ApiError error770503 =
      new ApiError("770503", "Invalid channel {ID}: should uuid without hypen");
  public static ApiError error770504 = new ApiError("770504", "Channel already exist");
  public static ApiError error770600 = new ApiError("770600", "Invalid request body");
  public static ApiError error770602 = new ApiError("770602", "Unable to save channel");
  public static ApiError error770603 = new ApiError("770603", "Channel was not found");
  public static ApiError error770700 = new ApiError("770700", "Unable get user channels");
  public static ApiError error770702 = new ApiError("770702", "invalid paging parameter");
  public static ApiError error770800 =
      new ApiError(
          "770800",
          "invalid paging parameter/max allowed number of tags is {maxTags}/invalid official"
              + " parameter/invalid ishidden parameter");
  public static ApiError error770801 =
      new ApiError("770801", "Unable to get ugc content: database/Unable to get creator");
  public static ApiError error770803 = new ApiError("770803", "Failed generate download URL");
  public static ApiError error770804 = new ApiError("770804", "invalid paging parameter");
  public static ApiError error770805 =
      new ApiError("770805", "Unable to get ugc content: database error");
  public static ApiError error770900 = new ApiError("770900", "invalid paging parameter");
  public static ApiError error770901 =
      new ApiError("770901", "Unable to get ugc content: database error/Unable to get creator");
  public static ApiError error770903 = new ApiError("770903", "Failed generate download URL");
  public static ApiError error771000 =
      new ApiError(
          "771000",
          "Malformed request/Content not found/Unable to update like status: content not found");
  public static ApiError error771001 =
      new ApiError("771001", "unable to like content/Unable to update like status: database error");
  public static ApiError error771003 =
      new ApiError("771003", "Unable to like content: too many request");
  public static ApiError error771004 = new ApiError("771004", "invalid paging parameter");
  public static ApiError error771006 =
      new ApiError("771006", "unable to get list of content like: database error");
  public static ApiError error771100 = new ApiError("771100", "unable to parse isofficial param");
  public static ApiError error771101 =
      new ApiError("771101", "Unable to get ugc content: database error");
  public static ApiError error771103 = new ApiError("771103", "Unable to get total liked content");
  public static ApiError error771200 = new ApiError("771200", "Malformed request");
  public static ApiError error771201 =
      new ApiError("771201", "Unable to update follow status: database error");
  public static ApiError error771300 =
      new ApiError("771300", "Unable to get creators: database error");
  public static ApiError error771303 =
      new ApiError("771303", "Unable to get creators: database error");
  public static ApiError error771304 = new ApiError("771304", "invalid paging parameter");
  public static ApiError error771310 =
      new ApiError("771310", "Unable to get ugc content: database error");
  public static ApiError error771311 = new ApiError("771311", "invalid paging parameter");
  public static ApiError error771401 =
      new ApiError("771401", "Malformed request/Invalid request body");
  public static ApiError error771402 = new ApiError("771402", "Unable to save ugc tag");
  public static ApiError error771403 = new ApiError("771403", "Conflicted resource indentifier");
  public static ApiError error771501 = new ApiError("771501", "invalid paging parameter");
  public static ApiError error771502 = new ApiError("771502", "Unable get user tags");
  public static ApiError error771601 = new ApiError("771601", "Creator not found");
  public static ApiError error771701 =
      new ApiError("771701", "Malformed request/Invalid request body");
  public static ApiError error771702 = new ApiError("771702", "Unable to save ugc type");
  public static ApiError error771703 = new ApiError("771703", "Conflicted resource indentifier");
  public static ApiError error771801 = new ApiError("771801", "invalid paging parameter");
  public static ApiError error771802 = new ApiError("771802", "Unable get types");
  public static ApiError error771901 =
      new ApiError("771901", "Malformed request/Invalid request body");
  public static ApiError error771902 = new ApiError("771902", "Unable update types");
  public static ApiError error771903 = new ApiError("771903", "Type not found");
  public static ApiError error771904 = new ApiError("771904", "Proposed Type already exist");
  public static ApiError error772002 = new ApiError("772002", "Unable delete tag");
  public static ApiError error772003 = new ApiError("772003", "Tag not found");
  public static ApiError error772004 = new ApiError("772004", "Unable delete type");
  public static ApiError error772005 = new ApiError("772005", "Type not found");
  public static ApiError error772101 =
      new ApiError("772101", "Malformed request/Invalid request body");
  public static ApiError error772102 = new ApiError("772102", "Unable to create group");
  public static ApiError error772201 =
      new ApiError("772201", "Malformed request/Invalid request body");
  public static ApiError error772202 = new ApiError("772202", "Unable to update group");
  public static ApiError error772203 = new ApiError("772203", "Group not found");
  public static ApiError error772301 = new ApiError("772301", "invalid paging parameter");
  public static ApiError error772302 = new ApiError("772302", "Unable get groups");
  public static ApiError error772402 = new ApiError("772402", "Unable delete groups");
  public static ApiError error772403 = new ApiError("772403", "Group not found");
  public static ApiError error772501 = new ApiError("772501", "Unable to delete channel");
  public static ApiError error772502 = new ApiError("772502", "Channel not found");
  public static ApiError error772601 = new ApiError("772601", "Malformed request");
  public static ApiError error772602 =
      new ApiError("772602", "Unable to check user ban status/Unable to get updated ugc content");
  public static ApiError error772603 = new ApiError("772603", "Content not found");
  public static ApiError error772604 =
      new ApiError("772604", "User has been banned to update content");
  public static ApiError error772605 =
      new ApiError("772605", "Unable to save ugc content: failed generate upload URL");
  public static ApiError error772606 = new ApiError("772606", "Share code already used");
  public static ApiError error772607 =
      new ApiError("772607", "Unable to update ugc content: invalid shareCode format");
  public static ApiError error772701 =
      new ApiError(
          "772701",
          "Unable to delete content/Unable to update user liked count/Unable to delete like"
              + " state/Unable to delete like state");
  public static ApiError error772702 = new ApiError("772702", "Content not found");
  public static ApiError error772801 =
      new ApiError("772801", "Malformed request/Invalid request body");
  public static ApiError error772802 = new ApiError("772802", "Unable update tags");
  public static ApiError error772803 = new ApiError("772803", "Tag not found");
  public static ApiError error772804 = new ApiError("772804", "Proposed Tag already exist");
  public static ApiError error772902 =
      new ApiError("772902", "Unable to add content download: database error");
  public static ApiError error772903 =
      new ApiError("772903", "Unable to add content download: content not found");
  public static ApiError error772904 =
      new ApiError("772904", "Unable to list content downloader: database error");
  public static ApiError error772906 =
      new ApiError("772906", "Unable to add content download: too many request");
  public static ApiError error773001 = new ApiError("773001", "Unable get group");
  public static ApiError error773002 = new ApiError("773002", "Group not found");
  public static ApiError error773101 = new ApiError("773101", "invalid paging parameter");
  public static ApiError error773102 =
      new ApiError("773102", "Unable to get ugc content: database error");
  public static ApiError error773103 = new ApiError("773103", "No group content was found");
  public static ApiError error773200 = new ApiError("773200", "ugc content not found");
  public static ApiError error773201 =
      new ApiError(
          "773201", "Unable to get ugc content/Unable to get creator/Unable to get included group");
  public static ApiError error773203 = new ApiError("773203", "Failed generate download URL");
  public static ApiError error773301 = new ApiError("773301", "Unable to find all user group");
  public static ApiError error773302 = new ApiError("773302", "Groups not found");
  public static ApiError error773401 = new ApiError("773401", "Unable to get all user content");
  public static ApiError error773402 = new ApiError("773402", "Content not found");
  public static ApiError error773501 = new ApiError("773501", "Unable to delete channel");
  public static ApiError error773502 = new ApiError("773502", "Channel not found");
  public static ApiError error773601 =
      new ApiError("773601", "Unable to get all user contents/Unable to delete user states");
  public static ApiError error773602 =
      new ApiError("773602", "user states are not found: content not found");
  public static ApiError error773701 = new ApiError("773701", "Unable to get ugc content");
  public static ApiError error773702 = new ApiError("773702", "ugc content not found");
  public static ApiError error773801 =
      new ApiError("773801", "Invalid request body/Malformed request");
  public static ApiError error773802 =
      new ApiError("773802", "Unable to update hide status: database error");
  public static ApiError error773803 =
      new ApiError("773803", "Unable to update hide status: content not found");
  public static ApiError error773804 =
      new ApiError("773804", "Unable to save ugc content: failed generate upload URL");
  public static ApiError error773805 =
      new ApiError("773805", "Unable to save ugc content preview: failed generate upload URL");
  public static ApiError error773900 =
      new ApiError("773900", "Malformed request/Invalid request body");
  public static ApiError error773901 =
      new ApiError("773901", "Unable to get ugc content: database/Unable to get creator");
  public static ApiError error773902 = new ApiError("773902", "Failed generate download URL");
  public static ApiError error774001 =
      new ApiError("774001", "unable to read response body/unable to update file location");
  public static ApiError error774002 =
      new ApiError("774002", "unable to update content file location: content not found");
  public static ApiError error774003 =
      new ApiError("774003", "unable to update content file location");
  public static ApiError error774004 = new ApiError("774004", "ugc content not found");
  public static ApiError error774005 = new ApiError("774005", "unable to get ugc content");
  public static ApiError error774101 = new ApiError("774101", "ugc content not found");
  public static ApiError error774102 = new ApiError("774102", "version not found");
  public static ApiError error774103 =
      new ApiError(
          "774103",
          "unable to get ugc content/content cannot be restored using the current content version");
  public static ApiError error774201 = new ApiError("774201", "Invalid request body");
  public static ApiError error774202 = new ApiError("774202", "Unable to save config");
  public static ApiError error774204 = new ApiError("774204", "invalid paging parameter");
  public static ApiError error774205 = new ApiError("774205", "Unable to get configs");
  public static ApiError error774301 = new ApiError("774301", "invalid paging parameter");
  public static ApiError error774302 = new ApiError("774302", "unable to get staging content");
  public static ApiError error774303 = new ApiError("774303", "unable to generate presigned URL");
  public static ApiError error774401 = new ApiError("774401", "staging content not found");
  public static ApiError error774402 = new ApiError("774402", "unable to get staging content");
  public static ApiError error774403 = new ApiError("774403", "unable to generate presigned URL");
  public static ApiError error774405 = new ApiError("774405", "Invalid request body");
  public static ApiError error774406 = new ApiError("774406", "staging content not found");
  public static ApiError error774407 = new ApiError("774407", "unable to approve staging content");
  public static ApiError error774408 =
      new ApiError("774408", "nable to save ugc content: shareCode exceed the limit");
  public static ApiError error774411 = new ApiError("774411", "Invalid request body");
  public static ApiError error774412 =
      new ApiError("774412", "user has been banned to update content");
  public static ApiError error774413 = new ApiError("774413", "staging content not found");
  public static ApiError error774414 = new ApiError("774414", "unable to update staging content");
  public static ApiError error774415 = new ApiError("774415", "unable to generate presigned URL");
  public static ApiError error774417 = new ApiError("774417", "staging content not found");
  public static ApiError error774418 = new ApiError("774418", "unable to delete staging content");
}
