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
    --limit '38' \
    --offset '24' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatch", "deployment": "KQvPscmi", "description": "Na6GbnbU", "find_match_timeout_seconds": 49, "game_mode": "KzBJedty", "joinable": true, "max_delay_ms": 4, "region_expansion_range_ms": 24, "region_expansion_rate_ms": 43, "region_latency_initial_range_ms": 60, "region_latency_max_ms": 97, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 40, "min": 3, "name": "ppuQcsa5"}, {"max": 19, "min": 64, "name": "M3aDEpt4"}, {"max": 34, "min": 72, "name": "bTp2HM8z"}], [{"max": 29, "min": 27, "name": "9wo7OcXn"}, {"max": 62, "min": 53, "name": "G613AYbO"}, {"max": 19, "min": 63, "name": "tKsGY9c8"}], [{"max": 100, "min": 98, "name": "BKvvpfJA"}, {"max": 35, "min": 7, "name": "1VoQRxG3"}, {"max": 66, "min": 44, "name": "3Ptn5fRD"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 98, "role_flexing_second": 0}, "max_number": 88, "min_number": 5, "player_max_number": 29, "player_min_number": 3}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 4, "min": 39, "name": "tLJaUUEz"}, {"max": 17, "min": 94, "name": "8JsuPQ8a"}, {"max": 62, "min": 44, "name": "OG0XF5Xn"}], [{"max": 9, "min": 7, "name": "5DRca8M8"}, {"max": 74, "min": 80, "name": "w3U6wk9e"}, {"max": 7, "min": 41, "name": "3fw61LrK"}], [{"max": 80, "min": 38, "name": "oQ34Idou"}, {"max": 82, "min": 0, "name": "FnpIqvv3"}, {"max": 91, "min": 10, "name": "YBgWoMGL"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 91, "role_flexing_second": 89}, "duration": 36, "max_number": 93, "min_number": 44, "player_max_number": 81, "player_min_number": 88}, {"combination": {"alliances": [[{"max": 49, "min": 100, "name": "e5TlmY4B"}, {"max": 20, "min": 12, "name": "ovxdzm5H"}, {"max": 14, "min": 72, "name": "rlJjyA27"}], [{"max": 98, "min": 26, "name": "8msC2QNR"}, {"max": 57, "min": 46, "name": "pvubRNKR"}, {"max": 84, "min": 71, "name": "lE6aGS41"}], [{"max": 40, "min": 93, "name": "x5RwMMpA"}, {"max": 68, "min": 52, "name": "xtSbtE68"}, {"max": 50, "min": 27, "name": "UJwN7bTe"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 8, "role_flexing_second": 39}, "duration": 45, "max_number": 18, "min_number": 93, "player_max_number": 50, "player_min_number": 31}, {"combination": {"alliances": [[{"max": 64, "min": 5, "name": "ka1IYdZg"}, {"max": 18, "min": 46, "name": "A7vjp0KT"}, {"max": 4, "min": 7, "name": "FhqvW0Rm"}], [{"max": 48, "min": 26, "name": "6l99vDj2"}, {"max": 71, "min": 70, "name": "ONeDAdOm"}, {"max": 33, "min": 4, "name": "1MeYCrGw"}], [{"max": 28, "min": 85, "name": "uuAgmCJd"}, {"max": 66, "min": 95, "name": "leDd0Y84"}, {"max": 71, "min": 44, "name": "n4AUUC0x"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 46, "role_flexing_second": 85}, "duration": 71, "max_number": 16, "min_number": 17, "player_max_number": 38, "player_min_number": 54}], "batch_size": 37, "bucket_mmr_rule": {"disable_authority": true, "flex_authority_count": 65, "flex_flat_step_range": 21, "flex_immunity_count": 19, "flex_range_max": 48, "flex_rate_ms": 49, "flex_step_max": 59, "force_authority_match": true, "initial_step_range": 10, "mmr_max": 34, "mmr_mean": 19, "mmr_min": 23, "mmr_std_dev": 11, "override_mmr_data": true, "use_bucket_mmr": true, "use_flat_flex_step": false}, "flexing_rule": [{"attribute": "iPiT9ywP", "criteria": "GuWLwVXz", "duration": 29, "reference": 0.8977191092351133}, {"attribute": "6bEadBO4", "criteria": "Kpxk5WIG", "duration": 65, "reference": 0.23134079312625022}, {"attribute": "uSRpEA39", "criteria": "Gx3wgnnB", "duration": 78, "reference": 0.18752654338483976}], "match_options": {"options": [{"name": "CpeRGUVX", "type": "u7jpJbzb"}, {"name": "oNssC72u", "type": "z0kcRLxF"}, {"name": "Ip9wyWhH", "type": "mO3jEhIA"}]}, "matching_rule": [{"attribute": "9KvlrNp1", "criteria": "qH1xt0QN", "reference": 0.902778916750381}, {"attribute": "aHFFx64Q", "criteria": "CEXDEMWG", "reference": 0.5215834069742556}, {"attribute": "ODfa1PEp", "criteria": "U3s0NEx1", "reference": 0.6714961657243005}], "rebalance_enable": false, "sort_ticket": {"search_result": "eTDTjFFq", "ticket_queue": "KflEvc5F"}, "sort_tickets": [{"search_result": "gLzpcd9D", "threshold": 25, "ticket_queue": "0F7XZZux"}, {"search_result": "Poiod0Dw", "threshold": 90, "ticket_queue": "MpNBzoEf"}, {"search_result": "icd16nT1", "threshold": 0, "ticket_queue": "tivRSO91"}], "sub_game_modes": {"DmSxRniK": {"alliance": {"combination": {"alliances": [[{"max": 28, "min": 52, "name": "Sn8TLtxm"}, {"max": 4, "min": 96, "name": "K7UXrE6v"}, {"max": 96, "min": 79, "name": "EwKw6GIH"}], [{"max": 81, "min": 46, "name": "I4chUWcS"}, {"max": 0, "min": 8, "name": "JHdwmUQA"}, {"max": 47, "min": 44, "name": "dpyu8GJu"}], [{"max": 17, "min": 20, "name": "jzNqgeSm"}, {"max": 39, "min": 43, "name": "ghdOF1BK"}, {"max": 46, "min": 94, "name": "VPmiaKyJ"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 51, "role_flexing_second": 67}, "max_number": 46, "min_number": 61, "player_max_number": 80, "player_min_number": 40}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 31, "min": 98, "name": "SCSBfbVx"}, {"max": 71, "min": 0, "name": "yFjW27Cf"}, {"max": 88, "min": 21, "name": "KPOgc6y8"}], [{"max": 24, "min": 65, "name": "FuirikEb"}, {"max": 33, "min": 57, "name": "AVCvKwrZ"}, {"max": 92, "min": 3, "name": "SNjqU8Ut"}], [{"max": 48, "min": 26, "name": "kfnhcpP5"}, {"max": 45, "min": 96, "name": "XM0rWUil"}, {"max": 98, "min": 57, "name": "zLWBEinw"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 59, "role_flexing_second": 6}, "duration": 21, "max_number": 11, "min_number": 73, "player_max_number": 6, "player_min_number": 27}, {"combination": {"alliances": [[{"max": 28, "min": 56, "name": "Rnq9CIWd"}, {"max": 92, "min": 65, "name": "WgARopjw"}, {"max": 30, "min": 77, "name": "0ITBz1no"}], [{"max": 21, "min": 43, "name": "sQaYfFuG"}, {"max": 2, "min": 16, "name": "gfcQGiy2"}, {"max": 61, "min": 93, "name": "qWGKldvs"}], [{"max": 36, "min": 96, "name": "yyC6sjhH"}, {"max": 88, "min": 44, "name": "qTb01CrW"}, {"max": 48, "min": 0, "name": "6c0l4N3K"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 44, "role_flexing_second": 61}, "duration": 2, "max_number": 45, "min_number": 83, "player_max_number": 2, "player_min_number": 13}, {"combination": {"alliances": [[{"max": 49, "min": 83, "name": "yCa3o4Wq"}, {"max": 22, "min": 98, "name": "AkxpC0lD"}, {"max": 14, "min": 80, "name": "ZWTgRRIw"}], [{"max": 69, "min": 72, "name": "dEaXJ23K"}, {"max": 74, "min": 36, "name": "XY2uJCQV"}, {"max": 32, "min": 16, "name": "wknFLhv4"}], [{"max": 92, "min": 64, "name": "8kpRg3Ho"}, {"max": 97, "min": 21, "name": "xlvqRzQk"}, {"max": 13, "min": 13, "name": "JiJjacgt"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 88, "role_flexing_second": 94}, "duration": 10, "max_number": 50, "min_number": 73, "player_max_number": 10, "player_min_number": 88}], "name": "wyUuZUSA"}, "ljeol31a": {"alliance": {"combination": {"alliances": [[{"max": 0, "min": 73, "name": "6TZlNUhD"}, {"max": 65, "min": 14, "name": "SNHj3bIC"}, {"max": 9, "min": 21, "name": "4KJj2OYP"}], [{"max": 64, "min": 60, "name": "R8hX38pQ"}, {"max": 70, "min": 68, "name": "RtfFLGit"}, {"max": 29, "min": 10, "name": "W2RfTyex"}], [{"max": 71, "min": 39, "name": "j5q16MMC"}, {"max": 63, "min": 61, "name": "mxDyruO3"}, {"max": 97, "min": 55, "name": "rL6I5TT7"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 45, "role_flexing_second": 18}, "max_number": 50, "min_number": 89, "player_max_number": 16, "player_min_number": 88}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 34, "min": 45, "name": "qumokEP7"}, {"max": 100, "min": 30, "name": "9cFqMMUl"}, {"max": 6, "min": 71, "name": "d6OmPj15"}], [{"max": 89, "min": 71, "name": "aEnIiyRT"}, {"max": 55, "min": 97, "name": "nJYxqDYx"}, {"max": 54, "min": 64, "name": "cs89xlNn"}], [{"max": 92, "min": 55, "name": "tbOe6Sc2"}, {"max": 1, "min": 78, "name": "XYuOrBf4"}, {"max": 40, "min": 41, "name": "41H0guEH"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 30, "role_flexing_second": 94}, "duration": 78, "max_number": 85, "min_number": 78, "player_max_number": 73, "player_min_number": 67}, {"combination": {"alliances": [[{"max": 62, "min": 65, "name": "OjiSqUuc"}, {"max": 44, "min": 81, "name": "r26WgQax"}, {"max": 58, "min": 6, "name": "vwNpY7PF"}], [{"max": 18, "min": 31, "name": "RMax3iOt"}, {"max": 64, "min": 66, "name": "LwBGEYaM"}, {"max": 31, "min": 9, "name": "M3fAR8Oi"}], [{"max": 72, "min": 24, "name": "GeXFvwF3"}, {"max": 52, "min": 40, "name": "aKdClCko"}, {"max": 19, "min": 50, "name": "TNRcdJcF"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 20, "role_flexing_second": 53}, "duration": 4, "max_number": 7, "min_number": 9, "player_max_number": 74, "player_min_number": 60}, {"combination": {"alliances": [[{"max": 73, "min": 91, "name": "l5bM7Lrp"}, {"max": 59, "min": 8, "name": "qTK1FJzM"}, {"max": 91, "min": 89, "name": "PYvVYXJP"}], [{"max": 25, "min": 27, "name": "OsEuN6Rp"}, {"max": 56, "min": 50, "name": "1PtamV5z"}, {"max": 5, "min": 76, "name": "4ivkq8my"}], [{"max": 98, "min": 96, "name": "2ivfK4tN"}, {"max": 96, "min": 20, "name": "KnYwGV17"}, {"max": 88, "min": 11, "name": "wg5uO7KT"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 58, "role_flexing_second": 19}, "duration": 85, "max_number": 97, "min_number": 37, "player_max_number": 75, "player_min_number": 19}], "name": "NnAxSL43"}, "o5EJeClj": {"alliance": {"combination": {"alliances": [[{"max": 83, "min": 93, "name": "zHwO3v5P"}, {"max": 23, "min": 1, "name": "tw6gtsBu"}, {"max": 85, "min": 11, "name": "bL59IduI"}], [{"max": 7, "min": 68, "name": "D3aG6QU9"}, {"max": 61, "min": 55, "name": "tuDQfmzg"}, {"max": 33, "min": 4, "name": "hpvS86VN"}], [{"max": 91, "min": 2, "name": "zo5lxWpR"}, {"max": 49, "min": 9, "name": "bb2OUHTC"}, {"max": 7, "min": 10, "name": "a0Ja5r9Q"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 10, "role_flexing_second": 10}, "max_number": 15, "min_number": 100, "player_max_number": 13, "player_min_number": 33}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 21, "min": 92, "name": "NJ43yZRK"}, {"max": 85, "min": 19, "name": "hKKawyBs"}, {"max": 49, "min": 35, "name": "EjsCgoXL"}], [{"max": 68, "min": 56, "name": "6EtNOICn"}, {"max": 61, "min": 6, "name": "cSCSEvDn"}, {"max": 80, "min": 17, "name": "Shqbbv9m"}], [{"max": 58, "min": 68, "name": "PtJDlmjX"}, {"max": 13, "min": 2, "name": "nY15DumW"}, {"max": 48, "min": 40, "name": "jsHDaEKm"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 40, "role_flexing_second": 98}, "duration": 89, "max_number": 88, "min_number": 14, "player_max_number": 28, "player_min_number": 45}, {"combination": {"alliances": [[{"max": 33, "min": 34, "name": "kOPHsEAl"}, {"max": 80, "min": 30, "name": "ONZ0waiy"}, {"max": 80, "min": 5, "name": "mCIwOTVu"}], [{"max": 42, "min": 54, "name": "sLb70iuS"}, {"max": 0, "min": 96, "name": "UppGTmRQ"}, {"max": 94, "min": 9, "name": "BA1YUvFw"}], [{"max": 42, "min": 78, "name": "7O0Edkyf"}, {"max": 30, "min": 8, "name": "Zmvkgcd7"}, {"max": 80, "min": 60, "name": "Tox15T5l"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 3, "role_flexing_second": 7}, "duration": 7, "max_number": 9, "min_number": 83, "player_max_number": 18, "player_min_number": 17}, {"combination": {"alliances": [[{"max": 35, "min": 57, "name": "SSIt7CfD"}, {"max": 19, "min": 22, "name": "rCKo6IhK"}, {"max": 16, "min": 95, "name": "dKUZ3bkm"}], [{"max": 84, "min": 11, "name": "p7gpVlqW"}, {"max": 33, "min": 42, "name": "rDbYlMVS"}, {"max": 14, "min": 86, "name": "T7L6prJE"}], [{"max": 64, "min": 77, "name": "9cc1a3SI"}, {"max": 93, "min": 47, "name": "cOHPTJOG"}, {"max": 24, "min": 2, "name": "kPKMLIxb"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 74, "role_flexing_second": 23}, "duration": 35, "max_number": 39, "min_number": 29, "player_max_number": 94, "player_min_number": 13}], "name": "DXhGMCL1"}}, "ticket_flexing_selection": "KntBOeaF", "ticket_flexing_selections": [{"selection": "oIJXJKOa", "threshold": 17}, {"selection": "6ZZAKomB", "threshold": 34}, {"selection": "qH9iAQBG", "threshold": 78}], "use_newest_ticket_for_flexing": true}, "session_queue_timeout_seconds": 24, "social_matchmaking": true, "sub_gamemode_selection": "random", "ticket_observability_enable": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName 'euYR7MK1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'MGS7p4yN' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "Y7kIxstc", "players": [{"results": [{"attribute": "7Obt7sir", "value": 0.5036050459651427}, {"attribute": "dUQVvEkI", "value": 0.23682633487188698}, {"attribute": "GdhYahIs", "value": 0.7305994757439936}], "user_id": "8BDjO7Vj"}, {"results": [{"attribute": "KDkT8fg4", "value": 0.043339760256934534}, {"attribute": "FyYoqqDu", "value": 0.13546304282489396}, {"attribute": "80A8ToJD", "value": 0.354225420028205}], "user_id": "Xmi0siBJ"}, {"results": [{"attribute": "N8qwaIly", "value": 0.3712183689142431}, {"attribute": "xyusv6lQ", "value": 0.43296764157876655}, {"attribute": "IbedyTYL", "value": 0.06709685771927743}], "user_id": "sTtBX4f1"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "P63liJuB"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "wYaqPvzQ", "client_version": "0ci3OKJ4", "deployment": "GRebJks7", "error_code": 22, "error_message": "XahUqnx1", "game_mode": "lT809uc7", "is_mock": "aM0LG92E", "joinable": false, "match_id": "hwZ1ZFj1", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 50, "party_attributes": {"RVbVdKr7": {}, "NEzBKw9z": {}, "AK6ZgySA": {}}, "party_id": "RSEbEdf4", "party_members": [{"extra_attributes": {"Rqdnug2L": {}, "nJNMBrgU": {}, "NnkJM50y": {}}, "user_id": "3GZmPJDx"}, {"extra_attributes": {"dFeZMM15": {}, "7EgkDvz1": {}, "KXFAx5qT": {}}, "user_id": "XiyKMzON"}, {"extra_attributes": {"uOCaJiJd": {}, "ayUuMF6L": {}, "S6YA2uVy": {}}, "user_id": "Ce3Jichz"}], "ticket_created_at": 73, "ticket_id": "fVNIQsKt"}, {"first_ticket_created_at": 44, "party_attributes": {"BKo1o2av": {}, "EYqFZHmU": {}, "cYh436Gr": {}}, "party_id": "drGV5b96", "party_members": [{"extra_attributes": {"UmwJ7Wj6": {}, "NTk6RhA9": {}, "KPVd1A8t": {}}, "user_id": "1UqriFvJ"}, {"extra_attributes": {"MpSehEdi": {}, "A6usrojD": {}, "TIAhOhOA": {}}, "user_id": "zlzx6d1d"}, {"extra_attributes": {"3jdWukxX": {}, "V541DVk3": {}, "jCePCRR3": {}}, "user_id": "iMJw00nJ"}], "ticket_created_at": 60, "ticket_id": "xKa9z25M"}, {"first_ticket_created_at": 96, "party_attributes": {"UQrWByUw": {}, "PDuTNiTn": {}, "L6nTfxBk": {}}, "party_id": "LM94h5ch", "party_members": [{"extra_attributes": {"AZQNtOTe": {}, "EqUpuYwZ": {}, "lVWuSSMq": {}}, "user_id": "EuRYJZ2K"}, {"extra_attributes": {"XR2hZP1i": {}, "xoanYy9W": {}, "CyQpWgyD": {}}, "user_id": "uz8N1WeD"}, {"extra_attributes": {"rvfpFiob": {}, "uA1vc4YO": {}, "EVkWPMfW": {}}, "user_id": "HEvIA3px"}], "ticket_created_at": 5, "ticket_id": "FJr75niu"}]}, {"matching_parties": [{"first_ticket_created_at": 68, "party_attributes": {"MC55E9ta": {}, "KuhrlNu5": {}, "tmonCq46": {}}, "party_id": "oZDcPqDL", "party_members": [{"extra_attributes": {"cMZVHeDi": {}, "pDRvlcVl": {}, "brpFNnI7": {}}, "user_id": "VkXaX9Pe"}, {"extra_attributes": {"DrUg9k8V": {}, "YpowN4Yd": {}, "3YzDSaxt": {}}, "user_id": "eXAJqNHr"}, {"extra_attributes": {"h3UsO5OE": {}, "2ONaExGU": {}, "BXOskdxN": {}}, "user_id": "GnxwMkxz"}], "ticket_created_at": 52, "ticket_id": "e9cIebCp"}, {"first_ticket_created_at": 19, "party_attributes": {"gSOanh3N": {}, "PcyydUWT": {}, "UcXFYI4P": {}}, "party_id": "bab2HOQQ", "party_members": [{"extra_attributes": {"nluqHTOv": {}, "usczELo7": {}, "bQiqWIb1": {}}, "user_id": "M8GVDGaa"}, {"extra_attributes": {"acimRVok": {}, "gPeUnatV": {}, "XFIJUC0Y": {}}, "user_id": "u6VB8Oay"}, {"extra_attributes": {"jnF9WEar": {}, "RXk7Jn2L": {}, "0Z3Fc5qF": {}}, "user_id": "YbJAzR8u"}], "ticket_created_at": 38, "ticket_id": "JNi9Zp24"}, {"first_ticket_created_at": 79, "party_attributes": {"4wpQBhXC": {}, "pkTJW1py": {}, "zO7O9NMO": {}}, "party_id": "kYahVemP", "party_members": [{"extra_attributes": {"q6eRAY2B": {}, "NP2tiRcr": {}, "kKqrOSq9": {}}, "user_id": "uWaDDAPq"}, {"extra_attributes": {"hrVLJYmp": {}, "SwQHuvJt": {}, "PsZy7gsR": {}}, "user_id": "m6kB4MJ5"}, {"extra_attributes": {"Yueh4AFm": {}, "9UWh9Lcd": {}, "T8e8KVu7": {}}, "user_id": "b3I4isxL"}], "ticket_created_at": 26, "ticket_id": "CYYDWE0D"}]}, {"matching_parties": [{"first_ticket_created_at": 56, "party_attributes": {"EW7n0WYw": {}, "FEDVUvZC": {}, "Ew28FwTp": {}}, "party_id": "uq9InSFi", "party_members": [{"extra_attributes": {"sXGJ1TpS": {}, "5B23mlf5": {}, "FCZsW6Ef": {}}, "user_id": "YUI4Txhe"}, {"extra_attributes": {"vQpPtySi": {}, "kdJR5nhv": {}, "nofmL1AD": {}}, "user_id": "rydRZs3e"}, {"extra_attributes": {"jzoSpBeS": {}, "Xd6ZiHZL": {}, "JR3muskD": {}}, "user_id": "J0TN4SNs"}], "ticket_created_at": 25, "ticket_id": "rQrN2ZdG"}, {"first_ticket_created_at": 51, "party_attributes": {"HcblSFq7": {}, "agFanv59": {}, "W61sLI4e": {}}, "party_id": "U00dr8ey", "party_members": [{"extra_attributes": {"MDp8esfe": {}, "sSu0O4Wl": {}, "E6uXzRqs": {}}, "user_id": "J1lGtld7"}, {"extra_attributes": {"djkymDKg": {}, "ykCOS6ba": {}, "7veIDGES": {}}, "user_id": "6K0Mi8fq"}, {"extra_attributes": {"Zurdl3y8": {}, "Hs5Z2dY7": {}, "BKD6UHi3": {}}, "user_id": "s8RJOs2i"}], "ticket_created_at": 4, "ticket_id": "leGpERB0"}, {"first_ticket_created_at": 45, "party_attributes": {"roVDJRsE": {}, "6gwSSHGh": {}, "xOrg8jre": {}}, "party_id": "efHVLzjp", "party_members": [{"extra_attributes": {"sSdzCe8H": {}, "YxPr80Ls": {}, "YWtXK4an": {}}, "user_id": "N4uyzacK"}, {"extra_attributes": {"ndQ28EUh": {}, "586jVMEB": {}, "FKGYyoLW": {}}, "user_id": "JMIecNHs"}, {"extra_attributes": {"cHubmwnl": {}, "uE56kiVf": {}, "BNvjFAdz": {}}, "user_id": "LKTJTKug"}], "ticket_created_at": 54, "ticket_id": "tKSGnNa6"}]}], "namespace": "O4c1guN0", "party_attributes": {"ra7RQboS": {}, "TEeNK1tR": {}, "Kogctkgw": {}}, "party_id": "8LodJvey", "queued_at": 24, "region": "bsZtZK9n", "server_name": "B4aKHc3z", "status": "dxD5JujQ", "ticket_id": "qaDT7Ees", "ticket_ids": ["1zPylQnV", "MuN6nE98", "sNlbJ8KV"], "updated_at": "1995-09-10T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "DlrAvzUa"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'bxPlxoSK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 63, "userID": "Nmh1eKiB", "weight": 0.8906247715472927}' \
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
    --matchIDs 'P6bson0L' \
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
    --strategy 'jyV9dIzU' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'L62f9RD0' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'pzMC0k9M' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatchOnDifferentTeam", "deployment": "NUMEkmtr", "description": "EeZmuNRy", "findMatchTimeoutSeconds": 36, "joinable": true, "max_delay_ms": 35, "region_expansion_range_ms": 45, "region_expansion_rate_ms": 1, "region_latency_initial_range_ms": 90, "region_latency_max_ms": 33, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 87, "min": 62, "name": "W0ggVdXx"}, {"max": 9, "min": 13, "name": "SCZbHphM"}, {"max": 19, "min": 43, "name": "xVJOi5En"}], [{"max": 12, "min": 95, "name": "dQME0bLc"}, {"max": 6, "min": 84, "name": "99cPRsDa"}, {"max": 6, "min": 62, "name": "V0Esc4Ss"}], [{"max": 18, "min": 11, "name": "pc250E6N"}, {"max": 89, "min": 35, "name": "4eWc7zXY"}, {"max": 31, "min": 48, "name": "suXLcszf"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 55, "role_flexing_second": 92}, "maxNumber": 34, "minNumber": 46, "playerMaxNumber": 10, "playerMinNumber": 68}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 16, "min": 8, "name": "PGJgPyNV"}, {"max": 92, "min": 59, "name": "jTb764g6"}, {"max": 86, "min": 5, "name": "I1mRvcKZ"}], [{"max": 50, "min": 8, "name": "sffjAhgP"}, {"max": 77, "min": 22, "name": "Kgx0QYRa"}, {"max": 92, "min": 36, "name": "CFB3Vrbs"}], [{"max": 7, "min": 21, "name": "VJmCJBdS"}, {"max": 52, "min": 72, "name": "A9Au9vWG"}, {"max": 83, "min": 33, "name": "avA5IjyB"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 52, "role_flexing_second": 28}, "duration": 85, "max_number": 39, "min_number": 19, "player_max_number": 7, "player_min_number": 40}, {"combination": {"alliances": [[{"max": 3, "min": 40, "name": "2tlalFMi"}, {"max": 22, "min": 100, "name": "L3UV7gz3"}, {"max": 91, "min": 77, "name": "CmA56Wss"}], [{"max": 46, "min": 43, "name": "LzkH8LHy"}, {"max": 90, "min": 88, "name": "Ea15xl6t"}, {"max": 92, "min": 63, "name": "EvL78OTm"}], [{"max": 7, "min": 80, "name": "zzD4UEDE"}, {"max": 60, "min": 64, "name": "yU2gUndM"}, {"max": 36, "min": 79, "name": "mYluAB74"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 1, "role_flexing_second": 90}, "duration": 50, "max_number": 37, "min_number": 49, "player_max_number": 90, "player_min_number": 49}, {"combination": {"alliances": [[{"max": 43, "min": 31, "name": "gOysup2t"}, {"max": 26, "min": 65, "name": "wa9F6aDf"}, {"max": 1, "min": 28, "name": "piAxY0ce"}], [{"max": 75, "min": 22, "name": "XUIwRpV6"}, {"max": 74, "min": 63, "name": "s2LAVxXd"}, {"max": 0, "min": 86, "name": "iPUibwI9"}], [{"max": 72, "min": 42, "name": "mNM0yUnp"}, {"max": 45, "min": 94, "name": "Q1RjNma7"}, {"max": 25, "min": 50, "name": "VSegYJpn"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 95, "role_flexing_second": 68}, "duration": 44, "max_number": 20, "min_number": 0, "player_max_number": 48, "player_min_number": 75}], "batch_size": 13, "bucket_mmr_rule": {"disable_authority": true, "flex_authority_count": 68, "flex_flat_step_range": 54, "flex_immunity_count": 70, "flex_range_max": 42, "flex_rate_ms": 2, "flex_step_max": 38, "force_authority_match": true, "initial_step_range": 88, "mmr_max": 30, "mmr_mean": 94, "mmr_min": 75, "mmr_std_dev": 86, "override_mmr_data": false, "use_bucket_mmr": false, "use_flat_flex_step": true}, "flexingRules": [{"attribute": "nxUn5sQH", "criteria": "CN2qHkQ0", "duration": 47, "reference": 0.941903267739246}, {"attribute": "F5ijNlCX", "criteria": "HQpRo7Ll", "duration": 4, "reference": 0.4588172049351793}, {"attribute": "ZBEXtH5v", "criteria": "LvpgDYui", "duration": 42, "reference": 0.044530022688537785}], "match_options": {"options": [{"name": "lTkBr4ta", "type": "PkjG84eR"}, {"name": "gxXciVph", "type": "QVJxORfA"}, {"name": "9xH09d2z", "type": "tsRd94Oy"}]}, "matchingRules": [{"attribute": "eOnDlrIy", "criteria": "78QZDMVB", "reference": 0.2459060159511417}, {"attribute": "QEK331l3", "criteria": "k4aSEn7g", "reference": 0.7618589659681787}, {"attribute": "ZoCDlkQh", "criteria": "7u3m6wsR", "reference": 0.38380753859584615}], "sort_ticket": {"search_result": "0QyPdpVi", "ticket_queue": "GJ3hPAkQ"}, "sort_tickets": [{"search_result": "3MjevvzS", "threshold": 17, "ticket_queue": "1QNDv7uY"}, {"search_result": "BP0hXrV4", "threshold": 39, "ticket_queue": "CYBcB3nR"}, {"search_result": "PMnCCcSC", "threshold": 36, "ticket_queue": "goSWMqFl"}], "sub_game_modes": {}, "ticket_flexing_selection": "vDspx09p", "ticket_flexing_selections": [{"selection": "UBtR5mYo", "threshold": 28}, {"selection": "5gs7vI56", "threshold": 34}, {"selection": "ZswurHnz", "threshold": 96}], "use_newest_ticket_for_flexing": true}, "sessionQueueTimeoutSeconds": 5, "socialMatchmaking": true, "sub_gamemode_selection": "ticketOrder", "ticket_observability_enable": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName 'JsvkZbcH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName 'vj8y4xWo' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName 'zUuSiTRs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 58}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName 'Yf5lr38n' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName 'Ftr5In5n' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "6CZo9nMG", "count": 0, "mmrMax": 0.8966502199515843, "mmrMean": 0.7965005045312844, "mmrMin": 0.013763306981514956, "mmrStdDev": 0.09338340820464897}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'W5Lubimu' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 76, "party_attributes": {"OrVgOo0n": {}, "1F2HeNqp": {}, "ABwUFrp6": {}}, "party_id": "QByeanpe", "party_members": [{"extra_attributes": {"YOkmljHi": {}, "Ucr8MaYA": {}, "mAzDluiG": {}}, "user_id": "d5R6OfjZ"}, {"extra_attributes": {"hMiWrLcX": {}, "QVvz7L3a": {}, "SZCN2GqQ": {}}, "user_id": "GmMguL1u"}, {"extra_attributes": {"1l53UZyd": {}, "sR3KsWot": {}, "O4IbGf9X": {}}, "user_id": "mkzYCfxy"}], "ticket_created_at": 94, "ticket_id": "aLdfUk0C"}, {"first_ticket_created_at": 85, "party_attributes": {"4lKm06OG": {}, "QRkaHUap": {}, "iLKX8PIB": {}}, "party_id": "Rrrqk4DV", "party_members": [{"extra_attributes": {"zatCqZE1": {}, "feqzem5R": {}, "FgtI6voD": {}}, "user_id": "YoFkPQZL"}, {"extra_attributes": {"paBFdsq9": {}, "9JJ0AfHX": {}, "JDnffoLk": {}}, "user_id": "g924dIWM"}, {"extra_attributes": {"k0KxyWq5": {}, "g52d97JV": {}, "lDR0ZfHK": {}}, "user_id": "B4cJw9h8"}], "ticket_created_at": 67, "ticket_id": "weVy5D6S"}, {"first_ticket_created_at": 27, "party_attributes": {"1XUsa8se": {}, "aHs27BVq": {}, "daPYmUid": {}}, "party_id": "pbyaLWwt", "party_members": [{"extra_attributes": {"Nnv8BLPK": {}, "pRf1aQi0": {}, "kLKJjJ5j": {}}, "user_id": "xHaprFsS"}, {"extra_attributes": {"ct0ZdYod": {}, "pmgBf7te": {}, "zClEcsiR": {}}, "user_id": "Yv7TAebN"}, {"extra_attributes": {"G2mMsOfg": {}, "xgozcdru": {}, "bf0raoOB": {}}, "user_id": "7uegeYSW"}], "ticket_created_at": 2, "ticket_id": "QMIBuxZW"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName 'KntwuT9A' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 39}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'E61GWEF1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'TC2aVR3F' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'bOqS43UG' \
    --matchID '0TKaYqnp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["wFTQshWW", "fOJ7Bv09", "jVH3eWA9"], "party_id": "7yd7f7i4", "user_id": "ArwOQi9C"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'HErSXDd6' \
    --matchID 'mSBxDJss' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName '6oPVrZmN' \
    --matchID 'D9QisZCg' \
    --namespace "$AB_NAMESPACE" \
    --userID 'qj4Jb1j0' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName 's8FpYUlG' \
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
    --channelName '0CU8CoHQ' \
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