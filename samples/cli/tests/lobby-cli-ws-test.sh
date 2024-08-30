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

export AB_BASE_URL="http://127.0.0.1:8080"
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
echo "1..106"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

export AB_BASE_URL="http://127.0.0.1:8000"      # Switch to mock websocket server

#- 2 AcceptFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: acceptFriendsNotif\nfriendId: rj2Ihs40' -u \
    > test.out 2>&1
eval_tap $? 2 'AcceptFriendsNotif' test.out

#- 3 AcceptFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: acceptFriendsRequest\nid: YWu9EX9U\nfriendId: kS2a1dLd' -u \
    > test.out 2>&1
eval_tap $? 3 'AcceptFriendsRequest' test.out

#- 4 AcceptFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: acceptFriendsResponse\nid: 7HkaD7x1\ncode: 77' -u \
    > test.out 2>&1
eval_tap $? 4 'AcceptFriendsResponse' test.out

#- 5 BlockPlayerNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: blockPlayerNotif\nblockedUserId: Efb6Buq5\nuserId: XePHTmOg' -u \
    > test.out 2>&1
eval_tap $? 5 'BlockPlayerNotif' test.out

#- 6 BlockPlayerRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: blockPlayerRequest\nid: gZF1JXGv\nblockUserId: IFQ1mPCc\nnamespace: VkzapLGX' -u \
    > test.out 2>&1
eval_tap $? 6 'BlockPlayerRequest' test.out

#- 7 BlockPlayerResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: blockPlayerResponse\nid: tuHc2hsw\nblockUserId: H2E2hBYG\ncode: 71\nnamespace: CSX3OMa4' -u \
    > test.out 2>&1
eval_tap $? 7 'BlockPlayerResponse' test.out

#- 8 CancelFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelFriendsNotif\nuserId: o8P9F0Oo' -u \
    > test.out 2>&1
eval_tap $? 8 'CancelFriendsNotif' test.out

#- 9 CancelFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelFriendsRequest\nid: pJFf2DcC\nfriendId: qGVTR11j' -u \
    > test.out 2>&1
eval_tap $? 9 'CancelFriendsRequest' test.out

#- 10 CancelFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelFriendsResponse\nid: Gp67fJLn\ncode: 96' -u \
    > test.out 2>&1
eval_tap $? 10 'CancelFriendsResponse' test.out

#- 11 CancelMatchmakingRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelMatchmakingRequest\nid: C2kMuvFD\ngameMode: n8asXKaS\nisTempParty: False' -u \
    > test.out 2>&1
eval_tap $? 11 'CancelMatchmakingRequest' test.out

#- 12 CancelMatchmakingResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: cancelMatchmakingResponse\nid: KRgfGxfV\ncode: 84' -u \
    > test.out 2>&1
eval_tap $? 12 'CancelMatchmakingResponse' test.out

#- 13 ChannelChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: channelChatNotif\nchannelSlug: rIcvJbqo\nfrom: nNICLRqs\npayload: DmMmRx1b\nsentAt: 1980-06-20T00:00:00Z' -u \
    > test.out 2>&1
eval_tap $? 13 'ChannelChatNotif' test.out

#- 14 ClientResetRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: clientResetRequest\nnamespace: Kf18GvlP\nuserId: 5so3ocMA' -u \
    > test.out 2>&1
eval_tap $? 14 'ClientResetRequest' test.out

#- 15 ConnectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: connectNotif\nlobbySessionID: WsdEwXT3' -u \
    > test.out 2>&1
eval_tap $? 15 'ConnectNotif' test.out

#- 16 DisconnectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: disconnectNotif\nconnectionId: cf76RTs0\nnamespace: 7pflkkiH' -u \
    > test.out 2>&1
eval_tap $? 16 'DisconnectNotif' test.out

#- 17 DsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: dsNotif\nalternateIps: [OB5zZwPq,U3pvCyhM,NdRHI06U]\ncustomAttribute: 9Sg5J3iS\ndeployment: 5tCG0tpC\ngameVersion: Ulj3rM27\nimageVersion: HXivvVAI\nip: hruP9pzd\nisOK: True\nisOverrideGameVersion: False\nlastUpdate: KrUIAPUO\nmatchId: R9Hejwef\nmessage: zwCveiK5\nnamespace: L8rssfhP\npodName: AdDzvZce\nport: 5\nports: {"v1M4G6JY":22,"efaSvZvz":19,"zIE0MXws":69}\nprotocol: tn3iu5dr\nprovider: yh5krN8t\nregion: aHN7vh0J\nsessionId: GfnieSEt\nstatus: P4qOgrrH' -u \
    > test.out 2>&1
eval_tap $? 17 'DsNotif' test.out

#- 18 ErrorNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: errorNotif\nmessage: GzZvz1gU' -u \
    > test.out 2>&1
eval_tap $? 18 'ErrorNotif' test.out

#- 19 ExitAllChannel
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: exitAllChannel\nnamespace: IBvssvTH\nuserId: hll7b4jj' -u \
    > test.out 2>&1
eval_tap $? 19 'ExitAllChannel' test.out

#- 20 FriendsStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: friendsStatusRequest\nid: H63SwrcZ' -u \
    > test.out 2>&1
eval_tap $? 20 'FriendsStatusRequest' test.out

#- 21 FriendsStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: friendsStatusResponse\nid: voFyDoox\nactivity: [VZXXxxNT,diT9kWFu,7p3YuJKo]\navailability: [oXqAqCCy,zjBE2uoW,iMWP5e4e]\ncode: 66\nfriendIds: [qIYatN8G,4avherJY,B0Nv6ExT]\nlastSeenAt: [1997-01-24T00:00:00Z,1977-09-02T00:00:00Z,1999-08-18T00:00:00Z]' -u \
    > test.out 2>&1
eval_tap $? 21 'FriendsStatusResponse' test.out

#- 22 GetAllSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getAllSessionAttributeRequest\nid: 7YZfEawa' -u \
    > test.out 2>&1
eval_tap $? 22 'GetAllSessionAttributeRequest' test.out

#- 23 GetAllSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getAllSessionAttributeResponse\nid: CQk06olt\nattributes: {"OM15887A":"MWlZEfwp","NMivNaU1":"9xDULnY3","uzCBh0yT":"6pWdq5IN"}\ncode: 29' -u \
    > test.out 2>&1
eval_tap $? 23 'GetAllSessionAttributeResponse' test.out

#- 24 GetFriendshipStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getFriendshipStatusRequest\nid: RttPN4E7\nfriendId: emfn3eWT' -u \
    > test.out 2>&1
eval_tap $? 24 'GetFriendshipStatusRequest' test.out

#- 25 GetFriendshipStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getFriendshipStatusResponse\nid: t5iqTOW1\ncode: 46\nfriendshipStatus: lEeYd16p' -u \
    > test.out 2>&1
eval_tap $? 25 'GetFriendshipStatusResponse' test.out

#- 26 GetSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getSessionAttributeRequest\nid: b5EGDFx9\nkey: LmesZeh6' -u \
    > test.out 2>&1
eval_tap $? 26 'GetSessionAttributeRequest' test.out

#- 27 GetSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: getSessionAttributeResponse\nid: JY5Adjoo\ncode: 88\nvalue: oOn8bfm3' -u \
    > test.out 2>&1
eval_tap $? 27 'GetSessionAttributeResponse' test.out

#- 28 Heartbeat
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: heartbeat' -u \
    > test.out 2>&1
eval_tap $? 28 'Heartbeat' test.out

#- 29 JoinDefaultChannelRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: joinDefaultChannelRequest\nid: Rn2S1end' -u \
    > test.out 2>&1
eval_tap $? 29 'JoinDefaultChannelRequest' test.out

#- 30 JoinDefaultChannelResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: joinDefaultChannelResponse\nid: YrUKTguU\nchannelSlug: VXp2f1WR\ncode: 35' -u \
    > test.out 2>&1
eval_tap $? 30 'JoinDefaultChannelResponse' test.out

#- 31 ListIncomingFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listIncomingFriendsRequest\nid: LFf5Mj3Y' -u \
    > test.out 2>&1
eval_tap $? 31 'ListIncomingFriendsRequest' test.out

#- 32 ListIncomingFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listIncomingFriendsResponse\nid: UThe7crN\ncode: 88\nuserIds: [GfaxQmnT,3PJm7ag6,SZowooi3]' -u \
    > test.out 2>&1
eval_tap $? 32 'ListIncomingFriendsResponse' test.out

#- 33 ListOfFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOfFriendsRequest\nid: MJ3hSQ9b\nfriendId: j5MLSOmC' -u \
    > test.out 2>&1
eval_tap $? 33 'ListOfFriendsRequest' test.out

#- 34 ListOfFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOfFriendsResponse\nid: sGTLCFo6\ncode: 100\nfriendIds: [c4VBRNYH,bZ3xEFh1,ROmLP5xE]' -u \
    > test.out 2>&1
eval_tap $? 34 'ListOfFriendsResponse' test.out

#- 35 ListOnlineFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOnlineFriendsRequest\nid: ubj9hFyG' -u \
    > test.out 2>&1
eval_tap $? 35 'ListOnlineFriendsRequest' test.out

#- 36 ListOutgoingFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOutgoingFriendsRequest\nid: VQNkyd08' -u \
    > test.out 2>&1
eval_tap $? 36 'ListOutgoingFriendsRequest' test.out

#- 37 ListOutgoingFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: listOutgoingFriendsResponse\nid: TgHZjcDL\ncode: 4\nfriendIds: [Qbjj2SO2,v0Y68FFK,LSHmYl3n]' -u \
    > test.out 2>&1
eval_tap $? 37 'ListOutgoingFriendsResponse' test.out

#- 38 MatchmakingNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: matchmakingNotif\ncounterPartyMember: [3xDpzGH0,SQWm3NDq,jm7mvojO]\nmatchId: edMmlTJp\nmessage: ce7PwSxw\npartyMember: [2Pi8JWDO,Aa1WNsxH,RzTwpiUF]\nreadyDuration: 15\nstatus: h4fR6xkM' -u \
    > test.out 2>&1
eval_tap $? 38 'MatchmakingNotif' test.out

#- 39 MessageNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: messageNotif\nid: PPcMeyRZ\nfrom: KmUrcI98\npayload: R0BeDGqO\nsentAt: 1980-06-16T00:00:00Z\nto: 2sU4MuZ7\ntopic: NeZwUyel' -u \
    > test.out 2>&1
eval_tap $? 39 'MessageNotif' test.out

#- 40 MessageSessionNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: messageSessionNotif\nid: H12aQOpG\nfrom: jtzvVDZv\npayload: BQRmRZLd\nsentAt: 1975-03-14T00:00:00Z\nto: ALrXKY5v\ntopic: RO4KcYOX' -u \
    > test.out 2>&1
eval_tap $? 40 'MessageSessionNotif' test.out

#- 41 OfflineNotificationRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: offlineNotificationRequest\nid: BMgVdZKZ' -u \
    > test.out 2>&1
eval_tap $? 41 'OfflineNotificationRequest' test.out

#- 42 OfflineNotificationResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: offlineNotificationResponse\nid: ukhg42rR\ncode: 74' -u \
    > test.out 2>&1
eval_tap $? 42 'OfflineNotificationResponse' test.out

#- 43 OnlineFriends
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: onlineFriends\nid: dlV6vGnG\ncode: 99\nonlineFriendIds: [GvYwmFGE,r8kshSa7,uVorBo73]' -u \
    > test.out 2>&1
eval_tap $? 43 'OnlineFriends' test.out

#- 44 PartyChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatNotif\nid: DWSFIexR\nfrom: HAxwgmyK\npayload: UcSBLMQs\nreceivedAt: 1994-02-04T00:00:00Z\nto: mH6qE9sS' -u \
    > test.out 2>&1
eval_tap $? 44 'PartyChatNotif' test.out

#- 45 PartyChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatRequest\nid: cmKSWd8N\nfrom: gXbU6dxp\npayload: gRVH06Oq\nreceivedAt: 1975-09-22T00:00:00Z\nto: VMcZD5bZ' -u \
    > test.out 2>&1
eval_tap $? 45 'PartyChatRequest' test.out

#- 46 PartyChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyChatResponse\nid: qpoSIvbi\ncode: 10' -u \
    > test.out 2>&1
eval_tap $? 46 'PartyChatResponse' test.out

#- 47 PartyCreateRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyCreateRequest\nid: A8txeKSA' -u \
    > test.out 2>&1
eval_tap $? 47 'PartyCreateRequest' test.out

#- 48 PartyCreateResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyCreateResponse\nid: puMQN7uG\ncode: 77\ninvitationToken: ZrVeExFp\ninvitees: FccHjxXj\nleaderId: LGnAt0sB\nmembers: FWjP67OY\npartyId: XUNGAkbd' -u \
    > test.out 2>&1
eval_tap $? 48 'PartyCreateResponse' test.out

#- 49 PartyDataUpdateNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyDataUpdateNotif\ncustomAttributes: {"n37nJLNt":{},"hwTW9ymu":{},"o2gC8V00":{}}\ninvitees: [Kg1Nhwa6,tVY13uhP,FG1skcej]\nleader: 5j5Gbtoz\nmembers: [I5AhjVuf,aBjxDYsE,qIzAFVmd]\nnamespace: fgvASQi3\npartyId: WpT5jLLC\nupdatedAt: 1991-09-05T00:00:00Z' -u \
    > test.out 2>&1
eval_tap $? 49 'PartyDataUpdateNotif' test.out

#- 50 PartyGetInvitedNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyGetInvitedNotif\nfrom: yogd65Kc\ninvitationToken: 6E9oI4GN\npartyId: beWvblll' -u \
    > test.out 2>&1
eval_tap $? 50 'PartyGetInvitedNotif' test.out

#- 51 PartyInfoRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInfoRequest\nid: aDvkm8vR' -u \
    > test.out 2>&1
eval_tap $? 51 'PartyInfoRequest' test.out

#- 52 PartyInfoResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInfoResponse\nid: gHdjr8CB\ncode: 7\ncustomAttributes: {"v0vBSUa8":{},"RfvFVFsP":{},"IjW2qDNp":{}}\ninvitationToken: SLPYQjcc\ninvitees: mchwTGeC\nleaderId: L5RTYvsK\nmembers: 5aNcmkyg\npartyId: Bk5bKkPT' -u \
    > test.out 2>&1
eval_tap $? 52 'PartyInfoResponse' test.out

#- 53 PartyInviteNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteNotif\ninviteeId: jcsC6d7n\ninviterId: vkhm6Nw4' -u \
    > test.out 2>&1
eval_tap $? 53 'PartyInviteNotif' test.out

#- 54 PartyInviteRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteRequest\nid: CHPU2S6f\nfriendId: KNSrP1Ht' -u \
    > test.out 2>&1
eval_tap $? 54 'PartyInviteRequest' test.out

#- 55 PartyInviteResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyInviteResponse\nid: Q2HCJX37\ncode: 51' -u \
    > test.out 2>&1
eval_tap $? 55 'PartyInviteResponse' test.out

#- 56 PartyJoinNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinNotif\nuserId: ya76IrI7' -u \
    > test.out 2>&1
eval_tap $? 56 'PartyJoinNotif' test.out

#- 57 PartyJoinRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinRequest\nid: tAx2gKn8\ninvitationToken: gZxdCIoa\npartyId: Zko8yq8H' -u \
    > test.out 2>&1
eval_tap $? 57 'PartyJoinRequest' test.out

#- 58 PartyJoinResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyJoinResponse\nid: 8l9A2xoc\ncode: 36\ninvitationToken: uztaniQ5\ninvitees: nAnYgvF9\nleaderId: 0hbyXntb\nmembers: CeiRuQDP\npartyId: AEd2b2Oo' -u \
    > test.out 2>&1
eval_tap $? 58 'PartyJoinResponse' test.out

#- 59 PartyKickNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickNotif\nleaderId: yTrXjHJp\npartyId: 0pH0cEjF\nuserId: 7H00WuXf' -u \
    > test.out 2>&1
eval_tap $? 59 'PartyKickNotif' test.out

#- 60 PartyKickRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickRequest\nid: G92q9dzi\nmemberId: H3h6Lb4I' -u \
    > test.out 2>&1
eval_tap $? 60 'PartyKickRequest' test.out

#- 61 PartyKickResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyKickResponse\nid: ECJ9u67e\ncode: 100' -u \
    > test.out 2>&1
eval_tap $? 61 'PartyKickResponse' test.out

#- 62 PartyLeaveNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveNotif\nleaderId: 208sVhcD\nuserId: MHan2HW8' -u \
    > test.out 2>&1
eval_tap $? 62 'PartyLeaveNotif' test.out

#- 63 PartyLeaveRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveRequest\nid: 2wC6H9q8\nignoreUserRegistry: False' -u \
    > test.out 2>&1
eval_tap $? 63 'PartyLeaveRequest' test.out

#- 64 PartyLeaveResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyLeaveResponse\nid: vEdyvbC4\ncode: 24' -u \
    > test.out 2>&1
eval_tap $? 64 'PartyLeaveResponse' test.out

#- 65 PartyPromoteLeaderRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyPromoteLeaderRequest\nid: ESXqqg6R\nnewLeaderUserId: yIDXhL9i' -u \
    > test.out 2>&1
eval_tap $? 65 'PartyPromoteLeaderRequest' test.out

#- 66 PartyPromoteLeaderResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyPromoteLeaderResponse\nid: dnvI0SrJ\ncode: 56\ninvitationToken: J2ugbTLi\ninvitees: Q18JAO8u\nleaderId: GMPz9cS5\nmembers: ScESBpuW\npartyId: fFKi2jkI' -u \
    > test.out 2>&1
eval_tap $? 66 'PartyPromoteLeaderResponse' test.out

#- 67 PartyRejectNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectNotif\nleaderId: wxKTVvbk\npartyId: gk353SaU\nuserId: NzdoJ9qB' -u \
    > test.out 2>&1
eval_tap $? 67 'PartyRejectNotif' test.out

#- 68 PartyRejectRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectRequest\nid: 8pg5DFMe\ninvitationToken: 5Eesm5Eo\npartyId: KXXlINDl' -u \
    > test.out 2>&1
eval_tap $? 68 'PartyRejectRequest' test.out

#- 69 PartyRejectResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: partyRejectResponse\nid: 5K0ulxv5\ncode: 25\npartyId: 69snG78a' -u \
    > test.out 2>&1
eval_tap $? 69 'PartyRejectResponse' test.out

#- 70 PersonalChatHistoryRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatHistoryRequest\nid: zQdgmzEZ\nfriendId: r8yozkwB' -u \
    > test.out 2>&1
eval_tap $? 70 'PersonalChatHistoryRequest' test.out

#- 71 PersonalChatHistoryResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatHistoryResponse\nid: WR1ToYrt\nchat: J6GKPkcX\ncode: 88\nfriendId: QohnjWwo' -u \
    > test.out 2>&1
eval_tap $? 71 'PersonalChatHistoryResponse' test.out

#- 72 PersonalChatNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatNotif\nid: S7PT6Dnq\nfrom: 82toypPx\npayload: 3OTUt2Du\nreceivedAt: 1978-01-03T00:00:00Z\nto: IzVrINeE' -u \
    > test.out 2>&1
eval_tap $? 72 'PersonalChatNotif' test.out

#- 73 PersonalChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatRequest\nid: 63aAGBqw\nfrom: D51hAmkV\npayload: AePsgNGL\nreceivedAt: 1975-10-30T00:00:00Z\nto: WflwUCTR' -u \
    > test.out 2>&1
eval_tap $? 73 'PersonalChatRequest' test.out

#- 74 PersonalChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: personalChatResponse\nid: m4gEsg0h\ncode: 91' -u \
    > test.out 2>&1
eval_tap $? 74 'PersonalChatResponse' test.out

#- 75 RefreshTokenRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: refreshTokenRequest\nid: iwq7QoMZ\ntoken: c05nbbxd' -u \
    > test.out 2>&1
eval_tap $? 75 'RefreshTokenRequest' test.out

#- 76 RefreshTokenResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: refreshTokenResponse\nid: 28hQcENu\ncode: 82' -u \
    > test.out 2>&1
eval_tap $? 76 'RefreshTokenResponse' test.out

#- 77 RejectFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsNotif\nuserId: tXdu9icU' -u \
    > test.out 2>&1
eval_tap $? 77 'RejectFriendsNotif' test.out

#- 78 RejectFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsRequest\nid: SDiknXSy\nfriendId: h8m5Ejwr' -u \
    > test.out 2>&1
eval_tap $? 78 'RejectFriendsRequest' test.out

#- 79 RejectFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rejectFriendsResponse\nid: zbwB2RuV\ncode: 17' -u \
    > test.out 2>&1
eval_tap $? 79 'RejectFriendsResponse' test.out

#- 80 RematchmakingNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: rematchmakingNotif\nbanDuration: 22' -u \
    > test.out 2>&1
eval_tap $? 80 'RematchmakingNotif' test.out

#- 81 RequestFriendsNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsNotif\nfriendId: Berp8ZKg' -u \
    > test.out 2>&1
eval_tap $? 81 'RequestFriendsNotif' test.out

#- 82 RequestFriendsRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsRequest\nid: lgVEPnpv\nfriendId: jLsmoUu1' -u \
    > test.out 2>&1
eval_tap $? 82 'RequestFriendsRequest' test.out

#- 83 RequestFriendsResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: requestFriendsResponse\nid: RYJY39AS\ncode: 42' -u \
    > test.out 2>&1
eval_tap $? 83 'RequestFriendsResponse' test.out

#- 84 SendChannelChatRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: sendChannelChatRequest\nid: XHDYteHH\nchannelSlug: aKq5qSSl\npayload: 2xBN42Q1' -u \
    > test.out 2>&1
eval_tap $? 84 'SendChannelChatRequest' test.out

#- 85 SendChannelChatResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: sendChannelChatResponse\nid: 20UXkiYz\ncode: 93' -u \
    > test.out 2>&1
eval_tap $? 85 'SendChannelChatResponse' test.out

#- 86 SetReadyConsentNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentNotif\nmatchId: 65qeRV0W\nuserId: MtP7oJI7' -u \
    > test.out 2>&1
eval_tap $? 86 'SetReadyConsentNotif' test.out

#- 87 SetReadyConsentRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentRequest\nid: ZvkhKTld\nmatchId: VeSdL7yd' -u \
    > test.out 2>&1
eval_tap $? 87 'SetReadyConsentRequest' test.out

#- 88 SetReadyConsentResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setReadyConsentResponse\nid: Uw0qnStz\ncode: 61' -u \
    > test.out 2>&1
eval_tap $? 88 'SetReadyConsentResponse' test.out

#- 89 SetSessionAttributeRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setSessionAttributeRequest\nid: KixttNo9\nkey: 0s9dD7yu\nnamespace: qkkRQi9V\nvalue: t9WbKtB1' -u \
    > test.out 2>&1
eval_tap $? 89 'SetSessionAttributeRequest' test.out

#- 90 SetSessionAttributeResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setSessionAttributeResponse\nid: QVG2thOu\ncode: 83' -u \
    > test.out 2>&1
eval_tap $? 90 'SetSessionAttributeResponse' test.out

#- 91 SetUserStatusRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setUserStatusRequest\nid: akrhIGdD\nactivity: KZf7Qlse\navailability: 71' -u \
    > test.out 2>&1
eval_tap $? 91 'SetUserStatusRequest' test.out

#- 92 SetUserStatusResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: setUserStatusResponse\nid: Wop0bm8N\ncode: 15' -u \
    > test.out 2>&1
eval_tap $? 92 'SetUserStatusResponse' test.out

#- 93 ShutdownNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: shutdownNotif\nmessage: TchI3H8b' -u \
    > test.out 2>&1
eval_tap $? 93 'ShutdownNotif' test.out

#- 94 SignalingP2PNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: signalingP2PNotif\ndestinationId: cNEYUqKD\nmessage: 8qM5TuOF' -u \
    > test.out 2>&1
eval_tap $? 94 'SignalingP2PNotif' test.out

#- 95 StartMatchmakingRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: startMatchmakingRequest\nid: xXEW0ZRb\nextraAttributes: nqbTKO7a\ngameMode: EPPUk4J6\npartyAttributes: {"snrVzqCF":{},"UMZyYqzw":{},"YF6TekOv":{}}\npriority: 7\ntempParty: zweTmVOO' -u \
    > test.out 2>&1
eval_tap $? 95 'StartMatchmakingRequest' test.out

#- 96 StartMatchmakingResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: startMatchmakingResponse\nid: gjYIHIG5\ncode: 81' -u \
    > test.out 2>&1
eval_tap $? 96 'StartMatchmakingResponse' test.out

#- 97 UnblockPlayerNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerNotif\nunblockedUserId: oIqQhYhn\nuserId: qk5ACUQ8' -u \
    > test.out 2>&1
eval_tap $? 97 'UnblockPlayerNotif' test.out

#- 98 UnblockPlayerRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerRequest\nid: 65Y4HRYk\nnamespace: ijuPGuM8\nunblockedUserId: 6FdUguSl' -u \
    > test.out 2>&1
eval_tap $? 98 'UnblockPlayerRequest' test.out

#- 99 UnblockPlayerResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unblockPlayerResponse\nid: LMRfeuxt\ncode: 72\nnamespace: MBCDtcIM\nunblockedUserId: ve5IGDIx' -u \
    > test.out 2>&1
eval_tap $? 99 'UnblockPlayerResponse' test.out

#- 100 UnfriendNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendNotif\nfriendId: VlzuYjo2' -u \
    > test.out 2>&1
eval_tap $? 100 'UnfriendNotif' test.out

#- 101 UnfriendRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendRequest\nid: eQq3sce9\nfriendId: RRixo9VD' -u \
    > test.out 2>&1
eval_tap $? 101 'UnfriendRequest' test.out

#- 102 UnfriendResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: unfriendResponse\nid: J00jKC9p\ncode: 83' -u \
    > test.out 2>&1
eval_tap $? 102 'UnfriendResponse' test.out

#- 103 UserBannedNotification
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userBannedNotification' -u \
    > test.out 2>&1
eval_tap $? 103 'UserBannedNotification' test.out

#- 104 UserMetricRequest
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userMetricRequest\nid: AHsRrh8i' -u \
    > test.out 2>&1
eval_tap $? 104 'UserMetricRequest' test.out

#- 105 UserMetricResponse
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userMetricResponse\nid: mMH8xKwD\ncode: 85\nplayerCount: 18' -u \
    > test.out 2>&1
eval_tap $? 105 'UserMetricResponse' test.out

#- 106 UserStatusNotif
./ng net.accelbyte.sdk.cli.Main lobbyWebsocket -m $'type: userStatusNotif\nactivity: OwBINbje\navailability: 80\nlastSeenAt: 1999-07-02T00:00:00Z\nuserId: t6mFTsrR' -u \
    > test.out 2>&1
eval_tap $? 106 'UserStatusNotif' test.out


exit $EXIT_CODE