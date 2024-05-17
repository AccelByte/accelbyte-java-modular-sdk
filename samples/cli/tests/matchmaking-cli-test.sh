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
    --limit '34' \
    --offset '5' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatchOnDifferentTeam", "deployment": "B9KaGYdU", "description": "LTsKMhRR", "find_match_timeout_seconds": 11, "game_mode": "N69n1UM1", "joinable": false, "max_delay_ms": 55, "region_expansion_range_ms": 98, "region_expansion_rate_ms": 64, "region_latency_initial_range_ms": 37, "region_latency_max_ms": 85, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 45, "min": 76, "name": "5N7WkiHx"}, {"max": 97, "min": 18, "name": "JomaGXjl"}, {"max": 46, "min": 39, "name": "ONaVf1KO"}], [{"max": 87, "min": 58, "name": "EXDYD0J4"}, {"max": 74, "min": 28, "name": "xNCyS5sY"}, {"max": 95, "min": 48, "name": "BoggPmDp"}], [{"max": 50, "min": 69, "name": "FKe9biJj"}, {"max": 88, "min": 93, "name": "JWAl6HHq"}, {"max": 90, "min": 29, "name": "8OQPrwaN"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 6, "role_flexing_second": 27}, "max_number": 4, "min_number": 64, "player_max_number": 91, "player_min_number": 32}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 97, "min": 45, "name": "ig8Z769R"}, {"max": 2, "min": 15, "name": "lHgAdPhu"}, {"max": 51, "min": 16, "name": "eRpNp6BZ"}], [{"max": 76, "min": 82, "name": "JKMQ8dDq"}, {"max": 87, "min": 71, "name": "Hlk3mbvA"}, {"max": 36, "min": 91, "name": "gJQ2V96W"}], [{"max": 89, "min": 35, "name": "IyboYOWl"}, {"max": 41, "min": 83, "name": "ltAfTERS"}, {"max": 63, "min": 91, "name": "QMJREeV0"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 42, "role_flexing_second": 17}, "duration": 1, "max_number": 62, "min_number": 70, "player_max_number": 39, "player_min_number": 30}, {"combination": {"alliances": [[{"max": 82, "min": 38, "name": "6y7KuOJR"}, {"max": 61, "min": 72, "name": "wJMBOBBi"}, {"max": 6, "min": 80, "name": "S4Cy5IMA"}], [{"max": 71, "min": 65, "name": "DyOpdaRf"}, {"max": 7, "min": 58, "name": "46ojPTTp"}, {"max": 36, "min": 88, "name": "TFNzEc3y"}], [{"max": 83, "min": 50, "name": "NVc8iEal"}, {"max": 14, "min": 81, "name": "gDf7MNMF"}, {"max": 48, "min": 24, "name": "BPRGJWR3"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 67, "role_flexing_second": 63}, "duration": 64, "max_number": 78, "min_number": 56, "player_max_number": 9, "player_min_number": 92}, {"combination": {"alliances": [[{"max": 85, "min": 27, "name": "ZHxEC9Vg"}, {"max": 1, "min": 78, "name": "EBdau31v"}, {"max": 99, "min": 97, "name": "yqjaGkXm"}], [{"max": 78, "min": 3, "name": "LJPfmr1y"}, {"max": 60, "min": 2, "name": "Bvx0HMrq"}, {"max": 73, "min": 14, "name": "BSr6DfTt"}], [{"max": 1, "min": 57, "name": "DFMvyXo9"}, {"max": 65, "min": 86, "name": "3IYPHy4S"}, {"max": 81, "min": 92, "name": "KLZ3a3a5"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 72, "role_flexing_second": 57}, "duration": 99, "max_number": 98, "min_number": 26, "player_max_number": 24, "player_min_number": 39}], "batch_size": 44, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 57, "flex_flat_step_range": 83, "flex_immunity_count": 97, "flex_range_max": 69, "flex_rate_ms": 84, "flex_step_max": 45, "force_authority_match": true, "initial_step_range": 12, "mmr_max": 43, "mmr_mean": 18, "mmr_min": 49, "mmr_std_dev": 26, "override_mmr_data": true, "use_bucket_mmr": true, "use_flat_flex_step": false}, "flexing_rule": [{"attribute": "1oq8s699", "criteria": "UqbFSqlU", "duration": 17, "reference": 0.5520855019841615}, {"attribute": "O7dsCFQk", "criteria": "xWyVmBQJ", "duration": 34, "reference": 0.08492073919819532}, {"attribute": "IrEOzb4Z", "criteria": "DoRjfVmY", "duration": 12, "reference": 0.9795390249907194}], "match_options": {"options": [{"name": "osPYCC8l", "type": "mWfkBVTw"}, {"name": "GMB2Bb8g", "type": "Iu0LouPn"}, {"name": "O0icWtAZ", "type": "W2edSktw"}]}, "matching_rule": [{"attribute": "YSn24lJV", "criteria": "8IhXb6HP", "reference": 0.10285468920619312}, {"attribute": "CN0mRtO7", "criteria": "1ycuHezD", "reference": 0.7867526713387101}, {"attribute": "zcNXf6NK", "criteria": "qeiqe433", "reference": 0.534479757139934}], "rebalance_enable": false, "sort_ticket": {"search_result": "yq6bEOGf", "ticket_queue": "DsAwUCCA"}, "sort_tickets": [{"search_result": "khFhRyaX", "threshold": 89, "ticket_queue": "bbP1has3"}, {"search_result": "xiq3gDDS", "threshold": 63, "ticket_queue": "tYbIGbaT"}, {"search_result": "MrqfJqAb", "threshold": 48, "ticket_queue": "RqreuEpa"}], "sub_game_modes": {"Eb1coh8N": {"alliance": {"combination": {"alliances": [[{"max": 99, "min": 68, "name": "P9HTPwfF"}, {"max": 89, "min": 41, "name": "RAQlZ27X"}, {"max": 5, "min": 87, "name": "NttQ2mGL"}], [{"max": 95, "min": 98, "name": "QyxSmq5g"}, {"max": 36, "min": 38, "name": "cBgbgBDd"}, {"max": 47, "min": 57, "name": "LbBPTr64"}], [{"max": 47, "min": 35, "name": "SbSwbuGs"}, {"max": 59, "min": 37, "name": "QlQahA2z"}, {"max": 84, "min": 36, "name": "cgkXwDan"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 74, "role_flexing_second": 95}, "max_number": 13, "min_number": 55, "player_max_number": 85, "player_min_number": 75}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 98, "min": 77, "name": "f6xM6B6N"}, {"max": 25, "min": 73, "name": "cy7MHNCZ"}, {"max": 100, "min": 74, "name": "HHRSYQFB"}], [{"max": 36, "min": 36, "name": "Go9sISBm"}, {"max": 16, "min": 62, "name": "XVvH3MeT"}, {"max": 60, "min": 18, "name": "ZbuniOyb"}], [{"max": 36, "min": 31, "name": "pavcGdff"}, {"max": 34, "min": 35, "name": "QvSSwtuP"}, {"max": 18, "min": 95, "name": "VQaMTwn4"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 52, "role_flexing_second": 62}, "duration": 11, "max_number": 81, "min_number": 4, "player_max_number": 21, "player_min_number": 17}, {"combination": {"alliances": [[{"max": 88, "min": 72, "name": "rF41dw9k"}, {"max": 36, "min": 61, "name": "1VDDpKjF"}, {"max": 96, "min": 91, "name": "GOnD5Hiy"}], [{"max": 46, "min": 55, "name": "HVJaWrlj"}, {"max": 13, "min": 2, "name": "QU2pra4u"}, {"max": 46, "min": 4, "name": "NsDJGatk"}], [{"max": 62, "min": 64, "name": "ULw4441u"}, {"max": 14, "min": 50, "name": "kVD4J3va"}, {"max": 42, "min": 51, "name": "Lih8q44W"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 6, "role_flexing_second": 21}, "duration": 16, "max_number": 91, "min_number": 61, "player_max_number": 16, "player_min_number": 94}, {"combination": {"alliances": [[{"max": 93, "min": 99, "name": "xruccxoZ"}, {"max": 79, "min": 30, "name": "Y8xqYrOD"}, {"max": 71, "min": 65, "name": "HTj9yJJF"}], [{"max": 98, "min": 91, "name": "ffuVDWkI"}, {"max": 44, "min": 7, "name": "pYFGftB5"}, {"max": 80, "min": 68, "name": "w1aHozRv"}], [{"max": 72, "min": 68, "name": "ZdfAQoC7"}, {"max": 92, "min": 63, "name": "5s5NrKbI"}, {"max": 80, "min": 14, "name": "z5KesdbG"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 50, "role_flexing_second": 27}, "duration": 61, "max_number": 25, "min_number": 70, "player_max_number": 59, "player_min_number": 90}], "name": "mg7fTdj1"}, "4PHLgHiN": {"alliance": {"combination": {"alliances": [[{"max": 37, "min": 15, "name": "Mn6QBaK5"}, {"max": 39, "min": 91, "name": "6ZKxONPL"}, {"max": 53, "min": 11, "name": "sc1FFlv4"}], [{"max": 71, "min": 78, "name": "ijlS5RnZ"}, {"max": 32, "min": 65, "name": "IdeaTMNF"}, {"max": 18, "min": 6, "name": "963ixYsN"}], [{"max": 19, "min": 73, "name": "d6V5mPQz"}, {"max": 81, "min": 56, "name": "wJjnAaxn"}, {"max": 61, "min": 76, "name": "D2raKbre"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 22, "role_flexing_second": 72}, "max_number": 66, "min_number": 22, "player_max_number": 16, "player_min_number": 11}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 59, "min": 21, "name": "1ACrsgoB"}, {"max": 8, "min": 66, "name": "L6oEWzpS"}, {"max": 21, "min": 41, "name": "FLl12ivX"}], [{"max": 13, "min": 95, "name": "5n2Z7qGg"}, {"max": 50, "min": 91, "name": "lVrDF448"}, {"max": 53, "min": 97, "name": "5iv645aV"}], [{"max": 28, "min": 11, "name": "7h8WBzEK"}, {"max": 72, "min": 24, "name": "BLhsVgz1"}, {"max": 24, "min": 60, "name": "PFYfztwQ"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 51, "role_flexing_second": 80}, "duration": 47, "max_number": 78, "min_number": 4, "player_max_number": 75, "player_min_number": 88}, {"combination": {"alliances": [[{"max": 2, "min": 58, "name": "WnXhP2xj"}, {"max": 31, "min": 10, "name": "X25U50pd"}, {"max": 95, "min": 48, "name": "TbkM5YNW"}], [{"max": 93, "min": 69, "name": "ZoizXhbP"}, {"max": 58, "min": 78, "name": "hIPA7YSm"}, {"max": 93, "min": 71, "name": "LpeKhg7x"}], [{"max": 32, "min": 18, "name": "mo3phbr7"}, {"max": 45, "min": 80, "name": "YUMkNV2P"}, {"max": 28, "min": 10, "name": "iqaPLoL8"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 84, "role_flexing_second": 25}, "duration": 64, "max_number": 7, "min_number": 90, "player_max_number": 88, "player_min_number": 20}, {"combination": {"alliances": [[{"max": 100, "min": 88, "name": "IXtmnxYk"}, {"max": 57, "min": 78, "name": "ObmL0Vvw"}, {"max": 20, "min": 86, "name": "3b7FtkDL"}], [{"max": 30, "min": 14, "name": "5zN6oHYH"}, {"max": 57, "min": 8, "name": "9dsqjyqr"}, {"max": 98, "min": 33, "name": "hJ8CybhR"}], [{"max": 30, "min": 56, "name": "HNEjSymG"}, {"max": 95, "min": 47, "name": "i4Z54Umb"}, {"max": 10, "min": 87, "name": "ovkPzYg4"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 30, "role_flexing_second": 79}, "duration": 55, "max_number": 28, "min_number": 14, "player_max_number": 58, "player_min_number": 18}], "name": "9KhsPnUW"}, "SGAF1ymc": {"alliance": {"combination": {"alliances": [[{"max": 7, "min": 21, "name": "BE1LTCh0"}, {"max": 100, "min": 97, "name": "pJlwlgpl"}, {"max": 60, "min": 36, "name": "s51bgunj"}], [{"max": 12, "min": 22, "name": "EXJ3Nx6M"}, {"max": 62, "min": 42, "name": "w9uKm2FT"}, {"max": 47, "min": 93, "name": "u52F88TJ"}], [{"max": 67, "min": 38, "name": "cwbNhCRH"}, {"max": 82, "min": 59, "name": "QNypKLZv"}, {"max": 44, "min": 30, "name": "z7j1BC00"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 58, "role_flexing_second": 65}, "max_number": 57, "min_number": 75, "player_max_number": 43, "player_min_number": 2}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 39, "min": 89, "name": "vkvVPEiK"}, {"max": 68, "min": 11, "name": "Vkqq8tqF"}, {"max": 8, "min": 17, "name": "ZDYTCtvi"}], [{"max": 83, "min": 82, "name": "hxxhKMi9"}, {"max": 12, "min": 4, "name": "nLXzb7DI"}, {"max": 3, "min": 47, "name": "bXrn1s8q"}], [{"max": 62, "min": 15, "name": "KjrogKCP"}, {"max": 80, "min": 78, "name": "3jvqGTmg"}, {"max": 54, "min": 75, "name": "rdgYuKFz"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 17, "role_flexing_second": 31}, "duration": 14, "max_number": 22, "min_number": 61, "player_max_number": 51, "player_min_number": 20}, {"combination": {"alliances": [[{"max": 19, "min": 5, "name": "iDPo4AOO"}, {"max": 78, "min": 39, "name": "L2fI2WWD"}, {"max": 72, "min": 34, "name": "DdsuTCr8"}], [{"max": 85, "min": 31, "name": "budGgUxu"}, {"max": 3, "min": 79, "name": "iSBF0nNU"}, {"max": 18, "min": 86, "name": "Ppgdl64Q"}], [{"max": 58, "min": 50, "name": "oGnmNmhA"}, {"max": 72, "min": 22, "name": "lyHVcJrY"}, {"max": 26, "min": 50, "name": "WqAo9DEF"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 17, "role_flexing_second": 100}, "duration": 49, "max_number": 66, "min_number": 32, "player_max_number": 52, "player_min_number": 32}, {"combination": {"alliances": [[{"max": 85, "min": 79, "name": "uP5bdffI"}, {"max": 7, "min": 89, "name": "lLNQgUH8"}, {"max": 92, "min": 34, "name": "PMw9MNzq"}], [{"max": 16, "min": 42, "name": "RskJd2j8"}, {"max": 21, "min": 40, "name": "rPWXaqus"}, {"max": 95, "min": 35, "name": "cSLoZpdY"}], [{"max": 16, "min": 8, "name": "JDFoBHWX"}, {"max": 97, "min": 12, "name": "felxpDYZ"}, {"max": 74, "min": 6, "name": "QHGAWQqO"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 63, "role_flexing_second": 40}, "duration": 78, "max_number": 37, "min_number": 42, "player_max_number": 37, "player_min_number": 83}], "name": "fwGNSgL1"}}, "ticket_flexing_selection": "kfe7WfHy", "ticket_flexing_selections": [{"selection": "vdQqYG3e", "threshold": 40}, {"selection": "Nw8nymaR", "threshold": 54}, {"selection": "UUvGiLpM", "threshold": 74}], "use_newest_ticket_for_flexing": false}, "session_queue_timeout_seconds": 52, "social_matchmaking": true, "sub_gamemode_selection": "random", "ticket_observability_enable": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName 'iPTe6mRJ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'FWTEen2x' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "l0PwsIco", "players": [{"results": [{"attribute": "ixVrhJt7", "value": 0.8613320651693316}, {"attribute": "T1t9Zko2", "value": 0.27814258524527835}, {"attribute": "iErjJXuw", "value": 0.4367589280565326}], "user_id": "TFknULmH"}, {"results": [{"attribute": "vubLviaX", "value": 0.21951477542159614}, {"attribute": "3672Fhy8", "value": 0.23142989753837218}, {"attribute": "Zmo44Flu", "value": 0.11106510181653839}], "user_id": "aAk9s6HQ"}, {"results": [{"attribute": "ohOJzL9Q", "value": 0.6929179637150613}, {"attribute": "OixR7b0S", "value": 0.07639296649925509}, {"attribute": "McyCSORt", "value": 0.4757287971760018}], "user_id": "jC98ipzw"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "g1D4uuIP"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "g4adfWXL", "client_version": "cboygrl0", "deployment": "7rKgsQyy", "error_code": 11, "error_message": "qlQZsCrL", "game_mode": "pE7C2ZJX", "is_mock": "OBU60Q8a", "joinable": false, "match_id": "lEw652RN", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 87, "party_attributes": {"67jFCjXi": {}, "LtDucoQC": {}, "KopNexwe": {}}, "party_id": "BtfkSV71", "party_members": [{"extra_attributes": {"m89293No": {}, "L5PtFoYW": {}, "HfEtdh0Q": {}}, "user_id": "drMdZ5KN"}, {"extra_attributes": {"AY6MN6Tg": {}, "bzPkN272": {}, "Oatcw4mg": {}}, "user_id": "dzGCfXRe"}, {"extra_attributes": {"5sJpPY9v": {}, "AKukd1Mn": {}, "StGHW5E7": {}}, "user_id": "DzgUtfri"}], "ticket_created_at": 22, "ticket_id": "0a0Cl2bS"}, {"first_ticket_created_at": 94, "party_attributes": {"QHJ1YcMo": {}, "at8s5ld4": {}, "C0OUCYyu": {}}, "party_id": "v6gTdpVi", "party_members": [{"extra_attributes": {"s3YHLbQD": {}, "hDoSS29T": {}, "yHEtzj0P": {}}, "user_id": "9CZfPHo2"}, {"extra_attributes": {"aBkaNTt3": {}, "JTwNjL1R": {}, "hZp1X4jQ": {}}, "user_id": "sOjKbzF1"}, {"extra_attributes": {"nynee2Wg": {}, "lrDA1DLN": {}, "Otsj0fy6": {}}, "user_id": "g4MH0CmX"}], "ticket_created_at": 28, "ticket_id": "8in7Ays5"}, {"first_ticket_created_at": 50, "party_attributes": {"aSak5Ev6": {}, "J7CY7KRo": {}, "f7JPNtNp": {}}, "party_id": "TE5T8R2G", "party_members": [{"extra_attributes": {"7GdQmOIs": {}, "VpOiLBRF": {}, "Q1Qjfivw": {}}, "user_id": "vqBamfk3"}, {"extra_attributes": {"7UMY0wby": {}, "pwAP4Xx7": {}, "Vfit96nb": {}}, "user_id": "kMMv2JcV"}, {"extra_attributes": {"wp17DEwB": {}, "AhuWFA5i": {}, "RVPdgaeX": {}}, "user_id": "Kkx6HXsc"}], "ticket_created_at": 17, "ticket_id": "qdNI8oBq"}]}, {"matching_parties": [{"first_ticket_created_at": 15, "party_attributes": {"bCdS0ifU": {}, "66gC9iZt": {}, "ZMouQUUX": {}}, "party_id": "OQarYESZ", "party_members": [{"extra_attributes": {"9Mm9TYeF": {}, "XBpmqX3o": {}, "Nh1yWcyQ": {}}, "user_id": "3PltLDNI"}, {"extra_attributes": {"IJ3McLVF": {}, "VclWZKKK": {}, "TOBvAkqv": {}}, "user_id": "9PFFbqYT"}, {"extra_attributes": {"29lC5Bgq": {}, "LETGi6GU": {}, "hcWBOY98": {}}, "user_id": "0MHdYSso"}], "ticket_created_at": 35, "ticket_id": "5uwoMp5k"}, {"first_ticket_created_at": 78, "party_attributes": {"zuqWXqrg": {}, "6xUKhNlA": {}, "wZ3REGfh": {}}, "party_id": "AbnMpt13", "party_members": [{"extra_attributes": {"JJ1EaTbl": {}, "7RuXDipE": {}, "Ju5bmIRZ": {}}, "user_id": "OjVnFLwB"}, {"extra_attributes": {"yA9Tcarp": {}, "ZDLssQNj": {}, "QXoI9WlB": {}}, "user_id": "ibplutDt"}, {"extra_attributes": {"qXOCu0u1": {}, "EQ1MlPUJ": {}, "r646v9Gg": {}}, "user_id": "4BcYgW3K"}], "ticket_created_at": 47, "ticket_id": "Qz3hUA9N"}, {"first_ticket_created_at": 30, "party_attributes": {"AnEPHQ9O": {}, "8dGN8as8": {}, "K8SNg8MB": {}}, "party_id": "HFvWh9zY", "party_members": [{"extra_attributes": {"YXAFU61w": {}, "qqd31F1l": {}, "ILeQfGok": {}}, "user_id": "WFikJ8j1"}, {"extra_attributes": {"N7IS9Mxq": {}, "1KdF1TPC": {}, "gzi9xBsS": {}}, "user_id": "7EdvenTb"}, {"extra_attributes": {"uloo4VdJ": {}, "iKyWhf7y": {}, "2Ly3QDDG": {}}, "user_id": "IlVXFJ94"}], "ticket_created_at": 95, "ticket_id": "kkL6YkoF"}]}, {"matching_parties": [{"first_ticket_created_at": 39, "party_attributes": {"ZzJpuftl": {}, "bx1mI9EV": {}, "1svMXyN0": {}}, "party_id": "De3bm1WT", "party_members": [{"extra_attributes": {"Y510EG3Z": {}, "TrWbdtix": {}, "KQNOjPwI": {}}, "user_id": "Limu8xz4"}, {"extra_attributes": {"vBSPSGh0": {}, "QXyRHOJz": {}, "KvpgOE34": {}}, "user_id": "xoqJdr4f"}, {"extra_attributes": {"zWSVx0cB": {}, "8K67oTdn": {}, "ZCPOHcif": {}}, "user_id": "utsgA0Nn"}], "ticket_created_at": 62, "ticket_id": "AXI1974q"}, {"first_ticket_created_at": 49, "party_attributes": {"MdaM7s1s": {}, "CSjTNtDk": {}, "tedVuihm": {}}, "party_id": "FCCt4ZUX", "party_members": [{"extra_attributes": {"epcHfaDD": {}, "mOHHnFvB": {}, "uiNkwSLK": {}}, "user_id": "DmcG60gv"}, {"extra_attributes": {"yOFgWV2b": {}, "mXgdxUQg": {}, "L2gXc2kh": {}}, "user_id": "tATQnvNT"}, {"extra_attributes": {"Etge9JgX": {}, "mVI8tbQo": {}, "sCnqMtj7": {}}, "user_id": "VsJm0mrX"}], "ticket_created_at": 40, "ticket_id": "ELcIR9BB"}, {"first_ticket_created_at": 59, "party_attributes": {"e8D9MKpz": {}, "oXSlrLOv": {}, "hqZBNPLl": {}}, "party_id": "WynPdBLJ", "party_members": [{"extra_attributes": {"1kUUMmdx": {}, "7jdG4WZ8": {}, "oUtOeMHZ": {}}, "user_id": "QiFPKcLr"}, {"extra_attributes": {"bxTkfTsv": {}, "6UKIYEzQ": {}, "vxHj9P4i": {}}, "user_id": "5avYtDGN"}, {"extra_attributes": {"23NIwYPG": {}, "pwB0bPHo": {}, "xvCg3cTR": {}}, "user_id": "eNp28w4b"}], "ticket_created_at": 58, "ticket_id": "oQpga2c3"}]}], "namespace": "Lef1ob8O", "party_attributes": {"CD81KLCs": {}, "6FLbthvx": {}, "GypkvJIH": {}}, "party_id": "tn92touR", "queued_at": 52, "region": "NPZzGqCx", "server_name": "DQM8sZ8V", "status": "6iTzbwpl", "ticket_id": "FxwBuTfB", "ticket_ids": ["q5KWL1lE", "dqTnWW4S", "bO19qaFJ"], "updated_at": "1985-04-10T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "Jtkgngf0"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'leY9QWho' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 60, "userID": "QwQRdGOT", "weight": 0.13544228890416432}' \
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
    --matchIDs '7wF66H4V' \
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
    --strategy 'biJneUt9' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'J7IXOiJ8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'kdzVR7YV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCannotMatch", "deployment": "MMx5jpW5", "description": "aUBJQoYt", "findMatchTimeoutSeconds": 61, "joinable": true, "max_delay_ms": 77, "region_expansion_range_ms": 42, "region_expansion_rate_ms": 14, "region_latency_initial_range_ms": 72, "region_latency_max_ms": 76, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 83, "min": 61, "name": "YZokS8uO"}, {"max": 25, "min": 64, "name": "ypYGRnQk"}, {"max": 28, "min": 33, "name": "ZhvhiSet"}], [{"max": 28, "min": 29, "name": "eU5XlDT1"}, {"max": 32, "min": 6, "name": "qZE9H2Dq"}, {"max": 92, "min": 20, "name": "tv5KVnuo"}], [{"max": 23, "min": 14, "name": "jfsMLBSm"}, {"max": 49, "min": 42, "name": "EScU7OoN"}, {"max": 55, "min": 12, "name": "j5EoOM8W"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 72, "role_flexing_second": 89}, "maxNumber": 0, "minNumber": 12, "playerMaxNumber": 81, "playerMinNumber": 68}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 10, "min": 4, "name": "c7eODxoS"}, {"max": 18, "min": 71, "name": "bS6fLaUK"}, {"max": 21, "min": 60, "name": "PI4zwIW8"}], [{"max": 6, "min": 33, "name": "HkKm67UK"}, {"max": 35, "min": 83, "name": "PGyuN2ou"}, {"max": 96, "min": 51, "name": "CKlItkM5"}], [{"max": 58, "min": 24, "name": "xyKp4Gh7"}, {"max": 74, "min": 49, "name": "3zHb5K0D"}, {"max": 50, "min": 74, "name": "V1eqj0ym"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 13, "role_flexing_second": 37}, "duration": 4, "max_number": 16, "min_number": 37, "player_max_number": 45, "player_min_number": 57}, {"combination": {"alliances": [[{"max": 73, "min": 24, "name": "QxkYgsPN"}, {"max": 41, "min": 81, "name": "SZDqcFSM"}, {"max": 89, "min": 51, "name": "uQQdaOIj"}], [{"max": 83, "min": 28, "name": "7DgdWvNq"}, {"max": 35, "min": 4, "name": "aaKvSVnQ"}, {"max": 46, "min": 6, "name": "v8m9sbtI"}], [{"max": 43, "min": 68, "name": "hD1fIYRJ"}, {"max": 10, "min": 81, "name": "QUZLF9n5"}, {"max": 6, "min": 64, "name": "A9AgSuDy"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 7, "role_flexing_second": 87}, "duration": 2, "max_number": 21, "min_number": 98, "player_max_number": 10, "player_min_number": 61}, {"combination": {"alliances": [[{"max": 66, "min": 36, "name": "MEXyrZHl"}, {"max": 85, "min": 89, "name": "BQkCvKQx"}, {"max": 53, "min": 42, "name": "mrowk0MC"}], [{"max": 61, "min": 97, "name": "cju9glBI"}, {"max": 29, "min": 43, "name": "Ec9tDzzF"}, {"max": 81, "min": 63, "name": "RNvQH7Bl"}], [{"max": 40, "min": 71, "name": "SUGW45o4"}, {"max": 21, "min": 30, "name": "3j7TTiXp"}, {"max": 11, "min": 39, "name": "Fijw2KZi"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 28, "role_flexing_second": 12}, "duration": 5, "max_number": 4, "min_number": 57, "player_max_number": 18, "player_min_number": 22}], "batch_size": 17, "bucket_mmr_rule": {"disable_authority": true, "flex_authority_count": 83, "flex_flat_step_range": 21, "flex_immunity_count": 24, "flex_range_max": 14, "flex_rate_ms": 79, "flex_step_max": 15, "force_authority_match": false, "initial_step_range": 40, "mmr_max": 59, "mmr_mean": 73, "mmr_min": 67, "mmr_std_dev": 91, "override_mmr_data": true, "use_bucket_mmr": true, "use_flat_flex_step": true}, "flexingRules": [{"attribute": "aPZDxmwB", "criteria": "fssJqJ7y", "duration": 60, "reference": 0.6905364480790156}, {"attribute": "LeWyzOpC", "criteria": "dH9WLkSj", "duration": 91, "reference": 0.5797825803571879}, {"attribute": "3WCpJ1Dt", "criteria": "Yx3KtN3d", "duration": 81, "reference": 0.727597250865535}], "match_options": {"options": [{"name": "1JpxEETP", "type": "fcl2Snrz"}, {"name": "6q8l9F4i", "type": "g76RNdgv"}, {"name": "NgVA3tR6", "type": "X95m0Eze"}]}, "matchingRules": [{"attribute": "SasAvI9h", "criteria": "o5sT1s69", "reference": 0.4204341581687656}, {"attribute": "P0OKWjQY", "criteria": "IabYTalJ", "reference": 0.6192048608790444}, {"attribute": "CqJ8zIw6", "criteria": "G38IHl2O", "reference": 0.3470778866767128}], "sort_ticket": {"search_result": "tDrAov5q", "ticket_queue": "PMmfwOBl"}, "sort_tickets": [{"search_result": "8ZxEv8MJ", "threshold": 97, "ticket_queue": "l9FuaHZK"}, {"search_result": "BMG6X6jQ", "threshold": 90, "ticket_queue": "rcwdUTAS"}, {"search_result": "4HO9IGMs", "threshold": 0, "ticket_queue": "gbADpyY6"}], "sub_game_modes": {}, "ticket_flexing_selection": "D2GnPgy4", "ticket_flexing_selections": [{"selection": "JQNoibEv", "threshold": 84}, {"selection": "hdXvqNsJ", "threshold": 87}, {"selection": "wiZcohmb", "threshold": 72}], "use_newest_ticket_for_flexing": false}, "sessionQueueTimeoutSeconds": 83, "socialMatchmaking": true, "sub_gamemode_selection": "ticketOrder", "ticket_observability_enable": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName 'vmqP7nJz' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName 'R1Ya7GYD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName 'SUs6k2yB' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 2}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName 'Ss74Itw9' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName 'mV9Qik9B' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "mftHaCcn", "count": 97, "mmrMax": 0.7064511059935562, "mmrMean": 0.7679058693415868, "mmrMin": 0.23670397120227293, "mmrStdDev": 0.6875559597027986}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'Gv8dKwX0' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 96, "party_attributes": {"AOFWrQZO": {}, "oeUolGIB": {}, "VROXr5gf": {}}, "party_id": "9LpagND2", "party_members": [{"extra_attributes": {"B7i76vTh": {}, "JIFPQjGz": {}, "NTeZOYPJ": {}}, "user_id": "QLLvxzRq"}, {"extra_attributes": {"1nPl0Y7r": {}, "05gN9qtX": {}, "fYpiX0Vh": {}}, "user_id": "XGSr1sxs"}, {"extra_attributes": {"9opIAunF": {}, "rTIgAzZs": {}, "yPyp5331": {}}, "user_id": "sdoFoV2V"}], "ticket_created_at": 13, "ticket_id": "UdKxHzhS"}, {"first_ticket_created_at": 31, "party_attributes": {"pXBkFFwe": {}, "xSQbtjx0": {}, "Y0OOCUes": {}}, "party_id": "Sn3VMobY", "party_members": [{"extra_attributes": {"HHSGEtUU": {}, "GetAmVFX": {}, "UYUfT5Lq": {}}, "user_id": "xuXhzrA3"}, {"extra_attributes": {"gsKZCaDo": {}, "c1pTqsHU": {}, "JDmBswaW": {}}, "user_id": "qkNqG6yd"}, {"extra_attributes": {"3javuRNa": {}, "Mj1hGqUY": {}, "egWFRAqO": {}}, "user_id": "YCS6LNyr"}], "ticket_created_at": 51, "ticket_id": "6ef0peri"}, {"first_ticket_created_at": 57, "party_attributes": {"XmBCLUhz": {}, "AVmIT3vv": {}, "BGAG2h7F": {}}, "party_id": "5pBmWaPT", "party_members": [{"extra_attributes": {"QwQCU96O": {}, "3HPB34aZ": {}, "MwHhMKL6": {}}, "user_id": "Kkq3ctEF"}, {"extra_attributes": {"BzXWVJ8h": {}, "GwcGIsPZ": {}, "IAJOw0C3": {}}, "user_id": "YTDtKom5"}, {"extra_attributes": {"xk1zNPja": {}, "PBV2Nj6b": {}, "FqZlwPcc": {}}, "user_id": "rkKWgmUs"}], "ticket_created_at": 66, "ticket_id": "IKxgzurj"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName 'h5rDKDR6' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 92}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'y4ZZHJfH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'N4HZT7Qy' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'RnzZ4rN6' \
    --matchID 'xAP8kdCO' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["tSapx2PG", "WJdaTrcy", "zENtJrNc"], "party_id": "lgMlHpzk", "user_id": "0Pi01AyV"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName '8MTyHvjt' \
    --matchID 'LUWsCjIk' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'LqFcuDJg' \
    --matchID 'p9KEofgF' \
    --namespace "$AB_NAMESPACE" \
    --userID 'OiLEurTv' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName 'Lp83OQcJ' \
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
    --channelName 'j1YVtq4c' \
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