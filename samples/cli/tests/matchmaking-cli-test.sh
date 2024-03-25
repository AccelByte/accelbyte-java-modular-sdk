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
    --limit '24' \
    --offset '46' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatchOnDifferentTeam", "deployment": "jArKhKyu", "description": "FsYtFjc4", "find_match_timeout_seconds": 93, "game_mode": "Gme3sUf3", "joinable": false, "max_delay_ms": 97, "region_expansion_range_ms": 30, "region_expansion_rate_ms": 99, "region_latency_initial_range_ms": 63, "region_latency_max_ms": 85, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 55, "min": 3, "name": "fOkWkcwV"}, {"max": 36, "min": 75, "name": "7ScbTjmf"}, {"max": 76, "min": 59, "name": "MeDpq0xF"}], [{"max": 70, "min": 7, "name": "oMLPkP8t"}, {"max": 68, "min": 63, "name": "d6KsX2VK"}, {"max": 76, "min": 39, "name": "m4AEVVlm"}], [{"max": 54, "min": 29, "name": "3XSx365N"}, {"max": 89, "min": 96, "name": "nZjtKcqR"}, {"max": 57, "min": 22, "name": "ghjZSUCi"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 73, "role_flexing_second": 92}, "max_number": 11, "min_number": 65, "player_max_number": 35, "player_min_number": 77}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 54, "min": 17, "name": "o4NYNMEb"}, {"max": 8, "min": 14, "name": "wq3nwkGV"}, {"max": 87, "min": 9, "name": "693X1jea"}], [{"max": 17, "min": 66, "name": "abyJKsXY"}, {"max": 59, "min": 88, "name": "kODcuZ52"}, {"max": 77, "min": 4, "name": "tu7Y6utH"}], [{"max": 81, "min": 96, "name": "tKNH7cnB"}, {"max": 2, "min": 54, "name": "Ts4RcUtJ"}, {"max": 90, "min": 76, "name": "Sa8AftGh"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 92, "role_flexing_second": 91}, "duration": 69, "max_number": 90, "min_number": 85, "player_max_number": 54, "player_min_number": 61}, {"combination": {"alliances": [[{"max": 61, "min": 81, "name": "DQhMQzcx"}, {"max": 2, "min": 25, "name": "VLg8VqL6"}, {"max": 23, "min": 97, "name": "BpNU2KY4"}], [{"max": 92, "min": 20, "name": "tWFoJaXl"}, {"max": 6, "min": 53, "name": "giLvCflg"}, {"max": 46, "min": 50, "name": "XoBOaLJM"}], [{"max": 66, "min": 31, "name": "2T7GJRJK"}, {"max": 48, "min": 29, "name": "RjVRKP1q"}, {"max": 62, "min": 58, "name": "I4Fb4NG9"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 80, "role_flexing_second": 35}, "duration": 96, "max_number": 43, "min_number": 33, "player_max_number": 96, "player_min_number": 16}, {"combination": {"alliances": [[{"max": 37, "min": 90, "name": "owmySRlF"}, {"max": 8, "min": 91, "name": "zIB0iqGn"}, {"max": 85, "min": 1, "name": "j6hDAxQU"}], [{"max": 5, "min": 89, "name": "L8TfBPaK"}, {"max": 99, "min": 6, "name": "ZSrbFVVm"}, {"max": 69, "min": 43, "name": "xZIq5rfz"}], [{"max": 51, "min": 45, "name": "jaBtUb3S"}, {"max": 3, "min": 87, "name": "VYzkkPgT"}, {"max": 77, "min": 26, "name": "qHK5qPbI"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 68, "role_flexing_second": 66}, "duration": 84, "max_number": 99, "min_number": 40, "player_max_number": 1, "player_min_number": 42}], "batch_size": 62, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 13, "flex_flat_step_range": 58, "flex_immunity_count": 48, "flex_range_max": 30, "flex_rate_ms": 38, "flex_step_max": 41, "force_authority_match": false, "initial_step_range": 22, "mmr_max": 65, "mmr_mean": 59, "mmr_min": 83, "mmr_std_dev": 59, "override_mmr_data": false, "use_bucket_mmr": true, "use_flat_flex_step": true}, "flexing_rule": [{"attribute": "yJKpvHlZ", "criteria": "FvYeFqxn", "duration": 72, "reference": 0.19588172952386718}, {"attribute": "NAvScaZb", "criteria": "FjaVeyrL", "duration": 18, "reference": 0.737710090047757}, {"attribute": "xPpbaO9R", "criteria": "7ifi3ulS", "duration": 77, "reference": 0.774750826482348}], "match_options": {"options": [{"name": "ON1RMExe", "type": "5ddK7LR0"}, {"name": "D9ADOOsC", "type": "Lbc0lvnE"}, {"name": "77b7fT8d", "type": "aoOwZ6JK"}]}, "matching_rule": [{"attribute": "lwju04sy", "criteria": "CcdhvPFD", "reference": 0.5092453364525099}, {"attribute": "OzPz7b7f", "criteria": "kcXH1QD1", "reference": 0.7398394167614618}, {"attribute": "iUiEcrDa", "criteria": "Y0axpEol", "reference": 0.7201624006090642}], "rebalance_enable": true, "sort_ticket": {"search_result": "y4CFzIcz", "ticket_queue": "LgnkuPHR"}, "sort_tickets": [{"search_result": "vL7xSqWD", "threshold": 36, "ticket_queue": "jfAVWldA"}, {"search_result": "muN1uIMj", "threshold": 30, "ticket_queue": "gGXBi013"}, {"search_result": "YXnbt1Dx", "threshold": 2, "ticket_queue": "94E2wcLb"}], "sub_game_modes": {"ucgEuMDJ": {"alliance": {"combination": {"alliances": [[{"max": 53, "min": 17, "name": "Sw2noof5"}, {"max": 87, "min": 56, "name": "c0Xp6SjM"}, {"max": 81, "min": 63, "name": "NOawqsoK"}], [{"max": 23, "min": 25, "name": "fpK9zsYh"}, {"max": 0, "min": 32, "name": "lhkeYRqB"}, {"max": 21, "min": 79, "name": "VrsjPb6v"}], [{"max": 73, "min": 78, "name": "SWv3yC7r"}, {"max": 28, "min": 27, "name": "jkEznv8t"}, {"max": 69, "min": 10, "name": "cHWdFFLt"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 17, "role_flexing_second": 62}, "max_number": 62, "min_number": 34, "player_max_number": 13, "player_min_number": 29}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 69, "min": 6, "name": "6CYhvoOU"}, {"max": 30, "min": 79, "name": "WKOt21qq"}, {"max": 39, "min": 84, "name": "tB80szMe"}], [{"max": 38, "min": 58, "name": "DDOGrYLI"}, {"max": 77, "min": 21, "name": "PjP1Dko7"}, {"max": 14, "min": 61, "name": "94PoZvd4"}], [{"max": 35, "min": 55, "name": "wl8Q7Srj"}, {"max": 76, "min": 78, "name": "qn1glWpB"}, {"max": 2, "min": 32, "name": "CwN9RHyr"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 4, "role_flexing_second": 10}, "duration": 20, "max_number": 31, "min_number": 26, "player_max_number": 94, "player_min_number": 62}, {"combination": {"alliances": [[{"max": 8, "min": 0, "name": "W6sHy5yD"}, {"max": 84, "min": 26, "name": "HXcsYR3R"}, {"max": 56, "min": 30, "name": "prx1aAYr"}], [{"max": 85, "min": 60, "name": "VBMlVMuM"}, {"max": 44, "min": 23, "name": "nHqvzabk"}, {"max": 32, "min": 79, "name": "Dr5wtCPW"}], [{"max": 60, "min": 86, "name": "oBwnttla"}, {"max": 48, "min": 83, "name": "G8mMvxEq"}, {"max": 23, "min": 61, "name": "RXtX6XBe"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 42, "role_flexing_second": 14}, "duration": 40, "max_number": 84, "min_number": 9, "player_max_number": 25, "player_min_number": 65}, {"combination": {"alliances": [[{"max": 89, "min": 73, "name": "PvqyOBq6"}, {"max": 87, "min": 37, "name": "hQuGqcXv"}, {"max": 88, "min": 3, "name": "VWzsNW2o"}], [{"max": 35, "min": 86, "name": "ez5CmWKH"}, {"max": 60, "min": 51, "name": "kPHkd4cG"}, {"max": 15, "min": 54, "name": "1JKjNIal"}], [{"max": 59, "min": 57, "name": "2M0byFOT"}, {"max": 6, "min": 54, "name": "tOsiHxNf"}, {"max": 5, "min": 80, "name": "H2sC1leg"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 68, "role_flexing_second": 47}, "duration": 39, "max_number": 17, "min_number": 35, "player_max_number": 61, "player_min_number": 30}], "name": "EPFIdMfc"}, "0IAME0Ro": {"alliance": {"combination": {"alliances": [[{"max": 62, "min": 89, "name": "WvkQfcTJ"}, {"max": 4, "min": 88, "name": "MOVhd6Xr"}, {"max": 83, "min": 10, "name": "stSayoYh"}], [{"max": 74, "min": 14, "name": "SqkUFOei"}, {"max": 50, "min": 68, "name": "1Rxnd6aK"}, {"max": 49, "min": 47, "name": "u3dmyD8K"}], [{"max": 75, "min": 4, "name": "JVKE7pWO"}, {"max": 36, "min": 74, "name": "6OdYJzV8"}, {"max": 5, "min": 84, "name": "7SpfFV6n"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 21, "role_flexing_second": 24}, "max_number": 9, "min_number": 58, "player_max_number": 18, "player_min_number": 50}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 1, "min": 2, "name": "kWelMOia"}, {"max": 45, "min": 53, "name": "NfTeSazA"}, {"max": 94, "min": 15, "name": "BC6epvKx"}], [{"max": 58, "min": 59, "name": "uc0I5sNO"}, {"max": 81, "min": 63, "name": "OhB9NJln"}, {"max": 87, "min": 87, "name": "ZEaViGGU"}], [{"max": 84, "min": 77, "name": "zhhh0jbL"}, {"max": 6, "min": 41, "name": "88UrVcCO"}, {"max": 3, "min": 30, "name": "hbSL3Tjp"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 92, "role_flexing_second": 84}, "duration": 41, "max_number": 33, "min_number": 30, "player_max_number": 52, "player_min_number": 17}, {"combination": {"alliances": [[{"max": 91, "min": 14, "name": "475dICAo"}, {"max": 47, "min": 82, "name": "K8CQYH1l"}, {"max": 44, "min": 21, "name": "x785eZl4"}], [{"max": 100, "min": 10, "name": "4O4MeQHS"}, {"max": 78, "min": 27, "name": "ci20O8qI"}, {"max": 27, "min": 90, "name": "J6llkhB0"}], [{"max": 18, "min": 43, "name": "cWznt0pt"}, {"max": 27, "min": 93, "name": "RsvouGDJ"}, {"max": 87, "min": 86, "name": "AbvXeF3H"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 36, "role_flexing_second": 34}, "duration": 12, "max_number": 31, "min_number": 84, "player_max_number": 46, "player_min_number": 86}, {"combination": {"alliances": [[{"max": 32, "min": 30, "name": "pidPPf2R"}, {"max": 46, "min": 71, "name": "93VTo2cc"}, {"max": 50, "min": 90, "name": "ilvRXyFy"}], [{"max": 85, "min": 25, "name": "9Mo3mBhy"}, {"max": 31, "min": 14, "name": "yWSBmk0F"}, {"max": 32, "min": 23, "name": "lF2x11ki"}], [{"max": 33, "min": 35, "name": "q5lW5hz8"}, {"max": 70, "min": 30, "name": "pL5iKBmt"}, {"max": 24, "min": 81, "name": "RYV05FoX"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 8, "role_flexing_second": 53}, "duration": 37, "max_number": 56, "min_number": 13, "player_max_number": 57, "player_min_number": 0}], "name": "TuNMbPuu"}, "kazSndtO": {"alliance": {"combination": {"alliances": [[{"max": 29, "min": 59, "name": "7ee6eMwJ"}, {"max": 69, "min": 79, "name": "1pVH9m3C"}, {"max": 13, "min": 95, "name": "ZYwc5TwF"}], [{"max": 93, "min": 56, "name": "G9jM1WoZ"}, {"max": 11, "min": 5, "name": "o1KjpKGb"}, {"max": 93, "min": 35, "name": "K05XCIOA"}], [{"max": 69, "min": 11, "name": "EZA3w9QJ"}, {"max": 50, "min": 37, "name": "PvSBDH9V"}, {"max": 32, "min": 56, "name": "NZXPpVVD"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 61, "role_flexing_second": 89}, "max_number": 8, "min_number": 99, "player_max_number": 97, "player_min_number": 4}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 58, "min": 80, "name": "0Hv5Vqvo"}, {"max": 62, "min": 94, "name": "wqN9tyKo"}, {"max": 6, "min": 47, "name": "Ax6jDJiG"}], [{"max": 66, "min": 95, "name": "wP3bkyv4"}, {"max": 55, "min": 73, "name": "8WPCNifV"}, {"max": 27, "min": 2, "name": "vp5613Mn"}], [{"max": 71, "min": 24, "name": "TQnPB94y"}, {"max": 87, "min": 28, "name": "bTxX4JqA"}, {"max": 38, "min": 20, "name": "IKzYhOHd"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 49, "role_flexing_second": 31}, "duration": 30, "max_number": 15, "min_number": 25, "player_max_number": 9, "player_min_number": 42}, {"combination": {"alliances": [[{"max": 29, "min": 90, "name": "0imEZKym"}, {"max": 23, "min": 81, "name": "eydluzCC"}, {"max": 24, "min": 13, "name": "QvWzCRXZ"}], [{"max": 39, "min": 63, "name": "6wAvPC1g"}, {"max": 47, "min": 22, "name": "gsLT93BD"}, {"max": 0, "min": 38, "name": "VzY8cot3"}], [{"max": 36, "min": 25, "name": "0eXZxXj4"}, {"max": 79, "min": 22, "name": "pUCaIcZG"}, {"max": 38, "min": 83, "name": "u9HC8u71"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 38, "role_flexing_second": 11}, "duration": 57, "max_number": 50, "min_number": 41, "player_max_number": 39, "player_min_number": 36}, {"combination": {"alliances": [[{"max": 57, "min": 38, "name": "je9AF3hl"}, {"max": 96, "min": 73, "name": "I3LVraNz"}, {"max": 80, "min": 54, "name": "R1AQIyOE"}], [{"max": 77, "min": 6, "name": "HIAWyUDT"}, {"max": 90, "min": 61, "name": "FiEo3nWg"}, {"max": 44, "min": 30, "name": "Afb7axXr"}], [{"max": 5, "min": 70, "name": "UPvnNyGX"}, {"max": 65, "min": 30, "name": "Obicr7Za"}, {"max": 56, "min": 65, "name": "JXx6ae0T"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 1, "role_flexing_second": 55}, "duration": 23, "max_number": 40, "min_number": 46, "player_max_number": 45, "player_min_number": 32}], "name": "NvgLmcxl"}}, "ticket_flexing_selection": "wpRF5X5k", "ticket_flexing_selections": [{"selection": "jp9HODXA", "threshold": 52}, {"selection": "RPVonmmr", "threshold": 35}, {"selection": "e3NZoN8k", "threshold": 54}], "use_newest_ticket_for_flexing": true}, "session_queue_timeout_seconds": 65, "social_matchmaking": false, "sub_gamemode_selection": "random", "ticket_observability_enable": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName '75hUsUMO' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'TcjLC79e' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "nAQ2dWDd", "players": [{"results": [{"attribute": "lDnYfw69", "value": 0.5558972628627997}, {"attribute": "Ly5lVq76", "value": 0.6076020418320174}, {"attribute": "BMS8n0eu", "value": 0.26506610042054646}], "user_id": "SmN6H5o2"}, {"results": [{"attribute": "plUHAPRW", "value": 0.21933335540978371}, {"attribute": "3T25Q5qe", "value": 0.21575504803462042}, {"attribute": "1wDq1CFm", "value": 0.7245315840175477}], "user_id": "jtcs8Rsv"}, {"results": [{"attribute": "sC0TStRX", "value": 0.08802871861138051}, {"attribute": "CkOm2GV8", "value": 0.1964557003916757}, {"attribute": "clu7A3RY", "value": 0.46800482896753504}], "user_id": "ai8oeoE9"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "TwPWjBMf"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "c8BqnUkP", "client_version": "9tkug2Xg", "deployment": "GYf56gWH", "error_code": 41, "error_message": "aWgCPhxR", "game_mode": "UGHh0JoY", "is_mock": "NBkncont", "joinable": false, "match_id": "DCXhAK5h", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 96, "party_attributes": {"AG5GdBY0": {}, "uhE8Wuoe": {}, "CZEJ2NWA": {}}, "party_id": "3utLHJQo", "party_members": [{"extra_attributes": {"uKRRwqCj": {}, "UiMWx4nI": {}, "t0ulSNwb": {}}, "user_id": "GpCHSZ7A"}, {"extra_attributes": {"MpxdV2OC": {}, "588O4sGA": {}, "LbYamsI4": {}}, "user_id": "VeNZLiex"}, {"extra_attributes": {"1kiZuUA1": {}, "2G9CePBi": {}, "piUClvyh": {}}, "user_id": "80f4yQ6m"}], "ticket_created_at": 64, "ticket_id": "gCoAkFeM"}, {"first_ticket_created_at": 90, "party_attributes": {"IqEVGqtd": {}, "G7e3ZDCv": {}, "iVDGGgip": {}}, "party_id": "lSBbJmDI", "party_members": [{"extra_attributes": {"wf4vdENl": {}, "mXDV3lsL": {}, "dqPU2Z70": {}}, "user_id": "1AhNtgm7"}, {"extra_attributes": {"lp02Z0B4": {}, "MgL9QAOJ": {}, "L9UWVI3F": {}}, "user_id": "CF8jddDs"}, {"extra_attributes": {"vyl9PHHL": {}, "hiWzD9PG": {}, "uu2884mX": {}}, "user_id": "EpZ9Cnzg"}], "ticket_created_at": 72, "ticket_id": "rl1rQWyp"}, {"first_ticket_created_at": 55, "party_attributes": {"1e7QWDht": {}, "FFo7cPA7": {}, "Lihwmx0r": {}}, "party_id": "H9yfps8l", "party_members": [{"extra_attributes": {"ZPOP6RR7": {}, "rrGCUHY5": {}, "PuJP00vf": {}}, "user_id": "Cf3r0Urw"}, {"extra_attributes": {"Zqq44o35": {}, "g46YjBLi": {}, "AESY73Hn": {}}, "user_id": "tD0bdQZY"}, {"extra_attributes": {"J3AuuwsP": {}, "n8lJionI": {}, "xJGC3psC": {}}, "user_id": "s6iQcWFG"}], "ticket_created_at": 98, "ticket_id": "Udosn6G8"}]}, {"matching_parties": [{"first_ticket_created_at": 80, "party_attributes": {"PzoEaxSU": {}, "lwb4ALxC": {}, "L1OmuTcJ": {}}, "party_id": "9LUcnVH3", "party_members": [{"extra_attributes": {"GYWc5hUg": {}, "V4KbZmqw": {}, "Gjx1dLUj": {}}, "user_id": "WgmoC8qZ"}, {"extra_attributes": {"UW8GiTyu": {}, "5QuTPv8u": {}, "8IGkcyoX": {}}, "user_id": "pVT3hBOt"}, {"extra_attributes": {"1fIoxej0": {}, "kRzviaMw": {}, "5kycbiaJ": {}}, "user_id": "O2AuYacn"}], "ticket_created_at": 84, "ticket_id": "nD1qROUC"}, {"first_ticket_created_at": 43, "party_attributes": {"4zumfBSO": {}, "shF5Z3Xl": {}, "ghH3iLSp": {}}, "party_id": "QuqwJJ6Z", "party_members": [{"extra_attributes": {"znzj2M5g": {}, "sxXvQrRg": {}, "Lv6owKLM": {}}, "user_id": "gKG3hLDV"}, {"extra_attributes": {"iDGIrMF9": {}, "wcLVll4M": {}, "cPfc79r1": {}}, "user_id": "jcx2cn8Q"}, {"extra_attributes": {"oorJ0Eiq": {}, "18ytZ4Yp": {}, "uVV1eOeC": {}}, "user_id": "V6zl6v0j"}], "ticket_created_at": 8, "ticket_id": "QmETDdx8"}, {"first_ticket_created_at": 85, "party_attributes": {"YPjpFtLf": {}, "SCSYywyr": {}, "izB6ODtI": {}}, "party_id": "IScODTBM", "party_members": [{"extra_attributes": {"L2RLQuPS": {}, "rGKLNXXg": {}, "tirNSQuo": {}}, "user_id": "hBjyIGMM"}, {"extra_attributes": {"H8PbOOjl": {}, "mWsZdkt9": {}, "4E1lLmfz": {}}, "user_id": "p5aPtecU"}, {"extra_attributes": {"VtNF4KJ2": {}, "zdh7of23": {}, "On4hHv8l": {}}, "user_id": "5tWOpztT"}], "ticket_created_at": 1, "ticket_id": "VKIGH1un"}]}, {"matching_parties": [{"first_ticket_created_at": 25, "party_attributes": {"u0ALvILB": {}, "2eCMV9HE": {}, "oHteRLzj": {}}, "party_id": "spY43Nt8", "party_members": [{"extra_attributes": {"aLvyVMu4": {}, "IJ63D4Ws": {}, "iE6VXjUz": {}}, "user_id": "rhTUWZdL"}, {"extra_attributes": {"KglhgjR3": {}, "2zppzLbt": {}, "jHatbkRV": {}}, "user_id": "5374Kk5L"}, {"extra_attributes": {"7l6lMJFT": {}, "BgnMCUGm": {}, "hvHzHqoK": {}}, "user_id": "qea9ycRe"}], "ticket_created_at": 89, "ticket_id": "e7UPD2fp"}, {"first_ticket_created_at": 5, "party_attributes": {"JdUWrIhw": {}, "voJ5QvMD": {}, "gxDYVZAC": {}}, "party_id": "pxgbEcb0", "party_members": [{"extra_attributes": {"GBmPrVLL": {}, "UflTCwQ9": {}, "Caopv52Q": {}}, "user_id": "gWMUTiUP"}, {"extra_attributes": {"IZhE5yHC": {}, "pUpBvRPZ": {}, "wwL1ZLSZ": {}}, "user_id": "0G8TBMvD"}, {"extra_attributes": {"I61i30Sb": {}, "fbEYvwMX": {}, "L7fp90fO": {}}, "user_id": "S5Z8Y5Fn"}], "ticket_created_at": 69, "ticket_id": "43BPQVg7"}, {"first_ticket_created_at": 61, "party_attributes": {"J7J3aNDM": {}, "yTmRRyfz": {}, "Sq51gP4R": {}}, "party_id": "JVNI0MLh", "party_members": [{"extra_attributes": {"CjGKCJHT": {}, "UbV0XzAL": {}, "vJbsjtze": {}}, "user_id": "X8Yr9Dmq"}, {"extra_attributes": {"U3wit7Hc": {}, "nm01PL7E": {}, "nVDuSFiO": {}}, "user_id": "xxWXrnWA"}, {"extra_attributes": {"y3I7qrDV": {}, "qxznX4KC": {}, "1cZdKCwj": {}}, "user_id": "2GQH6MF1"}], "ticket_created_at": 81, "ticket_id": "YIKX3lKr"}]}], "namespace": "nxeV2cAt", "party_attributes": {"jKyoTWXn": {}, "B2XYT4Wz": {}, "er98dWQC": {}}, "party_id": "TXgW9otu", "queued_at": 31, "region": "XhS5xoLQ", "server_name": "MKKyKdpr", "status": "UYU6y9uD", "ticket_id": "0f6IRzVT", "ticket_ids": ["FeNEZFL6", "27RbZqwK", "cdIi9bzF"], "updated_at": "1995-07-14T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "UfhqUTVw"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'k5SV7oVk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 26, "userID": "KNjq62qz", "weight": 0.1414638134389833}' \
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
    --matchIDs 'uFs5AQlv' \
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
    --strategy 'aiyBF4QM' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'KLVvO9tE' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName '70ZIhzCs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatchOnDifferentTeam", "deployment": "4PELqFNm", "description": "p548auq4", "findMatchTimeoutSeconds": 35, "joinable": false, "max_delay_ms": 37, "region_expansion_range_ms": 34, "region_expansion_rate_ms": 11, "region_latency_initial_range_ms": 8, "region_latency_max_ms": 10, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 41, "min": 12, "name": "WMsWhdOw"}, {"max": 98, "min": 26, "name": "tZSbLWr7"}, {"max": 67, "min": 34, "name": "6ickWTmw"}], [{"max": 10, "min": 30, "name": "IPIlbThD"}, {"max": 18, "min": 10, "name": "40HlTvQT"}, {"max": 33, "min": 38, "name": "aRaEAVO0"}], [{"max": 5, "min": 22, "name": "wRgHu6e4"}, {"max": 70, "min": 36, "name": "hvSjNEQj"}, {"max": 8, "min": 66, "name": "JYdCUW79"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 70, "role_flexing_second": 0}, "maxNumber": 16, "minNumber": 24, "playerMaxNumber": 3, "playerMinNumber": 93}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 5, "min": 44, "name": "Kk7xrUAK"}, {"max": 29, "min": 79, "name": "DOzNsTPX"}, {"max": 8, "min": 37, "name": "Uzujbngf"}], [{"max": 52, "min": 29, "name": "ydatG2nZ"}, {"max": 87, "min": 7, "name": "2wUcTWdO"}, {"max": 33, "min": 99, "name": "JUJETEnv"}], [{"max": 35, "min": 88, "name": "k6MZmtqj"}, {"max": 13, "min": 3, "name": "ev55YTPS"}, {"max": 65, "min": 19, "name": "l7zvPlbA"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 77, "role_flexing_second": 19}, "duration": 22, "max_number": 20, "min_number": 16, "player_max_number": 83, "player_min_number": 48}, {"combination": {"alliances": [[{"max": 31, "min": 23, "name": "VgUbloF1"}, {"max": 64, "min": 92, "name": "B3eW1KyY"}, {"max": 56, "min": 87, "name": "Riu2HMDE"}], [{"max": 78, "min": 42, "name": "zIXegVZb"}, {"max": 37, "min": 28, "name": "s5CuFQTi"}, {"max": 26, "min": 4, "name": "UJiQ737Y"}], [{"max": 43, "min": 18, "name": "DVVfCUq9"}, {"max": 34, "min": 19, "name": "Gy9sS2BL"}, {"max": 14, "min": 87, "name": "040BxW6p"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 91, "role_flexing_second": 62}, "duration": 22, "max_number": 54, "min_number": 70, "player_max_number": 44, "player_min_number": 55}, {"combination": {"alliances": [[{"max": 3, "min": 9, "name": "sJpDdIqk"}, {"max": 15, "min": 31, "name": "LPa4hJ5o"}, {"max": 66, "min": 15, "name": "J3Y3id2N"}], [{"max": 16, "min": 3, "name": "M4zZzmRK"}, {"max": 13, "min": 72, "name": "DJ6gmcy8"}, {"max": 17, "min": 3, "name": "SzywtA52"}], [{"max": 95, "min": 98, "name": "XokNqKlJ"}, {"max": 89, "min": 43, "name": "jN8xpJkv"}, {"max": 85, "min": 5, "name": "6xz739SU"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 69, "role_flexing_second": 64}, "duration": 30, "max_number": 19, "min_number": 52, "player_max_number": 75, "player_min_number": 56}], "batch_size": 43, "bucket_mmr_rule": {"disable_authority": true, "flex_authority_count": 45, "flex_flat_step_range": 73, "flex_immunity_count": 80, "flex_range_max": 59, "flex_rate_ms": 38, "flex_step_max": 84, "force_authority_match": true, "initial_step_range": 93, "mmr_max": 79, "mmr_mean": 53, "mmr_min": 0, "mmr_std_dev": 54, "override_mmr_data": true, "use_bucket_mmr": true, "use_flat_flex_step": true}, "flexingRules": [{"attribute": "6CcYFEds", "criteria": "kXCqzUcO", "duration": 90, "reference": 0.004484645064950721}, {"attribute": "cigi66fG", "criteria": "yRLMvVSv", "duration": 83, "reference": 0.9084425001562559}, {"attribute": "MY1qsmcc", "criteria": "SUOQEE5y", "duration": 6, "reference": 0.5698504936400016}], "match_options": {"options": [{"name": "8pyR94Ta", "type": "BXyMdFBV"}, {"name": "zYAWfZvO", "type": "fc3CnV2x"}, {"name": "SibB195t", "type": "HhSyJYu7"}]}, "matchingRules": [{"attribute": "x3m6W2tg", "criteria": "Jn800Tqi", "reference": 0.06625020181472263}, {"attribute": "9uwxCGJv", "criteria": "SoWCztyB", "reference": 0.7862399930821032}, {"attribute": "JHCOJ7R5", "criteria": "RL0ec8Vr", "reference": 0.29568010687427937}], "sort_ticket": {"search_result": "ncbYOp2h", "ticket_queue": "gEaVKJyN"}, "sort_tickets": [{"search_result": "XZQetKzw", "threshold": 61, "ticket_queue": "Q5GCjFHU"}, {"search_result": "H44vbb8H", "threshold": 98, "ticket_queue": "AlJ8K8Zo"}, {"search_result": "7Sk5haEu", "threshold": 63, "ticket_queue": "7VM5154a"}], "sub_game_modes": {}, "ticket_flexing_selection": "NBTh99yd", "ticket_flexing_selections": [{"selection": "CuLTkSTG", "threshold": 8}, {"selection": "tG5pOL20", "threshold": 90}, {"selection": "7TOWpPag", "threshold": 60}], "use_newest_ticket_for_flexing": true}, "sessionQueueTimeoutSeconds": 7, "socialMatchmaking": false, "sub_gamemode_selection": "random", "ticket_observability_enable": false, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName 'heMjyBKt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName 'S2xP3YiB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName 'upAGz6S2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 27}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName 'pTQU1kwS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName '5rKqFIX1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "6iQXAKw8", "count": 79, "mmrMax": 0.3084638642649057, "mmrMean": 0.3276634544174406, "mmrMin": 0.9536964717535878, "mmrStdDev": 0.8856830194615284}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'c4iBMxrI' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 67, "party_attributes": {"MwP5xiOM": {}, "vR7hZLJ1": {}, "hGsBgf3Q": {}}, "party_id": "agdyyzJH", "party_members": [{"extra_attributes": {"2Wgbhj8N": {}, "Ji8x3xTG": {}, "eipJdbxV": {}}, "user_id": "Itmb3T5c"}, {"extra_attributes": {"b3u6AHJM": {}, "EhtuzhCJ": {}, "47KwnCoQ": {}}, "user_id": "eVUVHubh"}, {"extra_attributes": {"33N5oufs": {}, "JmLX34Rh": {}, "3vOeWWv0": {}}, "user_id": "MG1YceiI"}], "ticket_created_at": 3, "ticket_id": "sC7Csvnd"}, {"first_ticket_created_at": 11, "party_attributes": {"OstvbWrF": {}, "I9Rw6B8N": {}, "HPnxCvUx": {}}, "party_id": "H6ftjigl", "party_members": [{"extra_attributes": {"2UJnmQ2d": {}, "w9Fo0JfP": {}, "apxwWwxd": {}}, "user_id": "7xhk9KKE"}, {"extra_attributes": {"v7ptfEr8": {}, "eVNXYjeu": {}, "WTGOGnDD": {}}, "user_id": "UIuTAWBo"}, {"extra_attributes": {"12eTxgTj": {}, "F3qLH8ts": {}, "ZbUbs7Ve": {}}, "user_id": "X67JvXdd"}], "ticket_created_at": 19, "ticket_id": "j3SLcmMj"}, {"first_ticket_created_at": 93, "party_attributes": {"2cMNoVmz": {}, "Q9hDHuhg": {}, "iCKgvsXR": {}}, "party_id": "sAUdTPLb", "party_members": [{"extra_attributes": {"9sdNivaD": {}, "KNKnuzqL": {}, "h4vCGWU5": {}}, "user_id": "Y0zdrUkc"}, {"extra_attributes": {"5JBnSvtC": {}, "fdJYzkNm": {}, "nrkWrYm6": {}}, "user_id": "BzqeZzhO"}, {"extra_attributes": {"Kfi1TYbq": {}, "kkq2umUu": {}, "GemCy6a2": {}}, "user_id": "ipGnOaNL"}], "ticket_created_at": 75, "ticket_id": "YxjuIKWR"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName 'C6JZ4evs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 59}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'u8WNr6Rt' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName '59XhDhZH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'lQP5hDpE' \
    --matchID '0Vj9RQFo' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["kuVT9CVs", "7Zcuywh9", "NUjDm5kS"], "party_id": "XASD8U4M", "user_id": "rkRJ1Sma"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'ukislSx3' \
    --matchID '3CdF76qM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'h40exEFr' \
    --matchID 'asOX8mYb' \
    --namespace "$AB_NAMESPACE" \
    --userID 'J0WRopBW' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName 'upv7vUXT' \
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
    --channelName 'W6z8nQng' \
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