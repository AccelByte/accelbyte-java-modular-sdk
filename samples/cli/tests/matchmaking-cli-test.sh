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
    --limit '43' \
    --offset '70' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatchOnDifferentTeam", "deployment": "uAehSbMp", "description": "tPLYS0HH", "find_match_timeout_seconds": 0, "game_mode": "FdlDHcKh", "joinable": false, "max_delay_ms": 1, "region_expansion_range_ms": 5, "region_expansion_rate_ms": 49, "region_latency_initial_range_ms": 21, "region_latency_max_ms": 84, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 62, "min": 81, "name": "brjqiSuW"}, {"max": 72, "min": 63, "name": "26DJeRAe"}, {"max": 58, "min": 81, "name": "bf1Vabi8"}], [{"max": 30, "min": 83, "name": "hGqJJZaX"}, {"max": 52, "min": 20, "name": "HlM7AaaH"}, {"max": 63, "min": 61, "name": "DmC0RFeo"}], [{"max": 55, "min": 48, "name": "AkIr6q0K"}, {"max": 10, "min": 44, "name": "PCtX2I1s"}, {"max": 39, "min": 30, "name": "zKLMNfXR"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 50, "role_flexing_second": 3}, "max_number": 17, "min_number": 71, "player_max_number": 90, "player_min_number": 75}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 59, "min": 70, "name": "bTtA7cAJ"}, {"max": 54, "min": 37, "name": "LPMefoNy"}, {"max": 62, "min": 1, "name": "jgKl1Bh3"}], [{"max": 30, "min": 91, "name": "Eh1iJnpV"}, {"max": 58, "min": 10, "name": "6jJ4S4wm"}, {"max": 32, "min": 3, "name": "feW95cz3"}], [{"max": 5, "min": 34, "name": "E02npczU"}, {"max": 92, "min": 79, "name": "nzb1zNdE"}, {"max": 52, "min": 99, "name": "HiSph3jj"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 86, "role_flexing_second": 28}, "duration": 3, "max_number": 25, "min_number": 58, "player_max_number": 73, "player_min_number": 74}, {"combination": {"alliances": [[{"max": 22, "min": 62, "name": "HkvHxBjS"}, {"max": 84, "min": 58, "name": "ak8WFfRI"}, {"max": 4, "min": 48, "name": "SNWnXbpR"}], [{"max": 91, "min": 5, "name": "OeTbv8ho"}, {"max": 32, "min": 22, "name": "88fdmhx2"}, {"max": 34, "min": 99, "name": "F3BtkFbe"}], [{"max": 5, "min": 34, "name": "t6oymyon"}, {"max": 78, "min": 50, "name": "QvLQjRAD"}, {"max": 99, "min": 6, "name": "ibYcG7k6"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 17, "role_flexing_second": 9}, "duration": 96, "max_number": 93, "min_number": 80, "player_max_number": 54, "player_min_number": 90}, {"combination": {"alliances": [[{"max": 95, "min": 27, "name": "bVe1AXxv"}, {"max": 56, "min": 84, "name": "jqULxOc5"}, {"max": 5, "min": 72, "name": "YAhuq9ph"}], [{"max": 96, "min": 83, "name": "PCLZIw5T"}, {"max": 65, "min": 20, "name": "RDDXkCHV"}, {"max": 78, "min": 94, "name": "kGLYvid6"}], [{"max": 45, "min": 64, "name": "Ntvi9EO4"}, {"max": 100, "min": 57, "name": "1KZP2qRg"}, {"max": 30, "min": 2, "name": "LEGyFjWt"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 58, "role_flexing_second": 90}, "duration": 97, "max_number": 75, "min_number": 20, "player_max_number": 62, "player_min_number": 63}], "batch_size": 40, "bucket_mmr_rule": {"disable_authority": true, "flex_authority_count": 4, "flex_flat_step_range": 37, "flex_immunity_count": 82, "flex_range_max": 39, "flex_rate_ms": 37, "flex_step_max": 93, "force_authority_match": false, "initial_step_range": 56, "mmr_max": 72, "mmr_mean": 2, "mmr_min": 100, "mmr_std_dev": 91, "override_mmr_data": true, "use_bucket_mmr": false, "use_flat_flex_step": false}, "flexing_rule": [{"attribute": "GUWi1U90", "criteria": "CB4NcEE7", "duration": 36, "reference": 0.5548144086517293}, {"attribute": "FlSPBZuo", "criteria": "hEi7cfRC", "duration": 51, "reference": 0.4322478621990614}, {"attribute": "E5GD6lWK", "criteria": "V973IeSB", "duration": 34, "reference": 0.9357282905669815}], "match_options": {"options": [{"name": "r8qvaO6B", "type": "HcxjhVeh"}, {"name": "A1xjOLA9", "type": "HrV86hCX"}, {"name": "K6ca6uGz", "type": "mdWzuT8P"}]}, "matching_rule": [{"attribute": "flKVImgH", "criteria": "5062rrlE", "reference": 0.5944039158315326}, {"attribute": "fLAxBc1y", "criteria": "bemK3j4L", "reference": 0.3762963523039706}, {"attribute": "QVU4gzBo", "criteria": "NluSER6n", "reference": 0.884139987377485}], "rebalance_enable": false, "sort_ticket": {"search_result": "none", "ticket_queue": "oldestTicketAge"}, "sort_tickets": [{"search_result": "random", "threshold": 5, "ticket_queue": "oldestTicketAge"}, {"search_result": "oldestTicketAge", "threshold": 54, "ticket_queue": "distance"}, {"search_result": "none", "threshold": 71, "ticket_queue": "distance"}], "sub_game_modes": {"K0j1x7Si": {"alliance": {"combination": {"alliances": [[{"max": 6, "min": 21, "name": "pWkTq8XD"}, {"max": 98, "min": 69, "name": "fzhgXpwZ"}, {"max": 46, "min": 8, "name": "SMPayG2H"}], [{"max": 0, "min": 47, "name": "K68iUw1x"}, {"max": 98, "min": 85, "name": "BhrB4CY5"}, {"max": 78, "min": 91, "name": "VmwvENUY"}], [{"max": 73, "min": 73, "name": "8UB0ts6O"}, {"max": 60, "min": 95, "name": "jimkWwZV"}, {"max": 47, "min": 87, "name": "kPHWzPgj"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 95, "role_flexing_second": 23}, "max_number": 39, "min_number": 72, "player_max_number": 9, "player_min_number": 33}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 16, "min": 18, "name": "futyNavp"}, {"max": 94, "min": 9, "name": "7LBvlBd1"}, {"max": 4, "min": 47, "name": "RdhxAp40"}], [{"max": 64, "min": 100, "name": "f4xbCyMt"}, {"max": 61, "min": 18, "name": "R0UoGRQZ"}, {"max": 81, "min": 39, "name": "W6F1dYgQ"}], [{"max": 39, "min": 76, "name": "PgFWkB4M"}, {"max": 96, "min": 78, "name": "rk3rtSIh"}, {"max": 28, "min": 99, "name": "t1JoPRju"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 69, "role_flexing_second": 40}, "duration": 12, "max_number": 72, "min_number": 93, "player_max_number": 34, "player_min_number": 22}, {"combination": {"alliances": [[{"max": 80, "min": 5, "name": "44enKuKe"}, {"max": 5, "min": 80, "name": "v9zX96Ml"}, {"max": 45, "min": 3, "name": "8qPPes0b"}], [{"max": 100, "min": 73, "name": "avgBVW1Q"}, {"max": 91, "min": 79, "name": "7jaVy3Ww"}, {"max": 20, "min": 14, "name": "mSf5Jo2b"}], [{"max": 73, "min": 51, "name": "cfRPZ1bt"}, {"max": 15, "min": 83, "name": "2WgdQ2Mt"}, {"max": 85, "min": 2, "name": "xffJjjjw"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 100, "role_flexing_second": 13}, "duration": 60, "max_number": 96, "min_number": 81, "player_max_number": 98, "player_min_number": 54}, {"combination": {"alliances": [[{"max": 12, "min": 54, "name": "MHcIAWNl"}, {"max": 80, "min": 66, "name": "T8wzkeGy"}, {"max": 70, "min": 82, "name": "XERyB7wp"}], [{"max": 17, "min": 6, "name": "yqYmEESa"}, {"max": 83, "min": 59, "name": "2KpH0zLo"}, {"max": 52, "min": 76, "name": "YfrTac6F"}], [{"max": 44, "min": 35, "name": "msI2JW0e"}, {"max": 38, "min": 32, "name": "QOqcE6Ls"}, {"max": 19, "min": 19, "name": "WYdohK3h"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 60, "role_flexing_second": 45}, "duration": 36, "max_number": 67, "min_number": 78, "player_max_number": 23, "player_min_number": 95}], "name": "zWMI4kF3"}, "EfiO03Lc": {"alliance": {"combination": {"alliances": [[{"max": 61, "min": 89, "name": "mYi1E1nK"}, {"max": 69, "min": 75, "name": "AqehoU7c"}, {"max": 20, "min": 6, "name": "URvWdKDr"}], [{"max": 43, "min": 38, "name": "vX8kg58y"}, {"max": 84, "min": 11, "name": "APVNOt0z"}, {"max": 48, "min": 63, "name": "ZElOKm03"}], [{"max": 6, "min": 82, "name": "PjhqstXc"}, {"max": 69, "min": 74, "name": "NdSdHXJy"}, {"max": 51, "min": 13, "name": "0V4dOQhf"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 82, "role_flexing_second": 17}, "max_number": 40, "min_number": 76, "player_max_number": 76, "player_min_number": 64}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 52, "min": 0, "name": "b8oLrHBU"}, {"max": 80, "min": 46, "name": "9HxBJNCj"}, {"max": 46, "min": 51, "name": "uL3NvQuN"}], [{"max": 44, "min": 99, "name": "qm4ZfKL7"}, {"max": 45, "min": 78, "name": "UAziuFZ4"}, {"max": 3, "min": 40, "name": "6oHeAv0e"}], [{"max": 22, "min": 10, "name": "yntcCJG9"}, {"max": 4, "min": 40, "name": "kIlQKVuB"}, {"max": 7, "min": 1, "name": "opJsXWNF"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 33, "role_flexing_second": 40}, "duration": 18, "max_number": 44, "min_number": 71, "player_max_number": 100, "player_min_number": 5}, {"combination": {"alliances": [[{"max": 83, "min": 6, "name": "DPcmRetm"}, {"max": 2, "min": 13, "name": "YwzS1jW0"}, {"max": 85, "min": 71, "name": "2uD5zFQv"}], [{"max": 64, "min": 36, "name": "noiOLLi4"}, {"max": 5, "min": 55, "name": "bhHkyAmq"}, {"max": 55, "min": 20, "name": "L8FlBLzY"}], [{"max": 31, "min": 21, "name": "UErpmsbE"}, {"max": 93, "min": 14, "name": "pVaNUBbd"}, {"max": 44, "min": 21, "name": "rWOwSBJ3"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 80, "role_flexing_second": 58}, "duration": 26, "max_number": 23, "min_number": 42, "player_max_number": 71, "player_min_number": 4}, {"combination": {"alliances": [[{"max": 22, "min": 28, "name": "JQh9Gegg"}, {"max": 83, "min": 5, "name": "vuw96b3I"}, {"max": 56, "min": 82, "name": "FaDjGSHd"}], [{"max": 24, "min": 70, "name": "GYsmfsWV"}, {"max": 41, "min": 73, "name": "JsxnZX6x"}, {"max": 50, "min": 51, "name": "8BTWCvIw"}], [{"max": 65, "min": 80, "name": "ttiYcrKI"}, {"max": 19, "min": 9, "name": "0b0OtO72"}, {"max": 3, "min": 99, "name": "lxywOXm1"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 57, "role_flexing_second": 57}, "duration": 20, "max_number": 70, "min_number": 54, "player_max_number": 3, "player_min_number": 35}], "name": "dfN3JjUY"}, "9FYolTbY": {"alliance": {"combination": {"alliances": [[{"max": 81, "min": 26, "name": "bhOYzOJb"}, {"max": 82, "min": 62, "name": "Q4iSPJE4"}, {"max": 72, "min": 37, "name": "dioVGX9L"}], [{"max": 93, "min": 51, "name": "VTpUTIvu"}, {"max": 13, "min": 68, "name": "8N18ebcD"}, {"max": 63, "min": 28, "name": "SwuVOoaL"}], [{"max": 0, "min": 89, "name": "MBv8VUZW"}, {"max": 28, "min": 8, "name": "FvmMgriv"}, {"max": 64, "min": 38, "name": "AemWtKHY"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 69, "role_flexing_second": 38}, "max_number": 32, "min_number": 2, "player_max_number": 48, "player_min_number": 94}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 87, "min": 73, "name": "JAdHthzv"}, {"max": 24, "min": 71, "name": "64bH5BZN"}, {"max": 53, "min": 22, "name": "mNv7yUn8"}], [{"max": 100, "min": 32, "name": "QmZXFQzq"}, {"max": 94, "min": 55, "name": "HlfRkpXC"}, {"max": 15, "min": 98, "name": "bIRW2caM"}], [{"max": 87, "min": 82, "name": "jhmvkvYL"}, {"max": 8, "min": 52, "name": "rOquw1lz"}, {"max": 35, "min": 22, "name": "fPgBHy28"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 100, "role_flexing_second": 16}, "duration": 92, "max_number": 88, "min_number": 0, "player_max_number": 27, "player_min_number": 8}, {"combination": {"alliances": [[{"max": 44, "min": 87, "name": "fJmgOMiO"}, {"max": 68, "min": 45, "name": "n2TistrQ"}, {"max": 60, "min": 67, "name": "99ny3jTj"}], [{"max": 20, "min": 31, "name": "RlK3M8cC"}, {"max": 8, "min": 80, "name": "CJOtZyhC"}, {"max": 46, "min": 100, "name": "JmyOsQSS"}], [{"max": 44, "min": 67, "name": "o0c0KEkk"}, {"max": 13, "min": 37, "name": "xSfv9zDj"}, {"max": 83, "min": 82, "name": "rwdmG2LD"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 23, "role_flexing_second": 66}, "duration": 85, "max_number": 3, "min_number": 71, "player_max_number": 19, "player_min_number": 59}, {"combination": {"alliances": [[{"max": 12, "min": 89, "name": "ZGGUPLNG"}, {"max": 70, "min": 10, "name": "2SjrmMFA"}, {"max": 15, "min": 59, "name": "Px9ei3La"}], [{"max": 92, "min": 33, "name": "Knrl93yf"}, {"max": 81, "min": 46, "name": "Dy71XZR3"}, {"max": 47, "min": 82, "name": "SBWGtAZE"}], [{"max": 25, "min": 74, "name": "TpjvtKjK"}, {"max": 89, "min": 73, "name": "EzZ58o5V"}, {"max": 91, "min": 7, "name": "BNnJ0Aeo"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 67, "role_flexing_second": 67}, "duration": 83, "max_number": 43, "min_number": 90, "player_max_number": 7, "player_min_number": 2}], "name": "TmHKqPn1"}}, "ticket_flexing_selection": "pivot", "ticket_flexing_selections": [{"selection": "newest", "threshold": 15}, {"selection": "oldest", "threshold": 12}, {"selection": "pivot", "threshold": 38}], "use_newest_ticket_for_flexing": false}, "session_queue_timeout_seconds": 49, "social_matchmaking": true, "sub_gamemode_selection": "random", "ticket_observability_enable": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName 'vwIJ4Sky' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'HjGsiglL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "baF63FGV", "players": [{"results": [{"attribute": "9KCz9EAq", "value": 0.4009780412049305}, {"attribute": "y42HPfkn", "value": 0.20090899715619825}, {"attribute": "OI00PiM6", "value": 0.7609084797438687}], "user_id": "FsTE3W2F"}, {"results": [{"attribute": "uJkqWLki", "value": 0.9646131617828619}, {"attribute": "Q2aNgRVU", "value": 0.03343330542319556}, {"attribute": "f7a6z5H0", "value": 0.08205609811121461}], "user_id": "IH37HEHG"}, {"results": [{"attribute": "qnPnP0An", "value": 0.5985181943060702}, {"attribute": "JAN7DLUZ", "value": 0.11703469261975052}, {"attribute": "tqYqPZeP", "value": 0.6504060305755348}], "user_id": "1aWMBQlE"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "tC8sUb8N"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "M3sGjRni", "client_version": "k9xaRA19", "deployment": "HJtCpJSx", "error_code": 78, "error_message": "gMaE8pZU", "game_mode": "LkaMKpOc", "is_mock": "QbmfiWKv", "joinable": false, "match_id": "9cC6XEy3", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 82, "party_attributes": {"I1u7rp7v": {}, "ni8puT1z": {}, "Cmb8Xsu7": {}}, "party_id": "5Mm6P1kR", "party_members": [{"extra_attributes": {"kMITMZC6": {}, "ruEPkyBu": {}, "GFEiDENt": {}}, "user_id": "jiREIwxO"}, {"extra_attributes": {"VT3BXDDP": {}, "9PuU66mX": {}, "6C8e39vk": {}}, "user_id": "81E1gv2X"}, {"extra_attributes": {"UbeneSoJ": {}, "z7hVEIca": {}, "4h6xKIWA": {}}, "user_id": "WcyopW2Z"}], "ticket_created_at": 12, "ticket_id": "lZVM7kkT"}, {"first_ticket_created_at": 98, "party_attributes": {"4jg4fNeS": {}, "LDPIjcqQ": {}, "MC0KjR82": {}}, "party_id": "QSUSI3Jk", "party_members": [{"extra_attributes": {"yzUTrBnQ": {}, "fKwg6SQZ": {}, "TsZHBXg0": {}}, "user_id": "eIh0Hl1i"}, {"extra_attributes": {"hNYABSd6": {}, "Z1b2Qh77": {}, "t3UcYlKo": {}}, "user_id": "rgJr5fLf"}, {"extra_attributes": {"bZG4tzKb": {}, "Fz3gJeNx": {}, "yQFiPOOL": {}}, "user_id": "mexQKWoQ"}], "ticket_created_at": 18, "ticket_id": "VtPC8dox"}, {"first_ticket_created_at": 35, "party_attributes": {"4W2DveEE": {}, "UvK9HqyO": {}, "qCh0UBmV": {}}, "party_id": "eqCEpl7M", "party_members": [{"extra_attributes": {"COnKBAoO": {}, "8oQ1krIP": {}, "ebRsIp4Q": {}}, "user_id": "jCvuxB0L"}, {"extra_attributes": {"CO0KLt9i": {}, "BvP1Wgf7": {}, "Nz00g5lR": {}}, "user_id": "LmZOBdtX"}, {"extra_attributes": {"mqwzEajh": {}, "BwfEqxNY": {}, "qVblRTT5": {}}, "user_id": "GRi3gtKU"}], "ticket_created_at": 17, "ticket_id": "ijopQg1A"}]}, {"matching_parties": [{"first_ticket_created_at": 92, "party_attributes": {"JnRTLClU": {}, "rXbzck5Q": {}, "UJD0WM3M": {}}, "party_id": "whcADSKe", "party_members": [{"extra_attributes": {"DZRNC8Bu": {}, "WWPlZSwe": {}, "BFc2e8wi": {}}, "user_id": "bEaMOvuy"}, {"extra_attributes": {"XVHUwIuc": {}, "KxaotQd3": {}, "EJMFm4zy": {}}, "user_id": "Kk2uk8Fv"}, {"extra_attributes": {"gAkJRYDs": {}, "GOxU2BJx": {}, "Db7ZS9tt": {}}, "user_id": "TWel092B"}], "ticket_created_at": 52, "ticket_id": "gb8S7fOi"}, {"first_ticket_created_at": 30, "party_attributes": {"Xwdj0hwM": {}, "gPhXuhM2": {}, "DZkowfJD": {}}, "party_id": "bjfbb6Is", "party_members": [{"extra_attributes": {"KUPSfLNK": {}, "mEJcKcgD": {}, "IuxKXX7Z": {}}, "user_id": "JWnnjVxI"}, {"extra_attributes": {"1V2JWsvz": {}, "ia1jvvcH": {}, "dmuwuxHU": {}}, "user_id": "BDc6X7NW"}, {"extra_attributes": {"qT3ogd6m": {}, "494kqgLa": {}, "lAgN1To3": {}}, "user_id": "pWVVOhBK"}], "ticket_created_at": 77, "ticket_id": "BVBTdZag"}, {"first_ticket_created_at": 83, "party_attributes": {"3Wjr60j5": {}, "rngtwljW": {}, "Qrd012Jq": {}}, "party_id": "RAIjoxZg", "party_members": [{"extra_attributes": {"o4EC6Vh1": {}, "9vJTQp5e": {}, "14LmyFOz": {}}, "user_id": "B367iulA"}, {"extra_attributes": {"qjFMiumV": {}, "5JKkY3WT": {}, "WjF69DRO": {}}, "user_id": "AXpRssP8"}, {"extra_attributes": {"tRc6yWvd": {}, "LFxo4SmE": {}, "QMZSBJWF": {}}, "user_id": "8CsIXjNI"}], "ticket_created_at": 19, "ticket_id": "pNrvvNgY"}]}, {"matching_parties": [{"first_ticket_created_at": 3, "party_attributes": {"MLwvN8lh": {}, "8KhHFphM": {}, "eh9Id5rG": {}}, "party_id": "RH2AnGe6", "party_members": [{"extra_attributes": {"6R24mzem": {}, "Ie8s7EK6": {}, "hA5aRkVh": {}}, "user_id": "nOgqNsSH"}, {"extra_attributes": {"0gmcUofW": {}, "Ea3WXo1v": {}, "IeIGUKdT": {}}, "user_id": "23k1rxGe"}, {"extra_attributes": {"nPx4s3dO": {}, "tqAQThRz": {}, "ak6NAUYN": {}}, "user_id": "PL3c859B"}], "ticket_created_at": 86, "ticket_id": "JK2BIW3i"}, {"first_ticket_created_at": 91, "party_attributes": {"r2jJp4yw": {}, "FtgQFxWG": {}, "gc3NREV7": {}}, "party_id": "GM2s1p3T", "party_members": [{"extra_attributes": {"C5XTpD2C": {}, "tP5aEH4Y": {}, "sbzDxNKw": {}}, "user_id": "ytamuyAK"}, {"extra_attributes": {"7sAIp3yJ": {}, "AYGBlvpN": {}, "IORbtXkk": {}}, "user_id": "qayWWMKW"}, {"extra_attributes": {"UHfVoMqG": {}, "6iea3ChH": {}, "yLcgWDWB": {}}, "user_id": "9CJ0oyz7"}], "ticket_created_at": 72, "ticket_id": "3jwksQiO"}, {"first_ticket_created_at": 82, "party_attributes": {"eKpO0mcb": {}, "O9eeGBQK": {}, "N5WfKKge": {}}, "party_id": "OVU4Gm6t", "party_members": [{"extra_attributes": {"RXzuM2WG": {}, "PsDg4NC6": {}, "APn7iBOn": {}}, "user_id": "w64VzzT4"}, {"extra_attributes": {"7yGlaeNr": {}, "n3YaVBid": {}, "SfEapiR4": {}}, "user_id": "o4uqQWZa"}, {"extra_attributes": {"TQjFEufi": {}, "KlTVAqi4": {}, "SqPfY75b": {}}, "user_id": "i8asNzEE"}], "ticket_created_at": 4, "ticket_id": "xvg2PTcv"}]}], "namespace": "l9ecdYlq", "party_attributes": {"NTGE4t6i": {}, "7NXS3cPT": {}, "ysFW6y65": {}}, "party_id": "uywF8wUK", "queued_at": 54, "region": "qEYMQ5Ai", "server_name": "8eyFtKjo", "status": "13opLB7k", "ticket_id": "6rOo4VDH", "ticket_ids": ["2tMsv642", "lLx4A7Du", "KPQVEEFO"], "updated_at": "1990-06-22T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "MHMqzdF6"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'QEw1vCqB' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 26, "userID": "MvfiywZZ", "weight": 0.7651431469660778}' \
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
    --matchIDs 'gnNmoeCK' \
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
    --strategy 'wsO0tPav' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'Hgjn4FkN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName '0VqEqKll' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatchOnDifferentTeam", "deployment": "fepWX2oI", "description": "YbhXPBW8", "findMatchTimeoutSeconds": 43, "joinable": true, "max_delay_ms": 40, "region_expansion_range_ms": 75, "region_expansion_rate_ms": 20, "region_latency_initial_range_ms": 19, "region_latency_max_ms": 5, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 63, "min": 5, "name": "4N5gTTjG"}, {"max": 79, "min": 52, "name": "I2ZQ9RV2"}, {"max": 66, "min": 14, "name": "TvIseh66"}], [{"max": 35, "min": 13, "name": "vvnAEkKT"}, {"max": 0, "min": 91, "name": "PtplVZve"}, {"max": 48, "min": 79, "name": "n88JNsBg"}], [{"max": 45, "min": 26, "name": "z3Aj44tg"}, {"max": 76, "min": 93, "name": "peV09tcM"}, {"max": 50, "min": 90, "name": "vrIGoVEk"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 6, "role_flexing_second": 2}, "maxNumber": 66, "minNumber": 12, "playerMaxNumber": 10, "playerMinNumber": 32}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 93, "min": 69, "name": "NC99FUzL"}, {"max": 23, "min": 5, "name": "Fai88T49"}, {"max": 79, "min": 82, "name": "xSdk3gfu"}], [{"max": 7, "min": 9, "name": "ATXbaur1"}, {"max": 37, "min": 61, "name": "uqX1DDUU"}, {"max": 55, "min": 62, "name": "KDeVHcTM"}], [{"max": 29, "min": 20, "name": "I8Ox2xpK"}, {"max": 80, "min": 5, "name": "XTfielBm"}, {"max": 75, "min": 2, "name": "CGmc2Ijr"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 88, "role_flexing_second": 90}, "duration": 73, "max_number": 28, "min_number": 93, "player_max_number": 17, "player_min_number": 73}, {"combination": {"alliances": [[{"max": 37, "min": 42, "name": "c1geRfo9"}, {"max": 100, "min": 66, "name": "N1ScZ6jY"}, {"max": 0, "min": 12, "name": "nFydYPss"}], [{"max": 96, "min": 3, "name": "mLG0wnaJ"}, {"max": 50, "min": 13, "name": "JEhraBRP"}, {"max": 97, "min": 45, "name": "e12L8tSx"}], [{"max": 69, "min": 14, "name": "K6QuXCay"}, {"max": 5, "min": 82, "name": "rAYoh7Xj"}, {"max": 84, "min": 88, "name": "CgHDk3w3"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 36, "role_flexing_second": 48}, "duration": 80, "max_number": 98, "min_number": 5, "player_max_number": 14, "player_min_number": 19}, {"combination": {"alliances": [[{"max": 41, "min": 55, "name": "P92SFjEH"}, {"max": 92, "min": 96, "name": "MRmubyg1"}, {"max": 46, "min": 39, "name": "uYW8nJxg"}], [{"max": 95, "min": 31, "name": "WyJIzfex"}, {"max": 65, "min": 10, "name": "5PlfEY7a"}, {"max": 79, "min": 58, "name": "TznTa2cQ"}], [{"max": 14, "min": 69, "name": "lH579YJB"}, {"max": 76, "min": 51, "name": "dXgBq8DS"}, {"max": 38, "min": 69, "name": "52Sd20Mt"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 73, "role_flexing_second": 54}, "duration": 0, "max_number": 54, "min_number": 46, "player_max_number": 88, "player_min_number": 47}], "batch_size": 39, "bucket_mmr_rule": {"disable_authority": true, "flex_authority_count": 4, "flex_flat_step_range": 47, "flex_immunity_count": 80, "flex_range_max": 11, "flex_rate_ms": 6, "flex_step_max": 85, "force_authority_match": true, "initial_step_range": 65, "mmr_max": 27, "mmr_mean": 8, "mmr_min": 96, "mmr_std_dev": 39, "override_mmr_data": false, "use_bucket_mmr": false, "use_flat_flex_step": true}, "flexingRules": [{"attribute": "sBs2n5sQ", "criteria": "NfyO3XtC", "duration": 5, "reference": 0.48060597150621065}, {"attribute": "E8z5LjzT", "criteria": "iPFZaBbK", "duration": 33, "reference": 0.045313751367033084}, {"attribute": "RynSQZkL", "criteria": "d0qh8YfG", "duration": 19, "reference": 0.47178825747391306}], "match_options": {"options": [{"name": "d3ftSzh4", "type": "hclfMTZz"}, {"name": "c5IFROrr", "type": "7xEZThbQ"}, {"name": "fhNYYmqQ", "type": "eXzmH1Uy"}]}, "matchingRules": [{"attribute": "4jvGIqRZ", "criteria": "iDi5PWXp", "reference": 0.612240089414082}, {"attribute": "ZOClc7oj", "criteria": "pdiTB1og", "reference": 0.7496813738456187}, {"attribute": "RbSsvVOu", "criteria": "71ElljWl", "reference": 0.0017112252520172788}], "sort_ticket": {"search_result": "none", "ticket_queue": "distance"}, "sort_tickets": [{"search_result": "distance", "threshold": 88, "ticket_queue": "oldestTicketAge"}, {"search_result": "random", "threshold": 100, "ticket_queue": "oldestTicketAge"}, {"search_result": "random", "threshold": 64, "ticket_queue": "oldestTicketAge"}], "sub_game_modes": {}, "ticket_flexing_selection": "newest", "ticket_flexing_selections": [{"selection": "pivot", "threshold": 65}, {"selection": "oldest", "threshold": 97}, {"selection": "random", "threshold": 75}], "use_newest_ticket_for_flexing": false}, "sessionQueueTimeoutSeconds": 52, "socialMatchmaking": true, "sub_gamemode_selection": "ticketOrder", "ticket_observability_enable": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName 'mKGAQPXL' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName 'Vbh7v1EU' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName '9gWmSNd5' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 99}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName 'dZazuCcN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName 't3Xja0zy' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "rtxk38sH", "count": 18, "mmrMax": 0.257949136319102, "mmrMean": 0.04815363636244829, "mmrMin": 0.507160085347246, "mmrStdDev": 0.8187284634858389}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'BWOlVa90' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 64, "party_attributes": {"mXVJYW3f": {}, "AmxMkhXg": {}, "62fMvurw": {}}, "party_id": "yAcc0IBp", "party_members": [{"extra_attributes": {"ePDB7ni0": {}, "umwO3tRJ": {}, "OyvvwfYR": {}}, "user_id": "E1UWDEb9"}, {"extra_attributes": {"2zgSYIfB": {}, "uLzuG7qi": {}, "H5NGfYKf": {}}, "user_id": "qWgbCfAb"}, {"extra_attributes": {"envWpTUB": {}, "4ym6m5UW": {}, "iwtaP6Ln": {}}, "user_id": "BDqyNwCq"}], "ticket_created_at": 99, "ticket_id": "UGxHwq91"}, {"first_ticket_created_at": 43, "party_attributes": {"ExjYfxpK": {}, "ASI0hUak": {}, "o0DpN3Im": {}}, "party_id": "iS9rfjL1", "party_members": [{"extra_attributes": {"yfhOcA1f": {}, "KNihTyRT": {}, "nrTL5Wlj": {}}, "user_id": "duh2JWjo"}, {"extra_attributes": {"E79qWOXc": {}, "MdVl3fK9": {}, "0PswpPVq": {}}, "user_id": "gFu6VYbu"}, {"extra_attributes": {"y7MgGbW0": {}, "ttD0LW8l": {}, "3XA81kyL": {}}, "user_id": "4PsikYYk"}], "ticket_created_at": 62, "ticket_id": "d76zWZoS"}, {"first_ticket_created_at": 49, "party_attributes": {"F9kHQ1DG": {}, "6E0euTwp": {}, "XYVWYx2n": {}}, "party_id": "iQASY1FP", "party_members": [{"extra_attributes": {"troxD0Uq": {}, "gkQ5stfY": {}, "OlAp0TlK": {}}, "user_id": "QojBlgl9"}, {"extra_attributes": {"QsMVyb3I": {}, "8HgVEQFH": {}, "XfPuO2h0": {}}, "user_id": "2TPyLiI4"}, {"extra_attributes": {"7GeFtghJ": {}, "M9uehuJd": {}, "66ze6h2R": {}}, "user_id": "EakSYjrt"}], "ticket_created_at": 44, "ticket_id": "WY3962d4"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName '4MDoFIiF' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 5}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'YwgZT9nG' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'FZwT9U8A' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'mD3biVQY' \
    --matchID 'Z867Nrup' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["KlS2mWvO", "ZOj0pYWJ", "SABHX3uW"], "party_id": "NRi2AllJ", "user_id": "4mAUKaY2"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'XA2yEMBh' \
    --matchID 'GouSKi86' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'MmjZfKlm' \
    --matchID 'RDTEzb14' \
    --namespace "$AB_NAMESPACE" \
    --userID 'NzeQ8Klu' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName 'UHDP7hsg' \
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
    --channelName 'ExCimSRl' \
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