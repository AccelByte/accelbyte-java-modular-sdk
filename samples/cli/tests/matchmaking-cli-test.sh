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
    --limit '30' \
    --offset '39' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "sYI8bFkN", "description": "VhyEV6xT", "find_match_timeout_seconds": 8, "game_mode": "uViXdXoG", "joinable": false, "max_delay_ms": 82, "region_expansion_range_ms": 93, "region_expansion_rate_ms": 94, "region_latency_initial_range_ms": 55, "region_latency_max_ms": 88, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 91, "min": 54, "name": "zovQA4lr"}, {"max": 20, "min": 36, "name": "d6pjJJcH"}, {"max": 69, "min": 5, "name": "PStJc6PZ"}], [{"max": 81, "min": 83, "name": "PYR2w42y"}, {"max": 23, "min": 15, "name": "at0wTB59"}, {"max": 90, "min": 76, "name": "T8gYvCAy"}], [{"max": 49, "min": 30, "name": "NzJcnzce"}, {"max": 79, "min": 19, "name": "VyzSwqxw"}, {"max": 46, "min": 98, "name": "2gDy9ps8"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 1, "role_flexing_second": 0}, "max_number": 60, "min_number": 100, "player_max_number": 28, "player_min_number": 5}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 65, "min": 10, "name": "YArwojhk"}, {"max": 66, "min": 21, "name": "upYXGjOJ"}, {"max": 81, "min": 23, "name": "HAHB6jYb"}], [{"max": 94, "min": 51, "name": "mcjnzK8Y"}, {"max": 84, "min": 60, "name": "TCp9DjHf"}, {"max": 32, "min": 18, "name": "u3EIBh3H"}], [{"max": 88, "min": 94, "name": "DAnC4Jzk"}, {"max": 81, "min": 98, "name": "nVyk9Ikh"}, {"max": 81, "min": 46, "name": "LmJ0hggQ"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 73, "role_flexing_second": 40}, "duration": 46, "max_number": 92, "min_number": 93, "player_max_number": 61, "player_min_number": 73}, {"combination": {"alliances": [[{"max": 1, "min": 72, "name": "5kQnPgh9"}, {"max": 82, "min": 19, "name": "Otofmsnh"}, {"max": 60, "min": 81, "name": "PwaOYait"}], [{"max": 94, "min": 58, "name": "qeXEprEB"}, {"max": 15, "min": 54, "name": "rZx6HwmL"}, {"max": 55, "min": 43, "name": "bK7J22LE"}], [{"max": 78, "min": 22, "name": "ZGL2uA3b"}, {"max": 89, "min": 24, "name": "uRRlZ2lC"}, {"max": 68, "min": 62, "name": "AbPctLCR"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 97, "role_flexing_second": 89}, "duration": 31, "max_number": 80, "min_number": 32, "player_max_number": 43, "player_min_number": 92}, {"combination": {"alliances": [[{"max": 46, "min": 11, "name": "AaHxMYSk"}, {"max": 16, "min": 2, "name": "QzbQlLXy"}, {"max": 5, "min": 49, "name": "yytqy8bR"}], [{"max": 4, "min": 20, "name": "BD7HLRaT"}, {"max": 85, "min": 53, "name": "VnJKiXqf"}, {"max": 63, "min": 32, "name": "MBglIJNO"}], [{"max": 32, "min": 100, "name": "EaFQL1nR"}, {"max": 1, "min": 19, "name": "a7lRANcD"}, {"max": 33, "min": 8, "name": "bcUXOoC4"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 9, "role_flexing_second": 91}, "duration": 19, "max_number": 14, "min_number": 43, "player_max_number": 16, "player_min_number": 37}], "bucket_mmr_rule": {"disable_authority": true, "flex_authority_count": 33, "flex_flat_step_range": 78, "flex_immunity_count": 11, "flex_range_max": 45, "flex_rate_ms": 3, "flex_step_max": 32, "force_authority_match": true, "initial_step_range": 35, "mmr_max": 97, "mmr_mean": 32, "mmr_min": 26, "mmr_std_dev": 97, "override_mmr_data": false, "use_bucket_mmr": false, "use_flat_flex_step": true}, "flexing_rule": [{"attribute": "6HbAd3Ag", "criteria": "N5tbmMHD", "duration": 23, "reference": 0.6778066143675673}, {"attribute": "pPUSnIO8", "criteria": "55Z8yyF1", "duration": 93, "reference": 0.21060128103321218}, {"attribute": "0iWmOiwB", "criteria": "uTC6GIIZ", "duration": 27, "reference": 0.03603850400931918}], "match_options": {"options": [{"name": "eGswlaWI", "type": "xr4p4cqq"}, {"name": "aHUv7B7e", "type": "OQfaSalQ"}, {"name": "gmmH7iHB", "type": "1rKlNuju"}]}, "matching_rule": [{"attribute": "LJLQ5Qkv", "criteria": "8tc0LY5r", "reference": 0.33567319263340734}, {"attribute": "X0LhWrId", "criteria": "2MEvwjbc", "reference": 0.15867655025278615}, {"attribute": "g7NTOtjH", "criteria": "dUrHbGP9", "reference": 0.0019126198127575877}], "rebalance_enable": true, "sub_game_modes": {"jeV6kbut": {"alliance": {"combination": {"alliances": [[{"max": 38, "min": 11, "name": "hGncUTCa"}, {"max": 70, "min": 82, "name": "aVo4T0q3"}, {"max": 89, "min": 18, "name": "i9Vvjxtx"}], [{"max": 25, "min": 51, "name": "ymxONBLr"}, {"max": 44, "min": 7, "name": "3fBOiSTx"}, {"max": 93, "min": 91, "name": "kpof8DV4"}], [{"max": 38, "min": 63, "name": "nxZfOMAz"}, {"max": 20, "min": 20, "name": "Lt3jH8yp"}, {"max": 18, "min": 70, "name": "qzyfyjA3"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 21, "role_flexing_second": 40}, "max_number": 45, "min_number": 84, "player_max_number": 63, "player_min_number": 52}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 84, "min": 95, "name": "z96PhEkS"}, {"max": 77, "min": 6, "name": "x4t2kpwe"}, {"max": 48, "min": 83, "name": "jGlBlRCx"}], [{"max": 96, "min": 57, "name": "rfTkRru1"}, {"max": 30, "min": 55, "name": "Wit8n8fT"}, {"max": 91, "min": 12, "name": "XKqGHbTm"}], [{"max": 100, "min": 63, "name": "4GfH5S9w"}, {"max": 90, "min": 14, "name": "saopfO30"}, {"max": 69, "min": 82, "name": "pCwpx2NB"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 65, "role_flexing_second": 18}, "duration": 2, "max_number": 84, "min_number": 68, "player_max_number": 100, "player_min_number": 59}, {"combination": {"alliances": [[{"max": 21, "min": 3, "name": "I3YRMLr9"}, {"max": 77, "min": 58, "name": "MHBkveRk"}, {"max": 8, "min": 16, "name": "O9tD62Og"}], [{"max": 24, "min": 25, "name": "LrFyWLna"}, {"max": 39, "min": 67, "name": "iPsb9Xo2"}, {"max": 63, "min": 64, "name": "KdtkGX67"}], [{"max": 89, "min": 4, "name": "KpVU9Heg"}, {"max": 57, "min": 15, "name": "P2jGBFMM"}, {"max": 86, "min": 22, "name": "POUWiMYY"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 14, "role_flexing_second": 27}, "duration": 57, "max_number": 97, "min_number": 72, "player_max_number": 23, "player_min_number": 55}, {"combination": {"alliances": [[{"max": 10, "min": 14, "name": "3s2vPZM6"}, {"max": 63, "min": 50, "name": "xtMWAS1T"}, {"max": 20, "min": 60, "name": "jQkL5Ue9"}], [{"max": 79, "min": 3, "name": "BVZeREQx"}, {"max": 29, "min": 8, "name": "5lVRCmPj"}, {"max": 7, "min": 1, "name": "wmvDk0fD"}], [{"max": 54, "min": 11, "name": "KGZFXXvF"}, {"max": 82, "min": 27, "name": "u3RUNamD"}, {"max": 38, "min": 40, "name": "OQmt4atn"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 94, "role_flexing_second": 5}, "duration": 15, "max_number": 25, "min_number": 87, "player_max_number": 77, "player_min_number": 0}], "name": "MMwDufoc"}, "8GwBLdZU": {"alliance": {"combination": {"alliances": [[{"max": 7, "min": 16, "name": "gbyv7uQN"}, {"max": 87, "min": 1, "name": "nffnkwBa"}, {"max": 51, "min": 4, "name": "YVmF8Pjy"}], [{"max": 43, "min": 90, "name": "1zm6YqBl"}, {"max": 84, "min": 75, "name": "tc4QpXkM"}, {"max": 88, "min": 9, "name": "g0c5AlfC"}], [{"max": 45, "min": 75, "name": "ZDu8Tcks"}, {"max": 86, "min": 68, "name": "Pt3sBBOs"}, {"max": 51, "min": 27, "name": "Y2pHK6NG"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 32, "role_flexing_second": 16}, "max_number": 68, "min_number": 51, "player_max_number": 23, "player_min_number": 49}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 78, "min": 89, "name": "twplblRc"}, {"max": 4, "min": 18, "name": "HpfrNVUb"}, {"max": 3, "min": 95, "name": "Sl792LCQ"}], [{"max": 57, "min": 36, "name": "6eaucNf9"}, {"max": 42, "min": 98, "name": "2F7lapuK"}, {"max": 98, "min": 81, "name": "0vbiKtMR"}], [{"max": 19, "min": 66, "name": "Bip4JxOw"}, {"max": 18, "min": 41, "name": "EYdqqs9V"}, {"max": 51, "min": 80, "name": "CDUsEvbN"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 56, "role_flexing_second": 43}, "duration": 57, "max_number": 14, "min_number": 15, "player_max_number": 93, "player_min_number": 88}, {"combination": {"alliances": [[{"max": 31, "min": 5, "name": "2khciUCc"}, {"max": 57, "min": 58, "name": "HyUq8McO"}, {"max": 94, "min": 74, "name": "WCywBNEi"}], [{"max": 1, "min": 97, "name": "PQx7ok9e"}, {"max": 96, "min": 71, "name": "RcNNhMrE"}, {"max": 55, "min": 70, "name": "DCIpOHYm"}], [{"max": 44, "min": 32, "name": "5hzv3d3k"}, {"max": 74, "min": 70, "name": "KeUgxYHx"}, {"max": 59, "min": 61, "name": "LIvkePAX"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 70, "role_flexing_second": 95}, "duration": 30, "max_number": 25, "min_number": 5, "player_max_number": 61, "player_min_number": 12}, {"combination": {"alliances": [[{"max": 88, "min": 34, "name": "duXpM5DS"}, {"max": 29, "min": 93, "name": "Y6mZl9cg"}, {"max": 100, "min": 3, "name": "VGZiILEi"}], [{"max": 98, "min": 100, "name": "C485p3h0"}, {"max": 64, "min": 81, "name": "0xkQfuwb"}, {"max": 62, "min": 55, "name": "enwY8qDr"}], [{"max": 17, "min": 84, "name": "OPgromdM"}, {"max": 82, "min": 32, "name": "aQsSURB1"}, {"max": 12, "min": 93, "name": "l1TqB4VN"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 29, "role_flexing_second": 46}, "duration": 85, "max_number": 83, "min_number": 32, "player_max_number": 26, "player_min_number": 48}], "name": "gRMo0lm1"}, "YAaYUocc": {"alliance": {"combination": {"alliances": [[{"max": 24, "min": 81, "name": "mc84kJpM"}, {"max": 11, "min": 88, "name": "xqrdcA9k"}, {"max": 92, "min": 56, "name": "f4LHSB8a"}], [{"max": 29, "min": 81, "name": "8syDjCi4"}, {"max": 12, "min": 64, "name": "FK0x5oQ8"}, {"max": 47, "min": 47, "name": "TgTNCeEO"}], [{"max": 54, "min": 83, "name": "CznULLKE"}, {"max": 93, "min": 14, "name": "KggYfPDD"}, {"max": 37, "min": 48, "name": "MFEnFToY"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 51, "role_flexing_second": 24}, "max_number": 5, "min_number": 52, "player_max_number": 40, "player_min_number": 89}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 44, "min": 72, "name": "JHrBVjl2"}, {"max": 37, "min": 96, "name": "dhAb97Sy"}, {"max": 36, "min": 39, "name": "LODxlUOl"}], [{"max": 85, "min": 83, "name": "RJcOIIhn"}, {"max": 15, "min": 13, "name": "m18EpT9s"}, {"max": 22, "min": 14, "name": "b9N0WdKS"}], [{"max": 65, "min": 31, "name": "Fb4fdGhd"}, {"max": 8, "min": 92, "name": "8WMqMQQ6"}, {"max": 91, "min": 62, "name": "6aVm19KH"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 19, "role_flexing_second": 91}, "duration": 39, "max_number": 51, "min_number": 97, "player_max_number": 66, "player_min_number": 83}, {"combination": {"alliances": [[{"max": 10, "min": 34, "name": "Wh7D6i3H"}, {"max": 35, "min": 55, "name": "36yJrIvU"}, {"max": 24, "min": 0, "name": "aoPRk4bX"}], [{"max": 1, "min": 39, "name": "JWlQgAhA"}, {"max": 37, "min": 44, "name": "LkCgvCDx"}, {"max": 99, "min": 76, "name": "6qgj9zQy"}], [{"max": 0, "min": 34, "name": "eLfFJQAe"}, {"max": 84, "min": 20, "name": "eUAEJGBf"}, {"max": 93, "min": 49, "name": "8vIsCEJH"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 19, "role_flexing_second": 28}, "duration": 53, "max_number": 52, "min_number": 0, "player_max_number": 31, "player_min_number": 73}, {"combination": {"alliances": [[{"max": 6, "min": 66, "name": "42mM9oQ3"}, {"max": 48, "min": 80, "name": "PMX0LXot"}, {"max": 13, "min": 35, "name": "Ec2RzDD1"}], [{"max": 48, "min": 90, "name": "qllrSIuT"}, {"max": 9, "min": 18, "name": "iQkMkcm5"}, {"max": 46, "min": 82, "name": "HYEqDPbu"}], [{"max": 34, "min": 3, "name": "fsXSh0un"}, {"max": 24, "min": 29, "name": "ZujoQH1x"}, {"max": 19, "min": 21, "name": "DlBd5VMr"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 62, "role_flexing_second": 78}, "duration": 52, "max_number": 40, "min_number": 72, "player_max_number": 61, "player_min_number": 95}], "name": "cxXTfFZM"}}, "use_newest_ticket_for_flexing": false}, "session_queue_timeout_seconds": 40, "social_matchmaking": false, "ticket_observability_enable": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName 'QSu5UBvc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'SOWtCrfd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "ldkLjg2e", "players": [{"results": [{"attribute": "2sLm7m81", "value": 0.8912307531753494}, {"attribute": "nQY3j2tt", "value": 0.9523354275108954}, {"attribute": "rAWI6306", "value": 0.44704962076124977}], "user_id": "0GVa7uzk"}, {"results": [{"attribute": "Tl6WFhsn", "value": 0.621445677717095}, {"attribute": "Ax20OkKA", "value": 0.3848422639436869}, {"attribute": "ZLXTPFvS", "value": 0.015041260380167287}], "user_id": "k1g9RRGh"}, {"results": [{"attribute": "UHh0orft", "value": 0.5960552438427356}, {"attribute": "W54YzmQ1", "value": 0.23702257487992484}, {"attribute": "FVMXE9Fg", "value": 0.19405735548114478}], "user_id": "yWeZO4zR"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "gP2PnQEQ"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "G2Kwogkm", "client_version": "Cw7QSFI6", "deployment": "nvKLQAbJ", "error_code": 96, "error_message": "NdCQuiyO", "game_mode": "dFlmM1uD", "is_mock": "LE3lNxYe", "joinable": false, "match_id": "uvLajLTB", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 17, "party_attributes": {"kP2cNqoY": {}, "EZg1kNgZ": {}, "yDuBZlRi": {}}, "party_id": "iebIg8sY", "party_members": [{"extra_attributes": {"C2tjhUkj": {}, "EzzCg7Zq": {}, "hUHWS9gN": {}}, "user_id": "l3cIubnT"}, {"extra_attributes": {"6MFSF5Ga": {}, "IjrSxWT7": {}, "LjEOJakK": {}}, "user_id": "nrCoERVo"}, {"extra_attributes": {"MdyojKzK": {}, "yXRrsLkq": {}, "8oncmlFc": {}}, "user_id": "j6IccoTN"}], "ticket_created_at": 74, "ticket_id": "E1r61BZc"}, {"first_ticket_created_at": 97, "party_attributes": {"JVS7X43W": {}, "MKGq4qb4": {}, "gANuemYy": {}}, "party_id": "ytXZLC6o", "party_members": [{"extra_attributes": {"ulkeGtCk": {}, "CyyYhw8A": {}, "OnPu3cfW": {}}, "user_id": "nmhnYK0Q"}, {"extra_attributes": {"zQJOtydu": {}, "8RR6ktwn": {}, "CadiNThY": {}}, "user_id": "8AszgBcT"}, {"extra_attributes": {"8PlhyQPV": {}, "NmF46kWZ": {}, "NfTyy7UU": {}}, "user_id": "PJgpmgBN"}], "ticket_created_at": 24, "ticket_id": "QQHPvhGr"}, {"first_ticket_created_at": 61, "party_attributes": {"6dmlSrvx": {}, "aFBjLBQs": {}, "U78ihqXL": {}}, "party_id": "NbKPoQUr", "party_members": [{"extra_attributes": {"5WFZ8MMx": {}, "sljFQMhc": {}, "SBMR13eP": {}}, "user_id": "bdAg0DcO"}, {"extra_attributes": {"4moZo1JF": {}, "9wJUPH1C": {}, "2D9v78CE": {}}, "user_id": "zwVEQjvU"}, {"extra_attributes": {"2FAijajJ": {}, "S51eXZRM": {}, "ZaGKpdZV": {}}, "user_id": "gHo3aGe2"}], "ticket_created_at": 5, "ticket_id": "EhzGa5M1"}]}, {"matching_parties": [{"first_ticket_created_at": 40, "party_attributes": {"LXKgmO4o": {}, "bINBeM0G": {}, "1QCTWNcz": {}}, "party_id": "8i2zTYJz", "party_members": [{"extra_attributes": {"D9JMUMFK": {}, "vh33umf5": {}, "fSiUuvit": {}}, "user_id": "NZ4tLC2a"}, {"extra_attributes": {"5a3Hc6Pc": {}, "QOJmWbsO": {}, "4hzrGXte": {}}, "user_id": "gEqYQF6V"}, {"extra_attributes": {"mgs85N6D": {}, "Rq4ZDfca": {}, "DLliYtDA": {}}, "user_id": "oidCYRZn"}], "ticket_created_at": 73, "ticket_id": "JvnApCQE"}, {"first_ticket_created_at": 25, "party_attributes": {"XwFg0Mq0": {}, "GhTFiuMM": {}, "CLY3e3NA": {}}, "party_id": "XG5bHjiS", "party_members": [{"extra_attributes": {"xKE4bRsf": {}, "zmscLe6i": {}, "r6jOyW3b": {}}, "user_id": "cBCm3Hnt"}, {"extra_attributes": {"VIcNBBl2": {}, "UWOGic7m": {}, "VwaMGv77": {}}, "user_id": "hdGN6zVJ"}, {"extra_attributes": {"2Amhj8k6": {}, "9axtgEjB": {}, "f6Bh69mp": {}}, "user_id": "bHbVI7eI"}], "ticket_created_at": 22, "ticket_id": "YoF7pUMT"}, {"first_ticket_created_at": 19, "party_attributes": {"bEEjOvHl": {}, "a61cKQr0": {}, "MSirBBNO": {}}, "party_id": "sWdLITqd", "party_members": [{"extra_attributes": {"BuUQ7Qiw": {}, "oUtDPJN3": {}, "QbnfJDpX": {}}, "user_id": "j7pSKwAE"}, {"extra_attributes": {"Mbhpi47P": {}, "cnRrDR33": {}, "NT5l6w2I": {}}, "user_id": "jN0AHqV7"}, {"extra_attributes": {"xXdtON5D": {}, "HYmHjqVW": {}, "wpN7585I": {}}, "user_id": "Jh8si73A"}], "ticket_created_at": 79, "ticket_id": "l9oqzZaT"}]}, {"matching_parties": [{"first_ticket_created_at": 55, "party_attributes": {"MkJ9961R": {}, "vRJ5zE4g": {}, "mgRQ48NU": {}}, "party_id": "qebwQEH0", "party_members": [{"extra_attributes": {"zm1b1JPW": {}, "Ja3KSHXH": {}, "CBjNkrxE": {}}, "user_id": "1VcBVuhD"}, {"extra_attributes": {"Y9Ba7R7l": {}, "fJPgrMty": {}, "KRgIKC6K": {}}, "user_id": "VtjskW4h"}, {"extra_attributes": {"aZ94wud6": {}, "8Z0KzuZQ": {}, "re8saIx4": {}}, "user_id": "ojv69FsK"}], "ticket_created_at": 57, "ticket_id": "ij7aGCn6"}, {"first_ticket_created_at": 38, "party_attributes": {"dt66vVab": {}, "gA3xCHGP": {}, "WftZEBWY": {}}, "party_id": "GWoOsVEG", "party_members": [{"extra_attributes": {"ctdKUSNq": {}, "BEKPXa4a": {}, "iHdBJK0e": {}}, "user_id": "54jQ24Vr"}, {"extra_attributes": {"JUvfkHED": {}, "U7bIZ1Q0": {}, "aBXReE8V": {}}, "user_id": "9Rboycmk"}, {"extra_attributes": {"LF9ZCMBS": {}, "gEls1H97": {}, "82VF14ud": {}}, "user_id": "rTlVcpsN"}], "ticket_created_at": 17, "ticket_id": "fQKIuBaF"}, {"first_ticket_created_at": 81, "party_attributes": {"TqFCeEww": {}, "7ytQKIsv": {}, "nqPjrjTl": {}}, "party_id": "bir7cbry", "party_members": [{"extra_attributes": {"B7dRoRlO": {}, "u15yevMi": {}, "Vwi7pB6Y": {}}, "user_id": "bvQ7X0Nk"}, {"extra_attributes": {"WgeqHGvl": {}, "vN6iEHeT": {}, "36JuAMrv": {}}, "user_id": "DfN61Bef"}, {"extra_attributes": {"qGz3rR7t": {}, "8jhehsYA": {}, "LBdgpk0R": {}}, "user_id": "xCnVAxOg"}], "ticket_created_at": 87, "ticket_id": "AnmBgANP"}]}], "namespace": "vH6073md", "party_attributes": {"0cjlMSla": {}, "dEX5mm2W": {}, "0yUSOFWs": {}}, "party_id": "zULBIAoG", "queued_at": 28, "region": "kfsGOPG3", "server_name": "poJDgSwx", "status": "PzV0fjHY", "ticket_id": "wCm3V1WU", "ticket_ids": ["SCEEPfwe", "zIBFzhVu", "EZUxXoBE"], "updated_at": "1999-11-14T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "VJtmcKz3"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'mbZdaf47' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 50, "userID": "Iqb9nIos", "weight": 0.03013177732429473}' \
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
    --matchIDs 'OmDsHc64' \
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
    --strategy 'pakPxAqG' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'iBkl1roj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'S3DRaGGd' \
    --namespace "$AB_NAMESPACE" \
    --body '{"deployment": "hzhijJL4", "description": "48dfpFLq", "findMatchTimeoutSeconds": 10, "joinable": false, "max_delay_ms": 47, "region_expansion_range_ms": 69, "region_expansion_rate_ms": 0, "region_latency_initial_range_ms": 51, "region_latency_max_ms": 77, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 97, "min": 33, "name": "5tpdFqjb"}, {"max": 59, "min": 27, "name": "0Kycc6e9"}, {"max": 52, "min": 50, "name": "vzLAdTKL"}], [{"max": 79, "min": 8, "name": "jywvxXQo"}, {"max": 81, "min": 11, "name": "3g77fZPo"}, {"max": 25, "min": 97, "name": "eAN3y9kK"}], [{"max": 20, "min": 50, "name": "bzje3bpv"}, {"max": 18, "min": 1, "name": "jfIs5ZlW"}, {"max": 15, "min": 57, "name": "tFRVbJhu"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 86, "role_flexing_second": 24}, "maxNumber": 38, "minNumber": 52, "playerMaxNumber": 74, "playerMinNumber": 35}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 79, "min": 4, "name": "tkKH9G6E"}, {"max": 16, "min": 44, "name": "bzCs2exm"}, {"max": 42, "min": 96, "name": "0tqsRjr0"}], [{"max": 88, "min": 20, "name": "mLjy50Ao"}, {"max": 77, "min": 41, "name": "WLSvHhv6"}, {"max": 70, "min": 17, "name": "dfrkhmVI"}], [{"max": 96, "min": 62, "name": "D9JDchqJ"}, {"max": 27, "min": 70, "name": "PUuA5Ogc"}, {"max": 60, "min": 50, "name": "5QqMcAkx"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 10, "role_flexing_second": 63}, "duration": 94, "max_number": 15, "min_number": 10, "player_max_number": 36, "player_min_number": 79}, {"combination": {"alliances": [[{"max": 85, "min": 7, "name": "ilzVes7i"}, {"max": 81, "min": 99, "name": "tjif5nxo"}, {"max": 99, "min": 4, "name": "XZNBQ70o"}], [{"max": 70, "min": 31, "name": "MRgK0aCS"}, {"max": 29, "min": 47, "name": "FR8b4hJ8"}, {"max": 23, "min": 7, "name": "ouaKNJ9Q"}], [{"max": 89, "min": 69, "name": "KPb1pJkJ"}, {"max": 3, "min": 81, "name": "d6fufwI0"}, {"max": 80, "min": 20, "name": "7A8HSSEJ"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 54, "role_flexing_second": 30}, "duration": 66, "max_number": 78, "min_number": 55, "player_max_number": 54, "player_min_number": 90}, {"combination": {"alliances": [[{"max": 99, "min": 91, "name": "iXaL7WnL"}, {"max": 18, "min": 11, "name": "Sz6BHHzu"}, {"max": 31, "min": 43, "name": "xY37Zreg"}], [{"max": 38, "min": 82, "name": "rZOjz0Ga"}, {"max": 68, "min": 88, "name": "1D7CnNZp"}, {"max": 22, "min": 47, "name": "phxb79sh"}], [{"max": 38, "min": 70, "name": "8mLpSAtq"}, {"max": 73, "min": 41, "name": "8GOry4CD"}, {"max": 34, "min": 21, "name": "f6OcxOR3"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 24, "role_flexing_second": 48}, "duration": 63, "max_number": 36, "min_number": 46, "player_max_number": 57, "player_min_number": 42}], "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 29, "flex_flat_step_range": 85, "flex_immunity_count": 38, "flex_range_max": 36, "flex_rate_ms": 10, "flex_step_max": 13, "force_authority_match": true, "initial_step_range": 97, "mmr_max": 75, "mmr_mean": 5, "mmr_min": 16, "mmr_std_dev": 48, "override_mmr_data": true, "use_bucket_mmr": false, "use_flat_flex_step": true}, "flexingRules": [{"attribute": "dSb61S1e", "criteria": "ALWscNXy", "duration": 44, "reference": 0.5101326850610872}, {"attribute": "kAb6YL9k", "criteria": "RJot4lOq", "duration": 17, "reference": 0.5454690565518423}, {"attribute": "4KGAxnWG", "criteria": "eDYlt0kh", "duration": 92, "reference": 0.2962597164218834}], "match_options": {"options": [{"name": "I7p7KpXF", "type": "jgKd85jY"}, {"name": "Lx1ZyjrI", "type": "cUh1aufV"}, {"name": "BIAUXKcH", "type": "HwCJ8W97"}]}, "matchingRules": [{"attribute": "i6moR8Xj", "criteria": "BWe8Xvfw", "reference": 0.7635521686673136}, {"attribute": "mmdwlZmk", "criteria": "ltISft64", "reference": 0.5923124468828728}, {"attribute": "wMzyblhp", "criteria": "OVa5QFB4", "reference": 0.8030395992387928}], "sub_game_modes": {}, "use_newest_ticket_for_flexing": true}, "sessionQueueTimeoutSeconds": 56, "socialMatchmaking": true, "ticket_observability_enable": false, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName '7eR3KeTQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName 'H4i1PCvJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName 'ZjLE5bf3' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 29}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName 'H4wNP9Oy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName 'uu9sHyRj' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "O3hFAmpv", "count": 58, "mmrMax": 0.17586937623675059, "mmrMean": 0.26969370809334503, "mmrMin": 0.8362310069047774, "mmrStdDev": 0.22025565247175127}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'v5OmE1S5' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 41, "party_attributes": {"hhLcfRBA": {}, "N3NvoVXr": {}, "EC4nKt2p": {}}, "party_id": "oGUR6xCB", "party_members": [{"extra_attributes": {"11jF4IMX": {}, "D65X84uI": {}, "dsyUc7EY": {}}, "user_id": "SnDhOrWC"}, {"extra_attributes": {"3ohPcQx0": {}, "pXfhBuOi": {}, "GZZNBljS": {}}, "user_id": "GhK1NwHU"}, {"extra_attributes": {"3GOKRqJ8": {}, "9iaa8Gbw": {}, "ZN1eAM3l": {}}, "user_id": "On4202N6"}], "ticket_created_at": 53, "ticket_id": "XbGtdvQJ"}, {"first_ticket_created_at": 11, "party_attributes": {"yEzu31KN": {}, "pywCv02Z": {}, "YyAVCgvW": {}}, "party_id": "X9bFpAoT", "party_members": [{"extra_attributes": {"zJqBvNl6": {}, "fqox0cmv": {}, "lohFIzXn": {}}, "user_id": "PFdmV6bl"}, {"extra_attributes": {"9zAhrmnn": {}, "N7nYELdz": {}, "V44gvO3D": {}}, "user_id": "5Y7e2vyN"}, {"extra_attributes": {"Pzw9GQSP": {}, "B2PyPsMZ": {}, "AkhaHxhT": {}}, "user_id": "XRcmXjjt"}], "ticket_created_at": 29, "ticket_id": "dC5AVVQX"}, {"first_ticket_created_at": 36, "party_attributes": {"M4gHyOiC": {}, "lMZXyHs1": {}, "nG4rJghL": {}}, "party_id": "vnMzmTJG", "party_members": [{"extra_attributes": {"j90eYC4M": {}, "VLYkEJhT": {}, "vrxkxVEX": {}}, "user_id": "AHCTqYsN"}, {"extra_attributes": {"ziQZQYBr": {}, "ENhj0zhD": {}, "DooIhXQV": {}}, "user_id": "uDPh5U5p"}, {"extra_attributes": {"tEcqD8SK": {}, "KDj8MliN": {}, "8ySb7L20": {}}, "user_id": "o6GvD6g3"}], "ticket_created_at": 25, "ticket_id": "Nku0ME4q"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName 'PwsaVIGk' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 13}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 's1VSSAl4' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'tS3xYtpn' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'dTYpxllM' \
    --matchID '2bVYlmrP' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["7BrhN7uP", "iv5kquwg", "lGL3MwZ1"], "party_id": "fwa7dI8O", "user_id": "oalJO3t2"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'Vrppo20d' \
    --matchID 'NmMbIcyh' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'iHbsfsiK' \
    --matchID '1G5npQEs' \
    --namespace "$AB_NAMESPACE" \
    --userID 'zPmDRwYJ' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName 'fUFt7v5x' \
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
    --channelName 'kHXf9ncu' \
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