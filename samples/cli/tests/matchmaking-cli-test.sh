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
    --offset '29' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatchOnDifferentTeam", "deployment": "A8uk11Sl", "description": "R9JJyE2Y", "find_match_timeout_seconds": 48, "game_mode": "oRUeWgmF", "joinable": false, "max_delay_ms": 54, "region_expansion_range_ms": 18, "region_expansion_rate_ms": 15, "region_latency_initial_range_ms": 51, "region_latency_max_ms": 95, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 13, "min": 16, "name": "zHVHbKZ5"}, {"max": 84, "min": 2, "name": "pdS1kKOE"}, {"max": 63, "min": 47, "name": "24qccI3J"}], [{"max": 5, "min": 35, "name": "LMo27LsD"}, {"max": 76, "min": 21, "name": "9cJfKDo1"}, {"max": 6, "min": 26, "name": "ADnVnVuq"}], [{"max": 86, "min": 27, "name": "B4GMU60r"}, {"max": 45, "min": 38, "name": "0M6NLpTW"}, {"max": 79, "min": 7, "name": "vHFjwfo9"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 96, "role_flexing_second": 51}, "max_number": 69, "min_number": 26, "player_max_number": 76, "player_min_number": 67}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 1, "min": 49, "name": "uebzX2bm"}, {"max": 70, "min": 8, "name": "sqYnNEcr"}, {"max": 28, "min": 77, "name": "woATb7q3"}], [{"max": 3, "min": 82, "name": "fBSakz05"}, {"max": 20, "min": 42, "name": "e7WZ9MHp"}, {"max": 48, "min": 90, "name": "HtuljWhh"}], [{"max": 18, "min": 5, "name": "2OhD8M2V"}, {"max": 90, "min": 13, "name": "ht3EEyiQ"}, {"max": 94, "min": 42, "name": "wMY4a5OT"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 30, "role_flexing_second": 56}, "duration": 48, "max_number": 90, "min_number": 66, "player_max_number": 0, "player_min_number": 40}, {"combination": {"alliances": [[{"max": 98, "min": 80, "name": "xHHNeNrK"}, {"max": 24, "min": 29, "name": "2gmief2g"}, {"max": 36, "min": 46, "name": "roSOdwDb"}], [{"max": 55, "min": 100, "name": "vsD0sp1S"}, {"max": 10, "min": 93, "name": "QcoflSpP"}, {"max": 89, "min": 97, "name": "TupW272d"}], [{"max": 61, "min": 7, "name": "sQhVK3XP"}, {"max": 27, "min": 81, "name": "BK1UBLqz"}, {"max": 19, "min": 60, "name": "QlcbTIFT"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 63, "role_flexing_second": 36}, "duration": 84, "max_number": 53, "min_number": 66, "player_max_number": 90, "player_min_number": 74}, {"combination": {"alliances": [[{"max": 26, "min": 44, "name": "UYhC6Tmb"}, {"max": 76, "min": 64, "name": "EzctkUC6"}, {"max": 82, "min": 11, "name": "dlhcGHbP"}], [{"max": 23, "min": 66, "name": "tDMw6BVr"}, {"max": 21, "min": 69, "name": "DfUelcCi"}, {"max": 19, "min": 62, "name": "ic9obS6H"}], [{"max": 95, "min": 16, "name": "nUYlsgTO"}, {"max": 1, "min": 5, "name": "rTebb69l"}, {"max": 79, "min": 41, "name": "oHLJ5bwa"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 34, "role_flexing_second": 42}, "duration": 52, "max_number": 1, "min_number": 34, "player_max_number": 33, "player_min_number": 62}], "batch_size": 93, "bucket_mmr_rule": {"disable_authority": true, "flex_authority_count": 29, "flex_flat_step_range": 63, "flex_immunity_count": 25, "flex_range_max": 96, "flex_rate_ms": 94, "flex_step_max": 96, "force_authority_match": true, "initial_step_range": 45, "mmr_max": 76, "mmr_mean": 27, "mmr_min": 47, "mmr_std_dev": 57, "override_mmr_data": false, "use_bucket_mmr": false, "use_flat_flex_step": true}, "flexing_rule": [{"attribute": "LEXuRWAw", "criteria": "a5OcWCI3", "duration": 49, "reference": 0.7877606560368515}, {"attribute": "se4QyurT", "criteria": "tLE1JW6Y", "duration": 94, "reference": 0.6499417986542311}, {"attribute": "6V2npDeq", "criteria": "0AsSEmaZ", "duration": 6, "reference": 0.8111402491324732}], "match_options": {"options": [{"name": "EWYKpRbA", "type": "TFzRGa9r"}, {"name": "Mtc5VO8l", "type": "Ncn4zR6R"}, {"name": "psXgR2iJ", "type": "vALJ4bYv"}]}, "matching_rule": [{"attribute": "5KLfgRRG", "criteria": "oKm3SWzd", "reference": 0.03767014199817531}, {"attribute": "GEAXzCvk", "criteria": "lRqSnuaU", "reference": 0.19818925152703393}, {"attribute": "eMFyU4Bd", "criteria": "RT139edz", "reference": 0.28240744003894336}], "rebalance_enable": false, "sort_ticket": {"search_result": "6TQZS4fc", "ticket_queue": "9XWWVC23"}, "sort_tickets": [{"search_result": "WFYMrs67", "threshold": 37, "ticket_queue": "EYCqkefX"}, {"search_result": "YIV7A6Sq", "threshold": 29, "ticket_queue": "LWbhWdaN"}, {"search_result": "LLFOC9Yn", "threshold": 59, "ticket_queue": "JdV7dzgB"}], "sub_game_modes": {"25ETo3XM": {"alliance": {"combination": {"alliances": [[{"max": 1, "min": 41, "name": "tmIuaN2Z"}, {"max": 47, "min": 72, "name": "QbRz9io7"}, {"max": 3, "min": 17, "name": "Hhkkmqvm"}], [{"max": 8, "min": 49, "name": "VbT08rNf"}, {"max": 59, "min": 66, "name": "WRbaEWI2"}, {"max": 93, "min": 87, "name": "HXt21N4v"}], [{"max": 96, "min": 100, "name": "ks9fZaHw"}, {"max": 80, "min": 94, "name": "3YPNw1mm"}, {"max": 81, "min": 61, "name": "LBI10Aol"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 20, "role_flexing_second": 47}, "max_number": 34, "min_number": 84, "player_max_number": 61, "player_min_number": 52}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 66, "min": 69, "name": "KBEEnGs0"}, {"max": 32, "min": 18, "name": "CdL4M3ud"}, {"max": 15, "min": 83, "name": "NcMXqlRO"}], [{"max": 29, "min": 40, "name": "AWqEEX5i"}, {"max": 24, "min": 88, "name": "b0L8ew8l"}, {"max": 98, "min": 62, "name": "WcTiyPqA"}], [{"max": 14, "min": 28, "name": "vIaPT3Nu"}, {"max": 60, "min": 38, "name": "u8FRvI4g"}, {"max": 52, "min": 12, "name": "PY98i8vv"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 66, "role_flexing_second": 84}, "duration": 56, "max_number": 46, "min_number": 63, "player_max_number": 15, "player_min_number": 77}, {"combination": {"alliances": [[{"max": 81, "min": 21, "name": "jIWhHSI1"}, {"max": 77, "min": 85, "name": "pVMqwTLs"}, {"max": 6, "min": 65, "name": "FTV6Yelb"}], [{"max": 81, "min": 75, "name": "zntnf3ri"}, {"max": 6, "min": 15, "name": "yWda5gFx"}, {"max": 82, "min": 63, "name": "lF1el1xx"}], [{"max": 91, "min": 7, "name": "eM7HZmo3"}, {"max": 73, "min": 27, "name": "Yh5soG5C"}, {"max": 67, "min": 41, "name": "elYj7fVO"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 67, "role_flexing_second": 50}, "duration": 4, "max_number": 94, "min_number": 59, "player_max_number": 80, "player_min_number": 94}, {"combination": {"alliances": [[{"max": 81, "min": 63, "name": "abUMxTwY"}, {"max": 63, "min": 82, "name": "apLkojLA"}, {"max": 75, "min": 33, "name": "QUUS7xFH"}], [{"max": 81, "min": 56, "name": "sCuEh353"}, {"max": 8, "min": 83, "name": "WEILlgcI"}, {"max": 18, "min": 18, "name": "dITJtrHd"}], [{"max": 44, "min": 20, "name": "0Wp3LaJd"}, {"max": 12, "min": 97, "name": "CQAUzWqR"}, {"max": 26, "min": 7, "name": "0hPjQnFr"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 32, "role_flexing_second": 92}, "duration": 24, "max_number": 41, "min_number": 98, "player_max_number": 15, "player_min_number": 71}], "name": "MVXpqYci"}, "ofsRvDwW": {"alliance": {"combination": {"alliances": [[{"max": 11, "min": 72, "name": "1mxsFfiK"}, {"max": 92, "min": 81, "name": "a3olLJly"}, {"max": 79, "min": 3, "name": "Bp0ILAYY"}], [{"max": 94, "min": 11, "name": "mMa64CJT"}, {"max": 51, "min": 60, "name": "v2pz591x"}, {"max": 13, "min": 2, "name": "iTWbpWYr"}], [{"max": 54, "min": 92, "name": "5bSc0wAD"}, {"max": 8, "min": 93, "name": "ttanCu3W"}, {"max": 42, "min": 56, "name": "IM8vAOFJ"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 6, "role_flexing_second": 22}, "max_number": 56, "min_number": 59, "player_max_number": 79, "player_min_number": 61}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 18, "min": 63, "name": "zYP557uL"}, {"max": 7, "min": 22, "name": "GzyEetTQ"}, {"max": 52, "min": 64, "name": "ReigINoH"}], [{"max": 26, "min": 75, "name": "6UQMEPaF"}, {"max": 92, "min": 49, "name": "siL5JuSI"}, {"max": 29, "min": 60, "name": "ftTGVh7g"}], [{"max": 68, "min": 65, "name": "4QJFCCr4"}, {"max": 59, "min": 9, "name": "iFeBRhfk"}, {"max": 22, "min": 47, "name": "LLpQZqap"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 9, "role_flexing_second": 35}, "duration": 94, "max_number": 89, "min_number": 59, "player_max_number": 35, "player_min_number": 92}, {"combination": {"alliances": [[{"max": 43, "min": 29, "name": "3sAGjEqg"}, {"max": 0, "min": 100, "name": "9hj1Gjhm"}, {"max": 19, "min": 63, "name": "GpV19Vx2"}], [{"max": 76, "min": 88, "name": "Sllbkkv4"}, {"max": 74, "min": 81, "name": "L0VEccqa"}, {"max": 74, "min": 59, "name": "ry7ZZ59t"}], [{"max": 25, "min": 55, "name": "QNmTFGEb"}, {"max": 84, "min": 98, "name": "bXlKxcYo"}, {"max": 23, "min": 52, "name": "197SFmJT"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 57, "role_flexing_second": 93}, "duration": 74, "max_number": 84, "min_number": 50, "player_max_number": 93, "player_min_number": 98}, {"combination": {"alliances": [[{"max": 28, "min": 52, "name": "Kh3rvDLw"}, {"max": 75, "min": 45, "name": "Qmvwbvm8"}, {"max": 70, "min": 54, "name": "XlNnsZgX"}], [{"max": 19, "min": 56, "name": "BiOuLnKK"}, {"max": 59, "min": 4, "name": "900Que5F"}, {"max": 47, "min": 1, "name": "ithbYaN4"}], [{"max": 60, "min": 19, "name": "FTIycZyr"}, {"max": 16, "min": 47, "name": "OrRHeRg3"}, {"max": 0, "min": 71, "name": "yZj1tcwD"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 16, "role_flexing_second": 93}, "duration": 47, "max_number": 49, "min_number": 42, "player_max_number": 80, "player_min_number": 54}], "name": "47MFtiHE"}, "wVv09vlK": {"alliance": {"combination": {"alliances": [[{"max": 98, "min": 23, "name": "iWEImTfU"}, {"max": 47, "min": 77, "name": "JnWHdJZo"}, {"max": 90, "min": 67, "name": "YtiTkKGQ"}], [{"max": 32, "min": 87, "name": "wSHsqCTY"}, {"max": 85, "min": 55, "name": "9OxmPNAL"}, {"max": 34, "min": 6, "name": "2zSNjhLR"}], [{"max": 28, "min": 25, "name": "eC5UfLSB"}, {"max": 28, "min": 82, "name": "pYRWco6l"}, {"max": 27, "min": 93, "name": "2SJOVN7r"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 15, "role_flexing_second": 78}, "max_number": 44, "min_number": 48, "player_max_number": 36, "player_min_number": 78}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 0, "min": 33, "name": "27A1uTZh"}, {"max": 38, "min": 54, "name": "b55Lc9V7"}, {"max": 97, "min": 97, "name": "kXq0HIwD"}], [{"max": 45, "min": 89, "name": "k3ztqiD0"}, {"max": 31, "min": 40, "name": "F0T071sy"}, {"max": 8, "min": 80, "name": "f7ckrrSk"}], [{"max": 99, "min": 35, "name": "u7iFLXfU"}, {"max": 17, "min": 33, "name": "3bA0Z3Xy"}, {"max": 53, "min": 69, "name": "771TkDnY"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 3, "role_flexing_second": 54}, "duration": 50, "max_number": 7, "min_number": 16, "player_max_number": 31, "player_min_number": 23}, {"combination": {"alliances": [[{"max": 19, "min": 100, "name": "bJ2bqzSZ"}, {"max": 92, "min": 72, "name": "T0Klze5B"}, {"max": 39, "min": 61, "name": "43veJvvt"}], [{"max": 0, "min": 41, "name": "H5l7jfaT"}, {"max": 13, "min": 81, "name": "rJC4nIPe"}, {"max": 86, "min": 99, "name": "rm0qN76P"}], [{"max": 30, "min": 63, "name": "Wif2UZrW"}, {"max": 88, "min": 55, "name": "yZRwMcHB"}, {"max": 59, "min": 89, "name": "5XBdUJ89"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 64, "role_flexing_second": 76}, "duration": 83, "max_number": 38, "min_number": 66, "player_max_number": 57, "player_min_number": 60}, {"combination": {"alliances": [[{"max": 22, "min": 5, "name": "ZM4sOb5q"}, {"max": 65, "min": 67, "name": "RxPUcYdR"}, {"max": 1, "min": 30, "name": "EPg2I2pk"}], [{"max": 37, "min": 32, "name": "jRh9OzdV"}, {"max": 42, "min": 61, "name": "q3kfU1qc"}, {"max": 79, "min": 73, "name": "21mqvhPB"}], [{"max": 3, "min": 21, "name": "9OPjrEoA"}, {"max": 65, "min": 8, "name": "tm35INGv"}, {"max": 68, "min": 8, "name": "KhcePTw7"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 0, "role_flexing_second": 32}, "duration": 0, "max_number": 90, "min_number": 22, "player_max_number": 34, "player_min_number": 81}], "name": "pnEvdWvu"}}, "ticket_flexing_selection": "LWlfY0Xq", "ticket_flexing_selections": [{"selection": "GFdMqBxu", "threshold": 66}, {"selection": "nciMepEo", "threshold": 34}, {"selection": "oLUy93q1", "threshold": 82}], "use_newest_ticket_for_flexing": true}, "session_queue_timeout_seconds": 83, "social_matchmaking": true, "sub_gamemode_selection": "random", "ticket_observability_enable": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName 'bHSCTn3Z' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'LYqIG7kI' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "nAg6f9Dr", "players": [{"results": [{"attribute": "SSfwu5QC", "value": 0.08799756743229914}, {"attribute": "W6auzvEE", "value": 0.5665595979155365}, {"attribute": "L9vz1plv", "value": 0.7737545516238243}], "user_id": "eGnA2dQj"}, {"results": [{"attribute": "WUTZd83p", "value": 0.16803275472803025}, {"attribute": "ZNMQsP9d", "value": 0.6442393743820009}, {"attribute": "bsKO5N0r", "value": 0.16456548962226059}], "user_id": "FTJC6o72"}, {"results": [{"attribute": "MnjlCkag", "value": 0.7360790761483443}, {"attribute": "cXi79pT8", "value": 0.914397394828799}, {"attribute": "Ck1iHfzD", "value": 0.2892315596603}], "user_id": "oyZyzcuA"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "hICld80E"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "doRXKxLK", "client_version": "nB5cx84Q", "deployment": "rREO2GCm", "error_code": 0, "error_message": "yzbA3WFp", "game_mode": "O49LYbZl", "is_mock": "WLwR4bSd", "joinable": false, "match_id": "4cR1NRyZ", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 71, "party_attributes": {"fep3OYwy": {}, "jFOhK7nS": {}, "9ltJyr3O": {}}, "party_id": "oiFuvbHO", "party_members": [{"extra_attributes": {"95MVzASe": {}, "BiZk1gfZ": {}, "C4LqwZuJ": {}}, "user_id": "QRNYXBmK"}, {"extra_attributes": {"wZyCNmju": {}, "pSJzM6LE": {}, "uB9OaT53": {}}, "user_id": "fOgmUQOD"}, {"extra_attributes": {"otjx2fP7": {}, "5ew8WrOF": {}, "aMafKYku": {}}, "user_id": "u5kuWtcp"}], "ticket_created_at": 97, "ticket_id": "8kGvmHTc"}, {"first_ticket_created_at": 84, "party_attributes": {"fodPNRts": {}, "RoXjZbJB": {}, "PPXKr2ji": {}}, "party_id": "8nqHKgWt", "party_members": [{"extra_attributes": {"6uvbXVDl": {}, "cVFBONQG": {}, "Ls7GeBbW": {}}, "user_id": "TGWlrD2s"}, {"extra_attributes": {"G7sIk4U2": {}, "XAKaMTy8": {}, "eShWCcgX": {}}, "user_id": "0YQHQ01J"}, {"extra_attributes": {"2wODwI5l": {}, "RD9vxgKC": {}, "sUSlDtEe": {}}, "user_id": "opUFMhDb"}], "ticket_created_at": 21, "ticket_id": "74iY7pyO"}, {"first_ticket_created_at": 24, "party_attributes": {"zi1fpbgy": {}, "RgNtpuOX": {}, "kx0kBtZa": {}}, "party_id": "AVvJbOgV", "party_members": [{"extra_attributes": {"9tSiQFDO": {}, "pMqIppEg": {}, "5dnKt8Gf": {}}, "user_id": "voaEBHSo"}, {"extra_attributes": {"1iPKnOJP": {}, "3KmLTNnZ": {}, "6AUpTREO": {}}, "user_id": "ftJOndz0"}, {"extra_attributes": {"6mn5XrzF": {}, "WKPk69ud": {}, "MWnWM1Ky": {}}, "user_id": "fkbz2AqS"}], "ticket_created_at": 61, "ticket_id": "99Lajwyn"}]}, {"matching_parties": [{"first_ticket_created_at": 23, "party_attributes": {"dbvasqRr": {}, "EpUaAfwT": {}, "qNuNkVVC": {}}, "party_id": "AJHh5S3Q", "party_members": [{"extra_attributes": {"GoIvWnzV": {}, "0C3q92L8": {}, "k2ciN7gr": {}}, "user_id": "GIJxcnS9"}, {"extra_attributes": {"Af9wQMNf": {}, "EDX4mue5": {}, "5qU0dUfn": {}}, "user_id": "78JLFZxy"}, {"extra_attributes": {"1UXK7b1O": {}, "uY3lII2R": {}, "uoQM3BHV": {}}, "user_id": "iljRvJcT"}], "ticket_created_at": 19, "ticket_id": "BAxN0boN"}, {"first_ticket_created_at": 10, "party_attributes": {"DbJUeLMA": {}, "xf3uiRbO": {}, "wWQhLhT8": {}}, "party_id": "2VZMcNGC", "party_members": [{"extra_attributes": {"KEGLxZzb": {}, "RRhxoacZ": {}, "MkO10lwW": {}}, "user_id": "cWwAgnXh"}, {"extra_attributes": {"6bleRqoA": {}, "gkWWFk41": {}, "WguM6LGx": {}}, "user_id": "noPyUOQ0"}, {"extra_attributes": {"RzlxMeRm": {}, "n8ltDHuU": {}, "V8WqFrtf": {}}, "user_id": "hsvSNgDZ"}], "ticket_created_at": 22, "ticket_id": "2gPElYgW"}, {"first_ticket_created_at": 70, "party_attributes": {"l6iFoCdA": {}, "7wDcKmSK": {}, "k67CdUDx": {}}, "party_id": "tNeqnnD5", "party_members": [{"extra_attributes": {"03DfVmGB": {}, "rqrqiEDV": {}, "zX9ZanDJ": {}}, "user_id": "1TKfYFT5"}, {"extra_attributes": {"Irqscypm": {}, "7QeGPL7Z": {}, "8i4UTe0U": {}}, "user_id": "whilCaaO"}, {"extra_attributes": {"ycTSvbDJ": {}, "hbtBqlvq": {}, "0uYohNR4": {}}, "user_id": "R90TjDGB"}], "ticket_created_at": 17, "ticket_id": "ZpnwgEz7"}]}, {"matching_parties": [{"first_ticket_created_at": 42, "party_attributes": {"POjwXDM6": {}, "JkJr1y6m": {}, "HcQWQlMV": {}}, "party_id": "YF9B7d7e", "party_members": [{"extra_attributes": {"qApmeLB4": {}, "Iy8DNWO2": {}, "SNkwNheY": {}}, "user_id": "4RCBF1zS"}, {"extra_attributes": {"0LnTZeqW": {}, "uj9tqgwl": {}, "M5Tv201h": {}}, "user_id": "Vf7WaHMM"}, {"extra_attributes": {"T4Ne7MRs": {}, "ShVkS5sG": {}, "az6UpMif": {}}, "user_id": "L862anti"}], "ticket_created_at": 45, "ticket_id": "hfYdCHEg"}, {"first_ticket_created_at": 82, "party_attributes": {"NyLoFEKP": {}, "DoMsQKbA": {}, "8Menlus7": {}}, "party_id": "rea4jqyE", "party_members": [{"extra_attributes": {"xMsLRxHv": {}, "CmcUUuO0": {}, "IFctRDAf": {}}, "user_id": "GFXgGMiD"}, {"extra_attributes": {"IrANB1bn": {}, "HuYtKotm": {}, "pf4yHXqP": {}}, "user_id": "KPQBP7Ak"}, {"extra_attributes": {"lRD6dLKs": {}, "4dGFleDp": {}, "mDvGzeEY": {}}, "user_id": "b2k9A3Zx"}], "ticket_created_at": 83, "ticket_id": "rSEcNYod"}, {"first_ticket_created_at": 68, "party_attributes": {"SLHxOlkx": {}, "TqCHSIMt": {}, "aGsfPcPK": {}}, "party_id": "hPtl8DAQ", "party_members": [{"extra_attributes": {"Q2ZOzmFR": {}, "mWhzh4vn": {}, "L0ftegK2": {}}, "user_id": "qh9NsMTC"}, {"extra_attributes": {"jrPoINM6": {}, "qloRtXKe": {}, "ZuCdsYMG": {}}, "user_id": "spIrWLO1"}, {"extra_attributes": {"bPPslJkC": {}, "Zy6YLVDL": {}, "XkRW79eU": {}}, "user_id": "13lZcadt"}], "ticket_created_at": 17, "ticket_id": "uxSZiXTt"}]}], "namespace": "ftJysW4T", "party_attributes": {"6YIriECk": {}, "Zx304QWf": {}, "NBGcyPuz": {}}, "party_id": "Y3Z6ZkMF", "queued_at": 69, "region": "TL2004mF", "server_name": "HXsWSb8U", "status": "nWvhRIkm", "ticket_id": "kAmKIJSx", "ticket_ids": ["5AhRkKZQ", "Vql6mTaZ", "04aXHW4r"], "updated_at": "1977-10-07T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "Fd3L4FRn"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'w6qDUbgK' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 2, "userID": "7LDmXUGh", "weight": 0.46461378818589016}' \
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
    --matchIDs 'L7Auh7IZ' \
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
    --strategy 'ZBfqE9sv' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'pvzpWqsj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'yGwQhNfc' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatch", "deployment": "mTa1aVOj", "description": "fXTJKccB", "findMatchTimeoutSeconds": 12, "joinable": false, "max_delay_ms": 61, "region_expansion_range_ms": 0, "region_expansion_rate_ms": 60, "region_latency_initial_range_ms": 54, "region_latency_max_ms": 72, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 31, "min": 57, "name": "1msPh0g3"}, {"max": 84, "min": 79, "name": "LiwCIYRI"}, {"max": 36, "min": 64, "name": "UJ1xqk8L"}], [{"max": 31, "min": 76, "name": "M6HkjrBV"}, {"max": 51, "min": 38, "name": "DAbD4AhW"}, {"max": 55, "min": 75, "name": "AGrbGtlk"}], [{"max": 43, "min": 44, "name": "1DypFrwm"}, {"max": 51, "min": 67, "name": "3Kz3xpiI"}, {"max": 78, "min": 82, "name": "pAyiMJQH"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 75, "role_flexing_second": 25}, "maxNumber": 68, "minNumber": 8, "playerMaxNumber": 50, "playerMinNumber": 45}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 44, "min": 56, "name": "34gNUfB1"}, {"max": 33, "min": 21, "name": "IYpl7tZj"}, {"max": 40, "min": 35, "name": "fJxy9TLE"}], [{"max": 93, "min": 96, "name": "7Tk3dAU4"}, {"max": 72, "min": 99, "name": "Z8dxqLgv"}, {"max": 68, "min": 20, "name": "cojAwBrn"}], [{"max": 24, "min": 26, "name": "xCGwr8WQ"}, {"max": 33, "min": 19, "name": "Z4MGHop2"}, {"max": 64, "min": 48, "name": "5Qc2GhY5"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 48, "role_flexing_second": 43}, "duration": 79, "max_number": 20, "min_number": 37, "player_max_number": 95, "player_min_number": 23}, {"combination": {"alliances": [[{"max": 88, "min": 70, "name": "YReCOuJ6"}, {"max": 18, "min": 29, "name": "hk60kfnE"}, {"max": 10, "min": 12, "name": "iAr09gEY"}], [{"max": 61, "min": 16, "name": "h583kUyi"}, {"max": 32, "min": 88, "name": "ohWBvvc5"}, {"max": 6, "min": 15, "name": "F8eqTWl2"}], [{"max": 98, "min": 30, "name": "cznE0o9v"}, {"max": 82, "min": 95, "name": "YAe0K4FC"}, {"max": 76, "min": 36, "name": "qVOjM0gA"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 94, "role_flexing_second": 6}, "duration": 64, "max_number": 7, "min_number": 75, "player_max_number": 39, "player_min_number": 10}, {"combination": {"alliances": [[{"max": 70, "min": 66, "name": "04UicdSR"}, {"max": 42, "min": 59, "name": "fVJoc7AQ"}, {"max": 32, "min": 34, "name": "QhGCMIU9"}], [{"max": 97, "min": 34, "name": "MKCy8JJy"}, {"max": 55, "min": 92, "name": "0JyEtZKX"}, {"max": 72, "min": 74, "name": "amjnSlC5"}], [{"max": 98, "min": 25, "name": "4JAMG67X"}, {"max": 22, "min": 73, "name": "WZRfNK1M"}, {"max": 39, "min": 12, "name": "NNlFx3B2"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 93, "role_flexing_second": 58}, "duration": 73, "max_number": 32, "min_number": 17, "player_max_number": 26, "player_min_number": 97}], "batch_size": 14, "bucket_mmr_rule": {"disable_authority": true, "flex_authority_count": 19, "flex_flat_step_range": 10, "flex_immunity_count": 37, "flex_range_max": 64, "flex_rate_ms": 19, "flex_step_max": 61, "force_authority_match": false, "initial_step_range": 98, "mmr_max": 91, "mmr_mean": 92, "mmr_min": 20, "mmr_std_dev": 14, "override_mmr_data": false, "use_bucket_mmr": true, "use_flat_flex_step": true}, "flexingRules": [{"attribute": "wBVK2b3l", "criteria": "T5pX9JUu", "duration": 84, "reference": 0.8232411549384984}, {"attribute": "Toh8bsqP", "criteria": "c4UpmgCA", "duration": 28, "reference": 0.6128974311358059}, {"attribute": "sUnjYDTF", "criteria": "dNpd7dra", "duration": 50, "reference": 0.6870883526352998}], "match_options": {"options": [{"name": "ut8jszQ3", "type": "lGGzEvpj"}, {"name": "aInl61RD", "type": "YmFy2P3r"}, {"name": "koBOPLp4", "type": "UmkVQVPT"}]}, "matchingRules": [{"attribute": "hOrdUEzC", "criteria": "Wsipld0k", "reference": 0.7497757257652973}, {"attribute": "DyEqndYs", "criteria": "GhWiw6E0", "reference": 0.04192521307249297}, {"attribute": "r1thfZY9", "criteria": "fDmvAS2L", "reference": 0.6269167661267985}], "sort_ticket": {"search_result": "gcXzMD9w", "ticket_queue": "gvpHhrZa"}, "sort_tickets": [{"search_result": "P6IGUjeo", "threshold": 9, "ticket_queue": "BNypKrL0"}, {"search_result": "pkvU8W7M", "threshold": 75, "ticket_queue": "rXFy0fVb"}, {"search_result": "PZyHBaHC", "threshold": 58, "ticket_queue": "KWKgPmKL"}], "sub_game_modes": {}, "ticket_flexing_selection": "d6uNsVzG", "ticket_flexing_selections": [{"selection": "wAHPFKq5", "threshold": 12}, {"selection": "oZWHHkdH", "threshold": 12}, {"selection": "7R4Xcqo7", "threshold": 31}], "use_newest_ticket_for_flexing": true}, "sessionQueueTimeoutSeconds": 4, "socialMatchmaking": true, "sub_gamemode_selection": "ticketOrder", "ticket_observability_enable": true, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName 'YY2EuBum' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName 'NMwrkFKb' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName 'eWBz0WU2' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 21}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName 'VPxXMbPc' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName '323DvKQ1' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "0nLmTO04", "count": 81, "mmrMax": 0.023560502760829216, "mmrMean": 0.5097117293683829, "mmrMin": 0.32917606322885296, "mmrStdDev": 0.9791409711275183}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'TySWh6rv' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 39, "party_attributes": {"taRQRjI7": {}, "bitOO9Jp": {}, "5lKR2YNz": {}}, "party_id": "ZgVeTLZE", "party_members": [{"extra_attributes": {"R8RCMxHS": {}, "07GM70oS": {}, "fA495mN8": {}}, "user_id": "0CAehUp9"}, {"extra_attributes": {"6tOhjHCf": {}, "HgHHa6dV": {}, "tbELY1xl": {}}, "user_id": "6yzSZ1wb"}, {"extra_attributes": {"RGi9LUT1": {}, "Q0h25gYH": {}, "zbvKk24V": {}}, "user_id": "jSjoMzm3"}], "ticket_created_at": 71, "ticket_id": "tlOLBCOH"}, {"first_ticket_created_at": 65, "party_attributes": {"vUb93obM": {}, "5gKRIzL5": {}, "kY0FLT90": {}}, "party_id": "6Ddr5gJ2", "party_members": [{"extra_attributes": {"0viXOzSp": {}, "7dkP84j9": {}, "DQnM0gZZ": {}}, "user_id": "n8gAhU57"}, {"extra_attributes": {"XqfiPsgs": {}, "vAUXhTia": {}, "UAyC2UGY": {}}, "user_id": "Iu2zf2tf"}, {"extra_attributes": {"AYOpmqzT": {}, "OCs2Kc8Z": {}, "1UCIS1pG": {}}, "user_id": "Zvj4JulZ"}], "ticket_created_at": 100, "ticket_id": "Tibr7NJa"}, {"first_ticket_created_at": 5, "party_attributes": {"HAjEiF7i": {}, "VgKlDIjc": {}, "Xh4TkMV6": {}}, "party_id": "Xr5Lr0uC", "party_members": [{"extra_attributes": {"E9JhaMCd": {}, "Rs1TnSsG": {}, "3cnaxBID": {}}, "user_id": "QQGrPvah"}, {"extra_attributes": {"wMzK3tkh": {}, "i3wFij78": {}, "UztOtDDy": {}}, "user_id": "dsJfOSnq"}, {"extra_attributes": {"j4x3ubm2": {}, "mLMYaJR9": {}, "AUlkSHIv": {}}, "user_id": "qdb0UeTC"}], "ticket_created_at": 86, "ticket_id": "qNjynoUf"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName 'vf4aUZPC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 82}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'cZSoCfu8' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName '7NsUx9A5' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'JLv8ZQHk' \
    --matchID 'jgMKp7Hp' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["lIk1ZLcO", "KGi6MKGy", "FRzA7W8F"], "party_id": "dsR3HL54", "user_id": "2kEN1Gyi"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'AwZzGBKa' \
    --matchID 'dublT21D' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'EMYcVf1G' \
    --matchID 'j6VVOkAd' \
    --namespace "$AB_NAMESPACE" \
    --userID 'WIue8dRe' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName 'uoXkmGEK' \
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
    --channelName 'hKJGZhGc' \
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