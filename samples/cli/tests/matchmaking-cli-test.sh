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
    --limit '62' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCannotMatch", "deployment": "XvdwedHy", "description": "cvFrBoC5", "find_match_timeout_seconds": 32, "game_mode": "OA1XIuXY", "joinable": false, "max_delay_ms": 97, "region_expansion_range_ms": 18, "region_expansion_rate_ms": 89, "region_latency_initial_range_ms": 90, "region_latency_max_ms": 20, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 58, "min": 34, "name": "yfLceMmQ"}, {"max": 0, "min": 44, "name": "mOIbqVYa"}, {"max": 38, "min": 50, "name": "SXIOMGEb"}], [{"max": 68, "min": 34, "name": "9r4cUwOt"}, {"max": 19, "min": 75, "name": "ZzpJnOND"}, {"max": 44, "min": 17, "name": "eOdedmtM"}], [{"max": 56, "min": 24, "name": "iYjwSsrr"}, {"max": 7, "min": 36, "name": "FP5CCOgW"}, {"max": 7, "min": 61, "name": "ZFEdeAqS"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 52, "role_flexing_second": 56}, "max_number": 2, "min_number": 21, "player_max_number": 5, "player_min_number": 92}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 73, "min": 19, "name": "hCCaFxX8"}, {"max": 5, "min": 80, "name": "FVwwUfFc"}, {"max": 96, "min": 54, "name": "ltW4rHix"}], [{"max": 86, "min": 17, "name": "RlHfqDAR"}, {"max": 58, "min": 5, "name": "ZCZeOOuP"}, {"max": 86, "min": 48, "name": "1FJOa8Q5"}], [{"max": 93, "min": 58, "name": "A23wcOlt"}, {"max": 73, "min": 69, "name": "5Ufm0fxL"}, {"max": 97, "min": 59, "name": "wDZNKEzH"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 0, "role_flexing_second": 14}, "duration": 5, "max_number": 64, "min_number": 93, "player_max_number": 69, "player_min_number": 30}, {"combination": {"alliances": [[{"max": 53, "min": 97, "name": "TD7bnxuF"}, {"max": 85, "min": 86, "name": "bZpFqGj0"}, {"max": 65, "min": 64, "name": "wO9xLMl5"}], [{"max": 54, "min": 50, "name": "3K1WEc8x"}, {"max": 25, "min": 38, "name": "LoEKczcA"}, {"max": 100, "min": 65, "name": "hOI4Oc1a"}], [{"max": 72, "min": 99, "name": "oGiQLwRK"}, {"max": 89, "min": 11, "name": "U62Lq4gF"}, {"max": 46, "min": 40, "name": "ZKLsIKKq"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 17, "role_flexing_second": 99}, "duration": 35, "max_number": 80, "min_number": 30, "player_max_number": 45, "player_min_number": 56}, {"combination": {"alliances": [[{"max": 54, "min": 85, "name": "4Gw358La"}, {"max": 29, "min": 53, "name": "jPnl8taL"}, {"max": 22, "min": 54, "name": "k2la6uTQ"}], [{"max": 93, "min": 8, "name": "4MhFIry7"}, {"max": 88, "min": 74, "name": "2VNWyu8v"}, {"max": 38, "min": 45, "name": "MQxoWFzb"}], [{"max": 27, "min": 58, "name": "8bOSuEFn"}, {"max": 65, "min": 81, "name": "giBe07e9"}, {"max": 11, "min": 31, "name": "5ecHIlOk"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 48, "role_flexing_second": 20}, "duration": 4, "max_number": 55, "min_number": 29, "player_max_number": 42, "player_min_number": 33}], "batch_size": 48, "bucket_mmr_rule": {"disable_authority": true, "flex_authority_count": 16, "flex_flat_step_range": 99, "flex_immunity_count": 45, "flex_range_max": 32, "flex_rate_ms": 88, "flex_step_max": 65, "force_authority_match": false, "initial_step_range": 79, "mmr_max": 81, "mmr_mean": 29, "mmr_min": 97, "mmr_std_dev": 61, "override_mmr_data": false, "use_bucket_mmr": true, "use_flat_flex_step": true}, "flexing_rule": [{"attribute": "kwoKSvlc", "criteria": "yU7LZzCO", "duration": 25, "reference": 0.886913168320283}, {"attribute": "MjoSqtck", "criteria": "jB8oVcP0", "duration": 54, "reference": 0.5310796054240986}, {"attribute": "cUTiFVVk", "criteria": "NihY0Bjk", "duration": 6, "reference": 0.14876023516606218}], "match_options": {"options": [{"name": "f5oz9PH6", "type": "4mYb97mQ"}, {"name": "t28cR9cd", "type": "WSbpQ290"}, {"name": "RtdGWLRZ", "type": "cEeiuJHV"}]}, "matching_rule": [{"attribute": "ckd5VwhG", "criteria": "RIQMIkyK", "reference": 0.09222405331361083}, {"attribute": "hiqCUsXn", "criteria": "OuNaib9x", "reference": 0.42432287748353903}, {"attribute": "L9uW8y5L", "criteria": "MoB31bGm", "reference": 0.4214106137694452}], "rebalance_enable": false, "sort_ticket": {"search_result": "JQIhXRDs", "ticket_queue": "l3KOkvnG"}, "sort_tickets": [{"search_result": "CW0RVSte", "threshold": 93, "ticket_queue": "POvuhK3X"}, {"search_result": "aVgFUz7q", "threshold": 20, "ticket_queue": "B8Wphnyl"}, {"search_result": "Zk1sKwIM", "threshold": 57, "ticket_queue": "45ps6TPO"}], "sub_game_modes": {"1uyHTkeW": {"alliance": {"combination": {"alliances": [[{"max": 69, "min": 61, "name": "A5y65Bc9"}, {"max": 63, "min": 67, "name": "heBSnPig"}, {"max": 56, "min": 6, "name": "PNAUS0uQ"}], [{"max": 30, "min": 88, "name": "yhrsAWfJ"}, {"max": 36, "min": 20, "name": "8UUuu4PQ"}, {"max": 55, "min": 18, "name": "EFmuiztF"}], [{"max": 33, "min": 44, "name": "z34Rb2kU"}, {"max": 33, "min": 39, "name": "XYQ2oOMH"}, {"max": 95, "min": 21, "name": "aY82V7UP"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 68, "role_flexing_second": 12}, "max_number": 99, "min_number": 65, "player_max_number": 48, "player_min_number": 38}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 82, "min": 0, "name": "LeSEJc1S"}, {"max": 96, "min": 53, "name": "L3LvaGDS"}, {"max": 65, "min": 81, "name": "9cRkndjC"}], [{"max": 4, "min": 77, "name": "RbLEfKPY"}, {"max": 68, "min": 90, "name": "moTxhoe3"}, {"max": 19, "min": 33, "name": "Uf9j4LcY"}], [{"max": 0, "min": 4, "name": "bXYeLDLZ"}, {"max": 18, "min": 12, "name": "ry8ZmWBu"}, {"max": 73, "min": 61, "name": "GovKmZdZ"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 16, "role_flexing_second": 69}, "duration": 42, "max_number": 27, "min_number": 23, "player_max_number": 32, "player_min_number": 23}, {"combination": {"alliances": [[{"max": 68, "min": 57, "name": "WMdMTmEq"}, {"max": 49, "min": 16, "name": "5G6jZQTi"}, {"max": 44, "min": 50, "name": "hzshsGPG"}], [{"max": 95, "min": 52, "name": "FC4nthRf"}, {"max": 13, "min": 71, "name": "fOGQYaz4"}, {"max": 99, "min": 34, "name": "x7x8tDgf"}], [{"max": 40, "min": 13, "name": "iSKzkG4y"}, {"max": 83, "min": 36, "name": "ehzMJYeU"}, {"max": 85, "min": 9, "name": "SGcV3CAK"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 65, "role_flexing_second": 36}, "duration": 1, "max_number": 78, "min_number": 57, "player_max_number": 50, "player_min_number": 29}, {"combination": {"alliances": [[{"max": 3, "min": 59, "name": "IdZg4NZT"}, {"max": 26, "min": 62, "name": "marB2nMK"}, {"max": 85, "min": 76, "name": "O6MRynXv"}], [{"max": 2, "min": 77, "name": "uAFjJQCA"}, {"max": 87, "min": 23, "name": "frtrTzQ8"}, {"max": 91, "min": 7, "name": "te0HmyZq"}], [{"max": 25, "min": 79, "name": "PvNryk1w"}, {"max": 64, "min": 61, "name": "zTwazddl"}, {"max": 5, "min": 89, "name": "fWJrxp76"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 30, "role_flexing_second": 33}, "duration": 16, "max_number": 24, "min_number": 63, "player_max_number": 58, "player_min_number": 77}], "name": "JAchnVCU"}, "kHIvBnUD": {"alliance": {"combination": {"alliances": [[{"max": 70, "min": 5, "name": "GzqsidER"}, {"max": 46, "min": 30, "name": "IYizgc02"}, {"max": 63, "min": 93, "name": "XXXP9Btn"}], [{"max": 46, "min": 95, "name": "aqBlh0v7"}, {"max": 94, "min": 93, "name": "dJgXQKYs"}, {"max": 8, "min": 28, "name": "IMQV752U"}], [{"max": 22, "min": 61, "name": "2IBX7uuC"}, {"max": 86, "min": 79, "name": "3qv5vv6j"}, {"max": 71, "min": 68, "name": "xfnGBu0q"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 73, "role_flexing_second": 86}, "max_number": 44, "min_number": 28, "player_max_number": 3, "player_min_number": 8}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 85, "min": 45, "name": "gDFd8UwW"}, {"max": 54, "min": 22, "name": "ynhmHe6u"}, {"max": 2, "min": 44, "name": "CPg4X5OU"}], [{"max": 40, "min": 83, "name": "4nlraBQi"}, {"max": 23, "min": 64, "name": "22u0X8nW"}, {"max": 56, "min": 76, "name": "gReWPYuw"}], [{"max": 62, "min": 58, "name": "vnTSXhgO"}, {"max": 72, "min": 87, "name": "apTeeOkz"}, {"max": 76, "min": 20, "name": "sAHGi3ic"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 24, "role_flexing_second": 18}, "duration": 72, "max_number": 52, "min_number": 100, "player_max_number": 48, "player_min_number": 32}, {"combination": {"alliances": [[{"max": 86, "min": 1, "name": "lgRXyP89"}, {"max": 24, "min": 3, "name": "ncYb05uL"}, {"max": 68, "min": 87, "name": "ozhYHRxa"}], [{"max": 51, "min": 83, "name": "Dq9bGoPz"}, {"max": 85, "min": 4, "name": "xh4tfiZH"}, {"max": 95, "min": 16, "name": "DFxx2SAM"}], [{"max": 52, "min": 33, "name": "ic0xRMBk"}, {"max": 97, "min": 64, "name": "j8uCQ5al"}, {"max": 39, "min": 17, "name": "hMWh8jPu"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 4, "role_flexing_second": 0}, "duration": 81, "max_number": 17, "min_number": 91, "player_max_number": 22, "player_min_number": 77}, {"combination": {"alliances": [[{"max": 36, "min": 100, "name": "oMKiqLi7"}, {"max": 55, "min": 94, "name": "MSs7AOkn"}, {"max": 69, "min": 94, "name": "nGq49wxS"}], [{"max": 14, "min": 55, "name": "44JBdo3u"}, {"max": 23, "min": 9, "name": "1LxvEsMZ"}, {"max": 55, "min": 11, "name": "PqMw2cVx"}], [{"max": 70, "min": 24, "name": "xklUwxnn"}, {"max": 45, "min": 61, "name": "HJTX9Ugh"}, {"max": 62, "min": 9, "name": "p8e7ljv8"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 36, "role_flexing_second": 56}, "duration": 53, "max_number": 38, "min_number": 43, "player_max_number": 86, "player_min_number": 50}], "name": "hqQ0kqFW"}, "x5Xi2DHL": {"alliance": {"combination": {"alliances": [[{"max": 60, "min": 48, "name": "0ry5td7E"}, {"max": 90, "min": 89, "name": "l7EThh9E"}, {"max": 76, "min": 3, "name": "AHowClM5"}], [{"max": 84, "min": 3, "name": "EPmbL1RN"}, {"max": 58, "min": 57, "name": "qHyEHLRM"}, {"max": 84, "min": 45, "name": "tkIdLi83"}], [{"max": 46, "min": 69, "name": "a8tPZuQs"}, {"max": 16, "min": 100, "name": "v6j7Kk31"}, {"max": 51, "min": 5, "name": "aQnBPYvB"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 67, "role_flexing_second": 95}, "max_number": 37, "min_number": 63, "player_max_number": 28, "player_min_number": 6}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 17, "min": 20, "name": "zDIypeP4"}, {"max": 31, "min": 44, "name": "r54ncLyH"}, {"max": 96, "min": 93, "name": "GR95CeU2"}], [{"max": 85, "min": 6, "name": "swtyisuk"}, {"max": 75, "min": 11, "name": "4SMLZf2F"}, {"max": 23, "min": 78, "name": "NTXm7EKB"}], [{"max": 35, "min": 17, "name": "hQepjXj2"}, {"max": 15, "min": 27, "name": "ldoV9PMx"}, {"max": 15, "min": 3, "name": "6ZvPR3Le"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 30, "role_flexing_second": 63}, "duration": 91, "max_number": 7, "min_number": 51, "player_max_number": 60, "player_min_number": 43}, {"combination": {"alliances": [[{"max": 59, "min": 40, "name": "8cTfOHAV"}, {"max": 10, "min": 22, "name": "FejbcWml"}, {"max": 7, "min": 94, "name": "eZeBv1nU"}], [{"max": 21, "min": 31, "name": "pxWeQPpJ"}, {"max": 75, "min": 46, "name": "gqjh7lTn"}, {"max": 70, "min": 69, "name": "13tuRFYz"}], [{"max": 84, "min": 29, "name": "WY2E20c2"}, {"max": 37, "min": 29, "name": "C7tZ3x4J"}, {"max": 81, "min": 10, "name": "INZbes8i"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 5, "role_flexing_second": 97}, "duration": 21, "max_number": 41, "min_number": 66, "player_max_number": 23, "player_min_number": 79}, {"combination": {"alliances": [[{"max": 14, "min": 16, "name": "SqqKgupr"}, {"max": 36, "min": 35, "name": "WTWJt2qg"}, {"max": 31, "min": 15, "name": "XEAIVPSX"}], [{"max": 65, "min": 6, "name": "lDqbAK8b"}, {"max": 83, "min": 69, "name": "NXvlITKd"}, {"max": 38, "min": 73, "name": "yeB3n0TC"}], [{"max": 89, "min": 98, "name": "nKuQYZPT"}, {"max": 47, "min": 88, "name": "CerobjWz"}, {"max": 28, "min": 21, "name": "Gdhe3FUA"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 89, "role_flexing_second": 63}, "duration": 48, "max_number": 6, "min_number": 32, "player_max_number": 42, "player_min_number": 77}], "name": "hXhjwyhu"}}, "ticket_flexing_selection": "fBkk5QDL", "ticket_flexing_selections": [{"selection": "XJdEVl0a", "threshold": 27}, {"selection": "qoYYHJ9J", "threshold": 11}, {"selection": "tzVnBrlK", "threshold": 84}], "use_newest_ticket_for_flexing": false}, "session_queue_timeout_seconds": 52, "social_matchmaking": false, "sub_gamemode_selection": "ticketOrder", "ticket_observability_enable": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName 'U2Apt4Oy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'Ab0dUoBH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "dvsJZeWw", "players": [{"results": [{"attribute": "vyEBXYw2", "value": 0.08658467650967894}, {"attribute": "X6sr5kw8", "value": 0.0338389134640078}, {"attribute": "Jhljl3vV", "value": 0.2626177190570741}], "user_id": "gesZbDWF"}, {"results": [{"attribute": "Ho4nMqfv", "value": 0.0942565262889895}, {"attribute": "XLjjP40N", "value": 0.619045505761015}, {"attribute": "qeI7AzTi", "value": 0.5727184634455162}], "user_id": "5oB2GI4W"}, {"results": [{"attribute": "5TK0uvVk", "value": 0.3597754805847425}, {"attribute": "957TAlSr", "value": 0.004961938306685676}, {"attribute": "bmdsZ6Pr", "value": 0.8995772450162393}], "user_id": "qke8h3X5"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "B0psFhFt"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "x6pexQbI", "client_version": "fBnZ0BI7", "deployment": "SH34441Z", "error_code": 82, "error_message": "mVZxGlfd", "game_mode": "Q9odDcgi", "is_mock": "a5T2NNrc", "joinable": true, "match_id": "EJMk9Iwb", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 34, "party_attributes": {"0s0JPmoC": {}, "C3FQFSYc": {}, "B05TAfkA": {}}, "party_id": "5RtR0Gm4", "party_members": [{"extra_attributes": {"JBs2i9Hh": {}, "jSRJi1WM": {}, "baGWIqvG": {}}, "user_id": "0MTGFqXq"}, {"extra_attributes": {"4aB8WWic": {}, "djGtMhDk": {}, "iTJ29fjP": {}}, "user_id": "tILTr6O6"}, {"extra_attributes": {"Ywgq5E4C": {}, "j7d1kyMz": {}, "k4ERWtEC": {}}, "user_id": "JEodSZxI"}], "ticket_created_at": 20, "ticket_id": "sGA51Z86"}, {"first_ticket_created_at": 54, "party_attributes": {"Jd2DL161": {}, "7Ku89v6f": {}, "yqcFW5pu": {}}, "party_id": "9gWG4fZ5", "party_members": [{"extra_attributes": {"LwFLwaAd": {}, "HXf07nT7": {}, "SvqA1dFW": {}}, "user_id": "SR2dyovh"}, {"extra_attributes": {"3lP6YR3Y": {}, "OAqXWT83": {}, "6emiSdpP": {}}, "user_id": "e6sHhjlD"}, {"extra_attributes": {"IYhOjYw2": {}, "9eA6oPha": {}, "xTy8zmxp": {}}, "user_id": "yJDzibPg"}], "ticket_created_at": 61, "ticket_id": "JMaRyq13"}, {"first_ticket_created_at": 82, "party_attributes": {"rrB1xdxv": {}, "TkRAbfIH": {}, "MtJPaFgV": {}}, "party_id": "kCrIOwtr", "party_members": [{"extra_attributes": {"rIeWV9Vb": {}, "XjU3YIye": {}, "rOVKhIMV": {}}, "user_id": "URRdSlbt"}, {"extra_attributes": {"RitYOctL": {}, "AihcIXJx": {}, "TUNfSd80": {}}, "user_id": "xfwMxwVf"}, {"extra_attributes": {"NniUEwft": {}, "LGrezzAX": {}, "B7yYoJkF": {}}, "user_id": "YCSsfDfX"}], "ticket_created_at": 92, "ticket_id": "kMwYodEd"}]}, {"matching_parties": [{"first_ticket_created_at": 15, "party_attributes": {"iuazUCkz": {}, "k4XJWrzT": {}, "O5IM0YnJ": {}}, "party_id": "radnLlE8", "party_members": [{"extra_attributes": {"KzCFJYOr": {}, "aiPtcxPB": {}, "3B6AGRO9": {}}, "user_id": "SqAQh56E"}, {"extra_attributes": {"hXIHyofH": {}, "mnCIuEqJ": {}, "gVMNk7CB": {}}, "user_id": "g39usXUY"}, {"extra_attributes": {"fQkl3gWf": {}, "NBiSDvTK": {}, "nPbP4MKp": {}}, "user_id": "KGLCMIWt"}], "ticket_created_at": 18, "ticket_id": "da3IHXZF"}, {"first_ticket_created_at": 0, "party_attributes": {"RC1V6Ct3": {}, "LKF3xJ9M": {}, "9Z8fPrIW": {}}, "party_id": "lnzvbX9l", "party_members": [{"extra_attributes": {"8Hqj9Z5v": {}, "ooR7HAKg": {}, "YKT2Pykf": {}}, "user_id": "79728wYG"}, {"extra_attributes": {"IThiFjAG": {}, "QqHlKPQ2": {}, "CCFi3jsD": {}}, "user_id": "ERsRtJon"}, {"extra_attributes": {"suoGHubS": {}, "IHwWbQVV": {}, "qIezUElD": {}}, "user_id": "8j0SfJ42"}], "ticket_created_at": 26, "ticket_id": "gHFvKA9Y"}, {"first_ticket_created_at": 43, "party_attributes": {"ilwMdTFa": {}, "qQXeb3Ka": {}, "eiNwBh3r": {}}, "party_id": "nQcXQhO6", "party_members": [{"extra_attributes": {"VM5cz8tV": {}, "jCUS1b9X": {}, "sQ2ZFw0a": {}}, "user_id": "MHYoIWfZ"}, {"extra_attributes": {"QT3GNQ1R": {}, "NcmLL2oU": {}, "mffFXpKk": {}}, "user_id": "MmfX8bU1"}, {"extra_attributes": {"8GMXCtpZ": {}, "nx9JLN5B": {}, "1MIBiNoE": {}}, "user_id": "KpQo20DM"}], "ticket_created_at": 76, "ticket_id": "vD4TTfeW"}]}, {"matching_parties": [{"first_ticket_created_at": 26, "party_attributes": {"7VBVwwTu": {}, "8frjXehn": {}, "BPt2XHFw": {}}, "party_id": "qBAdHY2r", "party_members": [{"extra_attributes": {"7QomxHYy": {}, "oqD5Rfdp": {}, "Ip1RlRwb": {}}, "user_id": "qXFFLLmh"}, {"extra_attributes": {"tv50oq51": {}, "zCoAvKC0": {}, "oaWDV4sz": {}}, "user_id": "ARk71bZT"}, {"extra_attributes": {"sgkWXecu": {}, "EwzeOq8x": {}, "Z0VJzh5u": {}}, "user_id": "h6IGwrjH"}], "ticket_created_at": 41, "ticket_id": "3WtPl1YO"}, {"first_ticket_created_at": 27, "party_attributes": {"2GmyeMlE": {}, "wv39hp7p": {}, "xEkX55dU": {}}, "party_id": "LnPqwM8c", "party_members": [{"extra_attributes": {"yU0uiOrQ": {}, "dpmqeJLb": {}, "ZOuBJNqE": {}}, "user_id": "RYmOdEaI"}, {"extra_attributes": {"pYta1YVT": {}, "6OmgLn4W": {}, "hnufvKbS": {}}, "user_id": "JHk8ikf8"}, {"extra_attributes": {"nTCSfviI": {}, "Hc38wURQ": {}, "szRPkNxi": {}}, "user_id": "MNDw8T8A"}], "ticket_created_at": 82, "ticket_id": "XlyNFrmR"}, {"first_ticket_created_at": 48, "party_attributes": {"T4y2kEV2": {}, "4bhjwmRO": {}, "PwQrNkzM": {}}, "party_id": "rgXqETlG", "party_members": [{"extra_attributes": {"BKfwQrLu": {}, "7i2ow2x7": {}, "CQcYViiK": {}}, "user_id": "IcXIMc1C"}, {"extra_attributes": {"mWHEnYfM": {}, "Et7k90gt": {}, "vYBi5bKo": {}}, "user_id": "DeMcLvsl"}, {"extra_attributes": {"eccDyneB": {}, "1xjyYtcf": {}, "E6gxfrU1": {}}, "user_id": "fI3dC2i6"}], "ticket_created_at": 34, "ticket_id": "rDRZQfcQ"}]}], "namespace": "ApEnPopA", "party_attributes": {"rhA5eKSw": {}, "KuloPWVT": {}, "U8CE9dTA": {}}, "party_id": "Sqdwd7Oh", "queued_at": 76, "region": "Rn8ZwXPl", "server_name": "Nhhs8yrw", "status": "pqiLGIlP", "ticket_id": "0MyjFU3m", "ticket_ids": ["YDEskpCs", "IcQMthgT", "ZpBivPQJ"], "updated_at": "1988-07-08T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "LOuLpIrQ"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'nO2WKubK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 43, "userID": "TwP6uRcH", "weight": 0.7345527457818617}' \
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
    --matchIDs 'cpIvryvu' \
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
    --strategy 'o35fSeMN' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'iSnfNuOi' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'cqTDDPzO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCannotMatch", "deployment": "s8iNtYzm", "description": "FHuHCQve", "findMatchTimeoutSeconds": 48, "joinable": false, "max_delay_ms": 36, "region_expansion_range_ms": 28, "region_expansion_rate_ms": 94, "region_latency_initial_range_ms": 35, "region_latency_max_ms": 35, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 7, "min": 49, "name": "oeQW93oV"}, {"max": 24, "min": 64, "name": "7kILe29y"}, {"max": 84, "min": 42, "name": "DkDKanMh"}], [{"max": 54, "min": 52, "name": "OlaYnELo"}, {"max": 98, "min": 1, "name": "vP3X80QN"}, {"max": 57, "min": 36, "name": "wqObpEDu"}], [{"max": 65, "min": 1, "name": "5udb41qO"}, {"max": 45, "min": 1, "name": "3FZpOi4r"}, {"max": 26, "min": 62, "name": "EuMjskLf"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 73, "role_flexing_second": 89}, "maxNumber": 44, "minNumber": 24, "playerMaxNumber": 9, "playerMinNumber": 14}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 13, "min": 10, "name": "NZlJCSYw"}, {"max": 82, "min": 18, "name": "98V7rZeY"}, {"max": 67, "min": 65, "name": "rfql22bt"}], [{"max": 34, "min": 69, "name": "SGgl6Ba2"}, {"max": 93, "min": 99, "name": "BzzGSOwV"}, {"max": 18, "min": 49, "name": "vQCgxuHK"}], [{"max": 64, "min": 24, "name": "mhgTj73y"}, {"max": 96, "min": 40, "name": "4B7dt14C"}, {"max": 3, "min": 55, "name": "WUjKtfWn"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 32, "role_flexing_second": 90}, "duration": 18, "max_number": 0, "min_number": 6, "player_max_number": 4, "player_min_number": 29}, {"combination": {"alliances": [[{"max": 19, "min": 72, "name": "ZON8XPDf"}, {"max": 62, "min": 45, "name": "fLnNoy7A"}, {"max": 36, "min": 43, "name": "Y7JxCEd8"}], [{"max": 93, "min": 17, "name": "q4OLBnKL"}, {"max": 45, "min": 82, "name": "w3KT3Y7M"}, {"max": 76, "min": 29, "name": "BNL11QjN"}], [{"max": 76, "min": 75, "name": "QPqKmD4Y"}, {"max": 85, "min": 21, "name": "2ujLEbtc"}, {"max": 87, "min": 3, "name": "fCr1KW47"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 96, "role_flexing_second": 49}, "duration": 59, "max_number": 71, "min_number": 30, "player_max_number": 28, "player_min_number": 12}, {"combination": {"alliances": [[{"max": 1, "min": 50, "name": "n4WziZce"}, {"max": 46, "min": 89, "name": "9KaPEzsX"}, {"max": 6, "min": 88, "name": "g88NrE0D"}], [{"max": 21, "min": 86, "name": "Ps2JVnR2"}, {"max": 62, "min": 92, "name": "EORe7G4e"}, {"max": 35, "min": 27, "name": "7NqXbjl6"}], [{"max": 28, "min": 80, "name": "b2B3FuEG"}, {"max": 30, "min": 41, "name": "bEMBw3eO"}, {"max": 3, "min": 60, "name": "x7AY7sz0"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 46, "role_flexing_second": 50}, "duration": 59, "max_number": 71, "min_number": 60, "player_max_number": 32, "player_min_number": 49}], "batch_size": 3, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 52, "flex_flat_step_range": 96, "flex_immunity_count": 90, "flex_range_max": 55, "flex_rate_ms": 48, "flex_step_max": 68, "force_authority_match": false, "initial_step_range": 21, "mmr_max": 21, "mmr_mean": 77, "mmr_min": 45, "mmr_std_dev": 54, "override_mmr_data": true, "use_bucket_mmr": true, "use_flat_flex_step": true}, "flexingRules": [{"attribute": "HPhEjhyc", "criteria": "JDhtqFdC", "duration": 10, "reference": 0.6693486330300454}, {"attribute": "ctCu4Alv", "criteria": "UCXHIv4Z", "duration": 0, "reference": 0.9864788509847437}, {"attribute": "mSAWupA6", "criteria": "O4lHEgb3", "duration": 33, "reference": 0.09231763043134178}], "match_options": {"options": [{"name": "45O5rvqX", "type": "tKhfCaWB"}, {"name": "OdJO6Q3t", "type": "PJHeZ5Ml"}, {"name": "V5BStXis", "type": "zOY0AFjS"}]}, "matchingRules": [{"attribute": "746t8lIN", "criteria": "CBGCmWvD", "reference": 0.6619211774752646}, {"attribute": "Le1aNSXx", "criteria": "VIJpxHgr", "reference": 0.41607701315954426}, {"attribute": "AgKXSysH", "criteria": "BwWnfRK9", "reference": 0.4017733064253747}], "sort_ticket": {"search_result": "VgMAZbAH", "ticket_queue": "1ivkeVfn"}, "sort_tickets": [{"search_result": "wt87DJkN", "threshold": 57, "ticket_queue": "rIZ4WSsm"}, {"search_result": "15DSsvsn", "threshold": 67, "ticket_queue": "l8Icwzii"}, {"search_result": "o1EBLk8o", "threshold": 30, "ticket_queue": "nZad1AGe"}], "sub_game_modes": {}, "ticket_flexing_selection": "drj6ahoV", "ticket_flexing_selections": [{"selection": "PUgrWMCN", "threshold": 21}, {"selection": "wjoWwiXS", "threshold": 55}, {"selection": "yiE5Z1yC", "threshold": 14}], "use_newest_ticket_for_flexing": true}, "sessionQueueTimeoutSeconds": 85, "socialMatchmaking": true, "sub_gamemode_selection": "random", "ticket_observability_enable": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName 'qdDiiEHV' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName 'xWKrG7HY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName '4MJPL8XX' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 34}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName '0u9JaQAY' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName 'KlycQJiG' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "rbYihEZt", "count": 88, "mmrMax": 0.4415542751508149, "mmrMean": 0.9614789305614697, "mmrMin": 0.7635796313698009, "mmrStdDev": 0.6389388919126044}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'mQh7ngAC' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 49, "party_attributes": {"hUchRRzv": {}, "NpzfBiwR": {}, "E43ic76s": {}}, "party_id": "NJlc9OON", "party_members": [{"extra_attributes": {"c2jD4baR": {}, "DeFDyYcV": {}, "6g1hNRGj": {}}, "user_id": "gHFyevFi"}, {"extra_attributes": {"tcO6YerU": {}, "gNyMZLyz": {}, "UYoYTxKj": {}}, "user_id": "PP7I3SDi"}, {"extra_attributes": {"NzHc3B1s": {}, "IUQ981a9": {}, "gTWpmEfE": {}}, "user_id": "QxNO4oc7"}], "ticket_created_at": 13, "ticket_id": "5EDSNdbS"}, {"first_ticket_created_at": 60, "party_attributes": {"Cac04U6B": {}, "PvWeqezP": {}, "f470VLB4": {}}, "party_id": "2IJmiAh0", "party_members": [{"extra_attributes": {"bqz09Q9U": {}, "ozVXv4SN": {}, "8fdYFofx": {}}, "user_id": "MkP1i3Nb"}, {"extra_attributes": {"kp7Phvkm": {}, "Ga4LR3Mi": {}, "RkFcaErF": {}}, "user_id": "KBIO6dTD"}, {"extra_attributes": {"b6kBpZzK": {}, "gVizSHqM": {}, "VpP55qGs": {}}, "user_id": "EaFi6G4F"}], "ticket_created_at": 61, "ticket_id": "H58v7eLu"}, {"first_ticket_created_at": 19, "party_attributes": {"WCYI6TpW": {}, "vThktVPm": {}, "Qb0TMUY4": {}}, "party_id": "vIIyTbak", "party_members": [{"extra_attributes": {"aucoEotG": {}, "rBQUzLro": {}, "su9DeCjM": {}}, "user_id": "ghCjNzfv"}, {"extra_attributes": {"wJLKkn3y": {}, "Pvl6g3gw": {}, "eio0sM0z": {}}, "user_id": "YVWLAC2G"}, {"extra_attributes": {"ZqTO43is": {}, "qD8p31Bk": {}, "VdXyMKic": {}}, "user_id": "8LxBu42r"}], "ticket_created_at": 99, "ticket_id": "OU9Nwg84"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName 'BzRkCUj2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 97}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'vy8OJSTn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'GAEM2CFa' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'Mg1mV8Uq' \
    --matchID 'wv2WrFuK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["gghrprG4", "tn76VET5", "LyIndkCc"], "party_id": "55JZJRIq", "user_id": "Xlr5Hzx4"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'TINfBVjm' \
    --matchID 'lxDt3kRq' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'qo3E00TW' \
    --matchID '7z82CSHP' \
    --namespace "$AB_NAMESPACE" \
    --userID 'vc8RMUAz' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName 'PBowiznG' \
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
    --channelName 'Ylj0xb7s' \
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