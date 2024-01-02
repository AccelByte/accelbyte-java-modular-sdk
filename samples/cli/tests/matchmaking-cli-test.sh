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
echo "1..39"

#- 1 Login
./ng net.accelbyte.sdk.cli.Main loginClient \
    > test.out 2>&1
eval_tap $? 1 'Login' test.out

if [ $EXIT_CODE -ne 0 ]; then
  echo "Bail out! Login failed."
  exit $EXIT_CODE
fi

touch "tmp.dat"

#- 2 GetHealthcheckInfo
./ng net.accelbyte.sdk.cli.Main matchmaking getHealthcheckInfo \
    > test.out 2>&1
eval_tap $? 2 'GetHealthcheckInfo' test.out

#- 3 HandlerV3Healthz
./ng net.accelbyte.sdk.cli.Main matchmaking handlerV3Healthz \
    > test.out 2>&1
eval_tap $? 3 'HandlerV3Healthz' test.out

#- 4 GetAllChannelsHandler
./ng net.accelbyte.sdk.cli.Main matchmaking getAllChannelsHandler \
    --namespace "$AB_NAMESPACE" \
    --limit '15' \
    --offset '35' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatch", "deployment": "0oE5pL8M", "description": "R4V7vxRZ", "find_match_timeout_seconds": 96, "game_mode": "8H0K2q7P", "joinable": false, "max_delay_ms": 91, "region_expansion_range_ms": 41, "region_expansion_rate_ms": 26, "region_latency_initial_range_ms": 70, "region_latency_max_ms": 2, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 23, "min": 47, "name": "OijZHCP3"}, {"max": 82, "min": 37, "name": "8OYIiTho"}, {"max": 65, "min": 89, "name": "bftEMHV4"}], [{"max": 100, "min": 94, "name": "8k8Ec4f0"}, {"max": 23, "min": 90, "name": "AvWTM0wN"}, {"max": 7, "min": 99, "name": "Ri2HIjTF"}], [{"max": 1, "min": 7, "name": "pujVGNZd"}, {"max": 93, "min": 75, "name": "z0tBSVlh"}, {"max": 82, "min": 23, "name": "Xut7TjVf"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 87, "role_flexing_second": 96}, "max_number": 71, "min_number": 76, "player_max_number": 2, "player_min_number": 11}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 43, "min": 39, "name": "c5lHHhbk"}, {"max": 29, "min": 50, "name": "H5AoohoS"}, {"max": 66, "min": 48, "name": "EfDSg3IY"}], [{"max": 29, "min": 1, "name": "L0wBZDuG"}, {"max": 48, "min": 32, "name": "VMBhelED"}, {"max": 87, "min": 26, "name": "JMoRUbcQ"}], [{"max": 11, "min": 34, "name": "aUGzxVs3"}, {"max": 49, "min": 81, "name": "h2ncjGdS"}, {"max": 68, "min": 53, "name": "8lzsN3PF"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 73, "role_flexing_second": 90}, "duration": 8, "max_number": 94, "min_number": 83, "player_max_number": 26, "player_min_number": 60}, {"combination": {"alliances": [[{"max": 83, "min": 55, "name": "MJM5eW3x"}, {"max": 14, "min": 2, "name": "J9CfNwSX"}, {"max": 68, "min": 29, "name": "4qlJ7GT2"}], [{"max": 41, "min": 13, "name": "wFcoMD9w"}, {"max": 99, "min": 57, "name": "eJ6E9zR4"}, {"max": 74, "min": 38, "name": "RD8PXwUi"}], [{"max": 29, "min": 82, "name": "4SwmBnVR"}, {"max": 35, "min": 52, "name": "JBFziB40"}, {"max": 5, "min": 93, "name": "vm2LqIHK"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 57, "role_flexing_second": 26}, "duration": 66, "max_number": 48, "min_number": 76, "player_max_number": 12, "player_min_number": 70}, {"combination": {"alliances": [[{"max": 39, "min": 79, "name": "XqWPb5Sc"}, {"max": 92, "min": 49, "name": "MqEp7TzZ"}, {"max": 23, "min": 48, "name": "sHTfU5ix"}], [{"max": 94, "min": 61, "name": "vsgDQ3Jl"}, {"max": 49, "min": 30, "name": "inHgsPBH"}, {"max": 17, "min": 27, "name": "BxjFYNhu"}], [{"max": 95, "min": 32, "name": "O1HhTtBu"}, {"max": 37, "min": 41, "name": "a8tA7Cns"}, {"max": 16, "min": 10, "name": "6H1RmN2S"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 97, "role_flexing_second": 80}, "duration": 49, "max_number": 40, "min_number": 75, "player_max_number": 97, "player_min_number": 96}], "batch_size": 59, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 51, "flex_flat_step_range": 2, "flex_immunity_count": 37, "flex_range_max": 72, "flex_rate_ms": 56, "flex_step_max": 63, "force_authority_match": false, "initial_step_range": 44, "mmr_max": 24, "mmr_mean": 0, "mmr_min": 42, "mmr_std_dev": 37, "override_mmr_data": false, "use_bucket_mmr": false, "use_flat_flex_step": true}, "flexing_rule": [{"attribute": "KUfDS1Ik", "criteria": "gtmu8MHq", "duration": 31, "reference": 0.026312122422508577}, {"attribute": "EouCKgSj", "criteria": "yuRmWiI1", "duration": 55, "reference": 0.062599403957727}, {"attribute": "ocq3w5LG", "criteria": "dOv9uViN", "duration": 55, "reference": 0.07593826805870796}], "match_options": {"options": [{"name": "kwYd1vz8", "type": "qRJT6xpk"}, {"name": "W2jMCa19", "type": "KTr0kQTK"}, {"name": "srh1eUnD", "type": "6iiRSsBB"}]}, "matching_rule": [{"attribute": "SlcS4b3t", "criteria": "egL3aWiv", "reference": 0.9127137405523684}, {"attribute": "SZ9s6a06", "criteria": "2G2y7lTg", "reference": 0.5951301716737917}, {"attribute": "EPPCYOxs", "criteria": "H1Busw33", "reference": 0.24976277540653058}], "rebalance_enable": false, "sort_ticket": {"search_result": "oldestTicketAge", "ticket_queue": "none"}, "sort_tickets": [{"search_result": "largestPartySize", "threshold": 21, "ticket_queue": "distance"}, {"search_result": "random", "threshold": 34, "ticket_queue": "oldestTicketAge"}, {"search_result": "largestPartySize", "threshold": 58, "ticket_queue": "random"}], "sub_game_modes": {"FKAWZJvr": {"alliance": {"combination": {"alliances": [[{"max": 49, "min": 61, "name": "Hr58vagN"}, {"max": 61, "min": 60, "name": "RNyN2zZY"}, {"max": 31, "min": 4, "name": "6hNIUwyy"}], [{"max": 97, "min": 98, "name": "Xs1B0YGO"}, {"max": 56, "min": 68, "name": "BRzU5iBl"}, {"max": 70, "min": 90, "name": "C8Xtd5df"}], [{"max": 6, "min": 80, "name": "WaVAB5DX"}, {"max": 75, "min": 56, "name": "5ZYoszcP"}, {"max": 61, "min": 81, "name": "OpntzceC"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 62, "role_flexing_second": 28}, "max_number": 86, "min_number": 26, "player_max_number": 42, "player_min_number": 66}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 77, "min": 18, "name": "g3oEY0ig"}, {"max": 66, "min": 7, "name": "3F2fgMnH"}, {"max": 93, "min": 91, "name": "36IjAOZd"}], [{"max": 14, "min": 90, "name": "67lkya8H"}, {"max": 27, "min": 20, "name": "T69v9ZOp"}, {"max": 14, "min": 47, "name": "LsAg9pGK"}], [{"max": 54, "min": 72, "name": "qVJHWDRa"}, {"max": 93, "min": 23, "name": "uVVIFsAV"}, {"max": 49, "min": 69, "name": "KN9FUc1f"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 82, "role_flexing_second": 63}, "duration": 85, "max_number": 97, "min_number": 100, "player_max_number": 81, "player_min_number": 77}, {"combination": {"alliances": [[{"max": 25, "min": 79, "name": "y8wQf3JH"}, {"max": 74, "min": 6, "name": "l0n2KTVD"}, {"max": 85, "min": 4, "name": "KVB76Bqh"}], [{"max": 45, "min": 98, "name": "B5yaE8h5"}, {"max": 91, "min": 53, "name": "PP5FJKOi"}, {"max": 30, "min": 46, "name": "Byb5RwdK"}], [{"max": 78, "min": 97, "name": "wp6CCMnn"}, {"max": 57, "min": 56, "name": "x6q1qld7"}, {"max": 58, "min": 14, "name": "yuilE5Dz"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 94, "role_flexing_second": 13}, "duration": 4, "max_number": 20, "min_number": 55, "player_max_number": 3, "player_min_number": 5}, {"combination": {"alliances": [[{"max": 72, "min": 14, "name": "s4VUrf3x"}, {"max": 31, "min": 5, "name": "R2nzz48l"}, {"max": 53, "min": 89, "name": "i5KhDXbD"}], [{"max": 76, "min": 48, "name": "Wh7gZcYW"}, {"max": 91, "min": 7, "name": "7bQoAXYq"}, {"max": 8, "min": 68, "name": "vPlKgJxa"}], [{"max": 44, "min": 63, "name": "IK9eNJMu"}, {"max": 57, "min": 13, "name": "JE6XP2pc"}, {"max": 55, "min": 91, "name": "vxAoOLtk"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 45, "role_flexing_second": 69}, "duration": 6, "max_number": 8, "min_number": 23, "player_max_number": 11, "player_min_number": 32}], "name": "poolr7XN"}, "WMOqf9CS": {"alliance": {"combination": {"alliances": [[{"max": 2, "min": 2, "name": "20gHva1N"}, {"max": 13, "min": 80, "name": "bLg3K7Sv"}, {"max": 52, "min": 12, "name": "P4qDPXQe"}], [{"max": 36, "min": 21, "name": "rO6aO85O"}, {"max": 69, "min": 94, "name": "kw0hzrCk"}, {"max": 9, "min": 86, "name": "6anZUTkK"}], [{"max": 32, "min": 68, "name": "Of0wx07Y"}, {"max": 1, "min": 49, "name": "jxc1irei"}, {"max": 35, "min": 99, "name": "deCsd4IT"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 25, "role_flexing_second": 31}, "max_number": 99, "min_number": 37, "player_max_number": 0, "player_min_number": 17}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 38, "min": 58, "name": "s9lGDzDX"}, {"max": 61, "min": 2, "name": "71s7ylN7"}, {"max": 16, "min": 95, "name": "G62E6kXj"}], [{"max": 68, "min": 94, "name": "2Eq1qXmD"}, {"max": 18, "min": 14, "name": "sf6JX6YA"}, {"max": 26, "min": 76, "name": "AfmOUovb"}], [{"max": 11, "min": 41, "name": "uIt0FmtZ"}, {"max": 69, "min": 63, "name": "woUGEZGZ"}, {"max": 45, "min": 17, "name": "maN4PyUs"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 6, "role_flexing_second": 52}, "duration": 32, "max_number": 99, "min_number": 58, "player_max_number": 47, "player_min_number": 6}, {"combination": {"alliances": [[{"max": 2, "min": 71, "name": "MmnJOBXL"}, {"max": 18, "min": 100, "name": "n21v8rZn"}, {"max": 94, "min": 62, "name": "TaGxd5VJ"}], [{"max": 27, "min": 40, "name": "ion0FWVl"}, {"max": 8, "min": 55, "name": "s2ngTLgJ"}, {"max": 5, "min": 23, "name": "Dp2IjrMZ"}], [{"max": 45, "min": 84, "name": "Omychj29"}, {"max": 95, "min": 73, "name": "5SxxC1un"}, {"max": 48, "min": 34, "name": "frwGoUSn"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 100, "role_flexing_second": 75}, "duration": 14, "max_number": 70, "min_number": 59, "player_max_number": 55, "player_min_number": 19}, {"combination": {"alliances": [[{"max": 0, "min": 87, "name": "0yTw5XLN"}, {"max": 26, "min": 51, "name": "poGq9Vnn"}, {"max": 84, "min": 99, "name": "4ibl7XQH"}], [{"max": 34, "min": 30, "name": "uxPiPyFt"}, {"max": 19, "min": 22, "name": "akTYnwTR"}, {"max": 47, "min": 52, "name": "RB2jjPbk"}], [{"max": 39, "min": 62, "name": "mEaWT6YT"}, {"max": 16, "min": 88, "name": "nJaBVrf7"}, {"max": 46, "min": 41, "name": "t1UP1xIv"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 78, "role_flexing_second": 21}, "duration": 44, "max_number": 13, "min_number": 14, "player_max_number": 72, "player_min_number": 75}], "name": "baQ0AJeI"}, "dud9NXvz": {"alliance": {"combination": {"alliances": [[{"max": 31, "min": 73, "name": "WIVPebRs"}, {"max": 56, "min": 72, "name": "0hTeSxq9"}, {"max": 31, "min": 73, "name": "EbZfzHpr"}], [{"max": 51, "min": 82, "name": "LAd9Jw8t"}, {"max": 72, "min": 20, "name": "vcawP3tR"}, {"max": 67, "min": 12, "name": "Yoj6NDsZ"}], [{"max": 90, "min": 87, "name": "8dH4cNMJ"}, {"max": 56, "min": 11, "name": "5y95Wfbs"}, {"max": 55, "min": 53, "name": "sCUxTRCw"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 44, "role_flexing_second": 14}, "max_number": 98, "min_number": 93, "player_max_number": 29, "player_min_number": 94}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 4, "min": 69, "name": "JTUtWBfl"}, {"max": 94, "min": 32, "name": "BnK2l2eS"}, {"max": 99, "min": 19, "name": "D4NWQI2J"}], [{"max": 0, "min": 61, "name": "yTHCxlxP"}, {"max": 33, "min": 100, "name": "7ZNQ1hCZ"}, {"max": 1, "min": 46, "name": "w0F6Pq9x"}], [{"max": 47, "min": 16, "name": "M1QsVbw8"}, {"max": 0, "min": 47, "name": "3s97S6O8"}, {"max": 3, "min": 34, "name": "bbAIhgkq"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 51, "role_flexing_second": 6}, "duration": 92, "max_number": 3, "min_number": 74, "player_max_number": 42, "player_min_number": 66}, {"combination": {"alliances": [[{"max": 49, "min": 83, "name": "93wjKr7J"}, {"max": 46, "min": 5, "name": "vkno8Ymv"}, {"max": 50, "min": 69, "name": "z7VBTB1K"}], [{"max": 9, "min": 4, "name": "2TUvqcvW"}, {"max": 22, "min": 59, "name": "UN838ZzW"}, {"max": 71, "min": 51, "name": "HRiZQ4wI"}], [{"max": 46, "min": 22, "name": "b9X5DMeb"}, {"max": 35, "min": 40, "name": "P98DRm1R"}, {"max": 98, "min": 33, "name": "7pSlI22w"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 96, "role_flexing_second": 7}, "duration": 27, "max_number": 6, "min_number": 69, "player_max_number": 9, "player_min_number": 95}, {"combination": {"alliances": [[{"max": 73, "min": 30, "name": "otm5FCQq"}, {"max": 85, "min": 95, "name": "KSbdXZPs"}, {"max": 10, "min": 74, "name": "5lg4ReNM"}], [{"max": 96, "min": 15, "name": "whx0b31L"}, {"max": 50, "min": 77, "name": "4UiQMKVo"}, {"max": 15, "min": 47, "name": "AOc6njyI"}], [{"max": 40, "min": 18, "name": "6czFZ5Fn"}, {"max": 37, "min": 53, "name": "TkeR0qp9"}, {"max": 58, "min": 77, "name": "E9cy2ITw"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 78, "role_flexing_second": 93}, "duration": 100, "max_number": 51, "min_number": 79, "player_max_number": 5, "player_min_number": 90}], "name": "2tyhcYPX"}}, "ticket_flexing_selection": "random", "ticket_flexing_selections": [{"selection": "newest", "threshold": 16}, {"selection": "pivot", "threshold": 38}, {"selection": "oldest", "threshold": 9}], "use_newest_ticket_for_flexing": false}, "session_queue_timeout_seconds": 66, "social_matchmaking": true, "ticket_observability_enable": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName 'khTSes7n' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'bFYmvqKN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "iN6aWdJi", "players": [{"results": [{"attribute": "XSH0nkMB", "value": 0.03401196337908374}, {"attribute": "Vvxj6dX6", "value": 0.13280942063915846}, {"attribute": "HHCP5huW", "value": 0.5422023380795481}], "user_id": "aoWVVUm5"}, {"results": [{"attribute": "7DoG9NKe", "value": 0.2756307871328202}, {"attribute": "PpIsQLvt", "value": 0.9055296788538955}, {"attribute": "EgtXvfYU", "value": 0.2955335222345459}], "user_id": "YpZCXQJa"}, {"results": [{"attribute": "Vado0G1H", "value": 0.25548885865412585}, {"attribute": "erVOHdJ6", "value": 0.1039879359005802}, {"attribute": "55zJQiir", "value": 0.8661231028057729}], "user_id": "ixZAhJQs"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "OftkU8Vm"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "H03qBTAG", "client_version": "5r27qoJo", "deployment": "VReZeFXV", "error_code": 23, "error_message": "sj57J8R4", "game_mode": "JYsqchGM", "is_mock": "E4tabbhS", "joinable": true, "match_id": "67cFDga4", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 4, "party_attributes": {"lmPLzDHM": {}, "dblNVJhm": {}, "HXp6DAIe": {}}, "party_id": "QVGAkLoU", "party_members": [{"extra_attributes": {"zgiHL1ki": {}, "rfhvp5pf": {}, "ZzDK0Oyg": {}}, "user_id": "obdSU4va"}, {"extra_attributes": {"GckJePJJ": {}, "iYIq8pAQ": {}, "aX2RHFED": {}}, "user_id": "KIlyKwBg"}, {"extra_attributes": {"P0GzfM8Q": {}, "AsAfnjY2": {}, "rnzFe7YS": {}}, "user_id": "8U8kVlRN"}], "ticket_created_at": 98, "ticket_id": "n0UuTrj7"}, {"first_ticket_created_at": 7, "party_attributes": {"3l1OqFsj": {}, "FpbXkpJ5": {}, "fwhKdWzD": {}}, "party_id": "n7heWRrL", "party_members": [{"extra_attributes": {"KhsT7rLS": {}, "bPSuaK7S": {}, "KaA1Q96p": {}}, "user_id": "RJ8YSt1j"}, {"extra_attributes": {"nqoDuLIf": {}, "iq11nLBN": {}, "x4LMQans": {}}, "user_id": "D0yDA0Yx"}, {"extra_attributes": {"1RbQDcMk": {}, "KmjJPnA3": {}, "7hbYrSEG": {}}, "user_id": "SVajJPNf"}], "ticket_created_at": 25, "ticket_id": "uOKiKkZC"}, {"first_ticket_created_at": 40, "party_attributes": {"VO1lgOrY": {}, "813z72sR": {}, "aYNkeEiz": {}}, "party_id": "fqlKRhv0", "party_members": [{"extra_attributes": {"G64fuL5j": {}, "iPRF2a5c": {}, "6CgXTYTY": {}}, "user_id": "xWgxVsQJ"}, {"extra_attributes": {"U4j09uQn": {}, "0VzYTLBi": {}, "IXHcqrmv": {}}, "user_id": "2qjmOCLm"}, {"extra_attributes": {"LdumVhke": {}, "VgCYCMge": {}, "UKjpVtkG": {}}, "user_id": "4DyxuYJc"}], "ticket_created_at": 40, "ticket_id": "VsecifnF"}]}, {"matching_parties": [{"first_ticket_created_at": 0, "party_attributes": {"aJV5MWYt": {}, "KNXR0Cp8": {}, "GRYQQjSM": {}}, "party_id": "KcX9Egch", "party_members": [{"extra_attributes": {"zlGLMbVd": {}, "e1FLVczt": {}, "7T3NERNV": {}}, "user_id": "HZMawoYp"}, {"extra_attributes": {"m4y9xbfV": {}, "TAQvmHX7": {}, "ObRDWS46": {}}, "user_id": "wE01EYcn"}, {"extra_attributes": {"IZ0WDHSH": {}, "www1jEzn": {}, "xYGgwIGV": {}}, "user_id": "8ZKpPQ94"}], "ticket_created_at": 79, "ticket_id": "2EDo41Co"}, {"first_ticket_created_at": 63, "party_attributes": {"TI9bN3pp": {}, "HS7BVpGc": {}, "fooQIzz9": {}}, "party_id": "LUwwrQ1K", "party_members": [{"extra_attributes": {"MP0YnU8a": {}, "mqqvOZOH": {}, "209FlVjb": {}}, "user_id": "abEnBMq3"}, {"extra_attributes": {"SS1y3oUB": {}, "sUbHLRxO": {}, "oTKfIy6h": {}}, "user_id": "TeRx2X1Q"}, {"extra_attributes": {"A6yaQfSd": {}, "GAC9d3K2": {}, "1aUXgMo0": {}}, "user_id": "lj1OTh7N"}], "ticket_created_at": 91, "ticket_id": "2XlxQTBM"}, {"first_ticket_created_at": 43, "party_attributes": {"FJknobZ5": {}, "iH8I7Eba": {}, "HjrTd93C": {}}, "party_id": "dg0Uej6a", "party_members": [{"extra_attributes": {"be659Oap": {}, "QJasTI5t": {}, "oBq2yzjC": {}}, "user_id": "qXOXNWej"}, {"extra_attributes": {"XnZ7SyWf": {}, "ILKbLIcb": {}, "hEhhccyD": {}}, "user_id": "os9gx81d"}, {"extra_attributes": {"ONBhNxGe": {}, "FrqLsaVr": {}, "lLyVIOtu": {}}, "user_id": "L550Izbf"}], "ticket_created_at": 7, "ticket_id": "ye7UDPjF"}]}, {"matching_parties": [{"first_ticket_created_at": 78, "party_attributes": {"9Ysfnm3T": {}, "Vg4Ryrus": {}, "R9437eNq": {}}, "party_id": "zd6noz6d", "party_members": [{"extra_attributes": {"xPjbeU1b": {}, "WxO4epZt": {}, "agqNd5Hg": {}}, "user_id": "NzgUSu5s"}, {"extra_attributes": {"tGreUo7K": {}, "dvjPSP0l": {}, "RAk6J8PM": {}}, "user_id": "uZazqrVy"}, {"extra_attributes": {"AEcl9mNp": {}, "q3juNuua": {}, "0UIphXQP": {}}, "user_id": "fftTSfJS"}], "ticket_created_at": 6, "ticket_id": "wBFufXxK"}, {"first_ticket_created_at": 12, "party_attributes": {"CmgWNyS7": {}, "piDCzsNF": {}, "9ovRNzY4": {}}, "party_id": "MJyyezmY", "party_members": [{"extra_attributes": {"qr64O7fa": {}, "mxknAiWJ": {}, "a8CXiktZ": {}}, "user_id": "03R5qzaD"}, {"extra_attributes": {"XDUxDjwb": {}, "iukTkgWq": {}, "MwEeV3pW": {}}, "user_id": "ORvtIx61"}, {"extra_attributes": {"uzu9Z0u7": {}, "aQwXazne": {}, "ibstipCu": {}}, "user_id": "acxDcHXH"}], "ticket_created_at": 6, "ticket_id": "daKvY0jM"}, {"first_ticket_created_at": 15, "party_attributes": {"657oETeH": {}, "4gUOweUE": {}, "AgVXPDTi": {}}, "party_id": "jUV7SmCj", "party_members": [{"extra_attributes": {"OqH0zKTP": {}, "d2i1eIJQ": {}, "RiXHkFoO": {}}, "user_id": "a27dqp46"}, {"extra_attributes": {"jV4Le1Di": {}, "VzJTnqCr": {}, "6gvzxcCf": {}}, "user_id": "Z0geVFSq"}, {"extra_attributes": {"bgPZc7UU": {}, "N8qgzBLK": {}, "gA2jE6p3": {}}, "user_id": "jWoWmU0o"}], "ticket_created_at": 20, "ticket_id": "umhKqqfM"}]}], "namespace": "m0fDmevD", "party_attributes": {"qcTVL0lz": {}, "wIlCGDJl": {}, "KhZLO4xp": {}}, "party_id": "fKN87cV1", "queued_at": 38, "region": "51wolOc1", "server_name": "cILL0Fs8", "status": "6SsNPMb4", "ticket_id": "fTZKs7C2", "ticket_ids": ["hTUGc957", "O2SeZhKx", "Z0YSMam9"], "updated_at": "1973-05-05T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "q2sVNW09"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'h49lF25E' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 19, "userID": "sg6VOcR3", "weight": 0.8428898925353298}' \
    > test.out 2>&1
eval_tap $? 13 'UpdatePlayTimeWeight' test.out

#- 14 GetAllPartyInAllChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInAllChannel \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 14 'GetAllPartyInAllChannel' test.out

#- 15 BulkGetSessions
./ng net.accelbyte.sdk.cli.Main matchmaking bulkGetSessions \
    --namespace "$AB_NAMESPACE" \
    --matchIDs 'NsP9ECte' \
    > test.out 2>&1
eval_tap $? 15 'BulkGetSessions' test.out

#- 16 ExportChannels
./ng net.accelbyte.sdk.cli.Main matchmaking exportChannels \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 16 'ExportChannels' test.out

#- 17 ImportChannels
./ng net.accelbyte.sdk.cli.Main matchmaking importChannels \
    --namespace "$AB_NAMESPACE" \
    --file 'tmp.dat' \
    --strategy 'YX6Xoczl' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'NXjsiRTP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'G4XuAmfU' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatch", "deployment": "6XUW25Tv", "description": "yWXEb4qj", "findMatchTimeoutSeconds": 57, "joinable": false, "max_delay_ms": 28, "region_expansion_range_ms": 36, "region_expansion_rate_ms": 43, "region_latency_initial_range_ms": 75, "region_latency_max_ms": 0, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 27, "min": 56, "name": "Bhqcj6eO"}, {"max": 63, "min": 55, "name": "U6QFdpTp"}, {"max": 47, "min": 80, "name": "ovFrY14L"}], [{"max": 18, "min": 86, "name": "H7ianftU"}, {"max": 83, "min": 88, "name": "ZEGoTKLv"}, {"max": 22, "min": 69, "name": "xo6NhI55"}], [{"max": 73, "min": 51, "name": "A3mDFG13"}, {"max": 1, "min": 51, "name": "u3Wmnv78"}, {"max": 4, "min": 91, "name": "Q8hW2UjV"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 99, "role_flexing_second": 11}, "maxNumber": 37, "minNumber": 74, "playerMaxNumber": 4, "playerMinNumber": 11}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 12, "min": 83, "name": "xgy7GOnp"}, {"max": 42, "min": 9, "name": "sjboBdXj"}, {"max": 77, "min": 32, "name": "PlshQS9C"}], [{"max": 69, "min": 38, "name": "S37TqkI0"}, {"max": 74, "min": 3, "name": "P5o0dA7b"}, {"max": 11, "min": 50, "name": "FTPoLP5H"}], [{"max": 66, "min": 59, "name": "wAJFjmPt"}, {"max": 85, "min": 64, "name": "mOlll6pI"}, {"max": 69, "min": 47, "name": "kY4ItJPA"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 98, "role_flexing_second": 50}, "duration": 48, "max_number": 19, "min_number": 59, "player_max_number": 52, "player_min_number": 8}, {"combination": {"alliances": [[{"max": 12, "min": 26, "name": "yAKH06jf"}, {"max": 63, "min": 22, "name": "QVDjk4EQ"}, {"max": 37, "min": 100, "name": "RwaiiAGt"}], [{"max": 70, "min": 47, "name": "VUtomzGa"}, {"max": 33, "min": 11, "name": "ZlHN6Jjl"}, {"max": 23, "min": 42, "name": "krtPbqZ8"}], [{"max": 16, "min": 30, "name": "OhF7CiIf"}, {"max": 28, "min": 68, "name": "Vgx7ao5g"}, {"max": 4, "min": 99, "name": "1qvppe7h"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 54, "role_flexing_second": 83}, "duration": 38, "max_number": 38, "min_number": 10, "player_max_number": 48, "player_min_number": 79}, {"combination": {"alliances": [[{"max": 77, "min": 23, "name": "iOMLKc5Y"}, {"max": 82, "min": 90, "name": "mlyg9xCm"}, {"max": 2, "min": 29, "name": "LtTQOV4G"}], [{"max": 41, "min": 98, "name": "I88IJ8hJ"}, {"max": 24, "min": 91, "name": "b2Z89qd2"}, {"max": 19, "min": 97, "name": "n5R2SVKi"}], [{"max": 0, "min": 39, "name": "aBaG9W4T"}, {"max": 92, "min": 8, "name": "5QTRn1Wc"}, {"max": 60, "min": 91, "name": "NX8kxEjo"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 13, "role_flexing_second": 55}, "duration": 35, "max_number": 5, "min_number": 27, "player_max_number": 2, "player_min_number": 86}], "batch_size": 59, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 5, "flex_flat_step_range": 63, "flex_immunity_count": 46, "flex_range_max": 4, "flex_rate_ms": 88, "flex_step_max": 4, "force_authority_match": false, "initial_step_range": 5, "mmr_max": 11, "mmr_mean": 69, "mmr_min": 0, "mmr_std_dev": 19, "override_mmr_data": false, "use_bucket_mmr": false, "use_flat_flex_step": false}, "flexingRules": [{"attribute": "jze7qRMA", "criteria": "DnoAJ5YX", "duration": 24, "reference": 0.7209919691034812}, {"attribute": "MxWOcr7n", "criteria": "oUeczLyH", "duration": 22, "reference": 0.32945648181523357}, {"attribute": "A5kfuXkG", "criteria": "IyNfxBgn", "duration": 97, "reference": 0.39209349170967034}], "match_options": {"options": [{"name": "UqVbiMIh", "type": "9o9jQe0a"}, {"name": "mP6kN6R0", "type": "GVwNp2NZ"}, {"name": "TgLhnknn", "type": "x3c7iG1H"}]}, "matchingRules": [{"attribute": "rslzA8fy", "criteria": "nR7MA3Kj", "reference": 0.07935578299756874}, {"attribute": "W47pAIVS", "criteria": "mTco2nF1", "reference": 0.4202213563703012}, {"attribute": "cymonL6X", "criteria": "XaStdkrz", "reference": 0.2921307663030822}], "sort_ticket": {"search_result": "distance", "ticket_queue": "distance"}, "sort_tickets": [{"search_result": "random", "threshold": 48, "ticket_queue": "distance"}, {"search_result": "distance", "threshold": 46, "ticket_queue": "distance"}, {"search_result": "random", "threshold": 30, "ticket_queue": "distance"}], "sub_game_modes": {}, "ticket_flexing_selection": "pivot", "ticket_flexing_selections": [{"selection": "random", "threshold": 45}, {"selection": "random", "threshold": 44}, {"selection": "newest", "threshold": 27}], "use_newest_ticket_for_flexing": false}, "sessionQueueTimeoutSeconds": 12, "socialMatchmaking": false, "ticket_observability_enable": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName 'vh6j9b1z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName 'yy8vIL3I' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName 'jdo8SuhF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 85}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName 'enDVktxl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName 'aposOIUb' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "ehsxTwIa", "count": 46, "mmrMax": 0.14040727171760403, "mmrMean": 0.6086004420108742, "mmrMin": 0.12480683597771325, "mmrStdDev": 0.8967796470857194}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'TDDidEaN' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 33, "party_attributes": {"dIXunfnW": {}, "HtKZk2r4": {}, "5ks4TTe9": {}}, "party_id": "UTZVwQDk", "party_members": [{"extra_attributes": {"MKziGhpo": {}, "uuZP3uFH": {}, "uDCyA3ga": {}}, "user_id": "iR4s6OuZ"}, {"extra_attributes": {"78bXb3Am": {}, "OT6Z1IUi": {}, "htgNwvnt": {}}, "user_id": "WdipEScC"}, {"extra_attributes": {"85QBT7yI": {}, "Y6gCUytN": {}, "SyjgCkIb": {}}, "user_id": "dPfMbdt1"}], "ticket_created_at": 25, "ticket_id": "niQDQXsT"}, {"first_ticket_created_at": 95, "party_attributes": {"iENYSN3j": {}, "aY9imahq": {}, "jsgqO6Kc": {}}, "party_id": "tbqXYbTN", "party_members": [{"extra_attributes": {"RM8hdwDp": {}, "ixoaK75X": {}, "oOJvhGn6": {}}, "user_id": "3zy0V7et"}, {"extra_attributes": {"WO6ASQys": {}, "rbSLmQJ5": {}, "qdv6stYK": {}}, "user_id": "EVyiE3G4"}, {"extra_attributes": {"JBsFmqmP": {}, "F0ygdRhM": {}, "WB3zJp4E": {}}, "user_id": "C9bKwVnL"}], "ticket_created_at": 12, "ticket_id": "cKWvsocl"}, {"first_ticket_created_at": 22, "party_attributes": {"doWGYgNE": {}, "pp3pNMm0": {}, "in5EOZEh": {}}, "party_id": "fMV0IwLE", "party_members": [{"extra_attributes": {"l5jy5NlN": {}, "pxEAWirj": {}, "ChbN9LA8": {}}, "user_id": "4qBY7ja0"}, {"extra_attributes": {"r4EsoDNX": {}, "fFjjcReH": {}, "qlrZt5XR": {}}, "user_id": "Ddh45qMa"}, {"extra_attributes": {"uvYINBfj": {}, "Zv4JALQa": {}, "K1vnhUVk": {}}, "user_id": "T28bbK9M"}], "ticket_created_at": 90, "ticket_id": "WcoMPYS3"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName 'z3A3rTCG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 28}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'Vh0LcmYe' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'wk2mvS7X' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'Rxi46eUc' \
    --matchID 'djvQL2xW' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["ihyxweNV", "iSOnfPsW", "waXe1Nbi"], "party_id": "w2WpOOOv", "user_id": "TdciH3mo"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'RILJ2AuD' \
    --matchID 'tWZbCAIv' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'Bw2axXRa' \
    --matchID 'eRK9a5z0' \
    --namespace "$AB_NAMESPACE" \
    --userID 'PD8sJf0F' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName 'eNeqSPez' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 32 'GetStatData' test.out

#- 33 SearchSessions
eval_tap 0 33 'SearchSessions # SKIP deprecated' test.out

#- 34 GetSessionHistoryDetailed
eval_tap 0 34 'GetSessionHistoryDetailed # SKIP deprecated' test.out

#- 35 PublicGetMessages
./ng net.accelbyte.sdk.cli.Main matchmaking publicGetMessages \
    > test.out 2>&1
eval_tap $? 35 'PublicGetMessages' test.out

#- 36 PublicGetAllMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking publicGetAllMatchmakingChannel \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 36 'PublicGetAllMatchmakingChannel' test.out

#- 37 PublicGetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking publicGetSingleMatchmakingChannel \
    --channelName 'Us3gTWNz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 37 'PublicGetSingleMatchmakingChannel' test.out

#- 38 SearchSessionsV2
eval_tap 0 38 'SearchSessionsV2 # SKIP deprecated' test.out

#- 39 VersionCheckHandler
./ng net.accelbyte.sdk.cli.Main matchmaking versionCheckHandler \
    > test.out 2>&1
eval_tap $? 39 'VersionCheckHandler' test.out


rm -f "tmp.dat"

exit $EXIT_CODE