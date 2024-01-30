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
    --limit '81' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatch", "deployment": "p2lBrsrh", "description": "3GsyNVa5", "find_match_timeout_seconds": 86, "game_mode": "mGErQH2S", "joinable": false, "max_delay_ms": 95, "region_expansion_range_ms": 14, "region_expansion_rate_ms": 29, "region_latency_initial_range_ms": 99, "region_latency_max_ms": 78, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 66, "min": 79, "name": "C0RvvjuD"}, {"max": 100, "min": 85, "name": "2beUJJkL"}, {"max": 37, "min": 84, "name": "QgwY31mg"}], [{"max": 61, "min": 42, "name": "G6oa46o3"}, {"max": 0, "min": 18, "name": "prSHAeWS"}, {"max": 75, "min": 42, "name": "H3rLxVBJ"}], [{"max": 8, "min": 26, "name": "rztWUad1"}, {"max": 13, "min": 84, "name": "t4v5dI3J"}, {"max": 88, "min": 78, "name": "Fk4b6Mp7"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 60, "role_flexing_second": 47}, "max_number": 15, "min_number": 20, "player_max_number": 42, "player_min_number": 95}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 42, "min": 66, "name": "mwXdxKuu"}, {"max": 28, "min": 81, "name": "iBguQqZS"}, {"max": 39, "min": 87, "name": "uI73VSu5"}], [{"max": 34, "min": 45, "name": "wr00kDdO"}, {"max": 65, "min": 64, "name": "5R2KyTKI"}, {"max": 83, "min": 3, "name": "CC6u53Z7"}], [{"max": 57, "min": 14, "name": "I07LDh3X"}, {"max": 77, "min": 76, "name": "w3dYdaHd"}, {"max": 3, "min": 6, "name": "3bVFRFTT"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 42, "role_flexing_second": 32}, "duration": 66, "max_number": 6, "min_number": 84, "player_max_number": 88, "player_min_number": 73}, {"combination": {"alliances": [[{"max": 25, "min": 98, "name": "00zKY56C"}, {"max": 37, "min": 86, "name": "0JwQE6L1"}, {"max": 12, "min": 76, "name": "2gHIGTwG"}], [{"max": 16, "min": 22, "name": "R4wV3Maf"}, {"max": 69, "min": 88, "name": "27nnXlw5"}, {"max": 61, "min": 19, "name": "bSI4hiH2"}], [{"max": 10, "min": 23, "name": "b713x9gs"}, {"max": 17, "min": 65, "name": "bBzsg18h"}, {"max": 66, "min": 100, "name": "04gSdN59"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 57, "role_flexing_second": 60}, "duration": 66, "max_number": 63, "min_number": 8, "player_max_number": 65, "player_min_number": 96}, {"combination": {"alliances": [[{"max": 56, "min": 41, "name": "Q6agv2rj"}, {"max": 11, "min": 91, "name": "MpjzNpUg"}, {"max": 78, "min": 46, "name": "ISzCHtsV"}], [{"max": 22, "min": 3, "name": "0kxzJXwX"}, {"max": 64, "min": 19, "name": "MGCdmV8p"}, {"max": 30, "min": 11, "name": "4KMjG4CD"}], [{"max": 97, "min": 29, "name": "QyG3hjIA"}, {"max": 20, "min": 36, "name": "eBEeJNmU"}, {"max": 15, "min": 16, "name": "W30lSqep"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 88, "role_flexing_second": 86}, "duration": 78, "max_number": 20, "min_number": 56, "player_max_number": 91, "player_min_number": 82}], "batch_size": 93, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 36, "flex_flat_step_range": 94, "flex_immunity_count": 53, "flex_range_max": 40, "flex_rate_ms": 29, "flex_step_max": 22, "force_authority_match": false, "initial_step_range": 48, "mmr_max": 46, "mmr_mean": 92, "mmr_min": 8, "mmr_std_dev": 7, "override_mmr_data": false, "use_bucket_mmr": true, "use_flat_flex_step": false}, "flexing_rule": [{"attribute": "qFkPcLzc", "criteria": "jzVPmQ0H", "duration": 96, "reference": 0.5152096905578023}, {"attribute": "GpxLk4gk", "criteria": "agOoXKz2", "duration": 59, "reference": 0.42973950147902207}, {"attribute": "mUncYhaB", "criteria": "xZCvqK5T", "duration": 46, "reference": 0.6203503765705577}], "match_options": {"options": [{"name": "6pi7Zjys", "type": "KY614ZA1"}, {"name": "Cr0E0sKI", "type": "jufrRXeW"}, {"name": "HAnUmVQM", "type": "0NM6iIKt"}]}, "matching_rule": [{"attribute": "0FDEiZX5", "criteria": "0U1NEaUu", "reference": 0.6637905743027847}, {"attribute": "al02luQg", "criteria": "4fmXKIZm", "reference": 0.9185800275081982}, {"attribute": "5EqlSQWE", "criteria": "r6wsMyrT", "reference": 0.7693035656416952}], "rebalance_enable": false, "sort_ticket": {"search_result": "distance", "ticket_queue": "none"}, "sort_tickets": [{"search_result": "random", "threshold": 40, "ticket_queue": "largestPartySize"}, {"search_result": "oldestTicketAge", "threshold": 88, "ticket_queue": "oldestTicketAge"}, {"search_result": "distance", "threshold": 44, "ticket_queue": "distance"}], "sub_game_modes": {"H1jp4c8l": {"alliance": {"combination": {"alliances": [[{"max": 2, "min": 2, "name": "iyxs6B6W"}, {"max": 2, "min": 10, "name": "ijQWtxX4"}, {"max": 93, "min": 12, "name": "CotnIwGQ"}], [{"max": 46, "min": 68, "name": "cMrOLwGh"}, {"max": 22, "min": 6, "name": "iyHK0YNI"}, {"max": 94, "min": 81, "name": "INPkSgyJ"}], [{"max": 24, "min": 61, "name": "eTRJYE4Y"}, {"max": 83, "min": 60, "name": "lD3yxXXl"}, {"max": 1, "min": 49, "name": "WOFain1w"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 94, "role_flexing_second": 16}, "max_number": 72, "min_number": 21, "player_max_number": 67, "player_min_number": 44}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 49, "min": 15, "name": "kDnLZDMB"}, {"max": 62, "min": 39, "name": "Gc8WFCUc"}, {"max": 11, "min": 7, "name": "YgRWhwZD"}], [{"max": 36, "min": 82, "name": "63wik7AG"}, {"max": 26, "min": 67, "name": "K5DPUTAx"}, {"max": 46, "min": 48, "name": "CMuvNlva"}], [{"max": 75, "min": 18, "name": "GKMJeuc5"}, {"max": 58, "min": 1, "name": "bG7am5Ln"}, {"max": 63, "min": 44, "name": "tOBzYlMv"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 77, "role_flexing_second": 1}, "duration": 57, "max_number": 47, "min_number": 100, "player_max_number": 94, "player_min_number": 79}, {"combination": {"alliances": [[{"max": 59, "min": 31, "name": "NIQMPOVm"}, {"max": 44, "min": 58, "name": "AmYPvTTd"}, {"max": 44, "min": 2, "name": "JRk1iqQC"}], [{"max": 34, "min": 74, "name": "dbFrsJv9"}, {"max": 75, "min": 40, "name": "3RIyxdbK"}, {"max": 44, "min": 69, "name": "81MymqDC"}], [{"max": 82, "min": 58, "name": "mPfjemRM"}, {"max": 88, "min": 9, "name": "dTUU4n9b"}, {"max": 44, "min": 23, "name": "Kiqw82N2"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 70, "role_flexing_second": 72}, "duration": 68, "max_number": 0, "min_number": 97, "player_max_number": 71, "player_min_number": 21}, {"combination": {"alliances": [[{"max": 80, "min": 1, "name": "l8Fy1JUp"}, {"max": 64, "min": 31, "name": "51OBwpfz"}, {"max": 66, "min": 13, "name": "5R0J5Dfo"}], [{"max": 18, "min": 57, "name": "VUwh4HV5"}, {"max": 52, "min": 54, "name": "g5wb1rc4"}, {"max": 11, "min": 44, "name": "7MYB4EFF"}], [{"max": 38, "min": 88, "name": "BKZ1n2My"}, {"max": 63, "min": 99, "name": "vuieCGzu"}, {"max": 62, "min": 9, "name": "OnqnjBTy"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 53, "role_flexing_second": 88}, "duration": 20, "max_number": 81, "min_number": 14, "player_max_number": 32, "player_min_number": 68}], "name": "QTquNvGl"}, "5x1ZWh3K": {"alliance": {"combination": {"alliances": [[{"max": 68, "min": 29, "name": "LZzttuAa"}, {"max": 58, "min": 87, "name": "qGVJYPrX"}, {"max": 18, "min": 15, "name": "kalcURqn"}], [{"max": 30, "min": 48, "name": "Wh8Suaw4"}, {"max": 39, "min": 26, "name": "EGBwqShR"}, {"max": 66, "min": 77, "name": "HG982knT"}], [{"max": 2, "min": 10, "name": "T1us9svy"}, {"max": 11, "min": 21, "name": "38jEKUoW"}, {"max": 13, "min": 85, "name": "QYkEMsB4"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 15, "role_flexing_second": 83}, "max_number": 84, "min_number": 78, "player_max_number": 30, "player_min_number": 97}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 31, "min": 30, "name": "EOc0khx8"}, {"max": 80, "min": 72, "name": "mml3nvxy"}, {"max": 27, "min": 30, "name": "4S5LokZf"}], [{"max": 99, "min": 93, "name": "6uoQLLJ2"}, {"max": 90, "min": 1, "name": "dTLik14r"}, {"max": 10, "min": 4, "name": "q6zEfSKb"}], [{"max": 99, "min": 33, "name": "S69qCE3C"}, {"max": 35, "min": 26, "name": "b5HxiVVH"}, {"max": 31, "min": 44, "name": "Xc2mDbuX"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 21, "role_flexing_second": 23}, "duration": 39, "max_number": 82, "min_number": 58, "player_max_number": 52, "player_min_number": 37}, {"combination": {"alliances": [[{"max": 81, "min": 96, "name": "nTksHmil"}, {"max": 51, "min": 74, "name": "zE9pR5E4"}, {"max": 19, "min": 96, "name": "eORuxqzN"}], [{"max": 66, "min": 57, "name": "WAm1o6f5"}, {"max": 43, "min": 65, "name": "N6lNj5Nx"}, {"max": 95, "min": 30, "name": "yg9V6GRY"}], [{"max": 72, "min": 54, "name": "2nROsAA2"}, {"max": 54, "min": 25, "name": "2Zty7rLs"}, {"max": 36, "min": 40, "name": "CXeeBVUE"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 11, "role_flexing_second": 6}, "duration": 69, "max_number": 32, "min_number": 14, "player_max_number": 99, "player_min_number": 81}, {"combination": {"alliances": [[{"max": 75, "min": 68, "name": "UlpnwwJH"}, {"max": 27, "min": 45, "name": "8BMQDB4j"}, {"max": 68, "min": 55, "name": "AkdaCJNJ"}], [{"max": 49, "min": 64, "name": "K1fbetDz"}, {"max": 14, "min": 76, "name": "3XlZWUqA"}, {"max": 5, "min": 85, "name": "vpGeZrvj"}], [{"max": 26, "min": 45, "name": "BhdFva1e"}, {"max": 77, "min": 94, "name": "jesLLlJJ"}, {"max": 3, "min": 32, "name": "LdSMBSED"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 67, "role_flexing_second": 89}, "duration": 13, "max_number": 21, "min_number": 98, "player_max_number": 9, "player_min_number": 21}], "name": "pi2IXnFL"}, "ok3nQ3JZ": {"alliance": {"combination": {"alliances": [[{"max": 88, "min": 21, "name": "MYSCCB4c"}, {"max": 83, "min": 22, "name": "Yss4NLst"}, {"max": 36, "min": 26, "name": "f2ePnPB2"}], [{"max": 53, "min": 12, "name": "m0cVvifA"}, {"max": 63, "min": 51, "name": "gtAQlHDy"}, {"max": 0, "min": 55, "name": "HWXLDklH"}], [{"max": 69, "min": 39, "name": "kTIZa2Qw"}, {"max": 36, "min": 17, "name": "yxECr3fU"}, {"max": 46, "min": 9, "name": "1g2cYv5Z"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 58, "role_flexing_second": 94}, "max_number": 39, "min_number": 98, "player_max_number": 71, "player_min_number": 84}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 62, "min": 65, "name": "YUM74G8P"}, {"max": 20, "min": 94, "name": "GN1cqJvs"}, {"max": 18, "min": 19, "name": "XBKsWqQ8"}], [{"max": 41, "min": 23, "name": "4umFi01X"}, {"max": 87, "min": 89, "name": "AAV52mWd"}, {"max": 78, "min": 35, "name": "mBKUTtGv"}], [{"max": 65, "min": 96, "name": "Ms8cVc0a"}, {"max": 84, "min": 24, "name": "mnOWv2K8"}, {"max": 52, "min": 46, "name": "1M2RuGtL"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 10, "role_flexing_second": 75}, "duration": 50, "max_number": 67, "min_number": 3, "player_max_number": 47, "player_min_number": 19}, {"combination": {"alliances": [[{"max": 61, "min": 8, "name": "nr0GfYI3"}, {"max": 15, "min": 66, "name": "JSx1BAzV"}, {"max": 0, "min": 5, "name": "epuWuYil"}], [{"max": 33, "min": 93, "name": "57wK6mhy"}, {"max": 29, "min": 67, "name": "YEOz5Gwq"}, {"max": 4, "min": 61, "name": "aw57aRxV"}], [{"max": 38, "min": 0, "name": "llWKAdEn"}, {"max": 91, "min": 19, "name": "lUH3s03v"}, {"max": 2, "min": 99, "name": "OzoGSe7z"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 74, "role_flexing_second": 76}, "duration": 61, "max_number": 5, "min_number": 89, "player_max_number": 67, "player_min_number": 74}, {"combination": {"alliances": [[{"max": 3, "min": 6, "name": "1KzqrQbk"}, {"max": 29, "min": 75, "name": "USxjpL3S"}, {"max": 54, "min": 57, "name": "UayZm82A"}], [{"max": 7, "min": 61, "name": "mUlMZnmj"}, {"max": 3, "min": 41, "name": "A8Ucn4w0"}, {"max": 58, "min": 29, "name": "Ak14iu4J"}], [{"max": 33, "min": 5, "name": "kTIngnjM"}, {"max": 2, "min": 91, "name": "1pvTQ1rz"}, {"max": 94, "min": 8, "name": "KZ7SeTCl"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 27, "role_flexing_second": 10}, "duration": 61, "max_number": 58, "min_number": 49, "player_max_number": 80, "player_min_number": 72}], "name": "qGFJIa3w"}}, "ticket_flexing_selection": "newest", "ticket_flexing_selections": [{"selection": "newest", "threshold": 12}, {"selection": "pivot", "threshold": 65}, {"selection": "pivot", "threshold": 36}], "use_newest_ticket_for_flexing": false}, "session_queue_timeout_seconds": 37, "social_matchmaking": false, "sub_gamemode_selection": "random", "ticket_observability_enable": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName 'h5qn0CGE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'tce4uej3' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "YXyiNxcR", "players": [{"results": [{"attribute": "gHZ3tZdg", "value": 0.08638295426618137}, {"attribute": "jzVrdfpB", "value": 0.6620587148464409}, {"attribute": "Z8gQxKHu", "value": 0.048790562938188176}], "user_id": "neEIKFhT"}, {"results": [{"attribute": "CBxV9L2X", "value": 0.4592162084956888}, {"attribute": "Ee0opEng", "value": 0.09018653699126544}, {"attribute": "lOqca6o4", "value": 0.15692879415334804}], "user_id": "IDy3mc02"}, {"results": [{"attribute": "HffYO2Ea", "value": 0.7978425260454284}, {"attribute": "MiXkB5Q7", "value": 0.2416180311064754}, {"attribute": "zBOGjy6G", "value": 0.6222739502442738}], "user_id": "GCZdEld8"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "szyMdNQD"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "EXJbpP81", "client_version": "MEnWriWX", "deployment": "biGtnygk", "error_code": 38, "error_message": "PZvtHL6v", "game_mode": "Y9mIIddY", "is_mock": "4bOsDrA9", "joinable": true, "match_id": "buPpb4ln", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 60, "party_attributes": {"vjCx9LL9": {}, "vagH6Oxs": {}, "jSWKRIgG": {}}, "party_id": "fACal7DT", "party_members": [{"extra_attributes": {"v2eK5AgJ": {}, "V2XZppcO": {}, "Q3Taw0UI": {}}, "user_id": "5PQ1Ag46"}, {"extra_attributes": {"ks8NvmId": {}, "xgn166Od": {}, "Fn54MJpH": {}}, "user_id": "vz7EHR9J"}, {"extra_attributes": {"1HyPIKQj": {}, "jAZp0Uh3": {}, "DTPfJzAC": {}}, "user_id": "OAEq6dQn"}], "ticket_created_at": 37, "ticket_id": "lI2bv7ml"}, {"first_ticket_created_at": 49, "party_attributes": {"pbuxrJRc": {}, "zxlqc2ws": {}, "g3fezx1M": {}}, "party_id": "zwBJWkrr", "party_members": [{"extra_attributes": {"znOtiYAO": {}, "DeuwXtpK": {}, "PnT1sGlh": {}}, "user_id": "UIp7n4SX"}, {"extra_attributes": {"IYxCTYYp": {}, "d3FEai4C": {}, "gHTh0xWL": {}}, "user_id": "LBU7Yl0K"}, {"extra_attributes": {"yEdsRV9B": {}, "Gk04AqSn": {}, "IGDLAGnC": {}}, "user_id": "4szMDmi3"}], "ticket_created_at": 84, "ticket_id": "3YJyV86h"}, {"first_ticket_created_at": 28, "party_attributes": {"kjQPV8Wf": {}, "HN12322n": {}, "pOSA6ZeF": {}}, "party_id": "UN3ReUGy", "party_members": [{"extra_attributes": {"bXQjUIKN": {}, "E3vW6LVY": {}, "5Obmwe1A": {}}, "user_id": "m7yhkfPN"}, {"extra_attributes": {"4dEmPaa2": {}, "jyxLMxoM": {}, "OKcEzUd8": {}}, "user_id": "RO1F7hS4"}, {"extra_attributes": {"Cahb9rCL": {}, "dRDMI7ml": {}, "xWDCSGR3": {}}, "user_id": "9OedpeMr"}], "ticket_created_at": 45, "ticket_id": "cFJDlR7I"}]}, {"matching_parties": [{"first_ticket_created_at": 90, "party_attributes": {"T5kXrmz3": {}, "A9nA6ew3": {}, "tTZ4l8hc": {}}, "party_id": "4Z23keu1", "party_members": [{"extra_attributes": {"0QCq5VDh": {}, "Bw6gw1Zt": {}, "xshn4Fvs": {}}, "user_id": "rMHt3guI"}, {"extra_attributes": {"9omTdBkl": {}, "CW7cVhjZ": {}, "V2QgdlWb": {}}, "user_id": "uk6SNMvJ"}, {"extra_attributes": {"i9wYrryi": {}, "NlvAMxpJ": {}, "xrvtpTtF": {}}, "user_id": "1VUNkcyt"}], "ticket_created_at": 87, "ticket_id": "QQkhZDvV"}, {"first_ticket_created_at": 83, "party_attributes": {"Pa1gdVeV": {}, "SERp7LGi": {}, "hCmRQIiK": {}}, "party_id": "RMtYgzoL", "party_members": [{"extra_attributes": {"VNoo7LzE": {}, "tNM1dwOQ": {}, "mQ5Wyr2i": {}}, "user_id": "EsKXabNG"}, {"extra_attributes": {"UqWwWInu": {}, "nvsnVN5X": {}, "WRhhEws5": {}}, "user_id": "vBgIjAQs"}, {"extra_attributes": {"QmFm4m4s": {}, "iPCUrk8D": {}, "MAwcH8Kg": {}}, "user_id": "X83FqKJS"}], "ticket_created_at": 31, "ticket_id": "rQSddqBa"}, {"first_ticket_created_at": 7, "party_attributes": {"seqmpJqI": {}, "cNXOx0xE": {}, "iC7SmF5N": {}}, "party_id": "bNcp3RhO", "party_members": [{"extra_attributes": {"BmBDhlLi": {}, "co2TTbGS": {}, "Qb73Hcr6": {}}, "user_id": "dotjhZq5"}, {"extra_attributes": {"ZIsGZK5R": {}, "LachiTr5": {}, "U2ycZ4ZW": {}}, "user_id": "klOBTFLN"}, {"extra_attributes": {"GqHE4fKl": {}, "reeP12UI": {}, "SUms7d1j": {}}, "user_id": "hRucf06p"}], "ticket_created_at": 82, "ticket_id": "aQY5Cqpy"}]}, {"matching_parties": [{"first_ticket_created_at": 4, "party_attributes": {"srTfNFwT": {}, "xWwmeZH6": {}, "skTzNcX4": {}}, "party_id": "ya4UlThQ", "party_members": [{"extra_attributes": {"NP9UAFnS": {}, "Bs0QTqD4": {}, "M0KOXViL": {}}, "user_id": "D6OWC9yK"}, {"extra_attributes": {"PJ8yoDsb": {}, "zsGWieUl": {}, "2gSmVsFr": {}}, "user_id": "dLW4VRk4"}, {"extra_attributes": {"XPi3ZYq4": {}, "5rbYZ26J": {}, "lyV5kX5w": {}}, "user_id": "dN1uHZnF"}], "ticket_created_at": 44, "ticket_id": "UtHcBvdY"}, {"first_ticket_created_at": 5, "party_attributes": {"vQU3b2EB": {}, "l0Mq9boJ": {}, "Uw8Eqmfj": {}}, "party_id": "5lCyKVa7", "party_members": [{"extra_attributes": {"UaqAgBy3": {}, "j0veOPAy": {}, "JlIhSP42": {}}, "user_id": "dDTy49LI"}, {"extra_attributes": {"rDsSYNUV": {}, "ZNgqXWMk": {}, "fIy1SBWC": {}}, "user_id": "kysWj4YY"}, {"extra_attributes": {"zjgw7wJV": {}, "2B2SjpMQ": {}, "YjxLC2uw": {}}, "user_id": "ZGaDmjpA"}], "ticket_created_at": 100, "ticket_id": "BeoIy6N5"}, {"first_ticket_created_at": 91, "party_attributes": {"WP9oBg0R": {}, "iYH5gJPG": {}, "fiWuz2RW": {}}, "party_id": "76ZioOEW", "party_members": [{"extra_attributes": {"cCH4g8Oq": {}, "hNCwHvOx": {}, "vVJAnt6g": {}}, "user_id": "BtMroYkU"}, {"extra_attributes": {"pT1OSQRT": {}, "w8ZkChSm": {}, "96BvXrpC": {}}, "user_id": "kIjcPKdS"}, {"extra_attributes": {"xNcP97ay": {}, "tfyENiMR": {}, "DSRb4Jwj": {}}, "user_id": "xR1gwpAz"}], "ticket_created_at": 82, "ticket_id": "JjYJWR1b"}]}], "namespace": "zE3yrRdf", "party_attributes": {"vvv1MTsH": {}, "IvWoeRzZ": {}, "pMD8sv9Y": {}}, "party_id": "QNz4QbQi", "queued_at": 40, "region": "5TSZo8Eo", "server_name": "bwX7P1gy", "status": "Dx4xypbX", "ticket_id": "o8kUjTrX", "ticket_ids": ["O6dh9qhA", "358QBp6Z", "rPTs39l9"], "updated_at": "1979-02-04T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "2s4iqeVf"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'sVE2iSiy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 20, "userID": "ePJWRZTs", "weight": 0.07858317723849939}' \
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
    --matchIDs '8sPOKQUz' \
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
    --strategy 'qXuZmyRW' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'FpBuzAL1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'c4oLAqXE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCannotMatch", "deployment": "EtAYcDXU", "description": "Vu4Tjmr4", "findMatchTimeoutSeconds": 4, "joinable": false, "max_delay_ms": 69, "region_expansion_range_ms": 1, "region_expansion_rate_ms": 33, "region_latency_initial_range_ms": 64, "region_latency_max_ms": 22, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 48, "min": 65, "name": "na8qq5l0"}, {"max": 35, "min": 94, "name": "HYenz1x4"}, {"max": 70, "min": 46, "name": "oaYummlD"}], [{"max": 95, "min": 73, "name": "Ox8AKzYk"}, {"max": 96, "min": 4, "name": "bcIORooh"}, {"max": 11, "min": 39, "name": "OGi7V9Iw"}], [{"max": 12, "min": 40, "name": "nEY9p9sJ"}, {"max": 98, "min": 100, "name": "ZMGaajGs"}, {"max": 33, "min": 76, "name": "Qwy4C8Pv"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 32, "role_flexing_second": 15}, "maxNumber": 21, "minNumber": 87, "playerMaxNumber": 97, "playerMinNumber": 32}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 48, "min": 84, "name": "zwi5VMCx"}, {"max": 10, "min": 11, "name": "6A83LD6k"}, {"max": 62, "min": 97, "name": "eC8oTDcB"}], [{"max": 90, "min": 58, "name": "0LDRwZXn"}, {"max": 34, "min": 30, "name": "MRyJG6R5"}, {"max": 18, "min": 34, "name": "3d7UjC3S"}], [{"max": 21, "min": 18, "name": "mj0pp7jK"}, {"max": 60, "min": 98, "name": "AaiqTZZt"}, {"max": 37, "min": 20, "name": "ruRZqe0Y"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 35, "role_flexing_second": 41}, "duration": 54, "max_number": 61, "min_number": 96, "player_max_number": 38, "player_min_number": 54}, {"combination": {"alliances": [[{"max": 96, "min": 59, "name": "cM6a2WUr"}, {"max": 4, "min": 51, "name": "JB25w6Hw"}, {"max": 94, "min": 70, "name": "kdO5eyYv"}], [{"max": 43, "min": 89, "name": "ostXdJzC"}, {"max": 71, "min": 8, "name": "hg5mqWiL"}, {"max": 95, "min": 66, "name": "YqUiJesn"}], [{"max": 95, "min": 25, "name": "P2URuF9Q"}, {"max": 20, "min": 57, "name": "lutZBA62"}, {"max": 51, "min": 79, "name": "Gx8fu5Ch"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 22, "role_flexing_second": 42}, "duration": 97, "max_number": 32, "min_number": 90, "player_max_number": 23, "player_min_number": 68}, {"combination": {"alliances": [[{"max": 28, "min": 84, "name": "oFkbx9R1"}, {"max": 26, "min": 71, "name": "lwvV0pqp"}, {"max": 51, "min": 98, "name": "1PWuO6D6"}], [{"max": 44, "min": 50, "name": "6HCF5su3"}, {"max": 25, "min": 40, "name": "3xtX1r8O"}, {"max": 83, "min": 96, "name": "hyCeMnD1"}], [{"max": 64, "min": 87, "name": "OXpEwN2L"}, {"max": 69, "min": 33, "name": "hiQeTrSJ"}, {"max": 14, "min": 53, "name": "elTA0q9K"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 72, "role_flexing_second": 93}, "duration": 66, "max_number": 49, "min_number": 52, "player_max_number": 86, "player_min_number": 90}], "batch_size": 0, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 92, "flex_flat_step_range": 11, "flex_immunity_count": 61, "flex_range_max": 26, "flex_rate_ms": 40, "flex_step_max": 91, "force_authority_match": true, "initial_step_range": 9, "mmr_max": 57, "mmr_mean": 12, "mmr_min": 9, "mmr_std_dev": 85, "override_mmr_data": true, "use_bucket_mmr": false, "use_flat_flex_step": false}, "flexingRules": [{"attribute": "HY7bAYCL", "criteria": "Hl33i59W", "duration": 37, "reference": 0.28486195068651243}, {"attribute": "L04tm9CF", "criteria": "mUiIyeWF", "duration": 90, "reference": 0.39260585450368957}, {"attribute": "0XEsCSFg", "criteria": "289X7iut", "duration": 70, "reference": 0.7604816381293767}], "match_options": {"options": [{"name": "N82FijKZ", "type": "4ZtqM32Z"}, {"name": "8VbNIHfN", "type": "ZrB8ZxsG"}, {"name": "ZGLr78PB", "type": "rFCFXdvD"}]}, "matchingRules": [{"attribute": "1Uni2mGJ", "criteria": "yUDytvw2", "reference": 0.5696839117604224}, {"attribute": "Ek7QSIkQ", "criteria": "EJA4Q3PY", "reference": 0.9657438812273553}, {"attribute": "1hRf6kZF", "criteria": "aiBr1dwr", "reference": 0.6927192530034392}], "sort_ticket": {"search_result": "distance", "ticket_queue": "none"}, "sort_tickets": [{"search_result": "oldestTicketAge", "threshold": 19, "ticket_queue": "none"}, {"search_result": "largestPartySize", "threshold": 42, "ticket_queue": "oldestTicketAge"}, {"search_result": "none", "threshold": 14, "ticket_queue": "none"}], "sub_game_modes": {}, "ticket_flexing_selection": "newest", "ticket_flexing_selections": [{"selection": "pivot", "threshold": 71}, {"selection": "oldest", "threshold": 3}, {"selection": "random", "threshold": 93}], "use_newest_ticket_for_flexing": true}, "sessionQueueTimeoutSeconds": 65, "socialMatchmaking": true, "sub_gamemode_selection": "ticketOrder", "ticket_observability_enable": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName 'K57jC7Jl' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName 'yPhFeAhW' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName 'haqcGOlM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 79}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName 'VQQ39smB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName '4uezDSev' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "KcsIqnuK", "count": 89, "mmrMax": 0.7282356188144831, "mmrMean": 0.23640723671319452, "mmrMin": 0.15032350215699208, "mmrStdDev": 0.22484374174150157}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'GVAik3x9' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 56, "party_attributes": {"57XYGZ44": {}, "rqR3LFW7": {}, "Au0v2OK4": {}}, "party_id": "lRBJxQbl", "party_members": [{"extra_attributes": {"CG0NuQtu": {}, "QzMWkxXT": {}, "oOSefKhZ": {}}, "user_id": "Y7oL0zCH"}, {"extra_attributes": {"UurHKkoy": {}, "IsdhA0DO": {}, "o3DV0XFj": {}}, "user_id": "MmxEjYh1"}, {"extra_attributes": {"CDqarRX9": {}, "NGlPlJoV": {}, "YKihy4Bo": {}}, "user_id": "zdpoIZ4z"}], "ticket_created_at": 92, "ticket_id": "l9e2xhQ6"}, {"first_ticket_created_at": 48, "party_attributes": {"xI0AKASt": {}, "D9xgf6wJ": {}, "A6isyUl7": {}}, "party_id": "WazsXXgJ", "party_members": [{"extra_attributes": {"FjamMwQw": {}, "8JbYBRLR": {}, "sdh2qpkW": {}}, "user_id": "10U0wBQe"}, {"extra_attributes": {"zxOCS7p1": {}, "hlK84lyW": {}, "nI6da2aV": {}}, "user_id": "KrLTYagz"}, {"extra_attributes": {"NAOwaIG5": {}, "BBa3cOfk": {}, "Wi4TpQaf": {}}, "user_id": "YL58CULW"}], "ticket_created_at": 88, "ticket_id": "STiiSD6X"}, {"first_ticket_created_at": 100, "party_attributes": {"sBb6knI1": {}, "iihMx30N": {}, "lEDMsaFS": {}}, "party_id": "iKFPnKXp", "party_members": [{"extra_attributes": {"n4yuuLxM": {}, "dGP81DkG": {}, "MIS11f0u": {}}, "user_id": "Wuw9Wvoe"}, {"extra_attributes": {"y9VByR90": {}, "A7YGHDh6": {}, "i5CbDtBa": {}}, "user_id": "YX6uHqSP"}, {"extra_attributes": {"wRcxVqUs": {}, "mMNTAMan": {}, "8LrcLbeL": {}}, "user_id": "FjcjfwNJ"}], "ticket_created_at": 9, "ticket_id": "RTdVFncC"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName 'KiaWUByB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 8}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'ghWU2jSU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'Po4rewry' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'qhOz0x2N' \
    --matchID 'bxZDg3kc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["7IqCo1ey", "UR4ioJmd", "kwDck3gI"], "party_id": "ZpzbPDjR", "user_id": "wHKkRxnR"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'FzPPDmcI' \
    --matchID 'Fojy0qy2' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'fLmB5Unx' \
    --matchID 'Bv7hkyJb' \
    --namespace "$AB_NAMESPACE" \
    --userID 'rwIyCJ5S' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName 'QjfARoPW' \
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
    --channelName 'OITMyapB' \
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