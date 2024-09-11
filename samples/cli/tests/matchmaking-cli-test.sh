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
    --limit '99' \
    --offset '81' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCannotMatch", "deployment": "okDp4JFr", "description": "b6NQ9pUH", "find_match_timeout_seconds": 39, "game_mode": "E4oPrBY4", "joinable": false, "max_delay_ms": 37, "region_expansion_range_ms": 73, "region_expansion_rate_ms": 36, "region_latency_initial_range_ms": 50, "region_latency_max_ms": 70, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 48, "min": 87, "name": "420mY3g4"}, {"max": 14, "min": 75, "name": "rrUy2HDL"}, {"max": 62, "min": 29, "name": "xdiiZmCs"}], [{"max": 100, "min": 91, "name": "FBn5X4NE"}, {"max": 47, "min": 90, "name": "jrIslD4E"}, {"max": 17, "min": 3, "name": "ZgEBomLP"}], [{"max": 9, "min": 46, "name": "SZBYML7V"}, {"max": 77, "min": 57, "name": "LwjKtIiK"}, {"max": 57, "min": 34, "name": "w9m60EuP"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 71, "role_flexing_second": 91}, "max_number": 6, "min_number": 99, "player_max_number": 7, "player_min_number": 5}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 70, "min": 55, "name": "wmXZALsw"}, {"max": 81, "min": 27, "name": "rUKNcSjC"}, {"max": 68, "min": 7, "name": "POOzSnCY"}], [{"max": 25, "min": 19, "name": "qryLgvo4"}, {"max": 40, "min": 21, "name": "fZpKDk84"}, {"max": 23, "min": 4, "name": "0ZhmtmiV"}], [{"max": 42, "min": 23, "name": "bZrg5TkB"}, {"max": 12, "min": 58, "name": "iZpXE6R0"}, {"max": 99, "min": 85, "name": "wmNNsifs"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 30, "role_flexing_second": 32}, "duration": 92, "max_number": 48, "min_number": 30, "player_max_number": 24, "player_min_number": 64}, {"combination": {"alliances": [[{"max": 66, "min": 44, "name": "xHh6LdR9"}, {"max": 42, "min": 61, "name": "Fpxyv39F"}, {"max": 31, "min": 71, "name": "7vnLD13H"}], [{"max": 16, "min": 27, "name": "mwmUcSvk"}, {"max": 10, "min": 37, "name": "fzCwjeWY"}, {"max": 74, "min": 18, "name": "KmBuDc5p"}], [{"max": 5, "min": 45, "name": "2vETwZUW"}, {"max": 12, "min": 92, "name": "jsnYligG"}, {"max": 9, "min": 87, "name": "OdOpNHDC"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 28, "role_flexing_second": 80}, "duration": 70, "max_number": 20, "min_number": 33, "player_max_number": 76, "player_min_number": 72}, {"combination": {"alliances": [[{"max": 78, "min": 11, "name": "YnBiF2zM"}, {"max": 79, "min": 22, "name": "pqk791nj"}, {"max": 72, "min": 56, "name": "WJHbpp3l"}], [{"max": 35, "min": 17, "name": "Iy1eXmNy"}, {"max": 100, "min": 41, "name": "CxJVfeJ7"}, {"max": 6, "min": 1, "name": "klJWmQkc"}], [{"max": 28, "min": 12, "name": "9dzz2shW"}, {"max": 54, "min": 12, "name": "Gz9KVlwx"}, {"max": 4, "min": 74, "name": "QAYwPM0y"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 17, "role_flexing_second": 2}, "duration": 24, "max_number": 17, "min_number": 6, "player_max_number": 94, "player_min_number": 75}], "batch_size": 28, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 86, "flex_flat_step_range": 84, "flex_immunity_count": 33, "flex_range_max": 3, "flex_rate_ms": 74, "flex_step_max": 70, "force_authority_match": true, "initial_step_range": 68, "mmr_max": 36, "mmr_mean": 75, "mmr_min": 84, "mmr_std_dev": 99, "override_mmr_data": false, "use_bucket_mmr": true, "use_flat_flex_step": true}, "flexing_rule": [{"attribute": "3J5hMHUl", "criteria": "Vuz0D5JU", "duration": 63, "reference": 0.47796428345142694}, {"attribute": "IL9AO6LP", "criteria": "ZH9m4Ane", "duration": 65, "reference": 0.0940122679901838}, {"attribute": "tQRISQUY", "criteria": "ofnRKGi7", "duration": 35, "reference": 0.20647908495916334}], "match_options": {"options": [{"name": "4yB9kAj5", "type": "cnyhLyj2"}, {"name": "g4MrifDx", "type": "Zbqj0o2Y"}, {"name": "QKTMXKqI", "type": "yBSa1JAi"}]}, "matching_rule": [{"attribute": "QpLwfvwT", "criteria": "G81QyojG", "reference": 0.08452778911196746}, {"attribute": "MiFavN4u", "criteria": "s64jnyG4", "reference": 0.3588594881728643}, {"attribute": "xvQxhDg9", "criteria": "nZQZ7J8X", "reference": 0.8832971133621237}], "rebalance_enable": true, "sort_ticket": {"search_result": "rUw7VckO", "ticket_queue": "e0gTD5QI"}, "sort_tickets": [{"search_result": "x920S5LI", "threshold": 93, "ticket_queue": "fSf00lFi"}, {"search_result": "CGHeFMCA", "threshold": 86, "ticket_queue": "ShI9ALDo"}, {"search_result": "eoAm1R4t", "threshold": 92, "ticket_queue": "yTod9IsQ"}], "sub_game_modes": {"iB1xHYpB": {"alliance": {"combination": {"alliances": [[{"max": 18, "min": 84, "name": "mtAC0mCi"}, {"max": 94, "min": 47, "name": "2pi75tE6"}, {"max": 35, "min": 46, "name": "F3d140MO"}], [{"max": 96, "min": 79, "name": "PkRGEypB"}, {"max": 13, "min": 87, "name": "IhJZuF7A"}, {"max": 23, "min": 82, "name": "raY7Za4j"}], [{"max": 11, "min": 53, "name": "J9k3tEnL"}, {"max": 24, "min": 45, "name": "VEOJcjaN"}, {"max": 45, "min": 83, "name": "wKXo5lq0"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 86, "role_flexing_second": 81}, "max_number": 64, "min_number": 92, "player_max_number": 85, "player_min_number": 92}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 33, "min": 76, "name": "7FGApI5Y"}, {"max": 16, "min": 53, "name": "9gDDvNWZ"}, {"max": 1, "min": 43, "name": "YiKov8nK"}], [{"max": 0, "min": 5, "name": "ACIadbgv"}, {"max": 70, "min": 61, "name": "A5Kh7ZAU"}, {"max": 82, "min": 99, "name": "VewwK5Rw"}], [{"max": 45, "min": 33, "name": "WXBp5Ag8"}, {"max": 83, "min": 1, "name": "i6wIDCrc"}, {"max": 15, "min": 82, "name": "wBwGti4H"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 36, "role_flexing_second": 47}, "duration": 14, "max_number": 28, "min_number": 33, "player_max_number": 72, "player_min_number": 79}, {"combination": {"alliances": [[{"max": 31, "min": 58, "name": "pgv1v1rh"}, {"max": 26, "min": 47, "name": "0G0nZuhb"}, {"max": 30, "min": 19, "name": "ISuAMJDk"}], [{"max": 84, "min": 37, "name": "De8wnlGU"}, {"max": 81, "min": 8, "name": "YecORGRs"}, {"max": 66, "min": 36, "name": "tu88LEix"}], [{"max": 18, "min": 4, "name": "Yu46XODK"}, {"max": 40, "min": 23, "name": "Ci11i78N"}, {"max": 96, "min": 47, "name": "WftJYgC7"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 19, "role_flexing_second": 70}, "duration": 8, "max_number": 100, "min_number": 32, "player_max_number": 83, "player_min_number": 82}, {"combination": {"alliances": [[{"max": 31, "min": 0, "name": "5GnX63Jp"}, {"max": 16, "min": 21, "name": "NtN5W66L"}, {"max": 94, "min": 15, "name": "DLNrlymI"}], [{"max": 25, "min": 1, "name": "8ZoTn0ja"}, {"max": 52, "min": 76, "name": "kZWlhupA"}, {"max": 4, "min": 35, "name": "fYrCofCO"}], [{"max": 73, "min": 61, "name": "Ng028I6p"}, {"max": 48, "min": 15, "name": "X9djfCeZ"}, {"max": 81, "min": 47, "name": "QsBxs2Bt"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 92, "role_flexing_second": 15}, "duration": 75, "max_number": 54, "min_number": 26, "player_max_number": 100, "player_min_number": 63}], "name": "CyuvuC7h"}, "V53cSeP9": {"alliance": {"combination": {"alliances": [[{"max": 76, "min": 75, "name": "FYXiORh8"}, {"max": 72, "min": 81, "name": "AfUtkCXf"}, {"max": 96, "min": 16, "name": "dFS91bJE"}], [{"max": 54, "min": 60, "name": "oqUqLLvd"}, {"max": 63, "min": 92, "name": "UnzsMvrr"}, {"max": 73, "min": 56, "name": "gEzsdFIN"}], [{"max": 41, "min": 56, "name": "4GsvkzHt"}, {"max": 96, "min": 74, "name": "FTJh8zaq"}, {"max": 37, "min": 100, "name": "2HqoeII4"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 27, "role_flexing_second": 10}, "max_number": 12, "min_number": 47, "player_max_number": 69, "player_min_number": 32}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 37, "min": 66, "name": "ptiaUmMa"}, {"max": 16, "min": 40, "name": "pD0OGgW9"}, {"max": 45, "min": 19, "name": "8i9CdEpx"}], [{"max": 55, "min": 99, "name": "z43inxJY"}, {"max": 98, "min": 5, "name": "W9hiKrp5"}, {"max": 15, "min": 81, "name": "w79QAevf"}], [{"max": 42, "min": 6, "name": "ngmGPfuD"}, {"max": 56, "min": 20, "name": "5FHAEDc1"}, {"max": 5, "min": 66, "name": "eu1rPaMy"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 58, "role_flexing_second": 16}, "duration": 97, "max_number": 62, "min_number": 33, "player_max_number": 95, "player_min_number": 90}, {"combination": {"alliances": [[{"max": 12, "min": 62, "name": "ITVZr2zE"}, {"max": 88, "min": 0, "name": "vFtrfDrF"}, {"max": 32, "min": 83, "name": "Gl08wJit"}], [{"max": 54, "min": 47, "name": "7CDMGRU4"}, {"max": 58, "min": 19, "name": "MZ61Rg2M"}, {"max": 46, "min": 59, "name": "8eBn0hAX"}], [{"max": 53, "min": 15, "name": "vTQng8Xr"}, {"max": 99, "min": 86, "name": "dT2FoKhW"}, {"max": 7, "min": 85, "name": "MIovB0rm"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 85, "role_flexing_second": 31}, "duration": 59, "max_number": 6, "min_number": 9, "player_max_number": 60, "player_min_number": 98}, {"combination": {"alliances": [[{"max": 44, "min": 22, "name": "6GPIES23"}, {"max": 41, "min": 16, "name": "d7Qh5Mtp"}, {"max": 94, "min": 51, "name": "FQqEFdLl"}], [{"max": 99, "min": 46, "name": "1YuKbHCn"}, {"max": 84, "min": 82, "name": "TMPegiqI"}, {"max": 88, "min": 28, "name": "vSV2aisI"}], [{"max": 17, "min": 29, "name": "9EZNYxk6"}, {"max": 60, "min": 89, "name": "09YzyVY6"}, {"max": 11, "min": 36, "name": "25VaXXiU"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 34, "role_flexing_second": 31}, "duration": 44, "max_number": 93, "min_number": 43, "player_max_number": 86, "player_min_number": 99}], "name": "JOJ3wcwk"}, "T1a0YWCJ": {"alliance": {"combination": {"alliances": [[{"max": 31, "min": 57, "name": "zYmvB8Nt"}, {"max": 53, "min": 64, "name": "k9Ct1s0Q"}, {"max": 98, "min": 86, "name": "UOnR2IFm"}], [{"max": 37, "min": 47, "name": "cqtOedra"}, {"max": 27, "min": 6, "name": "l98CRSik"}, {"max": 39, "min": 56, "name": "fqqGijLJ"}], [{"max": 61, "min": 58, "name": "Urdo4QQl"}, {"max": 45, "min": 88, "name": "sQVVXVzG"}, {"max": 79, "min": 93, "name": "c04vBOXN"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 29, "role_flexing_second": 63}, "max_number": 42, "min_number": 59, "player_max_number": 27, "player_min_number": 63}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 24, "min": 10, "name": "ZvHT6j7F"}, {"max": 28, "min": 92, "name": "3MUFE1AR"}, {"max": 44, "min": 44, "name": "b2MxIPaV"}], [{"max": 92, "min": 58, "name": "w4KIP1Ix"}, {"max": 13, "min": 23, "name": "bH2VBxGE"}, {"max": 36, "min": 80, "name": "at0tVh8v"}], [{"max": 71, "min": 99, "name": "Kdtc1jBq"}, {"max": 32, "min": 42, "name": "Whf9ffqd"}, {"max": 49, "min": 55, "name": "XQ1pbHEJ"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 56, "role_flexing_second": 3}, "duration": 16, "max_number": 38, "min_number": 29, "player_max_number": 77, "player_min_number": 53}, {"combination": {"alliances": [[{"max": 20, "min": 69, "name": "ezaMGY2g"}, {"max": 100, "min": 82, "name": "AEXKJbTd"}, {"max": 25, "min": 17, "name": "Q2qLboZx"}], [{"max": 62, "min": 34, "name": "yNF2j7r3"}, {"max": 48, "min": 87, "name": "y8QYNWVh"}, {"max": 61, "min": 53, "name": "fsSLnygD"}], [{"max": 59, "min": 67, "name": "IUCtOiny"}, {"max": 85, "min": 25, "name": "fPBeJmUn"}, {"max": 85, "min": 47, "name": "ztUMP9CW"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 51, "role_flexing_second": 29}, "duration": 89, "max_number": 3, "min_number": 8, "player_max_number": 33, "player_min_number": 88}, {"combination": {"alliances": [[{"max": 38, "min": 82, "name": "6UvaqV8Z"}, {"max": 4, "min": 0, "name": "6xJhAN1s"}, {"max": 17, "min": 30, "name": "FQvzRpvH"}], [{"max": 91, "min": 81, "name": "ovEbafO0"}, {"max": 17, "min": 83, "name": "Ce3cMCLk"}, {"max": 21, "min": 62, "name": "JTSf1x3T"}], [{"max": 12, "min": 84, "name": "pu9uTHAB"}, {"max": 67, "min": 80, "name": "ylyd6exJ"}, {"max": 35, "min": 41, "name": "SFqcKIUO"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 56, "role_flexing_second": 15}, "duration": 90, "max_number": 34, "min_number": 2, "player_max_number": 27, "player_min_number": 60}], "name": "b0PKCXvh"}}, "ticket_flexing_selection": "Vs9JmdqN", "ticket_flexing_selections": [{"selection": "EkugzMUy", "threshold": 54}, {"selection": "oUn1FNqP", "threshold": 12}, {"selection": "gHH4TnXZ", "threshold": 56}], "use_newest_ticket_for_flexing": true}, "session_queue_timeout_seconds": 68, "social_matchmaking": false, "sub_gamemode_selection": "random", "ticket_observability_enable": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName 'opUG5Xk2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'Pzq1fKwq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "TR8e0NTQ", "players": [{"results": [{"attribute": "JQAIc1eu", "value": 0.23831801473172964}, {"attribute": "EIvR9Ul7", "value": 0.06986250604568}, {"attribute": "VJEchxgi", "value": 0.5950140689914195}], "user_id": "qj8yPapu"}, {"results": [{"attribute": "nL8bqnTL", "value": 0.4827428862747527}, {"attribute": "xuBUgm6d", "value": 0.6578127180475055}, {"attribute": "wLe2wjeW", "value": 0.5740232086596733}], "user_id": "Suob0dYy"}, {"results": [{"attribute": "8a6yHnFM", "value": 0.6948737186020932}, {"attribute": "ihJ2woOd", "value": 0.28165445104486053}, {"attribute": "l2tfbvcD", "value": 0.41911704869541755}], "user_id": "bg0pbWlz"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "QZOTfz1f"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "UrFvLkMb", "client_version": "u4VJ8VZd", "deployment": "cvjKNlnS", "error_code": 73, "error_message": "FpuXbBK5", "game_mode": "w85p6LiG", "is_mock": "AgXrpwiW", "joinable": true, "match_id": "pjZt2XKY", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 84, "party_attributes": {"3LpzniAx": {}, "kPxwtaTu": {}, "gWiuseaC": {}}, "party_id": "SDIjTmet", "party_members": [{"extra_attributes": {"y1HA9c4x": {}, "rOniqdZA": {}, "m0F8aq7u": {}}, "user_id": "LkOs2hl5"}, {"extra_attributes": {"aTSAwLSn": {}, "HRS4xPCF": {}, "yO8pvKFu": {}}, "user_id": "zaJM0bIr"}, {"extra_attributes": {"I0vxawd5": {}, "pX3fKf5O": {}, "n5dgjXHi": {}}, "user_id": "G3f8oVwV"}], "ticket_created_at": 82, "ticket_id": "3yJj9qsZ"}, {"first_ticket_created_at": 47, "party_attributes": {"dkfYGFaE": {}, "ltJyAvcJ": {}, "RgfB7vN8": {}}, "party_id": "UDJo9L37", "party_members": [{"extra_attributes": {"xNGkWKVR": {}, "Ab2bD46q": {}, "mtekczKJ": {}}, "user_id": "3IzYVSLU"}, {"extra_attributes": {"oxwjmbof": {}, "OIiT9iHW": {}, "HRdsKyZW": {}}, "user_id": "xtnGYT9W"}, {"extra_attributes": {"A5fY9xvU": {}, "FUJgKSrd": {}, "UATEmnYD": {}}, "user_id": "wxDHmw8m"}], "ticket_created_at": 69, "ticket_id": "sLuHalm9"}, {"first_ticket_created_at": 41, "party_attributes": {"6hvf5cRI": {}, "SRoXeyH9": {}, "Mug1lzVX": {}}, "party_id": "EXIEpBNn", "party_members": [{"extra_attributes": {"p7puCNlf": {}, "aieS04Bk": {}, "RVnbdq5a": {}}, "user_id": "XRJUUVkQ"}, {"extra_attributes": {"u80kxsI2": {}, "ElVZcyjV": {}, "f0yq2uLT": {}}, "user_id": "2kvrX3eN"}, {"extra_attributes": {"78JOFWFX": {}, "lgwkcHAA": {}, "6Pgs1tDy": {}}, "user_id": "8eNgp6f3"}], "ticket_created_at": 26, "ticket_id": "nG5GPd1y"}]}, {"matching_parties": [{"first_ticket_created_at": 15, "party_attributes": {"JMviA7fB": {}, "gNGGeRec": {}, "Sx745qzN": {}}, "party_id": "q1mgurAf", "party_members": [{"extra_attributes": {"3hIn4bYv": {}, "2iTh7C4c": {}, "QECdFhd3": {}}, "user_id": "QhdS7YfN"}, {"extra_attributes": {"glncFHQA": {}, "PlU56MkH": {}, "411qmR2o": {}}, "user_id": "Gvyr6sjm"}, {"extra_attributes": {"gDUSoXrc": {}, "dT3STm5p": {}, "MjrqSSQF": {}}, "user_id": "HnwAr4pO"}], "ticket_created_at": 54, "ticket_id": "LlKapErv"}, {"first_ticket_created_at": 37, "party_attributes": {"fTE3Azin": {}, "6EQ1LtY5": {}, "ufNKN3LK": {}}, "party_id": "fhiRIFm6", "party_members": [{"extra_attributes": {"YhAzcCdN": {}, "ERkFWxvO": {}, "XYdbu0J2": {}}, "user_id": "26QhHS7w"}, {"extra_attributes": {"pG8S1kP5": {}, "kuVBq05w": {}, "24BE7ntl": {}}, "user_id": "TKlBJW2d"}, {"extra_attributes": {"eC3AirwN": {}, "IUlFsPRo": {}, "XZP7PInz": {}}, "user_id": "d9MEPbpf"}], "ticket_created_at": 46, "ticket_id": "eAfgcDvO"}, {"first_ticket_created_at": 39, "party_attributes": {"USX6CGHy": {}, "NbDPBkQi": {}, "LN0FvLnd": {}}, "party_id": "cSF0punU", "party_members": [{"extra_attributes": {"gk9zbXcP": {}, "3vWTxaKE": {}, "y13RhcVi": {}}, "user_id": "pfjFlvH1"}, {"extra_attributes": {"yKJiDey1": {}, "ObAF12zl": {}, "ZAi87PpT": {}}, "user_id": "xZZBIskd"}, {"extra_attributes": {"1NgKXY1s": {}, "bseDJF0E": {}, "NfSCfID1": {}}, "user_id": "7Yc5PjRY"}], "ticket_created_at": 28, "ticket_id": "GFyyjuyK"}]}, {"matching_parties": [{"first_ticket_created_at": 58, "party_attributes": {"GpjnMzJT": {}, "5Ez3i8jd": {}, "bCgUdkCp": {}}, "party_id": "rGEawFW5", "party_members": [{"extra_attributes": {"xZgaOoU2": {}, "GLGs1pMo": {}, "P4XOCMXa": {}}, "user_id": "CAMbLL58"}, {"extra_attributes": {"tFSmC2Iw": {}, "FoZvzxQA": {}, "eLqwpNQg": {}}, "user_id": "QKlaQXna"}, {"extra_attributes": {"MzpGTy3z": {}, "DxdvoKOZ": {}, "AqDp8xTe": {}}, "user_id": "IHhMh4DR"}], "ticket_created_at": 52, "ticket_id": "RJqvzafk"}, {"first_ticket_created_at": 58, "party_attributes": {"cd7l49SI": {}, "vdlSeWSe": {}, "4VNe0oaT": {}}, "party_id": "mTslLF6G", "party_members": [{"extra_attributes": {"j947agpi": {}, "F5W0e7fr": {}, "4adWC9UN": {}}, "user_id": "YQQeayxu"}, {"extra_attributes": {"VV2Wq7jd": {}, "KNfKY8nh": {}, "9Oe63HR1": {}}, "user_id": "Qqu2qUhW"}, {"extra_attributes": {"uHSbnyvI": {}, "sSAwwTIp": {}, "Uvyo7Gtx": {}}, "user_id": "MPbIY4rq"}], "ticket_created_at": 77, "ticket_id": "CSc24jox"}, {"first_ticket_created_at": 26, "party_attributes": {"sRHitnWb": {}, "Jes3kNNL": {}, "Dag6OSOa": {}}, "party_id": "Ym6gjVAY", "party_members": [{"extra_attributes": {"TIzyXXLt": {}, "UyOjpMfv": {}, "WggRQYlJ": {}}, "user_id": "ocIvbvKS"}, {"extra_attributes": {"YsUZdzWt": {}, "hCEdxYDp": {}, "qtYzoNac": {}}, "user_id": "59SOrFwo"}, {"extra_attributes": {"pnlk3Hy7": {}, "EdNXn6RE": {}, "fXjYUkse": {}}, "user_id": "Sdg1SVdm"}], "ticket_created_at": 57, "ticket_id": "YxJSXThL"}]}], "namespace": "iNOZlbIP", "party_attributes": {"jfBtwbxc": {}, "ARcNYC7i": {}, "SYfLfmY9": {}}, "party_id": "tSF3zOEd", "queued_at": 82, "region": "KL0qdANx", "server_name": "6P2MTzEZ", "status": "4JSGXz6h", "ticket_id": "Zfvx81Hb", "ticket_ids": ["JMcmzwto", "ileAVsTL", "uFJ8Kp1K"], "updated_at": "1980-11-09T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "NnGqWU4v"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'JNwkJ2F2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 36, "userID": "dNNxf4J5", "weight": 0.3064505630057126}' \
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
    --matchIDs 'vHwFZaYi' \
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
    --strategy 'YxJLCyQu' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'sQrLEHnf' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'AVt7JBcm' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCannotMatch", "deployment": "blNzreWF", "description": "5sEAmQtP", "findMatchTimeoutSeconds": 27, "joinable": true, "max_delay_ms": 69, "region_expansion_range_ms": 68, "region_expansion_rate_ms": 30, "region_latency_initial_range_ms": 8, "region_latency_max_ms": 84, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 80, "min": 59, "name": "aMZkoUZP"}, {"max": 36, "min": 51, "name": "4ogbIgKr"}, {"max": 87, "min": 19, "name": "wCjMSFIp"}], [{"max": 39, "min": 6, "name": "zB5O2jB7"}, {"max": 56, "min": 77, "name": "fwFpgTEA"}, {"max": 65, "min": 42, "name": "ELxDA9Q3"}], [{"max": 44, "min": 31, "name": "w1K0QD85"}, {"max": 45, "min": 4, "name": "rzHVfV2k"}, {"max": 41, "min": 0, "name": "6Qa1ULl3"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 21, "role_flexing_second": 98}, "maxNumber": 65, "minNumber": 42, "playerMaxNumber": 84, "playerMinNumber": 77}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 30, "min": 68, "name": "qBCMVVmg"}, {"max": 19, "min": 34, "name": "lAad8zh9"}, {"max": 75, "min": 68, "name": "S3gcrMVy"}], [{"max": 1, "min": 95, "name": "vV2atThO"}, {"max": 72, "min": 46, "name": "nrmYMlCq"}, {"max": 66, "min": 70, "name": "dWUjxSEI"}], [{"max": 8, "min": 17, "name": "ZNYOhFBe"}, {"max": 48, "min": 40, "name": "YhLoNO3E"}, {"max": 85, "min": 59, "name": "3UJlDWvx"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 34, "role_flexing_second": 41}, "duration": 88, "max_number": 41, "min_number": 60, "player_max_number": 58, "player_min_number": 58}, {"combination": {"alliances": [[{"max": 37, "min": 76, "name": "XyvsYK3N"}, {"max": 8, "min": 66, "name": "deqHdfBv"}, {"max": 2, "min": 56, "name": "sAWuFWFR"}], [{"max": 79, "min": 25, "name": "DzZZ86km"}, {"max": 87, "min": 48, "name": "RsA6FlDu"}, {"max": 93, "min": 13, "name": "54rPU8TV"}], [{"max": 32, "min": 43, "name": "ln5HBFLD"}, {"max": 74, "min": 45, "name": "8mboZoFX"}, {"max": 3, "min": 44, "name": "0jskgmAU"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 0, "role_flexing_second": 59}, "duration": 44, "max_number": 35, "min_number": 95, "player_max_number": 95, "player_min_number": 50}, {"combination": {"alliances": [[{"max": 20, "min": 81, "name": "UwrprIUB"}, {"max": 19, "min": 5, "name": "vO9ImsaG"}, {"max": 70, "min": 4, "name": "B6tJRITO"}], [{"max": 7, "min": 28, "name": "2iqCbOed"}, {"max": 47, "min": 5, "name": "qnp6oqp9"}, {"max": 45, "min": 96, "name": "xljnbbPl"}], [{"max": 26, "min": 29, "name": "lwMDlolj"}, {"max": 23, "min": 33, "name": "cLwFn21g"}, {"max": 70, "min": 43, "name": "Kh7FABWE"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 58, "role_flexing_second": 23}, "duration": 22, "max_number": 60, "min_number": 79, "player_max_number": 59, "player_min_number": 2}], "batch_size": 31, "bucket_mmr_rule": {"disable_authority": true, "flex_authority_count": 1, "flex_flat_step_range": 80, "flex_immunity_count": 86, "flex_range_max": 14, "flex_rate_ms": 98, "flex_step_max": 22, "force_authority_match": false, "initial_step_range": 21, "mmr_max": 67, "mmr_mean": 17, "mmr_min": 74, "mmr_std_dev": 50, "override_mmr_data": true, "use_bucket_mmr": false, "use_flat_flex_step": false}, "flexingRules": [{"attribute": "vgc4SHNC", "criteria": "xR4VGJGg", "duration": 53, "reference": 0.33635685411755323}, {"attribute": "U9PX5gEH", "criteria": "a2epF4d0", "duration": 39, "reference": 0.14939175102483981}, {"attribute": "37Tztb6F", "criteria": "BtzGq88o", "duration": 7, "reference": 0.7282016233474219}], "match_options": {"options": [{"name": "YhmtBbd7", "type": "Hqa1jXPK"}, {"name": "RhZBmo6n", "type": "TrMN3zwa"}, {"name": "FrQoirR4", "type": "C5yDaDUG"}]}, "matchingRules": [{"attribute": "TRR6RaFO", "criteria": "h6xrecj5", "reference": 0.8303645951870713}, {"attribute": "LPOLReny", "criteria": "0kkGgObR", "reference": 0.5065563443308844}, {"attribute": "aTxhfPsS", "criteria": "nKTauScv", "reference": 0.9740894402705738}], "sort_ticket": {"search_result": "W3qayIsT", "ticket_queue": "MWUkR6mS"}, "sort_tickets": [{"search_result": "0LgEfxSP", "threshold": 22, "ticket_queue": "u7JTLZ5T"}, {"search_result": "idAEpVtF", "threshold": 5, "ticket_queue": "dGL2YU3i"}, {"search_result": "A7DCJs8J", "threshold": 48, "ticket_queue": "kZGdUgFs"}], "sub_game_modes": {}, "ticket_flexing_selection": "TNu1opPQ", "ticket_flexing_selections": [{"selection": "WJs7Gssw", "threshold": 70}, {"selection": "o83d0b1Z", "threshold": 66}, {"selection": "EkDQZMWo", "threshold": 77}], "use_newest_ticket_for_flexing": false}, "sessionQueueTimeoutSeconds": 64, "socialMatchmaking": false, "sub_gamemode_selection": "ticketOrder", "ticket_observability_enable": false, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName 'rwlUmLkZ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName 'i3npmkzT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName 'eVWn43yR' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 89}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName 'x1rBedHB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName 'NPngwxoG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "If5zqc0M", "count": 52, "mmrMax": 0.8199536468213474, "mmrMean": 0.13057817381559989, "mmrMin": 0.009672126530812286, "mmrStdDev": 0.8268702607100108}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'v8MAXaKk' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 94, "party_attributes": {"3QGrE7qp": {}, "Zz1KT33M": {}, "uHntULQ0": {}}, "party_id": "U2qNH6TQ", "party_members": [{"extra_attributes": {"mnAJTrv5": {}, "RYMvLNXu": {}, "KMLooxkZ": {}}, "user_id": "oNjSlI6A"}, {"extra_attributes": {"J6Mruj0H": {}, "XDPKTKiK": {}, "QNCXewsB": {}}, "user_id": "SWrIXv0U"}, {"extra_attributes": {"CNFGP8bU": {}, "NmIyBXzT": {}, "4C51Y4Vw": {}}, "user_id": "4TYrAgRl"}], "ticket_created_at": 47, "ticket_id": "6GkMZo2c"}, {"first_ticket_created_at": 47, "party_attributes": {"5LE6hHHo": {}, "GFIsUJek": {}, "QBNT5IqQ": {}}, "party_id": "fZoeQAjp", "party_members": [{"extra_attributes": {"yqlb1rN2": {}, "WmYEacrq": {}, "6NLeeleK": {}}, "user_id": "IyoIq0sW"}, {"extra_attributes": {"yQu2mHDP": {}, "m83yWQm8": {}, "PpJ4VDVx": {}}, "user_id": "TOYSZegM"}, {"extra_attributes": {"qmG9bkdj": {}, "n7o8Pdxe": {}, "5JuuvJsq": {}}, "user_id": "ttAnX0jp"}], "ticket_created_at": 51, "ticket_id": "rmRveqLp"}, {"first_ticket_created_at": 50, "party_attributes": {"KTgozpvn": {}, "HjfvrqcR": {}, "BW4KxFNp": {}}, "party_id": "dVg45q3c", "party_members": [{"extra_attributes": {"WMs00lsI": {}, "nnYykDck": {}, "JPbcuvSa": {}}, "user_id": "hMV1bJNG"}, {"extra_attributes": {"PGtWbwSh": {}, "3Tv2Lv57": {}, "OrtK9icC": {}}, "user_id": "fuaTvA8B"}, {"extra_attributes": {"Tg01kbMG": {}, "18vNDcdJ": {}, "ihQZcbMY": {}}, "user_id": "A6s6LiI0"}], "ticket_created_at": 18, "ticket_id": "0tnHz0CA"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName 'PqmtZFxj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 43}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'iAWGGIh4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'CKyjIzyJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName '3iuZ5cID' \
    --matchID 'pEy9RbrP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["Ds4JmTnP", "JkfVAjsy", "xo00CAJ6"], "party_id": "JlSwkT2W", "user_id": "eEHWrCKG"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'SmEAH4QO' \
    --matchID 'Nr8U7lro' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName '0gAyiGyM' \
    --matchID 's8oUcERw' \
    --namespace "$AB_NAMESPACE" \
    --userID 'Hoo2AH8K' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName '8n5TfEf0' \
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
    --channelName 'QgNeWpKT' \
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