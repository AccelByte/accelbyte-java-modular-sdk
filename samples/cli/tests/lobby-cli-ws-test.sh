#!/usr/bin/env bash

# Copyright (c) 2021 AccelByte Inc. All Rights Reserved.
# This is licensed software from AccelByte Inc, for limitations
# and restrictions contact your company contract manager.

# Code generated. DO NOT EDIT.

# Meta:
# - random seed: 
# - template file: 

# Instructions:
# - Run the Justice SDK Mock Server first before running this script.

export AB_BASE_URL="http://127.0.0.1:8000"
export AB_CLIENT_ID="admin"
export AB_CLIENT_SECRET="admin"
export AB_NAMESPACE="test"

EXIT_CODE=0

eval_tap() {
  if [ $1 -eq 0 ]; then
    echo "ok $2 - $3"
  else
    EXIT_CODE=1
    echo "not ok $2 - $3"
    sed 's/^/# /g' $4
  fi
  rm -f $4
}

chmod +x ./ng
trap "./ng ng-stop" EXIT
java -jar build/install/cli/lib/nailgun-server-*.jar 1>&2 &
(for i in $(seq 1 100); do bash -c "timeout 1 echo > /dev/tcp/127.0.0.1/2113" 2>/dev/null && exit 0 || sleep 1; done; exit 1) || exit 1
for JAR in build/install/cli/lib/*.jar; do ./ng ng-cp $JAR 1>&2; done
./ng ng-cp 1>&2

echo "TAP version 13"
echo "1..105"

#- 1 AcceptFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: acceptFriendsNotif\nfriendId: rNFUMoUy' -u \
    > test.out 2>&1
eval_tap $? 1 'AcceptFriendsNotif' test.out

#- 2 AcceptFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: acceptFriendsRequest\nid: 3bQNNov8\nfriendId: xMajjt9C' -u \
    > test.out 2>&1
eval_tap $? 2 'AcceptFriendsRequest' test.out

#- 3 AcceptFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: acceptFriendsResponse\nid: tZiTyjk7\ncode: 26' -u \
    > test.out 2>&1
eval_tap $? 3 'AcceptFriendsResponse' test.out

#- 4 BlockPlayerNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: blockPlayerNotif\nblockedUserId: HOaTTiwE\nuserId: ftXmJKSC' -u \
    > test.out 2>&1
eval_tap $? 4 'BlockPlayerNotif' test.out

#- 5 BlockPlayerRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: blockPlayerRequest\nid: sbk3dHGn\nblockUserId: 5LlheKyd\nnamespace: uh8QmiZJ' -u \
    > test.out 2>&1
eval_tap $? 5 'BlockPlayerRequest' test.out

#- 6 BlockPlayerResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: blockPlayerResponse\nid: VleCuXkQ\nblockUserId: uzRyRS5V\ncode: 41\nnamespace: nYGTcW3W' -u \
    > test.out 2>&1
eval_tap $? 6 'BlockPlayerResponse' test.out

#- 7 CancelFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelFriendsNotif\nuserId: VU7yCBst' -u \
    > test.out 2>&1
eval_tap $? 7 'CancelFriendsNotif' test.out

#- 8 CancelFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelFriendsRequest\nid: JZQ1OkF2\nfriendId: uIEbx8XF' -u \
    > test.out 2>&1
eval_tap $? 8 'CancelFriendsRequest' test.out

#- 9 CancelFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelFriendsResponse\nid: tIxyT3HZ\ncode: 6' -u \
    > test.out 2>&1
eval_tap $? 9 'CancelFriendsResponse' test.out

#- 10 CancelMatchmakingRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelMatchmakingRequest\nid: GQMGmAdM\ngameMode: j28VRG2M\nisTempParty: False' -u \
    > test.out 2>&1
eval_tap $? 10 'CancelMatchmakingRequest' test.out

#- 11 CancelMatchmakingResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelMatchmakingResponse\nid: Ven6hDVS\ncode: 9' -u \
    > test.out 2>&1
eval_tap $? 11 'CancelMatchmakingResponse' test.out

#- 12 ChannelChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: channelChatNotif\nchannelSlug: 9dXAQvH1\nfrom: ftEhoxYO\npayload: IQlIHvMO\nsentAt: 1973-04-22T00:00:00Z' -u \
    > test.out 2>&1
eval_tap $? 12 'ChannelChatNotif' test.out

#- 13 ClientResetRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: clientResetRequest\nnamespace: p82vrCZa\nuserId: NMopZZfZ' -u \
    > test.out 2>&1
eval_tap $? 13 'ClientResetRequest' test.out

#- 14 ConnectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: connectNotif\nlobbySessionID: mTAJbZ8P' -u \
    > test.out 2>&1
eval_tap $? 14 'ConnectNotif' test.out

#- 15 DisconnectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: disconnectNotif\nconnectionId: XDofIBid\nnamespace: sPvCFxUQ' -u \
    > test.out 2>&1
eval_tap $? 15 'DisconnectNotif' test.out

#- 16 DsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: dsNotif\nalternateIps: [qoW2NJie,Qe7g9iIP,aie73oph]\ncustomAttribute: peF7HQTY\ndeployment: gLT3v4h7\ngameVersion: txcKvqyS\nimageVersion: mp7qQ8l3\nip: k0JOxjli\nisOK: True\nisOverrideGameVersion: True\nlastUpdate: cw1wQ32o\nmatchId: A5MTlmk0\nmessage: n3m7XYZ7\nnamespace: z6rywe0g\npodName: sxmYVOg3\nport: 54\nports: {"9op2pcYX":75,"i3cWNyKR":54,"5BXhGWkL":39}\nprotocol: sdODRQsp\nprovider: 6wZgM9OY\nregion: kiHBUiE6\nsessionId: f5aFs6N6\nstatus: FZ0hC5fT' -u \
    > test.out 2>&1
eval_tap $? 16 'DsNotif' test.out

#- 17 ErrorNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: errorNotif\nmessage: wmoin3E7' -u \
    > test.out 2>&1
eval_tap $? 17 'ErrorNotif' test.out

#- 18 ExitAllChannel
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: exitAllChannel\nnamespace: 2LObJRkm\nuserId: DyWVvVUo' -u \
    > test.out 2>&1
eval_tap $? 18 'ExitAllChannel' test.out

#- 19 FriendsStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: friendsStatusRequest\nid: MDPcfsKj' -u \
    > test.out 2>&1
eval_tap $? 19 'FriendsStatusRequest' test.out

#- 20 FriendsStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: friendsStatusResponse\nid: v6Uqs9Sw\nactivity: [cm9Tlo7G,h6zbRoT2,rOvb93q1]\navailability: [h7VlOYJy,YlpWXCyr,XT8gWGAr]\ncode: 79\nfriendIds: [syEJDfM6,1ZgHRFbQ,hJBrJUzV]\nlastSeenAt: [1973-03-20T00:00:00Z,1981-07-21T00:00:00Z,1982-07-20T00:00:00Z]' -u \
    > test.out 2>&1
eval_tap $? 20 'FriendsStatusResponse' test.out

#- 21 GetAllSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getAllSessionAttributeRequest\nid: ys7vfFpq' -u \
    > test.out 2>&1
eval_tap $? 21 'GetAllSessionAttributeRequest' test.out

#- 22 GetAllSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getAllSessionAttributeResponse\nid: Kfxpen41\nattributes: {"VlR86NQE":"eQiKxZbn","KH3YhwnC":"h0141KsU","xy6t5KCi":"UuDl6Cbt"}\ncode: 56' -u \
    > test.out 2>&1
eval_tap $? 22 'GetAllSessionAttributeResponse' test.out

#- 23 GetFriendshipStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getFriendshipStatusRequest\nid: mtddDyTE\nfriendId: oBUdqTbN' -u \
    > test.out 2>&1
eval_tap $? 23 'GetFriendshipStatusRequest' test.out

#- 24 GetFriendshipStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getFriendshipStatusResponse\nid: 6eee2UIN\ncode: 20\nfriendshipStatus: 4tMuSVFw' -u \
    > test.out 2>&1
eval_tap $? 24 'GetFriendshipStatusResponse' test.out

#- 25 GetSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getSessionAttributeRequest\nid: BewDbT1l\nkey: DVQ9rjLb' -u \
    > test.out 2>&1
eval_tap $? 25 'GetSessionAttributeRequest' test.out

#- 26 GetSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getSessionAttributeResponse\nid: QbucoZqn\ncode: 30\nvalue: 4XiVUWb7' -u \
    > test.out 2>&1
eval_tap $? 26 'GetSessionAttributeResponse' test.out

#- 27 Heartbeat
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: heartbeat' -u \
    > test.out 2>&1
eval_tap $? 27 'Heartbeat' test.out

#- 28 JoinDefaultChannelRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: joinDefaultChannelRequest\nid: BMsAQ9XK' -u \
    > test.out 2>&1
eval_tap $? 28 'JoinDefaultChannelRequest' test.out

#- 29 JoinDefaultChannelResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: joinDefaultChannelResponse\nid: UIDuG9rR\nchannelSlug: NF3FBi8E\ncode: 20' -u \
    > test.out 2>&1
eval_tap $? 29 'JoinDefaultChannelResponse' test.out

#- 30 ListIncomingFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listIncomingFriendsRequest\nid: MAacj3jo' -u \
    > test.out 2>&1
eval_tap $? 30 'ListIncomingFriendsRequest' test.out

#- 31 ListIncomingFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listIncomingFriendsResponse\nid: bIxlsupD\ncode: 41\nuserIds: [xhVPXHsH,xLb88Z80,CveAH0ID]' -u \
    > test.out 2>&1
eval_tap $? 31 'ListIncomingFriendsResponse' test.out

#- 32 ListOfFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOfFriendsRequest\nid: fOPKRha2\nfriendId: H3sWtreC' -u \
    > test.out 2>&1
eval_tap $? 32 'ListOfFriendsRequest' test.out

#- 33 ListOfFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOfFriendsResponse\nid: uidWSdCX\ncode: 43\nfriendIds: [U2YPYm2z,1ahzwwTa,fpYDI0FJ]' -u \
    > test.out 2>&1
eval_tap $? 33 'ListOfFriendsResponse' test.out

#- 34 ListOnlineFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOnlineFriendsRequest\nid: 13vDshBW' -u \
    > test.out 2>&1
eval_tap $? 34 'ListOnlineFriendsRequest' test.out

#- 35 ListOutgoingFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOutgoingFriendsRequest\nid: xnLkvV71' -u \
    > test.out 2>&1
eval_tap $? 35 'ListOutgoingFriendsRequest' test.out

#- 36 ListOutgoingFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOutgoingFriendsResponse\nid: BWT1Ebrm\ncode: 46\nfriendIds: [saxZk9gw,KFKKu9VM,8N6R5bsK]' -u \
    > test.out 2>&1
eval_tap $? 36 'ListOutgoingFriendsResponse' test.out

#- 37 MatchmakingNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: matchmakingNotif\ncounterPartyMember: [RuU6VglL,pZWJQnlZ,MMQSHa6r]\nmatchId: c5z63KnY\nmessage: aZumemb7\npartyMember: [zk1Ejt5P,tWKGtZnF,HEG9Lkid]\nreadyDuration: 72\nstatus: qx0KL0hr' -u \
    > test.out 2>&1
eval_tap $? 37 'MatchmakingNotif' test.out

#- 38 MessageNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: messageNotif\nid: W4lwTesX\nfrom: fywtbLJs\npayload: vMJIHMSa\nsentAt: 1982-11-02T00:00:00Z\nto: 3Hx0E4GE\ntopic: y2QHOCA6' -u \
    > test.out 2>&1
eval_tap $? 38 'MessageNotif' test.out

#- 39 MessageSessionNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: messageSessionNotif\nid: gPmM7RnD\nfrom: Z31XTKyU\npayload: IdgR8gKe\nsentAt: 1992-05-06T00:00:00Z\nto: wCUsAZmI\ntopic: tTfDJRZz' -u \
    > test.out 2>&1
eval_tap $? 39 'MessageSessionNotif' test.out

#- 40 OfflineNotificationRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: offlineNotificationRequest\nid: gqEhTx6t' -u \
    > test.out 2>&1
eval_tap $? 40 'OfflineNotificationRequest' test.out

#- 41 OfflineNotificationResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: offlineNotificationResponse\nid: Ck7Bp6Ap\ncode: 44' -u \
    > test.out 2>&1
eval_tap $? 41 'OfflineNotificationResponse' test.out

#- 42 OnlineFriends
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: onlineFriends\nid: QzPM7E15\ncode: 92\nonlineFriendIds: [U3ZY0zQ7,1UKlu34D,MMnJ5fZJ]' -u \
    > test.out 2>&1
eval_tap $? 42 'OnlineFriends' test.out

#- 43 PartyChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatNotif\nid: Mmsmgcpl\nfrom: ECXPBViC\npayload: GTWC59DU\nreceivedAt: 1973-06-07T00:00:00Z\nto: U9QgWGun' -u \
    > test.out 2>&1
eval_tap $? 43 'PartyChatNotif' test.out

#- 44 PartyChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatRequest\nid: OZNk2oaT\nfrom: v8Ak3vuw\npayload: ay1KscBb\nreceivedAt: 1983-10-30T00:00:00Z\nto: yXDJftEP' -u \
    > test.out 2>&1
eval_tap $? 44 'PartyChatRequest' test.out

#- 45 PartyChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatResponse\nid: Sltiotd4\ncode: 41' -u \
    > test.out 2>&1
eval_tap $? 45 'PartyChatResponse' test.out

#- 46 PartyCreateRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyCreateRequest\nid: mKR3l0XP' -u \
    > test.out 2>&1
eval_tap $? 46 'PartyCreateRequest' test.out

#- 47 PartyCreateResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyCreateResponse\nid: 5DDuv1rU\ncode: 30\ninvitationToken: wDUIBaBL\ninvitees: erNVuKhY\nleaderId: lDSAdDuy\nmembers: 3YrGrVsJ\npartyId: EZpUPwia' -u \
    > test.out 2>&1
eval_tap $? 47 'PartyCreateResponse' test.out

#- 48 PartyDataUpdateNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyDataUpdateNotif\ncustomAttributes: {"NE2iowR3":{},"VN5g2rgv":{},"HLAOGsLV":{}}\ninvitees: [VAVjn0vL,e0KREHSn,1LqCzV2J]\nleader: wA49XLkB\nmembers: [t9yh0rTf,po5mTq8N,J9npYYmA]\nnamespace: XxRudaKf\npartyId: LW12XzBU\nupdatedAt: 1979-01-27T00:00:00Z' -u \
    > test.out 2>&1
eval_tap $? 48 'PartyDataUpdateNotif' test.out

#- 49 PartyGetInvitedNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyGetInvitedNotif\nfrom: 7ftuwt46\ninvitationToken: q09oIpow\npartyId: ARTlbvFu' -u \
    > test.out 2>&1
eval_tap $? 49 'PartyGetInvitedNotif' test.out

#- 50 PartyInfoRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInfoRequest\nid: o0INRH7q' -u \
    > test.out 2>&1
eval_tap $? 50 'PartyInfoRequest' test.out

#- 51 PartyInfoResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInfoResponse\nid: RW2IAm4R\ncode: 65\ncustomAttributes: {"RCSmZS9J":{},"tAhj1fCN":{},"aaZgsNVd":{}}\ninvitationToken: BoRFJr0E\ninvitees: yWGLTVRi\nleaderId: 0j86A23l\nmembers: R7XbinKb\npartyId: 2xO19rcb' -u \
    > test.out 2>&1
eval_tap $? 51 'PartyInfoResponse' test.out

#- 52 PartyInviteNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteNotif\ninviteeId: r3S7DCK2\ninviterId: ji4Tq7vA' -u \
    > test.out 2>&1
eval_tap $? 52 'PartyInviteNotif' test.out

#- 53 PartyInviteRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteRequest\nid: BUqAaam6\nfriendId: DILtTHwX' -u \
    > test.out 2>&1
eval_tap $? 53 'PartyInviteRequest' test.out

#- 54 PartyInviteResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteResponse\nid: 3siKhn5k\ncode: 12' -u \
    > test.out 2>&1
eval_tap $? 54 'PartyInviteResponse' test.out

#- 55 PartyJoinNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinNotif\nuserId: 1ByQ8Pa3' -u \
    > test.out 2>&1
eval_tap $? 55 'PartyJoinNotif' test.out

#- 56 PartyJoinRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinRequest\nid: E848UQ8n\ninvitationToken: v0YbAilK\npartyId: nL6cb8FG' -u \
    > test.out 2>&1
eval_tap $? 56 'PartyJoinRequest' test.out

#- 57 PartyJoinResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinResponse\nid: proS4GFk\ncode: 100\ninvitationToken: DKB67C8g\ninvitees: cCzUsehs\nleaderId: u7gjOwOy\nmembers: NXLAdEkv\npartyId: 97NGDT9n' -u \
    > test.out 2>&1
eval_tap $? 57 'PartyJoinResponse' test.out

#- 58 PartyKickNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickNotif\nleaderId: va34If9u\npartyId: HrvWPZUL\nuserId: 6zpS5z7B' -u \
    > test.out 2>&1
eval_tap $? 58 'PartyKickNotif' test.out

#- 59 PartyKickRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickRequest\nid: ID2mV9ZE\nmemberId: DdM5jZo3' -u \
    > test.out 2>&1
eval_tap $? 59 'PartyKickRequest' test.out

#- 60 PartyKickResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickResponse\nid: XusvbTyy\ncode: 10' -u \
    > test.out 2>&1
eval_tap $? 60 'PartyKickResponse' test.out

#- 61 PartyLeaveNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveNotif\nleaderId: 8Xa4FjH8\nuserId: m1qNh5zM' -u \
    > test.out 2>&1
eval_tap $? 61 'PartyLeaveNotif' test.out

#- 62 PartyLeaveRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveRequest\nid: H2ecq7Vl\nignoreUserRegistry: True' -u \
    > test.out 2>&1
eval_tap $? 62 'PartyLeaveRequest' test.out

#- 63 PartyLeaveResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveResponse\nid: orB1fehq\ncode: 57' -u \
    > test.out 2>&1
eval_tap $? 63 'PartyLeaveResponse' test.out

#- 64 PartyPromoteLeaderRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyPromoteLeaderRequest\nid: 4eg0QdzG\nnewLeaderUserId: GPLn2d83' -u \
    > test.out 2>&1
eval_tap $? 64 'PartyPromoteLeaderRequest' test.out

#- 65 PartyPromoteLeaderResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyPromoteLeaderResponse\nid: mW2Dv3jv\ncode: 92\ninvitationToken: Xz20NyPy\ninvitees: 68B9Klku\nleaderId: Sxfwy4rK\nmembers: AriWV1En\npartyId: z1PSmWNh' -u \
    > test.out 2>&1
eval_tap $? 65 'PartyPromoteLeaderResponse' test.out

#- 66 PartyRejectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectNotif\nleaderId: 3arPWis1\npartyId: zssde0F2\nuserId: C51pvylF' -u \
    > test.out 2>&1
eval_tap $? 66 'PartyRejectNotif' test.out

#- 67 PartyRejectRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectRequest\nid: DvSLIlSO\ninvitationToken: 1hUnMXAj\npartyId: SCHlUOpK' -u \
    > test.out 2>&1
eval_tap $? 67 'PartyRejectRequest' test.out

#- 68 PartyRejectResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectResponse\nid: ad5gajCi\ncode: 65\npartyId: 9luGdzJU' -u \
    > test.out 2>&1
eval_tap $? 68 'PartyRejectResponse' test.out

#- 69 PersonalChatHistoryRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatHistoryRequest\nid: vmtxcUCO\nfriendId: pT5uZ28O' -u \
    > test.out 2>&1
eval_tap $? 69 'PersonalChatHistoryRequest' test.out

#- 70 PersonalChatHistoryResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatHistoryResponse\nid: 2NVmz7iX\nchat: GIEjCMSW\ncode: 68\nfriendId: clq7ZbYe' -u \
    > test.out 2>&1
eval_tap $? 70 'PersonalChatHistoryResponse' test.out

#- 71 PersonalChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatNotif\nid: mcZhWMdz\nfrom: OuVNnLZF\npayload: CPiruNYG\nreceivedAt: 1987-02-27T00:00:00Z\nto: NyylJDjc' -u \
    > test.out 2>&1
eval_tap $? 71 'PersonalChatNotif' test.out

#- 72 PersonalChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatRequest\nid: Mb9peYru\nfrom: RVDDMwZt\npayload: jEql7VLi\nreceivedAt: 1976-06-11T00:00:00Z\nto: rI8lFdyO' -u \
    > test.out 2>&1
eval_tap $? 72 'PersonalChatRequest' test.out

#- 73 PersonalChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatResponse\nid: hsEU2KLT\ncode: 7' -u \
    > test.out 2>&1
eval_tap $? 73 'PersonalChatResponse' test.out

#- 74 RefreshTokenRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: refreshTokenRequest\nid: Y4BnCl4f\ntoken: 8HO7qZK2' -u \
    > test.out 2>&1
eval_tap $? 74 'RefreshTokenRequest' test.out

#- 75 RefreshTokenResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: refreshTokenResponse\nid: bxSYeQ5L\ncode: 22' -u \
    > test.out 2>&1
eval_tap $? 75 'RefreshTokenResponse' test.out

#- 76 RejectFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsNotif\nuserId: ffUCOGBY' -u \
    > test.out 2>&1
eval_tap $? 76 'RejectFriendsNotif' test.out

#- 77 RejectFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsRequest\nid: VZZ7wQ7Y\nfriendId: KVUf8l8P' -u \
    > test.out 2>&1
eval_tap $? 77 'RejectFriendsRequest' test.out

#- 78 RejectFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsResponse\nid: FWeIgRSh\ncode: 94' -u \
    > test.out 2>&1
eval_tap $? 78 'RejectFriendsResponse' test.out

#- 79 RematchmakingNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rematchmakingNotif\nbanDuration: 68' -u \
    > test.out 2>&1
eval_tap $? 79 'RematchmakingNotif' test.out

#- 80 RequestFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsNotif\nfriendId: 7rxUVkEd' -u \
    > test.out 2>&1
eval_tap $? 80 'RequestFriendsNotif' test.out

#- 81 RequestFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsRequest\nid: FBredOPX\nfriendId: 2mCZhgly' -u \
    > test.out 2>&1
eval_tap $? 81 'RequestFriendsRequest' test.out

#- 82 RequestFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsResponse\nid: f34x4agW\ncode: 68' -u \
    > test.out 2>&1
eval_tap $? 82 'RequestFriendsResponse' test.out

#- 83 SendChannelChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: sendChannelChatRequest\nid: jyk1IeL0\nchannelSlug: OO5KMajL\npayload: 9Z0JCfAo' -u \
    > test.out 2>&1
eval_tap $? 83 'SendChannelChatRequest' test.out

#- 84 SendChannelChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: sendChannelChatResponse\nid: MbCw9KOc\ncode: 41' -u \
    > test.out 2>&1
eval_tap $? 84 'SendChannelChatResponse' test.out

#- 85 SetReadyConsentNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentNotif\nmatchId: utuh4nVc\nuserId: z6STYdeo' -u \
    > test.out 2>&1
eval_tap $? 85 'SetReadyConsentNotif' test.out

#- 86 SetReadyConsentRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentRequest\nid: k0HrSA6R\nmatchId: o2zjIlVr' -u \
    > test.out 2>&1
eval_tap $? 86 'SetReadyConsentRequest' test.out

#- 87 SetReadyConsentResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentResponse\nid: B6qDnaov\ncode: 69' -u \
    > test.out 2>&1
eval_tap $? 87 'SetReadyConsentResponse' test.out

#- 88 SetSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setSessionAttributeRequest\nid: RbOw9lei\nkey: UGucRgZy\nnamespace: Kt2DT3LI\nvalue: 4g24xLMn' -u \
    > test.out 2>&1
eval_tap $? 88 'SetSessionAttributeRequest' test.out

#- 89 SetSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setSessionAttributeResponse\nid: 2ktZs4KF\ncode: 5' -u \
    > test.out 2>&1
eval_tap $? 89 'SetSessionAttributeResponse' test.out

#- 90 SetUserStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setUserStatusRequest\nid: 08N5WNdb\nactivity: ekZGjCUp\navailability: 51' -u \
    > test.out 2>&1
eval_tap $? 90 'SetUserStatusRequest' test.out

#- 91 SetUserStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setUserStatusResponse\nid: pA4CxdPa\ncode: 54' -u \
    > test.out 2>&1
eval_tap $? 91 'SetUserStatusResponse' test.out

#- 92 ShutdownNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: shutdownNotif\nmessage: wqTySMyo' -u \
    > test.out 2>&1
eval_tap $? 92 'ShutdownNotif' test.out

#- 93 SignalingP2PNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: signalingP2PNotif\ndestinationId: eXkQg2BX\nmessage: fA9Gncra' -u \
    > test.out 2>&1
eval_tap $? 93 'SignalingP2PNotif' test.out

#- 94 StartMatchmakingRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: startMatchmakingRequest\nid: tU42JIZJ\nextraAttributes: LopU0m4x\ngameMode: BxB19vwU\npartyAttributes: {"v133GVSD":{},"xMg6Zoj3":{},"eJdORkKO":{}}\npriority: 47\ntempParty: 6a8XWKh8' -u \
    > test.out 2>&1
eval_tap $? 94 'StartMatchmakingRequest' test.out

#- 95 StartMatchmakingResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: startMatchmakingResponse\nid: 5RGXBnjk\ncode: 100' -u \
    > test.out 2>&1
eval_tap $? 95 'StartMatchmakingResponse' test.out

#- 96 UnblockPlayerNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerNotif\nunblockedUserId: chskMw3G\nuserId: Dk698syn' -u \
    > test.out 2>&1
eval_tap $? 96 'UnblockPlayerNotif' test.out

#- 97 UnblockPlayerRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerRequest\nid: QgYBKwut\nnamespace: 4uk7w8xG\nunblockedUserId: YgJCqUGD' -u \
    > test.out 2>&1
eval_tap $? 97 'UnblockPlayerRequest' test.out

#- 98 UnblockPlayerResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerResponse\nid: LSVf3Qiv\ncode: 42\nnamespace: kv7076J1\nunblockedUserId: JfKLxBgP' -u \
    > test.out 2>&1
eval_tap $? 98 'UnblockPlayerResponse' test.out

#- 99 UnfriendNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendNotif\nfriendId: GvInFIZo' -u \
    > test.out 2>&1
eval_tap $? 99 'UnfriendNotif' test.out

#- 100 UnfriendRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendRequest\nid: bZa9azdM\nfriendId: Yh8Y2toF' -u \
    > test.out 2>&1
eval_tap $? 100 'UnfriendRequest' test.out

#- 101 UnfriendResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendResponse\nid: y2Kea8PV\ncode: 72' -u \
    > test.out 2>&1
eval_tap $? 101 'UnfriendResponse' test.out

#- 102 UserBannedNotification
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userBannedNotification' -u \
    > test.out 2>&1
eval_tap $? 102 'UserBannedNotification' test.out

#- 103 UserMetricRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userMetricRequest\nid: 7IwfPGQq' -u \
    > test.out 2>&1
eval_tap $? 103 'UserMetricRequest' test.out

#- 104 UserMetricResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userMetricResponse\nid: g2XeWY06\ncode: 12\nplayerCount: 2' -u \
    > test.out 2>&1
eval_tap $? 104 'UserMetricResponse' test.out

#- 105 UserStatusNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userStatusNotif\nactivity: nWUQ52z3\navailability: 16\nlastSeenAt: 1982-12-09T00:00:00Z\nuserId: 8iA88o4d' -u \
    > test.out 2>&1
eval_tap $? 105 'UserStatusNotif' test.out


exit $EXIT_CODE