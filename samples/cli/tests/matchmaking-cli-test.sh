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
    --limit '45' \
    --offset '55' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatchOnDifferentTeam", "deployment": "GRIjrSMg", "description": "rTll7Bgi", "find_match_timeout_seconds": 94, "game_mode": "bPVlV2Li", "joinable": false, "max_delay_ms": 3, "region_expansion_range_ms": 20, "region_expansion_rate_ms": 9, "region_latency_initial_range_ms": 47, "region_latency_max_ms": 67, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 79, "min": 37, "name": "YQdjh0O9"}, {"max": 55, "min": 5, "name": "gfUiqBpc"}, {"max": 10, "min": 95, "name": "7pFUVfFH"}], [{"max": 88, "min": 80, "name": "ULxSxn52"}, {"max": 100, "min": 97, "name": "GsXTqR70"}, {"max": 3, "min": 18, "name": "QaR77N2o"}], [{"max": 81, "min": 44, "name": "Q7kuUb21"}, {"max": 31, "min": 22, "name": "uPmNIQ23"}, {"max": 58, "min": 63, "name": "c2Gyx2gJ"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 58, "role_flexing_second": 55}, "max_number": 30, "min_number": 16, "player_max_number": 85, "player_min_number": 18}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 36, "min": 91, "name": "j3hF8kVG"}, {"max": 98, "min": 89, "name": "i6fsN6WL"}, {"max": 19, "min": 30, "name": "kO27UgH2"}], [{"max": 83, "min": 7, "name": "HAx83Dce"}, {"max": 85, "min": 97, "name": "LzUvpNjI"}, {"max": 59, "min": 78, "name": "yD4piUyt"}], [{"max": 51, "min": 52, "name": "c6DtZRKg"}, {"max": 19, "min": 87, "name": "op1DLfOc"}, {"max": 11, "min": 24, "name": "b6Epv5it"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 18, "role_flexing_second": 100}, "duration": 12, "max_number": 64, "min_number": 72, "player_max_number": 77, "player_min_number": 64}, {"combination": {"alliances": [[{"max": 46, "min": 50, "name": "UbyNPoIE"}, {"max": 16, "min": 4, "name": "6Epr6Rkb"}, {"max": 32, "min": 18, "name": "48pQCzFo"}], [{"max": 5, "min": 59, "name": "cXekvPLh"}, {"max": 88, "min": 88, "name": "LOcGH479"}, {"max": 90, "min": 18, "name": "zTMr6ZDd"}], [{"max": 87, "min": 2, "name": "WEzKAEAF"}, {"max": 58, "min": 60, "name": "IQQMyPBQ"}, {"max": 100, "min": 65, "name": "qnL29bwl"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 16, "role_flexing_second": 79}, "duration": 31, "max_number": 83, "min_number": 56, "player_max_number": 50, "player_min_number": 21}, {"combination": {"alliances": [[{"max": 91, "min": 83, "name": "s9M7SXif"}, {"max": 20, "min": 68, "name": "tcMVyfwp"}, {"max": 19, "min": 41, "name": "ISz1UIsk"}], [{"max": 65, "min": 49, "name": "qEURz0MK"}, {"max": 28, "min": 8, "name": "TYB0nS5K"}, {"max": 24, "min": 74, "name": "eq3vbQMr"}], [{"max": 11, "min": 70, "name": "6CptMLlV"}, {"max": 25, "min": 33, "name": "3yy9n3AK"}, {"max": 54, "min": 18, "name": "3RBjvc67"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 25, "role_flexing_second": 19}, "duration": 94, "max_number": 87, "min_number": 18, "player_max_number": 47, "player_min_number": 81}], "batch_size": 35, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 4, "flex_flat_step_range": 95, "flex_immunity_count": 79, "flex_range_max": 22, "flex_rate_ms": 8, "flex_step_max": 90, "force_authority_match": false, "initial_step_range": 10, "mmr_max": 25, "mmr_mean": 71, "mmr_min": 76, "mmr_std_dev": 40, "override_mmr_data": false, "use_bucket_mmr": false, "use_flat_flex_step": true}, "flexing_rule": [{"attribute": "w3rtiynG", "criteria": "h7So9ekd", "duration": 11, "reference": 0.2761825535789312}, {"attribute": "lBcbKuoz", "criteria": "OrpBiIPy", "duration": 25, "reference": 0.3126761357643453}, {"attribute": "G245YBND", "criteria": "bTqKtouZ", "duration": 40, "reference": 0.5498738260542585}], "match_options": {"options": [{"name": "GzxZQxen", "type": "XyYcnU7q"}, {"name": "14gqAXif", "type": "rpRvk2a6"}, {"name": "bGoMeKnI", "type": "ecc2rcDl"}]}, "matching_rule": [{"attribute": "bebjmqIk", "criteria": "NMVaunSN", "reference": 0.26420585576450695}, {"attribute": "KNsysiDl", "criteria": "ATgVTTpL", "reference": 0.6293261317673925}, {"attribute": "8q735OxG", "criteria": "AzpIhuzR", "reference": 0.9393520237117547}], "rebalance_enable": true, "sort_ticket": {"search_result": "MsTYma6q", "ticket_queue": "EzHvcByY"}, "sort_tickets": [{"search_result": "sQKmqfXv", "threshold": 85, "ticket_queue": "oHlRJSzz"}, {"search_result": "TjKsgkx0", "threshold": 79, "ticket_queue": "oQeQOC0z"}, {"search_result": "uUOi5BvY", "threshold": 3, "ticket_queue": "nYtfR4qs"}], "sub_game_modes": {"klUgR2Qe": {"alliance": {"combination": {"alliances": [[{"max": 72, "min": 6, "name": "t8jCnDCW"}, {"max": 43, "min": 25, "name": "ACz2PSxw"}, {"max": 50, "min": 89, "name": "SZ0P8LC0"}], [{"max": 33, "min": 80, "name": "dpObSnCF"}, {"max": 4, "min": 63, "name": "874M0qcd"}, {"max": 89, "min": 70, "name": "9gvF3zGN"}], [{"max": 17, "min": 65, "name": "t6MtXZp0"}, {"max": 35, "min": 20, "name": "89o6d2Kg"}, {"max": 24, "min": 61, "name": "vACexdwN"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 50, "role_flexing_second": 0}, "max_number": 95, "min_number": 83, "player_max_number": 3, "player_min_number": 91}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 42, "min": 82, "name": "7bTwPINM"}, {"max": 25, "min": 48, "name": "BVoxf6Z3"}, {"max": 51, "min": 31, "name": "ZepjIwPL"}], [{"max": 100, "min": 72, "name": "DGbgMKXl"}, {"max": 19, "min": 2, "name": "nGbKSyYE"}, {"max": 48, "min": 7, "name": "hTEP3doP"}], [{"max": 35, "min": 64, "name": "ZLaDoYX9"}, {"max": 38, "min": 39, "name": "WdGjP4Re"}, {"max": 21, "min": 51, "name": "QFKDB9L8"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 16, "role_flexing_second": 67}, "duration": 29, "max_number": 65, "min_number": 66, "player_max_number": 88, "player_min_number": 10}, {"combination": {"alliances": [[{"max": 5, "min": 59, "name": "RnQmKjkP"}, {"max": 9, "min": 33, "name": "NC1cUWmL"}, {"max": 22, "min": 79, "name": "DRyxBLQr"}], [{"max": 62, "min": 37, "name": "KfN9yJp3"}, {"max": 95, "min": 74, "name": "S54dLfFy"}, {"max": 27, "min": 6, "name": "8GE0ApNB"}], [{"max": 72, "min": 4, "name": "tnb5SYPu"}, {"max": 94, "min": 100, "name": "lEsf4S21"}, {"max": 65, "min": 75, "name": "tYjs5daW"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 92, "role_flexing_second": 92}, "duration": 58, "max_number": 11, "min_number": 92, "player_max_number": 11, "player_min_number": 88}, {"combination": {"alliances": [[{"max": 68, "min": 6, "name": "iffqg36d"}, {"max": 9, "min": 42, "name": "CtnEo2eo"}, {"max": 49, "min": 78, "name": "fMMgZWzm"}], [{"max": 6, "min": 72, "name": "nOFGF7qA"}, {"max": 90, "min": 53, "name": "X6UUhn8D"}, {"max": 21, "min": 28, "name": "h50ugqyo"}], [{"max": 48, "min": 59, "name": "ynZcVMzb"}, {"max": 2, "min": 18, "name": "8fltsRnk"}, {"max": 23, "min": 32, "name": "Aadx49OI"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 42, "role_flexing_second": 81}, "duration": 10, "max_number": 61, "min_number": 16, "player_max_number": 27, "player_min_number": 61}], "name": "zSDoLEQB"}, "DeMpm8uh": {"alliance": {"combination": {"alliances": [[{"max": 59, "min": 46, "name": "e35r5MTG"}, {"max": 39, "min": 7, "name": "HzMmtl5i"}, {"max": 8, "min": 71, "name": "EoJDUnDI"}], [{"max": 16, "min": 35, "name": "NMoVFRQR"}, {"max": 19, "min": 53, "name": "G2z8MvIT"}, {"max": 37, "min": 50, "name": "S2MPtDEg"}], [{"max": 57, "min": 8, "name": "8hiM2v3i"}, {"max": 12, "min": 39, "name": "WZ8KCy5U"}, {"max": 71, "min": 89, "name": "ibB53LNi"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 74, "role_flexing_second": 57}, "max_number": 95, "min_number": 16, "player_max_number": 24, "player_min_number": 34}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 100, "min": 50, "name": "7gTV3TRL"}, {"max": 21, "min": 51, "name": "mxwbkBiM"}, {"max": 5, "min": 100, "name": "2aH4UQmW"}], [{"max": 44, "min": 29, "name": "2O3n8vlZ"}, {"max": 49, "min": 83, "name": "Zu7yQh0u"}, {"max": 76, "min": 0, "name": "p1JdcQ5R"}], [{"max": 97, "min": 1, "name": "ide8wkYV"}, {"max": 6, "min": 11, "name": "MOGyePx5"}, {"max": 31, "min": 39, "name": "IO2QvTUb"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 11, "role_flexing_second": 55}, "duration": 5, "max_number": 66, "min_number": 10, "player_max_number": 44, "player_min_number": 32}, {"combination": {"alliances": [[{"max": 40, "min": 18, "name": "CSqUOOVB"}, {"max": 65, "min": 42, "name": "mJ9xJ9U0"}, {"max": 27, "min": 34, "name": "YMkscEXc"}], [{"max": 1, "min": 28, "name": "0g5fk6wT"}, {"max": 48, "min": 62, "name": "ScqCmNsq"}, {"max": 98, "min": 33, "name": "yJKBHkMa"}], [{"max": 99, "min": 47, "name": "adc8vEL6"}, {"max": 88, "min": 67, "name": "A6bkhJCF"}, {"max": 5, "min": 97, "name": "emZpcgpP"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 73, "role_flexing_second": 5}, "duration": 34, "max_number": 64, "min_number": 66, "player_max_number": 33, "player_min_number": 84}, {"combination": {"alliances": [[{"max": 70, "min": 41, "name": "YIRPdq1J"}, {"max": 2, "min": 67, "name": "ZtqhO5ac"}, {"max": 34, "min": 52, "name": "x33Gvtx3"}], [{"max": 88, "min": 22, "name": "wjFAqDfs"}, {"max": 59, "min": 64, "name": "bppRt1t8"}, {"max": 47, "min": 7, "name": "QvMuY83f"}], [{"max": 48, "min": 81, "name": "8qT3zqyi"}, {"max": 39, "min": 28, "name": "NxqkViiX"}, {"max": 79, "min": 84, "name": "ovoe5p08"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 56, "role_flexing_second": 78}, "duration": 100, "max_number": 21, "min_number": 14, "player_max_number": 95, "player_min_number": 95}], "name": "ew7xYcoW"}, "FNalN0Zr": {"alliance": {"combination": {"alliances": [[{"max": 5, "min": 92, "name": "7qnSSfGO"}, {"max": 92, "min": 39, "name": "m6bA1Emg"}, {"max": 90, "min": 68, "name": "pzKoQphW"}], [{"max": 30, "min": 18, "name": "uXHDvu3W"}, {"max": 15, "min": 59, "name": "hgEO8fV9"}, {"max": 25, "min": 14, "name": "G2ZZctJB"}], [{"max": 65, "min": 42, "name": "66I40nwF"}, {"max": 72, "min": 79, "name": "QBirYSsI"}, {"max": 72, "min": 52, "name": "5308p68c"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 58, "role_flexing_second": 38}, "max_number": 14, "min_number": 88, "player_max_number": 22, "player_min_number": 24}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 85, "min": 13, "name": "zH2CjTHZ"}, {"max": 79, "min": 23, "name": "Ej2LgkTX"}, {"max": 84, "min": 91, "name": "IGsjB6Ib"}], [{"max": 6, "min": 51, "name": "ETJ26HUc"}, {"max": 85, "min": 86, "name": "JBZEs7GB"}, {"max": 60, "min": 56, "name": "3ORolTGd"}], [{"max": 21, "min": 70, "name": "HjRP1bAd"}, {"max": 79, "min": 59, "name": "yVdA36Xj"}, {"max": 4, "min": 18, "name": "SlCWtVaJ"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 52, "role_flexing_second": 50}, "duration": 77, "max_number": 78, "min_number": 33, "player_max_number": 73, "player_min_number": 35}, {"combination": {"alliances": [[{"max": 28, "min": 35, "name": "11uaCRvC"}, {"max": 35, "min": 71, "name": "vzG9W21U"}, {"max": 28, "min": 49, "name": "eh7Ehkp2"}], [{"max": 22, "min": 67, "name": "z7vmwYbN"}, {"max": 9, "min": 67, "name": "VHIvC7h5"}, {"max": 58, "min": 54, "name": "vfHDoS4C"}], [{"max": 7, "min": 75, "name": "4y7yIsP8"}, {"max": 11, "min": 78, "name": "PFdOG3bf"}, {"max": 92, "min": 29, "name": "KOdSoSpF"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 42, "role_flexing_second": 59}, "duration": 99, "max_number": 92, "min_number": 63, "player_max_number": 0, "player_min_number": 14}, {"combination": {"alliances": [[{"max": 47, "min": 70, "name": "QgXZyIBw"}, {"max": 68, "min": 14, "name": "o4VJW1jy"}, {"max": 68, "min": 32, "name": "G33XSdej"}], [{"max": 32, "min": 12, "name": "kMBYwavo"}, {"max": 96, "min": 38, "name": "5E8ejQmn"}, {"max": 63, "min": 9, "name": "yCunevM6"}], [{"max": 25, "min": 4, "name": "YTzo92MV"}, {"max": 6, "min": 58, "name": "dyzP9RRb"}, {"max": 74, "min": 8, "name": "8wOhwV9v"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 21, "role_flexing_second": 6}, "duration": 69, "max_number": 23, "min_number": 96, "player_max_number": 92, "player_min_number": 87}], "name": "JgKBJwjL"}}, "ticket_flexing_selection": "JXWl5UNN", "ticket_flexing_selections": [{"selection": "fQYob0Tw", "threshold": 5}, {"selection": "a1ePkRH3", "threshold": 14}, {"selection": "vqQuQ7yX", "threshold": 15}], "use_newest_ticket_for_flexing": false}, "session_queue_timeout_seconds": 36, "social_matchmaking": false, "sub_gamemode_selection": "ticketOrder", "ticket_observability_enable": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName 'bG3RWOfy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'Xy0F8Wy0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "MjJ6tOKN", "players": [{"results": [{"attribute": "wJxfbwdq", "value": 0.7604819026877309}, {"attribute": "OKzndhB6", "value": 0.7397298873789664}, {"attribute": "ygshr7Dy", "value": 0.761537747372403}], "user_id": "DjoduuBX"}, {"results": [{"attribute": "akzfKVba", "value": 0.49414703455356623}, {"attribute": "B1HXCSeZ", "value": 0.9653293054886772}, {"attribute": "al3DiTNK", "value": 0.4988639158286674}], "user_id": "qHRTq7Yh"}, {"results": [{"attribute": "TksNfbjp", "value": 0.6687983575726163}, {"attribute": "4MbjFrve", "value": 0.1418564781496845}, {"attribute": "A43mCU0Z", "value": 0.5634642512474031}], "user_id": "rbGAe161"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "rgBNSeyN"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "W87upAKV", "client_version": "R6KgYWE6", "deployment": "j2WVFPZk", "error_code": 0, "error_message": "q7XrlrdU", "game_mode": "JzHyJHHx", "is_mock": "N0YPkUUH", "joinable": true, "match_id": "h4ukTH9o", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 69, "party_attributes": {"zTsE7EZz": {}, "gJb1WzZ6": {}, "dMa75JcA": {}}, "party_id": "CzrsHsx0", "party_members": [{"extra_attributes": {"EgDL2E3a": {}, "GqMizpno": {}, "FxzgmuQB": {}}, "user_id": "0XZihq1r"}, {"extra_attributes": {"UJTfCq4Y": {}, "UCdOUIeA": {}, "az5dXuh5": {}}, "user_id": "5kI1xW97"}, {"extra_attributes": {"JwsEsxRQ": {}, "rAjH6uXe": {}, "tUvn2Z0o": {}}, "user_id": "INp0RCFB"}], "ticket_created_at": 32, "ticket_id": "w9uCnMQ9"}, {"first_ticket_created_at": 6, "party_attributes": {"2uPQYZt4": {}, "t2VkqXLx": {}, "FtpJAzUD": {}}, "party_id": "KXwUT6GI", "party_members": [{"extra_attributes": {"Gx9t6Bk1": {}, "nLBgoOUk": {}, "JGT3nBpa": {}}, "user_id": "CwwnRqQh"}, {"extra_attributes": {"tthAeIrO": {}, "IpVoJL8l": {}, "VtvMizuK": {}}, "user_id": "1cEwTimN"}, {"extra_attributes": {"xM2bb9N4": {}, "obfqumbI": {}, "CQZwiL5e": {}}, "user_id": "CGcdxhiz"}], "ticket_created_at": 15, "ticket_id": "jQQXdJMF"}, {"first_ticket_created_at": 16, "party_attributes": {"JcxFVwDz": {}, "eCR8n4Yz": {}, "mUrrQp3H": {}}, "party_id": "GfKLURNm", "party_members": [{"extra_attributes": {"leELvuth": {}, "SyZyesV3": {}, "XzOvCUKd": {}}, "user_id": "zdLxdxrU"}, {"extra_attributes": {"HEVUMDzw": {}, "EBPV3vjt": {}, "12pR6kQ7": {}}, "user_id": "XWqThL9a"}, {"extra_attributes": {"855u6vuU": {}, "PNOYj45m": {}, "a8rbd0m0": {}}, "user_id": "n2vZPUPg"}], "ticket_created_at": 26, "ticket_id": "R6pHnAkx"}]}, {"matching_parties": [{"first_ticket_created_at": 52, "party_attributes": {"NX0xpygh": {}, "nPPXMRVL": {}, "Bkg5t4jU": {}}, "party_id": "wmMlitqh", "party_members": [{"extra_attributes": {"uxkZPNGQ": {}, "dqpNwj6m": {}, "radcGRxp": {}}, "user_id": "blrEjSBb"}, {"extra_attributes": {"nGbnVGbl": {}, "kX0UqnU3": {}, "k3LbzUJg": {}}, "user_id": "rsI2igEv"}, {"extra_attributes": {"OWEkqWLm": {}, "OTERg9lw": {}, "kbUfyP8u": {}}, "user_id": "PbMhxx2M"}], "ticket_created_at": 48, "ticket_id": "Pm3HPDSs"}, {"first_ticket_created_at": 72, "party_attributes": {"BuiWC4rK": {}, "MriGPEI3": {}, "kj7KnH2O": {}}, "party_id": "B5x8zRHV", "party_members": [{"extra_attributes": {"NVXrTcng": {}, "JTtKed9h": {}, "dx1FR4uM": {}}, "user_id": "YerFyMEK"}, {"extra_attributes": {"qkrMrKIO": {}, "WGYBGktO": {}, "rTUXiYJd": {}}, "user_id": "j0woqJwD"}, {"extra_attributes": {"mdb1j4i0": {}, "64co4lJg": {}, "gOb5rGcs": {}}, "user_id": "Fn2MbJXE"}], "ticket_created_at": 23, "ticket_id": "VIJFE1uH"}, {"first_ticket_created_at": 94, "party_attributes": {"TEb3AOgU": {}, "7TiDJlPc": {}, "fLRPT91v": {}}, "party_id": "JyVXtcos", "party_members": [{"extra_attributes": {"LL5NJfjs": {}, "LriBnpAh": {}, "60NTh4LJ": {}}, "user_id": "6sCEUeP1"}, {"extra_attributes": {"Ivb53izf": {}, "4Uh81MRo": {}, "G8LX0bIC": {}}, "user_id": "kHu5fvw2"}, {"extra_attributes": {"epy4FX8o": {}, "ImLr1dkI": {}, "mymNaAqc": {}}, "user_id": "MuB4Rljr"}], "ticket_created_at": 20, "ticket_id": "KFcQNUpn"}]}, {"matching_parties": [{"first_ticket_created_at": 86, "party_attributes": {"zHQbeuN0": {}, "wXyc0dUp": {}, "g8T0wNLz": {}}, "party_id": "iwmBcVSj", "party_members": [{"extra_attributes": {"4cpcg3Kv": {}, "46lXFqMB": {}, "yJCzB9nA": {}}, "user_id": "CuVExo1v"}, {"extra_attributes": {"QCY8iij7": {}, "aBuFdbAu": {}, "6RfZJk7V": {}}, "user_id": "Pa1heF4o"}, {"extra_attributes": {"qK5deKHo": {}, "DCaeBCeG": {}, "mAfPQa8d": {}}, "user_id": "IJwnGEFF"}], "ticket_created_at": 27, "ticket_id": "aEJudXeA"}, {"first_ticket_created_at": 71, "party_attributes": {"L8qnF0ST": {}, "CDxle0xb": {}, "Qfau6b5l": {}}, "party_id": "ILB5a0FO", "party_members": [{"extra_attributes": {"r0rbS5bZ": {}, "d6ZPXstp": {}, "MGm783fP": {}}, "user_id": "3HEN5BH5"}, {"extra_attributes": {"xXuHMWnP": {}, "pP1zvZ72": {}, "TwwqPWLI": {}}, "user_id": "1sZgpiVe"}, {"extra_attributes": {"azK4MTCS": {}, "vQWSd3i0": {}, "06F3e1GM": {}}, "user_id": "yUaGrzwq"}], "ticket_created_at": 90, "ticket_id": "rMWISAYq"}, {"first_ticket_created_at": 32, "party_attributes": {"wpo1OGbe": {}, "8oMYnK2I": {}, "K9ixBTrK": {}}, "party_id": "NHYrcoV0", "party_members": [{"extra_attributes": {"6MgMpbyt": {}, "t38nXbBz": {}, "UvofFfDu": {}}, "user_id": "8IhYZISR"}, {"extra_attributes": {"Dt52Hy2h": {}, "nxn5C2jj": {}, "3Ua6YWKw": {}}, "user_id": "8OeRhmvk"}, {"extra_attributes": {"gXuSWVm8": {}, "AXvhywHF": {}, "cgbI45Av": {}}, "user_id": "vmNHWlMV"}], "ticket_created_at": 30, "ticket_id": "7dJsosYa"}]}], "namespace": "nYWJyFKJ", "party_attributes": {"XLQ13QP7": {}, "9jKfDkb8": {}, "hcvlDNrq": {}}, "party_id": "AxtraijL", "queued_at": 5, "region": "HyeY3phj", "server_name": "NWX0N765", "status": "nNoc1Dvt", "ticket_id": "RstU68N8", "ticket_ids": ["qFfU9hr2", "dBG92Blm", "eTdNqd8X"], "updated_at": "1978-11-15T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "KBHhrwO7"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'fGHJ9Com' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 51, "userID": "SHI2O3O0", "weight": 0.1006388763411904}' \
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
    --matchIDs '9D5eFJGV' \
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
    --strategy 'KTqrKDtv' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName '0puaLgLU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName '5fgbu2Cd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatch", "deployment": "uOQj81WQ", "description": "4BtPWYmK", "findMatchTimeoutSeconds": 44, "joinable": true, "max_delay_ms": 36, "region_expansion_range_ms": 17, "region_expansion_rate_ms": 25, "region_latency_initial_range_ms": 89, "region_latency_max_ms": 58, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 100, "min": 58, "name": "yQSvQGUi"}, {"max": 22, "min": 82, "name": "YAiAWs4l"}, {"max": 74, "min": 27, "name": "es6qhPUW"}], [{"max": 18, "min": 95, "name": "p3XJ69fp"}, {"max": 56, "min": 59, "name": "U6dP5hp5"}, {"max": 69, "min": 49, "name": "pmShrZlu"}], [{"max": 81, "min": 2, "name": "zh7EHQy9"}, {"max": 97, "min": 88, "name": "QVTBXPk6"}, {"max": 10, "min": 40, "name": "TNGV7TWc"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 0, "role_flexing_second": 84}, "maxNumber": 98, "minNumber": 45, "playerMaxNumber": 89, "playerMinNumber": 3}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 55, "min": 48, "name": "C3r8SvgM"}, {"max": 84, "min": 13, "name": "ZqcGZ3rz"}, {"max": 24, "min": 19, "name": "1a0nHo4w"}], [{"max": 25, "min": 54, "name": "BpFmZBHt"}, {"max": 45, "min": 47, "name": "ikoeYHFt"}, {"max": 52, "min": 92, "name": "lYiqrDD6"}], [{"max": 86, "min": 17, "name": "lRhcEq4a"}, {"max": 10, "min": 42, "name": "m9Q5MsJG"}, {"max": 63, "min": 39, "name": "180LLHi1"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 39, "role_flexing_second": 85}, "duration": 60, "max_number": 53, "min_number": 6, "player_max_number": 90, "player_min_number": 75}, {"combination": {"alliances": [[{"max": 62, "min": 64, "name": "jgjDt4Mz"}, {"max": 1, "min": 38, "name": "00wySXtu"}, {"max": 3, "min": 72, "name": "JI6VVhEz"}], [{"max": 50, "min": 90, "name": "AA0UIx6F"}, {"max": 35, "min": 6, "name": "BZxW9oK7"}, {"max": 37, "min": 24, "name": "CEqaOSGM"}], [{"max": 81, "min": 3, "name": "D5j5P1jz"}, {"max": 15, "min": 68, "name": "2LA1IFIv"}, {"max": 62, "min": 93, "name": "tjSlhreU"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 43, "role_flexing_second": 47}, "duration": 54, "max_number": 2, "min_number": 40, "player_max_number": 78, "player_min_number": 43}, {"combination": {"alliances": [[{"max": 70, "min": 47, "name": "ouQoDNjT"}, {"max": 95, "min": 53, "name": "a6JSVd10"}, {"max": 97, "min": 37, "name": "EesOwENI"}], [{"max": 50, "min": 44, "name": "gXkrZHCB"}, {"max": 32, "min": 6, "name": "EKVYOBmU"}, {"max": 29, "min": 75, "name": "By7FWRvn"}], [{"max": 67, "min": 20, "name": "fH1zAL2n"}, {"max": 35, "min": 71, "name": "LSnWiLCe"}, {"max": 80, "min": 27, "name": "3TA7vyxL"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 57, "role_flexing_second": 73}, "duration": 64, "max_number": 7, "min_number": 35, "player_max_number": 83, "player_min_number": 46}], "batch_size": 96, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 81, "flex_flat_step_range": 79, "flex_immunity_count": 50, "flex_range_max": 16, "flex_rate_ms": 81, "flex_step_max": 76, "force_authority_match": true, "initial_step_range": 96, "mmr_max": 66, "mmr_mean": 6, "mmr_min": 83, "mmr_std_dev": 88, "override_mmr_data": true, "use_bucket_mmr": false, "use_flat_flex_step": false}, "flexingRules": [{"attribute": "ROxcb0hM", "criteria": "dhdzXZ4M", "duration": 20, "reference": 0.800250270597832}, {"attribute": "tzjtZatA", "criteria": "cwb4OdGH", "duration": 99, "reference": 0.3333178400660478}, {"attribute": "tx3APPNW", "criteria": "YGEgmb9k", "duration": 63, "reference": 0.622825690818018}], "match_options": {"options": [{"name": "4wzi3ATj", "type": "fJvpLfa7"}, {"name": "xxyxJa2C", "type": "EP4C3ePQ"}, {"name": "4IlAsn8t", "type": "2cLeAPYR"}]}, "matchingRules": [{"attribute": "uwwLu99P", "criteria": "s3YaHQHm", "reference": 0.9161745694076884}, {"attribute": "kbDlHaBu", "criteria": "a3RadR5D", "reference": 0.5185769791857606}, {"attribute": "93MKzOoN", "criteria": "6HRGNC6r", "reference": 0.06476956905440145}], "sort_ticket": {"search_result": "Vfi9lHa9", "ticket_queue": "k18flEgQ"}, "sort_tickets": [{"search_result": "ErcQjpzi", "threshold": 4, "ticket_queue": "y3yB0vaD"}, {"search_result": "Fuczd4uU", "threshold": 35, "ticket_queue": "vHPPkADL"}, {"search_result": "wTWgj9ee", "threshold": 87, "ticket_queue": "rrLu6DDl"}], "sub_game_modes": {}, "ticket_flexing_selection": "D8Mg7X2P", "ticket_flexing_selections": [{"selection": "narJcY7n", "threshold": 8}, {"selection": "WEMPRdJz", "threshold": 90}, {"selection": "LGxP0Ekg", "threshold": 24}], "use_newest_ticket_for_flexing": false}, "sessionQueueTimeoutSeconds": 75, "socialMatchmaking": false, "sub_gamemode_selection": "ticketOrder", "ticket_observability_enable": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName 'k63cCqK9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName '7nNS9eoO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName 'cK0vzBkn' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 47}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName '9fhLdrhA' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName 'kQfxZlY2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "Nu13Vh7G", "count": 82, "mmrMax": 0.38382295045228354, "mmrMean": 0.9744635428534177, "mmrMin": 0.8036552875806121, "mmrStdDev": 0.7510637873021169}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'U01DRb8c' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 51, "party_attributes": {"abUtuFD4": {}, "yLvdg7S9": {}, "XSpjmt0J": {}}, "party_id": "0T5fHWyw", "party_members": [{"extra_attributes": {"Mic8sY8Q": {}, "0MenmiwY": {}, "tHaD78Xa": {}}, "user_id": "FSTfvsAu"}, {"extra_attributes": {"dAhOP8lH": {}, "ygllgmBT": {}, "MejLzYH5": {}}, "user_id": "RJu0Alv4"}, {"extra_attributes": {"0npEe1Un": {}, "gIlUYErX": {}, "GV0tgjqj": {}}, "user_id": "tcSh1NgG"}], "ticket_created_at": 77, "ticket_id": "9Fk2UTEV"}, {"first_ticket_created_at": 31, "party_attributes": {"cRFzHv4X": {}, "9tlSRPfi": {}, "tmJtgJ0C": {}}, "party_id": "1ezn3KHx", "party_members": [{"extra_attributes": {"4LS7OLxh": {}, "vo79p69A": {}, "RssaYyod": {}}, "user_id": "GSnNiFX4"}, {"extra_attributes": {"RetCN5pg": {}, "0qBfrUFB": {}, "QcFBCaPd": {}}, "user_id": "UbNFmFfp"}, {"extra_attributes": {"fQO5ZcnC": {}, "wDCsKSPM": {}, "wpDYIGEi": {}}, "user_id": "dcrX1FSv"}], "ticket_created_at": 64, "ticket_id": "4oHQ3m61"}, {"first_ticket_created_at": 65, "party_attributes": {"cXDHmwwL": {}, "yLCAduLy": {}, "GHmjFN7U": {}}, "party_id": "tEgwKHX3", "party_members": [{"extra_attributes": {"13KPFWKk": {}, "7CzARDvU": {}, "pO7dHnb5": {}}, "user_id": "rbmkBTt2"}, {"extra_attributes": {"Fps5BGRx": {}, "4OsbiDo7": {}, "SkLuBaOk": {}}, "user_id": "ZayPgihz"}, {"extra_attributes": {"fEnKCHRX": {}, "MakYJTUR": {}, "SdtbcBl2": {}}, "user_id": "6uUMEl1e"}], "ticket_created_at": 77, "ticket_id": "GQtbCks6"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName 'C2aDg7Bh' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 96}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'E9gdPcgy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName '2AAc8yK5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'z9jggTOY' \
    --matchID 'qon1QjHz' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["XvIFYp7o", "ryodJDwo", "sSgaBt2T"], "party_id": "TN5QzQwM", "user_id": "PqZ29hwO"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'cKZOBUdH' \
    --matchID 'iRixf3Xh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'BZ09lzLD' \
    --matchID '94LMqHPV' \
    --namespace "$AB_NAMESPACE" \
    --userID 'wm75Y8jx' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName '92KZmTGh' \
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
    --channelName 'cIpwVHMm' \
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