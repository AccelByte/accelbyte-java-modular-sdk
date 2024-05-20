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
    --limit '98' \
    --offset '84' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCannotMatch", "deployment": "MCNA2ncA", "description": "CiUiwEBp", "find_match_timeout_seconds": 55, "game_mode": "uPddqgof", "joinable": false, "max_delay_ms": 36, "region_expansion_range_ms": 5, "region_expansion_rate_ms": 30, "region_latency_initial_range_ms": 95, "region_latency_max_ms": 79, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 66, "min": 43, "name": "piKmuEUa"}, {"max": 72, "min": 34, "name": "XxfZVciw"}, {"max": 1, "min": 48, "name": "pxiiQQCX"}], [{"max": 57, "min": 38, "name": "ZlnaRu9W"}, {"max": 20, "min": 63, "name": "GqLpLDD4"}, {"max": 66, "min": 49, "name": "WNC6A3vV"}], [{"max": 73, "min": 63, "name": "Zi5o19VR"}, {"max": 41, "min": 56, "name": "zZZyFEhJ"}, {"max": 56, "min": 32, "name": "KADlYK9X"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 30, "role_flexing_second": 15}, "max_number": 68, "min_number": 29, "player_max_number": 49, "player_min_number": 49}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 18, "min": 34, "name": "NEtrOGxq"}, {"max": 25, "min": 66, "name": "nRDtnT3U"}, {"max": 94, "min": 3, "name": "A5EYVG8B"}], [{"max": 8, "min": 34, "name": "C3JUQ1s3"}, {"max": 1, "min": 2, "name": "01Oux0ci"}, {"max": 1, "min": 11, "name": "xsEuac24"}], [{"max": 64, "min": 27, "name": "ilNKxa4M"}, {"max": 94, "min": 80, "name": "3yvHJ6Kr"}, {"max": 73, "min": 69, "name": "xiksgNy5"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 12, "role_flexing_second": 21}, "duration": 51, "max_number": 78, "min_number": 51, "player_max_number": 92, "player_min_number": 93}, {"combination": {"alliances": [[{"max": 2, "min": 79, "name": "rXyFJUh7"}, {"max": 21, "min": 19, "name": "bwh7EmhW"}, {"max": 40, "min": 71, "name": "lk7Lg0SS"}], [{"max": 51, "min": 58, "name": "w33xtoFd"}, {"max": 67, "min": 19, "name": "DZHnnuUW"}, {"max": 34, "min": 84, "name": "A1KewFVS"}], [{"max": 35, "min": 99, "name": "Jh9AWMD9"}, {"max": 24, "min": 42, "name": "S5IlsbTW"}, {"max": 65, "min": 42, "name": "muEiNDIn"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 32, "role_flexing_second": 6}, "duration": 20, "max_number": 57, "min_number": 7, "player_max_number": 96, "player_min_number": 32}, {"combination": {"alliances": [[{"max": 55, "min": 36, "name": "91QDT7Sb"}, {"max": 23, "min": 96, "name": "HHZl5kLV"}, {"max": 16, "min": 52, "name": "PITDEXnL"}], [{"max": 3, "min": 85, "name": "nlplADUz"}, {"max": 8, "min": 50, "name": "tqDwm4i4"}, {"max": 46, "min": 93, "name": "E60NROKI"}], [{"max": 99, "min": 100, "name": "ns6k9pwM"}, {"max": 88, "min": 16, "name": "P2RDsjij"}, {"max": 64, "min": 72, "name": "mGQREMAo"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 92, "role_flexing_second": 4}, "duration": 24, "max_number": 94, "min_number": 80, "player_max_number": 22, "player_min_number": 86}], "batch_size": 74, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 95, "flex_flat_step_range": 41, "flex_immunity_count": 91, "flex_range_max": 32, "flex_rate_ms": 57, "flex_step_max": 61, "force_authority_match": true, "initial_step_range": 36, "mmr_max": 45, "mmr_mean": 1, "mmr_min": 51, "mmr_std_dev": 22, "override_mmr_data": true, "use_bucket_mmr": false, "use_flat_flex_step": false}, "flexing_rule": [{"attribute": "pzrRwJ63", "criteria": "vK3KFy0l", "duration": 95, "reference": 0.5342509373677659}, {"attribute": "Ry4XA5lb", "criteria": "oDzjvia1", "duration": 32, "reference": 0.1159802994252428}, {"attribute": "cpwGxhhq", "criteria": "yDXwi7xx", "duration": 26, "reference": 0.23584780056649035}], "match_options": {"options": [{"name": "wrvWmCQx", "type": "d3Nu0bv7"}, {"name": "KpUItjsB", "type": "z4Gql7a9"}, {"name": "EYmg4C1Q", "type": "1h8XNZuY"}]}, "matching_rule": [{"attribute": "GlsPNkXF", "criteria": "HGvz4ykj", "reference": 0.33381524957368125}, {"attribute": "xJk51xIy", "criteria": "g5pqp7ET", "reference": 0.10995870176957512}, {"attribute": "YaI7G60X", "criteria": "DyzVth3C", "reference": 0.6258011467013749}], "rebalance_enable": false, "sort_ticket": {"search_result": "dEPFOOkL", "ticket_queue": "6CORLouw"}, "sort_tickets": [{"search_result": "Fb2jB8bM", "threshold": 91, "ticket_queue": "aIFguJS1"}, {"search_result": "LHMYfTTR", "threshold": 1, "ticket_queue": "YnUMJ7pK"}, {"search_result": "7ymaSaNj", "threshold": 46, "ticket_queue": "7Wy1iBzl"}], "sub_game_modes": {"oELe9fOS": {"alliance": {"combination": {"alliances": [[{"max": 81, "min": 65, "name": "xuVXnz5O"}, {"max": 46, "min": 39, "name": "Pw919rM4"}, {"max": 82, "min": 94, "name": "9jvy5f2H"}], [{"max": 19, "min": 23, "name": "l7I24PWD"}, {"max": 20, "min": 99, "name": "yN9BsLIJ"}, {"max": 27, "min": 7, "name": "SqkEzkLD"}], [{"max": 85, "min": 90, "name": "AxBKLCft"}, {"max": 99, "min": 38, "name": "MEWXCtnN"}, {"max": 98, "min": 31, "name": "JvxtYYq9"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 2, "role_flexing_second": 26}, "max_number": 38, "min_number": 60, "player_max_number": 56, "player_min_number": 54}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 67, "min": 39, "name": "zpepMjqA"}, {"max": 98, "min": 43, "name": "0mFYafof"}, {"max": 10, "min": 99, "name": "vHbropJR"}], [{"max": 84, "min": 90, "name": "WduEHFuH"}, {"max": 65, "min": 51, "name": "I13uuMOn"}, {"max": 84, "min": 37, "name": "fyxDHLt7"}], [{"max": 69, "min": 84, "name": "mGIOXqlB"}, {"max": 21, "min": 42, "name": "qjYgWb4k"}, {"max": 51, "min": 39, "name": "oyZeyLUZ"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 58, "role_flexing_second": 51}, "duration": 96, "max_number": 32, "min_number": 24, "player_max_number": 58, "player_min_number": 17}, {"combination": {"alliances": [[{"max": 40, "min": 76, "name": "NGom5DYL"}, {"max": 63, "min": 55, "name": "Asw07cli"}, {"max": 76, "min": 12, "name": "MGX5Rxlc"}], [{"max": 72, "min": 90, "name": "b8u0XXdO"}, {"max": 55, "min": 78, "name": "3Hj4WIGs"}, {"max": 0, "min": 47, "name": "ASuxdltu"}], [{"max": 6, "min": 81, "name": "j9X9SEdy"}, {"max": 11, "min": 40, "name": "g25DBaY8"}, {"max": 20, "min": 76, "name": "ptkCdVLG"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 23, "role_flexing_second": 61}, "duration": 5, "max_number": 49, "min_number": 85, "player_max_number": 9, "player_min_number": 21}, {"combination": {"alliances": [[{"max": 69, "min": 44, "name": "y3wLIHHg"}, {"max": 69, "min": 2, "name": "tqSXl9zm"}, {"max": 26, "min": 87, "name": "uRn0li7M"}], [{"max": 27, "min": 62, "name": "6Lpb6C44"}, {"max": 1, "min": 41, "name": "NDC8OpIz"}, {"max": 8, "min": 56, "name": "tzDBjebL"}], [{"max": 2, "min": 75, "name": "Gu4HieAM"}, {"max": 42, "min": 77, "name": "61WaU0Vj"}, {"max": 56, "min": 34, "name": "Q26KCOfs"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 49, "role_flexing_second": 55}, "duration": 53, "max_number": 83, "min_number": 29, "player_max_number": 87, "player_min_number": 26}], "name": "L5vzfIAB"}, "eTRDza62": {"alliance": {"combination": {"alliances": [[{"max": 30, "min": 23, "name": "PcDW3iRn"}, {"max": 28, "min": 29, "name": "6O39E2lU"}, {"max": 69, "min": 6, "name": "GSzYDyOF"}], [{"max": 42, "min": 29, "name": "MpN1pBIh"}, {"max": 71, "min": 31, "name": "cOAkdDYK"}, {"max": 14, "min": 23, "name": "AyJhjrbF"}], [{"max": 95, "min": 39, "name": "nA3JuvBD"}, {"max": 57, "min": 81, "name": "dPNMJRQK"}, {"max": 95, "min": 28, "name": "KctnS7wI"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 33, "role_flexing_second": 38}, "max_number": 11, "min_number": 20, "player_max_number": 48, "player_min_number": 28}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 9, "min": 37, "name": "Pl1MfSoG"}, {"max": 47, "min": 46, "name": "52nOoqDY"}, {"max": 2, "min": 9, "name": "3syhyP6R"}], [{"max": 35, "min": 58, "name": "OM3d6MxH"}, {"max": 99, "min": 56, "name": "nPJ2Hn7z"}, {"max": 29, "min": 3, "name": "eNx22d57"}], [{"max": 1, "min": 60, "name": "FkYn6PLb"}, {"max": 80, "min": 35, "name": "eKKy2T4h"}, {"max": 52, "min": 39, "name": "2jULrNiX"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 83, "role_flexing_second": 53}, "duration": 69, "max_number": 41, "min_number": 21, "player_max_number": 21, "player_min_number": 30}, {"combination": {"alliances": [[{"max": 25, "min": 42, "name": "IYesXC8u"}, {"max": 34, "min": 33, "name": "vAtl4CwD"}, {"max": 68, "min": 9, "name": "xPlDkQqk"}], [{"max": 92, "min": 82, "name": "NACl4jYW"}, {"max": 83, "min": 81, "name": "0ydZ2Ocj"}, {"max": 97, "min": 30, "name": "3NLjbAxO"}], [{"max": 30, "min": 73, "name": "NNnHQk23"}, {"max": 33, "min": 19, "name": "39p2Ryvj"}, {"max": 57, "min": 20, "name": "SphYkO4v"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 8, "role_flexing_second": 77}, "duration": 17, "max_number": 57, "min_number": 21, "player_max_number": 57, "player_min_number": 21}, {"combination": {"alliances": [[{"max": 89, "min": 61, "name": "mycEPG0Y"}, {"max": 45, "min": 8, "name": "Ma5X03h1"}, {"max": 18, "min": 57, "name": "1oHgU1jC"}], [{"max": 76, "min": 95, "name": "1DlzeVMp"}, {"max": 41, "min": 77, "name": "QP7TiqRi"}, {"max": 54, "min": 62, "name": "7zlKDnL5"}], [{"max": 95, "min": 8, "name": "41YmVwNL"}, {"max": 58, "min": 58, "name": "n24ky5Nl"}, {"max": 78, "min": 95, "name": "rNGHyslP"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 66, "role_flexing_second": 30}, "duration": 79, "max_number": 91, "min_number": 41, "player_max_number": 97, "player_min_number": 27}], "name": "lr32eMpR"}, "Eyfhe3qN": {"alliance": {"combination": {"alliances": [[{"max": 24, "min": 84, "name": "lDzglQqF"}, {"max": 28, "min": 66, "name": "Z9zZYVNH"}, {"max": 26, "min": 28, "name": "Gk48w0TD"}], [{"max": 5, "min": 12, "name": "SBSaVjwL"}, {"max": 97, "min": 54, "name": "C62R9gwJ"}, {"max": 44, "min": 12, "name": "oVZQGYZG"}], [{"max": 69, "min": 56, "name": "8jGkC7nf"}, {"max": 41, "min": 89, "name": "jMCEPxwa"}, {"max": 33, "min": 10, "name": "3ala1fhN"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 100, "role_flexing_second": 91}, "max_number": 79, "min_number": 40, "player_max_number": 76, "player_min_number": 79}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 91, "min": 24, "name": "1WO7a1j6"}, {"max": 3, "min": 73, "name": "b1SiKGsV"}, {"max": 53, "min": 43, "name": "lb87sQBm"}], [{"max": 76, "min": 38, "name": "hUwjN8OH"}, {"max": 7, "min": 56, "name": "yqV8qKTf"}, {"max": 91, "min": 47, "name": "6yUcn9oO"}], [{"max": 59, "min": 19, "name": "GvZEGbZQ"}, {"max": 86, "min": 36, "name": "ve7CJx7A"}, {"max": 100, "min": 91, "name": "AJRY6eae"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 21, "role_flexing_second": 80}, "duration": 87, "max_number": 21, "min_number": 99, "player_max_number": 8, "player_min_number": 60}, {"combination": {"alliances": [[{"max": 27, "min": 10, "name": "3YIwG6yF"}, {"max": 19, "min": 19, "name": "9Abqwep8"}, {"max": 60, "min": 90, "name": "eXoeVCIh"}], [{"max": 56, "min": 58, "name": "VaWfBI6R"}, {"max": 20, "min": 76, "name": "qZsScHLN"}, {"max": 48, "min": 74, "name": "1yZqebPM"}], [{"max": 43, "min": 51, "name": "HnZLEDPu"}, {"max": 47, "min": 8, "name": "kRhep6WW"}, {"max": 57, "min": 50, "name": "PyWpu0xW"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 18, "role_flexing_second": 96}, "duration": 89, "max_number": 82, "min_number": 68, "player_max_number": 95, "player_min_number": 76}, {"combination": {"alliances": [[{"max": 77, "min": 9, "name": "Qu5LD6fn"}, {"max": 60, "min": 97, "name": "xdFlVEZw"}, {"max": 20, "min": 8, "name": "Jgz7QDtH"}], [{"max": 20, "min": 21, "name": "XwzsLw9A"}, {"max": 29, "min": 86, "name": "s6KQFHiv"}, {"max": 75, "min": 84, "name": "vTbIUvTR"}], [{"max": 66, "min": 22, "name": "MQz2KFm4"}, {"max": 92, "min": 53, "name": "0FPjJYxR"}, {"max": 16, "min": 27, "name": "4FXpghfY"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 9, "role_flexing_second": 69}, "duration": 55, "max_number": 90, "min_number": 27, "player_max_number": 7, "player_min_number": 73}], "name": "s3Pz54KZ"}}, "ticket_flexing_selection": "a07FfMVO", "ticket_flexing_selections": [{"selection": "PPZYBh9b", "threshold": 71}, {"selection": "ddQ76SPI", "threshold": 1}, {"selection": "npzbWWDj", "threshold": 42}], "use_newest_ticket_for_flexing": true}, "session_queue_timeout_seconds": 78, "social_matchmaking": true, "sub_gamemode_selection": "ticketOrder", "ticket_observability_enable": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName '4lZzntg9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'V2trkK30' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "P7XZ7iQ3", "players": [{"results": [{"attribute": "siSZ0R6W", "value": 0.24353511644469494}, {"attribute": "LWgR7o4o", "value": 0.8644449421888766}, {"attribute": "qBCzOV6b", "value": 0.7690015204613768}], "user_id": "vc0CA5dD"}, {"results": [{"attribute": "SKiFXRt3", "value": 0.35212789776582876}, {"attribute": "TjszoWjj", "value": 0.316353753967457}, {"attribute": "1s5Tedav", "value": 0.30179514891642434}], "user_id": "MLNJHBu6"}, {"results": [{"attribute": "mVaJYbjZ", "value": 0.9435007485109778}, {"attribute": "sRo6tEbd", "value": 0.8501987196146958}, {"attribute": "EeebO9Th", "value": 0.7491143997055264}], "user_id": "SLseoXLG"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "T5dEU55c"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "tYXTwdBw", "client_version": "z0pPMkOG", "deployment": "PxQLc7HA", "error_code": 83, "error_message": "TZsPBGhW", "game_mode": "uHzzkYud", "is_mock": "5kCcDwUH", "joinable": true, "match_id": "mFdtdPJg", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 83, "party_attributes": {"vp5YcOYD": {}, "Ivr44pAI": {}, "J286sk2W": {}}, "party_id": "3vYAMbiB", "party_members": [{"extra_attributes": {"xBDynFnJ": {}, "f3eMV4pi": {}, "n0B0Q9Nz": {}}, "user_id": "1M4tLwUG"}, {"extra_attributes": {"J2xowPG0": {}, "4vtL3Lpd": {}, "DWVcNQ15": {}}, "user_id": "8Kj30lBe"}, {"extra_attributes": {"Bsi8ngga": {}, "K9418553": {}, "lLZ5er1W": {}}, "user_id": "6GQOtHVN"}], "ticket_created_at": 68, "ticket_id": "CmRGchZg"}, {"first_ticket_created_at": 96, "party_attributes": {"kZfe5jJs": {}, "jikjZ6EW": {}, "fd1U8mKF": {}}, "party_id": "K41Mm7O6", "party_members": [{"extra_attributes": {"hiAFwLGE": {}, "kHaldg4L": {}, "1iW2P4UA": {}}, "user_id": "ZVMy6vni"}, {"extra_attributes": {"BZC8ArQx": {}, "0NqL1Xxt": {}, "e2UJwzvw": {}}, "user_id": "RyaPDJJA"}, {"extra_attributes": {"CeAio5vL": {}, "8HZzdSDq": {}, "0MFFTcWF": {}}, "user_id": "L1ZCzf0Y"}], "ticket_created_at": 30, "ticket_id": "XE5MpNXs"}, {"first_ticket_created_at": 53, "party_attributes": {"9INJJoiV": {}, "YCGfGCi8": {}, "uuVIfRyu": {}}, "party_id": "h9DQTYO7", "party_members": [{"extra_attributes": {"0NxOhbKt": {}, "9oxZDwBp": {}, "6VQalhSg": {}}, "user_id": "lsWjZxxC"}, {"extra_attributes": {"pudDFGR3": {}, "bNcTQroh": {}, "9yo0ylPl": {}}, "user_id": "Zw4Mt9D5"}, {"extra_attributes": {"iXLZx8gd": {}, "mXE4qrFI": {}, "s2PMZjvq": {}}, "user_id": "5PZ2pJ6X"}], "ticket_created_at": 26, "ticket_id": "UDfskrvp"}]}, {"matching_parties": [{"first_ticket_created_at": 28, "party_attributes": {"B6xkZvck": {}, "7y25jYID": {}, "levah7lh": {}}, "party_id": "QCCQ8GnY", "party_members": [{"extra_attributes": {"yYYXPIxS": {}, "NXOz973V": {}, "xLcA0BOp": {}}, "user_id": "OJOLfyJR"}, {"extra_attributes": {"Ficy3pgJ": {}, "QV2F3Gzy": {}, "oJO40m8d": {}}, "user_id": "So61vVeE"}, {"extra_attributes": {"16BqCWyG": {}, "8LAWYCqk": {}, "SVOmATIS": {}}, "user_id": "Q1fKfTWC"}], "ticket_created_at": 77, "ticket_id": "T3ZOy5cl"}, {"first_ticket_created_at": 37, "party_attributes": {"BoFbjdDz": {}, "lEHCHFeB": {}, "6lWpsetU": {}}, "party_id": "V9u9kInk", "party_members": [{"extra_attributes": {"Des7Uo0Z": {}, "mo3veXws": {}, "0C265gSZ": {}}, "user_id": "rSknxvwo"}, {"extra_attributes": {"XLtPL5gA": {}, "PIxEXWyi": {}, "2sNn48Bk": {}}, "user_id": "6ZQnC5zY"}, {"extra_attributes": {"ykYR6vI0": {}, "RuREToDO": {}, "FaiUe1F1": {}}, "user_id": "AOj5PjQ4"}], "ticket_created_at": 55, "ticket_id": "j2TxT0l8"}, {"first_ticket_created_at": 81, "party_attributes": {"E8ukC3Qv": {}, "ZcFbmam2": {}, "OSadQeuj": {}}, "party_id": "omKKXvWL", "party_members": [{"extra_attributes": {"uaoxx4nB": {}, "LdAiY9l2": {}, "wmfxCzXu": {}}, "user_id": "gOkGmd8P"}, {"extra_attributes": {"BszpOOus": {}, "bhK3b6XD": {}, "kgRge41J": {}}, "user_id": "5bvs9SBC"}, {"extra_attributes": {"SxuU50r7": {}, "wYgvEX9d": {}, "sFOFCmSz": {}}, "user_id": "KJhOF2Ty"}], "ticket_created_at": 25, "ticket_id": "oJp7KSu6"}]}, {"matching_parties": [{"first_ticket_created_at": 26, "party_attributes": {"eeW5lN6E": {}, "nD51v0r6": {}, "cYr0byOU": {}}, "party_id": "ucwwp4nt", "party_members": [{"extra_attributes": {"ym4SJ3BU": {}, "pcD2elhA": {}, "VoMEwiLI": {}}, "user_id": "0CyqOuAt"}, {"extra_attributes": {"46AV3fch": {}, "ED6AzOuJ": {}, "y1ihCXfL": {}}, "user_id": "ndfOqEzx"}, {"extra_attributes": {"WbzRQqt7": {}, "1UjoPIlX": {}, "9IxLucpS": {}}, "user_id": "DV4Tphrw"}], "ticket_created_at": 48, "ticket_id": "9JdT9vzZ"}, {"first_ticket_created_at": 65, "party_attributes": {"xV1Mt8Ob": {}, "28q0ybW1": {}, "OSI9N0d4": {}}, "party_id": "8wNR99Fo", "party_members": [{"extra_attributes": {"JMLKMRUB": {}, "myzntPiT": {}, "mywsXM7K": {}}, "user_id": "4PmCPIVl"}, {"extra_attributes": {"Ka17Nl3R": {}, "czw0XBxX": {}, "zVijIlCq": {}}, "user_id": "AUlDTmCC"}, {"extra_attributes": {"GpLabr5z": {}, "xvorV5kY": {}, "HPUKdDNc": {}}, "user_id": "PDTH4VjD"}], "ticket_created_at": 36, "ticket_id": "4JZadfn2"}, {"first_ticket_created_at": 99, "party_attributes": {"sl7WRshK": {}, "pXyXpPn2": {}, "iPKIl4rs": {}}, "party_id": "9La664W3", "party_members": [{"extra_attributes": {"tKrS8iF9": {}, "7wU3SsuZ": {}, "6Onvtt1K": {}}, "user_id": "TBvTShIT"}, {"extra_attributes": {"kIunlKFJ": {}, "WTNYCne6": {}, "IQq32zrm": {}}, "user_id": "g8JTV6KJ"}, {"extra_attributes": {"43l073SR": {}, "RCLaGffl": {}, "tweySC9g": {}}, "user_id": "WMmHV5Rk"}], "ticket_created_at": 98, "ticket_id": "VtAaQi3d"}]}], "namespace": "8VZUAUIX", "party_attributes": {"K8zcM50K": {}, "lLYWCzQf": {}, "FkypY1ll": {}}, "party_id": "GnPYuJlx", "queued_at": 46, "region": "9KKgRjCo", "server_name": "OzDmRpIi", "status": "lnGSaeK1", "ticket_id": "wjBZV50V", "ticket_ids": ["jGqwpGDF", "sRT52crl", "ezVIwK6J"], "updated_at": "1986-03-21T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "Pt1JgCLS"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'QeMWJIYM' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 37, "userID": "DVOOPiEn", "weight": 0.9879610211012191}' \
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
    --matchIDs '4OusJY54' \
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
    --strategy 'SO8IgjVB' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'MniHdED7' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'B7rMSdDK' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatch", "deployment": "xLey8VYC", "description": "E5LaNlds", "findMatchTimeoutSeconds": 55, "joinable": true, "max_delay_ms": 71, "region_expansion_range_ms": 100, "region_expansion_rate_ms": 20, "region_latency_initial_range_ms": 43, "region_latency_max_ms": 38, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 55, "min": 90, "name": "Ijfggieq"}, {"max": 60, "min": 7, "name": "pHNH99F2"}, {"max": 4, "min": 8, "name": "V7PzI6zz"}], [{"max": 89, "min": 59, "name": "4Yub692U"}, {"max": 57, "min": 28, "name": "Z6nHfrGK"}, {"max": 33, "min": 27, "name": "xU4WUZjW"}], [{"max": 33, "min": 22, "name": "uLTrdK8j"}, {"max": 41, "min": 77, "name": "FlBhmZX9"}, {"max": 68, "min": 51, "name": "iZfICiIr"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 33, "role_flexing_second": 80}, "maxNumber": 17, "minNumber": 21, "playerMaxNumber": 100, "playerMinNumber": 88}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 54, "min": 59, "name": "bVgVMgyy"}, {"max": 3, "min": 35, "name": "gq3Q4AvX"}, {"max": 48, "min": 4, "name": "uYG6FrjD"}], [{"max": 65, "min": 49, "name": "afx6Gut9"}, {"max": 4, "min": 50, "name": "hyWn3J0l"}, {"max": 8, "min": 53, "name": "MQH7JaRX"}], [{"max": 79, "min": 92, "name": "bnsK0hsJ"}, {"max": 94, "min": 36, "name": "OTeNib4p"}, {"max": 66, "min": 67, "name": "xH9wEDf3"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 95, "role_flexing_second": 88}, "duration": 40, "max_number": 9, "min_number": 43, "player_max_number": 53, "player_min_number": 67}, {"combination": {"alliances": [[{"max": 23, "min": 87, "name": "0C14LztH"}, {"max": 38, "min": 35, "name": "hVaowOZr"}, {"max": 7, "min": 39, "name": "to6GEPep"}], [{"max": 64, "min": 67, "name": "RJCT2Soj"}, {"max": 30, "min": 16, "name": "mBcIX0tG"}, {"max": 16, "min": 77, "name": "V9KtQUYD"}], [{"max": 74, "min": 33, "name": "45c9qMoN"}, {"max": 65, "min": 44, "name": "ZTTatYKb"}, {"max": 74, "min": 57, "name": "ghHYuuzu"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 53, "role_flexing_second": 95}, "duration": 30, "max_number": 47, "min_number": 52, "player_max_number": 95, "player_min_number": 32}, {"combination": {"alliances": [[{"max": 56, "min": 59, "name": "ytJCWnf5"}, {"max": 21, "min": 65, "name": "AZsEkPdw"}, {"max": 4, "min": 26, "name": "8tw0fc7v"}], [{"max": 20, "min": 61, "name": "yYmKTCnH"}, {"max": 82, "min": 100, "name": "riqNQStc"}, {"max": 31, "min": 89, "name": "afRDGvb4"}], [{"max": 43, "min": 60, "name": "9hwxkDYW"}, {"max": 61, "min": 69, "name": "ZCkT6bEI"}, {"max": 86, "min": 62, "name": "RNsh7Gyx"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 53, "role_flexing_second": 27}, "duration": 89, "max_number": 34, "min_number": 61, "player_max_number": 40, "player_min_number": 97}], "batch_size": 100, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 99, "flex_flat_step_range": 34, "flex_immunity_count": 13, "flex_range_max": 87, "flex_rate_ms": 93, "flex_step_max": 47, "force_authority_match": true, "initial_step_range": 87, "mmr_max": 80, "mmr_mean": 11, "mmr_min": 44, "mmr_std_dev": 95, "override_mmr_data": false, "use_bucket_mmr": false, "use_flat_flex_step": false}, "flexingRules": [{"attribute": "R1sj5TS5", "criteria": "cJexsTai", "duration": 56, "reference": 0.3562765325618893}, {"attribute": "bEUXiKGp", "criteria": "LAFMqUPG", "duration": 17, "reference": 0.2722486227617572}, {"attribute": "TbjSHVQO", "criteria": "s94vG4rx", "duration": 61, "reference": 0.9605515629760858}], "match_options": {"options": [{"name": "iHIp6v2B", "type": "hR7VJItr"}, {"name": "udkkJb5j", "type": "3xMgiQgp"}, {"name": "XHWSqc7I", "type": "Kv6SUDcw"}]}, "matchingRules": [{"attribute": "3KFhO9we", "criteria": "IdRHXj3k", "reference": 0.8992405906277878}, {"attribute": "w4BvhKVm", "criteria": "LWivu8ee", "reference": 0.8940120160767239}, {"attribute": "u0wfQIfs", "criteria": "jLbjSKBm", "reference": 0.3306547804037646}], "sort_ticket": {"search_result": "KU5JsxCR", "ticket_queue": "ggAHJmZp"}, "sort_tickets": [{"search_result": "ssnTVPtG", "threshold": 46, "ticket_queue": "rMrs3ZJe"}, {"search_result": "C8m6dVXJ", "threshold": 24, "ticket_queue": "ylO8BuIU"}, {"search_result": "qFlhTV3C", "threshold": 67, "ticket_queue": "JKMfyMdu"}], "sub_game_modes": {}, "ticket_flexing_selection": "rY5Et3m9", "ticket_flexing_selections": [{"selection": "eBgE5V2R", "threshold": 37}, {"selection": "uGeE7QPb", "threshold": 64}, {"selection": "iMzs71Pe", "threshold": 71}], "use_newest_ticket_for_flexing": true}, "sessionQueueTimeoutSeconds": 44, "socialMatchmaking": true, "sub_gamemode_selection": "random", "ticket_observability_enable": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName '3dqd9zPU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName '36kyjIBy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName 'RXeCoCyI' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 43}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName 'ERNf180q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName '2WzGyH6P' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "VoH109aU", "count": 53, "mmrMax": 0.208960597108392, "mmrMean": 0.30205283666905003, "mmrMin": 0.9812181154513154, "mmrStdDev": 0.3818775914674344}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'IwWN1Feb' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 71, "party_attributes": {"BpPQOLXw": {}, "JueRPhsb": {}, "iBfObY35": {}}, "party_id": "I3JWoZu1", "party_members": [{"extra_attributes": {"xcwoZzQW": {}, "9TvLH7uA": {}, "4HnEUYv3": {}}, "user_id": "rtJ7mdQJ"}, {"extra_attributes": {"n7D4dTj5": {}, "eAi7gbes": {}, "1PJApA27": {}}, "user_id": "YL4A6uhF"}, {"extra_attributes": {"GuQlWnTl": {}, "KEyJwSdq": {}, "FF6T55AQ": {}}, "user_id": "TaPHBaEV"}], "ticket_created_at": 59, "ticket_id": "HN9YnPYD"}, {"first_ticket_created_at": 80, "party_attributes": {"bKAVbg5R": {}, "NybCU6vY": {}, "Ak149mA8": {}}, "party_id": "3272ut3x", "party_members": [{"extra_attributes": {"zTDn1Uas": {}, "iDHselQV": {}, "wZgZ9E30": {}}, "user_id": "NdxKdkSr"}, {"extra_attributes": {"9lKplWwz": {}, "LdW8tcI5": {}, "FOSU44bi": {}}, "user_id": "roF4uJ92"}, {"extra_attributes": {"FYc0Abfn": {}, "u9iTr9iI": {}, "CAyHBeZQ": {}}, "user_id": "tIEIUOsk"}], "ticket_created_at": 33, "ticket_id": "pcsZ2Z03"}, {"first_ticket_created_at": 63, "party_attributes": {"fYRlTn5f": {}, "IswDFQ4p": {}, "3paQeyIN": {}}, "party_id": "CZY5NBqG", "party_members": [{"extra_attributes": {"sqzx9tQ3": {}, "xiettxSz": {}, "TTjywrhN": {}}, "user_id": "qne4lcOB"}, {"extra_attributes": {"eOKy078x": {}, "Bq3VcMPp": {}, "aZ7XgIce": {}}, "user_id": "Xl1BlUYF"}, {"extra_attributes": {"H6f9vydN": {}, "cJtqjGl4": {}, "mpxg5jXl": {}}, "user_id": "3hwXLA88"}], "ticket_created_at": 9, "ticket_id": "97hw83Vg"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName 'Eg3z6l6p' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 61}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName '0INQ3IJy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName '927Skwx4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'ogx1tnUR' \
    --matchID 'bk3l3yRy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["AXK2QOL1", "tDr8hcGp", "UB3shTsf"], "party_id": "oih0Pxy5", "user_id": "sKKG0G2g"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'GVeT8HCk' \
    --matchID 'OAFf3Y5Q' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'yMdOXwtq' \
    --matchID 'uYg4OPy7' \
    --namespace "$AB_NAMESPACE" \
    --userID 'DY1Wffq2' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName 'YJ8EvS6z' \
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
    --channelName 'a2nxtlyt' \
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