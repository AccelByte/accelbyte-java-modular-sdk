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
    --limit '10' \
    --offset '14' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCannotMatch", "deployment": "c1cxlmuw", "description": "qAtw8MYI", "find_match_timeout_seconds": 3, "game_mode": "XsE8v9Qx", "joinable": false, "max_delay_ms": 77, "region_expansion_range_ms": 77, "region_expansion_rate_ms": 90, "region_latency_initial_range_ms": 19, "region_latency_max_ms": 18, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 99, "min": 55, "name": "PzLSmzWp"}, {"max": 10, "min": 51, "name": "6htlmdtg"}, {"max": 59, "min": 55, "name": "ap75dclJ"}], [{"max": 2, "min": 64, "name": "ovvIa2yN"}, {"max": 68, "min": 77, "name": "xRvhMY0f"}, {"max": 62, "min": 23, "name": "3PBrxSCZ"}], [{"max": 13, "min": 26, "name": "T22NS5DB"}, {"max": 0, "min": 52, "name": "L7Y92DGb"}, {"max": 73, "min": 63, "name": "naC62P2W"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 80, "role_flexing_second": 78}, "max_number": 8, "min_number": 58, "player_max_number": 27, "player_min_number": 37}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 21, "min": 12, "name": "OzQrEH29"}, {"max": 85, "min": 5, "name": "wduZokNM"}, {"max": 27, "min": 0, "name": "gxoi31QB"}], [{"max": 65, "min": 64, "name": "L8X2nhfh"}, {"max": 75, "min": 17, "name": "aWrHWxSk"}, {"max": 26, "min": 62, "name": "waj2SBvb"}], [{"max": 0, "min": 97, "name": "1c47l8Gw"}, {"max": 22, "min": 87, "name": "MRV1nw7R"}, {"max": 99, "min": 41, "name": "sV7asoBO"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 22, "role_flexing_second": 57}, "duration": 9, "max_number": 21, "min_number": 56, "player_max_number": 45, "player_min_number": 28}, {"combination": {"alliances": [[{"max": 80, "min": 80, "name": "88XKgrN2"}, {"max": 43, "min": 49, "name": "hd0RLEc6"}, {"max": 21, "min": 1, "name": "esj33IfO"}], [{"max": 17, "min": 4, "name": "igmNkhpr"}, {"max": 60, "min": 12, "name": "i4icUxa7"}, {"max": 94, "min": 76, "name": "nD90ZB2T"}], [{"max": 96, "min": 29, "name": "3tMxg8Me"}, {"max": 38, "min": 53, "name": "q9Fwflh3"}, {"max": 53, "min": 59, "name": "2dGCkYfc"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 76, "role_flexing_second": 71}, "duration": 14, "max_number": 59, "min_number": 99, "player_max_number": 28, "player_min_number": 38}, {"combination": {"alliances": [[{"max": 39, "min": 90, "name": "v9oOXtbG"}, {"max": 77, "min": 93, "name": "LjeP2dVB"}, {"max": 57, "min": 71, "name": "BokIjSxz"}], [{"max": 3, "min": 53, "name": "dGR4BMQI"}, {"max": 77, "min": 85, "name": "nhSbmNN0"}, {"max": 69, "min": 97, "name": "o3PNZ46q"}], [{"max": 56, "min": 63, "name": "oZFd5cSr"}, {"max": 77, "min": 14, "name": "UxwgYhtp"}, {"max": 55, "min": 80, "name": "tJwPaWkk"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 28, "role_flexing_second": 66}, "duration": 95, "max_number": 1, "min_number": 25, "player_max_number": 62, "player_min_number": 27}], "batch_size": 70, "bucket_mmr_rule": {"disable_authority": true, "flex_authority_count": 28, "flex_flat_step_range": 73, "flex_immunity_count": 40, "flex_range_max": 87, "flex_rate_ms": 78, "flex_step_max": 70, "force_authority_match": false, "initial_step_range": 86, "mmr_max": 7, "mmr_mean": 36, "mmr_min": 64, "mmr_std_dev": 82, "override_mmr_data": true, "use_bucket_mmr": false, "use_flat_flex_step": true}, "flexing_rule": [{"attribute": "z2XwIF7k", "criteria": "OmmsnSLD", "duration": 55, "reference": 0.06486551252479977}, {"attribute": "ofdV2HHx", "criteria": "tMSXjh0x", "duration": 86, "reference": 0.047532346923370716}, {"attribute": "UhjFLutD", "criteria": "PJmGAh2p", "duration": 20, "reference": 0.7988557646460778}], "match_options": {"options": [{"name": "MWKOAyyA", "type": "cl5jJavL"}, {"name": "O3sRNRou", "type": "IUOzrpD2"}, {"name": "s739MUGU", "type": "S6gmxquc"}]}, "matching_rule": [{"attribute": "04mjTFYW", "criteria": "1kzvVLWh", "reference": 0.01145467768582753}, {"attribute": "lqPp3iIc", "criteria": "Ul6ufWPL", "reference": 0.6996158276169291}, {"attribute": "pIdiXERA", "criteria": "5yihf7Gm", "reference": 0.9733380036460859}], "rebalance_enable": false, "sort_ticket": {"search_result": "AQBrJz3h", "ticket_queue": "DHjAdXgl"}, "sort_tickets": [{"search_result": "hSPmL3do", "threshold": 29, "ticket_queue": "8pba0fd1"}, {"search_result": "2OdsVM37", "threshold": 16, "ticket_queue": "65LTwuXr"}, {"search_result": "qL4Nh3wh", "threshold": 70, "ticket_queue": "A951VYQN"}], "sub_game_modes": {"ksR370o0": {"alliance": {"combination": {"alliances": [[{"max": 8, "min": 50, "name": "PZxVVRL4"}, {"max": 71, "min": 10, "name": "JZpHvkRb"}, {"max": 17, "min": 17, "name": "byCHbrMy"}], [{"max": 59, "min": 90, "name": "H20qFsh9"}, {"max": 30, "min": 15, "name": "7VMBhNZD"}, {"max": 28, "min": 62, "name": "O1wxQYMw"}], [{"max": 36, "min": 75, "name": "dCs8S7wp"}, {"max": 44, "min": 15, "name": "U1Q2HINg"}, {"max": 47, "min": 81, "name": "rwvh2IIk"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 37, "role_flexing_second": 47}, "max_number": 14, "min_number": 38, "player_max_number": 25, "player_min_number": 40}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 33, "min": 49, "name": "cmTjsmHM"}, {"max": 76, "min": 26, "name": "lTfvULVk"}, {"max": 58, "min": 15, "name": "RkQYQrXG"}], [{"max": 76, "min": 39, "name": "1qzyhXDG"}, {"max": 54, "min": 68, "name": "reENQtIT"}, {"max": 49, "min": 55, "name": "oJNFCRps"}], [{"max": 93, "min": 74, "name": "eE25rZlD"}, {"max": 49, "min": 18, "name": "DEdjufpo"}, {"max": 81, "min": 75, "name": "FAoNbMFR"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 67, "role_flexing_second": 71}, "duration": 40, "max_number": 24, "min_number": 42, "player_max_number": 25, "player_min_number": 74}, {"combination": {"alliances": [[{"max": 61, "min": 21, "name": "Ah4WG1CS"}, {"max": 50, "min": 92, "name": "y1xbG0GX"}, {"max": 9, "min": 7, "name": "f4sLCjBD"}], [{"max": 98, "min": 60, "name": "TFgCHGsC"}, {"max": 74, "min": 92, "name": "aOjFMtaa"}, {"max": 3, "min": 64, "name": "EKvxcxJY"}], [{"max": 67, "min": 88, "name": "zblM4df0"}, {"max": 46, "min": 71, "name": "bUu0uOyp"}, {"max": 98, "min": 90, "name": "HUeBXymy"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 71, "role_flexing_second": 81}, "duration": 94, "max_number": 87, "min_number": 37, "player_max_number": 61, "player_min_number": 67}, {"combination": {"alliances": [[{"max": 44, "min": 34, "name": "YcEg51q9"}, {"max": 43, "min": 21, "name": "p6nQIR71"}, {"max": 80, "min": 36, "name": "8XBQi55E"}], [{"max": 20, "min": 84, "name": "9ZbKFbu9"}, {"max": 49, "min": 59, "name": "i8WS7FXl"}, {"max": 51, "min": 6, "name": "njsNGK38"}], [{"max": 34, "min": 10, "name": "HQF0uNTZ"}, {"max": 86, "min": 40, "name": "YN5xGnlf"}, {"max": 43, "min": 38, "name": "6Zy2Vq4t"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 75, "role_flexing_second": 75}, "duration": 3, "max_number": 97, "min_number": 48, "player_max_number": 72, "player_min_number": 60}], "name": "eAZaAhhw"}, "0pvs1kNf": {"alliance": {"combination": {"alliances": [[{"max": 42, "min": 23, "name": "zr2RGmGR"}, {"max": 87, "min": 38, "name": "nirzDj7J"}, {"max": 34, "min": 58, "name": "Mxcu4TEr"}], [{"max": 22, "min": 67, "name": "atcfLxQy"}, {"max": 91, "min": 43, "name": "UM3CaU1o"}, {"max": 75, "min": 87, "name": "v9hPkUM9"}], [{"max": 23, "min": 26, "name": "GwG5ZoAT"}, {"max": 58, "min": 54, "name": "7q6DvOgV"}, {"max": 61, "min": 28, "name": "9k6D3vLG"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 53, "role_flexing_second": 72}, "max_number": 76, "min_number": 32, "player_max_number": 61, "player_min_number": 80}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 29, "min": 2, "name": "3ocYAgxN"}, {"max": 91, "min": 45, "name": "MdgNUXfk"}, {"max": 46, "min": 21, "name": "8FfNm5qR"}], [{"max": 46, "min": 46, "name": "dxNdPnpT"}, {"max": 68, "min": 62, "name": "uYAHizB6"}, {"max": 65, "min": 25, "name": "CAP7SRG3"}], [{"max": 41, "min": 92, "name": "bzev2TUr"}, {"max": 3, "min": 47, "name": "YG3UUxUe"}, {"max": 90, "min": 59, "name": "uKonHU9r"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 14, "role_flexing_second": 63}, "duration": 20, "max_number": 15, "min_number": 33, "player_max_number": 53, "player_min_number": 74}, {"combination": {"alliances": [[{"max": 36, "min": 89, "name": "9uRMlQjg"}, {"max": 53, "min": 63, "name": "aeN7IrS8"}, {"max": 35, "min": 75, "name": "2Hh8yrob"}], [{"max": 87, "min": 91, "name": "9ffH03ht"}, {"max": 82, "min": 93, "name": "UEqtTKDi"}, {"max": 53, "min": 79, "name": "dHZfu4Pr"}], [{"max": 62, "min": 47, "name": "LQ3Ps6cZ"}, {"max": 6, "min": 61, "name": "y1iMA1Gb"}, {"max": 0, "min": 56, "name": "xRXLt1dm"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 25, "role_flexing_second": 9}, "duration": 42, "max_number": 91, "min_number": 2, "player_max_number": 32, "player_min_number": 20}, {"combination": {"alliances": [[{"max": 49, "min": 63, "name": "sgTtSWOX"}, {"max": 68, "min": 35, "name": "NpMdUx0q"}, {"max": 90, "min": 86, "name": "ecpQvHqZ"}], [{"max": 91, "min": 64, "name": "LRiFqKd4"}, {"max": 100, "min": 89, "name": "JVs48iMd"}, {"max": 3, "min": 41, "name": "xactmd03"}], [{"max": 54, "min": 89, "name": "6rfi8xP8"}, {"max": 2, "min": 25, "name": "1N9GxjLW"}, {"max": 39, "min": 5, "name": "s7dd1g33"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 9, "role_flexing_second": 83}, "duration": 13, "max_number": 5, "min_number": 35, "player_max_number": 11, "player_min_number": 7}], "name": "FKRi1Pt7"}, "qEFxFocD": {"alliance": {"combination": {"alliances": [[{"max": 43, "min": 59, "name": "LKJ0QlPb"}, {"max": 98, "min": 81, "name": "81fRzwvf"}, {"max": 97, "min": 97, "name": "Fu3GIxzK"}], [{"max": 48, "min": 63, "name": "D0bxjdxx"}, {"max": 72, "min": 14, "name": "gfHXhVrZ"}, {"max": 74, "min": 88, "name": "IFgPMkaF"}], [{"max": 34, "min": 18, "name": "JNRR4Ang"}, {"max": 96, "min": 98, "name": "tF1oRNLk"}, {"max": 99, "min": 80, "name": "7uHHmUl8"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 69, "role_flexing_second": 48}, "max_number": 93, "min_number": 24, "player_max_number": 81, "player_min_number": 79}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 25, "min": 71, "name": "ZLr8n67w"}, {"max": 17, "min": 4, "name": "ddUnnr1r"}, {"max": 30, "min": 34, "name": "HotLI4j2"}], [{"max": 2, "min": 85, "name": "HnL4QuYT"}, {"max": 23, "min": 23, "name": "VQ3WeeMA"}, {"max": 66, "min": 1, "name": "Q8n3OT5e"}], [{"max": 49, "min": 49, "name": "PtHM7gNO"}, {"max": 18, "min": 17, "name": "hbpEXOwe"}, {"max": 62, "min": 82, "name": "5hVHWOmz"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 46, "role_flexing_second": 35}, "duration": 63, "max_number": 99, "min_number": 28, "player_max_number": 58, "player_min_number": 26}, {"combination": {"alliances": [[{"max": 64, "min": 77, "name": "sb4pphmg"}, {"max": 44, "min": 27, "name": "k8DXidX8"}, {"max": 39, "min": 21, "name": "FYOvq2zL"}], [{"max": 24, "min": 18, "name": "NcdmsxPb"}, {"max": 28, "min": 69, "name": "AxlKhP7s"}, {"max": 12, "min": 30, "name": "fzMczhyC"}], [{"max": 58, "min": 47, "name": "DL84UzAt"}, {"max": 41, "min": 34, "name": "zE6KDsRR"}, {"max": 44, "min": 50, "name": "qUZICTr7"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 53, "role_flexing_second": 65}, "duration": 87, "max_number": 84, "min_number": 94, "player_max_number": 33, "player_min_number": 8}, {"combination": {"alliances": [[{"max": 33, "min": 12, "name": "DFpYCJ3A"}, {"max": 50, "min": 64, "name": "C6AfS78U"}, {"max": 29, "min": 94, "name": "y2dHvc3h"}], [{"max": 49, "min": 81, "name": "EgkqC8Zx"}, {"max": 68, "min": 35, "name": "YLq64nZG"}, {"max": 90, "min": 48, "name": "5M2031bD"}], [{"max": 31, "min": 47, "name": "P5v1ND2Z"}, {"max": 16, "min": 98, "name": "4VtHn4zy"}, {"max": 23, "min": 87, "name": "29ynIlTk"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 52, "role_flexing_second": 21}, "duration": 12, "max_number": 53, "min_number": 25, "player_max_number": 1, "player_min_number": 92}], "name": "cWzyZVxT"}}, "ticket_flexing_selection": "tfWHGfvS", "ticket_flexing_selections": [{"selection": "XPEQvOMj", "threshold": 37}, {"selection": "ubGmNoEt", "threshold": 86}, {"selection": "IHhMSwSs", "threshold": 89}], "use_newest_ticket_for_flexing": false}, "session_queue_timeout_seconds": 72, "social_matchmaking": true, "sub_gamemode_selection": "ticketOrder", "ticket_observability_enable": true, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName 'L5QHZEky' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'c9xymF7a' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "mUqkuw3i", "players": [{"results": [{"attribute": "gDe3hjQ4", "value": 0.43020373508071375}, {"attribute": "C6i7rMAK", "value": 0.12372848908138057}, {"attribute": "mtRrivN7", "value": 0.3491291156139382}], "user_id": "QvriJ4Z9"}, {"results": [{"attribute": "kyT6jvmW", "value": 0.3123892007304139}, {"attribute": "M5KAR7Ra", "value": 0.19841575299579028}, {"attribute": "joVQx1Sp", "value": 0.689503293708387}], "user_id": "fxssxf52"}, {"results": [{"attribute": "2PyBkjAI", "value": 0.607901197767375}, {"attribute": "zvGAtDLX", "value": 0.6941557774977448}, {"attribute": "p1qGAsee", "value": 0.43244444796835935}], "user_id": "0nMgBxXY"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "vLlY64or"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "bxwZlo6D", "client_version": "QfPue89a", "deployment": "8eqXUUZN", "error_code": 84, "error_message": "ZigNADtY", "game_mode": "zzzLqVCy", "is_mock": "lLEIkfiM", "joinable": true, "match_id": "6Z5VA5Ta", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 31, "party_attributes": {"nknK70Bz": {}, "aETecUMJ": {}, "T0feskFF": {}}, "party_id": "lidhJcW6", "party_members": [{"extra_attributes": {"HxBozltw": {}, "j7t1dJYx": {}, "aUUuK6Fe": {}}, "user_id": "nUMJJ3k0"}, {"extra_attributes": {"wQYds9KF": {}, "VkHLkslC": {}, "mpMLbu7p": {}}, "user_id": "5tH8tVZU"}, {"extra_attributes": {"lMRZ8vdN": {}, "775C3W67": {}, "Epg3dSf6": {}}, "user_id": "wCNVRYRa"}], "ticket_created_at": 29, "ticket_id": "24agT3tE"}, {"first_ticket_created_at": 58, "party_attributes": {"xjr8jQq4": {}, "AzbtIlT6": {}, "89I1T22T": {}}, "party_id": "DDHbxPto", "party_members": [{"extra_attributes": {"MPMLK1Z9": {}, "1n2N6Tdj": {}, "e6AosKjD": {}}, "user_id": "tiDErlar"}, {"extra_attributes": {"iTlounGA": {}, "avQR1jai": {}, "KnrQMVu9": {}}, "user_id": "eVxGkDQs"}, {"extra_attributes": {"dXXrBEt8": {}, "EEaRN34c": {}, "HBF3aAG0": {}}, "user_id": "Hk5WCzTv"}], "ticket_created_at": 16, "ticket_id": "2Ti8SbjB"}, {"first_ticket_created_at": 71, "party_attributes": {"5CGVuq46": {}, "inAwT7qq": {}, "ohnL7Se6": {}}, "party_id": "Qh7JTOYK", "party_members": [{"extra_attributes": {"J0Aij1jg": {}, "IinV3SAR": {}, "X70tLCe8": {}}, "user_id": "QmYh2ZFj"}, {"extra_attributes": {"GmUjFOYv": {}, "zOrVPgrf": {}, "rb2FJpeV": {}}, "user_id": "DEhpSnSt"}, {"extra_attributes": {"rxAjmIV3": {}, "5feVxTFS": {}, "a8cUv4U1": {}}, "user_id": "arvXN4DZ"}], "ticket_created_at": 59, "ticket_id": "tdEOwIs1"}]}, {"matching_parties": [{"first_ticket_created_at": 99, "party_attributes": {"769FZTgO": {}, "CKPhzS9f": {}, "0rM1mWdh": {}}, "party_id": "gI33jhj9", "party_members": [{"extra_attributes": {"h78bvwzR": {}, "5T1PlSOr": {}, "jQLJTOBj": {}}, "user_id": "7GOrzrtd"}, {"extra_attributes": {"xOUnVYzw": {}, "LlAt1UDq": {}, "PEBRhaD4": {}}, "user_id": "TmUnrQsb"}, {"extra_attributes": {"xzvyKzFj": {}, "uZRYad1r": {}, "gfsKmIbf": {}}, "user_id": "3wWX8Ki5"}], "ticket_created_at": 8, "ticket_id": "oUg8SvwK"}, {"first_ticket_created_at": 9, "party_attributes": {"IyNLB8RQ": {}, "3BNBGefF": {}, "L1q7oDZn": {}}, "party_id": "j6KSg4ty", "party_members": [{"extra_attributes": {"0JMjuXe4": {}, "CshI1swP": {}, "L6cy66BH": {}}, "user_id": "zf6p0l4W"}, {"extra_attributes": {"tg4yrFUQ": {}, "Nfhs5J0g": {}, "gOlbzooD": {}}, "user_id": "MhLWVbqp"}, {"extra_attributes": {"5hN1uQ5M": {}, "0m6ODXZY": {}, "vjlnCyMq": {}}, "user_id": "4Uks1iop"}], "ticket_created_at": 4, "ticket_id": "vBxgtUJo"}, {"first_ticket_created_at": 39, "party_attributes": {"WRwolcr7": {}, "n4EGQjxA": {}, "3l7KktLD": {}}, "party_id": "8YjCPUDA", "party_members": [{"extra_attributes": {"BKxQr6DP": {}, "HqhUeRwj": {}, "R03fVEjX": {}}, "user_id": "k8bNESIH"}, {"extra_attributes": {"k5TFHtHb": {}, "T2Ds2Hp1": {}, "H6Ngposm": {}}, "user_id": "UzbwfvFa"}, {"extra_attributes": {"Ydi7zGM3": {}, "cfEmZJ9J": {}, "wIMgM8Jh": {}}, "user_id": "e6bueME8"}], "ticket_created_at": 19, "ticket_id": "1mFaGMOk"}]}, {"matching_parties": [{"first_ticket_created_at": 49, "party_attributes": {"zsxjTCMs": {}, "5I2sLl7x": {}, "R2FP1F6K": {}}, "party_id": "IfyT1m3T", "party_members": [{"extra_attributes": {"ea0xD9HN": {}, "rBmkr69X": {}, "dDbtQ1xh": {}}, "user_id": "HfNgFrIb"}, {"extra_attributes": {"VsgNA77S": {}, "4PIu8s3k": {}, "AWpvfQl7": {}}, "user_id": "kMKtWRF1"}, {"extra_attributes": {"0V0IYU7X": {}, "IHntsxtm": {}, "EJHTqK51": {}}, "user_id": "e82Z2y97"}], "ticket_created_at": 27, "ticket_id": "PFaFbq6i"}, {"first_ticket_created_at": 66, "party_attributes": {"bn42HOmV": {}, "PLoHLYva": {}, "g3LRpA6D": {}}, "party_id": "jl4biSDx", "party_members": [{"extra_attributes": {"hrn181U3": {}, "NTl6EcBh": {}, "rIRawQ3H": {}}, "user_id": "aRNC3y0e"}, {"extra_attributes": {"vxbRxu9q": {}, "y3wKn5TD": {}, "K9VTPPPn": {}}, "user_id": "2SpLHcED"}, {"extra_attributes": {"YmLE9Re9": {}, "hksSXNuN": {}, "QA5rCbqc": {}}, "user_id": "B3lPl2Lm"}], "ticket_created_at": 88, "ticket_id": "DzyLApGB"}, {"first_ticket_created_at": 93, "party_attributes": {"QNjMxZ6o": {}, "hJioHnpA": {}, "KbjXzPhV": {}}, "party_id": "Ozvfq8uy", "party_members": [{"extra_attributes": {"fhnmVBLe": {}, "SHI5RRpr": {}, "cCPOoeYb": {}}, "user_id": "RbbEH6QL"}, {"extra_attributes": {"tDrLqyja": {}, "EvinhgnU": {}, "dEKokL4Y": {}}, "user_id": "Mo1SnZxd"}, {"extra_attributes": {"rfMv1JHV": {}, "0Azooo89": {}, "rrh7xA3S": {}}, "user_id": "HQUMn7su"}], "ticket_created_at": 98, "ticket_id": "eF4ITSy4"}]}], "namespace": "jGpl4oiM", "party_attributes": {"V36vFExA": {}, "fCKmHdX6": {}, "qWjE6Ij8": {}}, "party_id": "aL9dKbHw", "queued_at": 41, "region": "y2FBzCRi", "server_name": "HdP64ZfV", "status": "yl356WKP", "ticket_id": "A9iTKOHV", "ticket_ids": ["vqb5xfgM", "mABhEtzV", "DtTOqPwj"], "updated_at": "1997-11-27T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "GL5DaJwq"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'ZZ1FwzNF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 22, "userID": "vZaMG2GE", "weight": 0.8656106652305364}' \
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
    --matchIDs 'ij4jXq8D' \
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
    --strategy 'URIOiHIZ' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'x01BzbDC' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName '0tWCRIwt' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatch", "deployment": "JtPoyx8A", "description": "iwCoqQXT", "findMatchTimeoutSeconds": 48, "joinable": true, "max_delay_ms": 51, "region_expansion_range_ms": 93, "region_expansion_rate_ms": 85, "region_latency_initial_range_ms": 24, "region_latency_max_ms": 61, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 91, "min": 45, "name": "Z2SEj5M1"}, {"max": 32, "min": 53, "name": "Zt3edX0A"}, {"max": 72, "min": 66, "name": "sIN4DACZ"}], [{"max": 3, "min": 7, "name": "x77ESgPV"}, {"max": 11, "min": 4, "name": "ykR5YiEH"}, {"max": 6, "min": 75, "name": "GR9lh5EK"}], [{"max": 80, "min": 64, "name": "tVYaDGYZ"}, {"max": 78, "min": 69, "name": "Dn1pmwsb"}, {"max": 97, "min": 17, "name": "5X4ae2zN"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 35, "role_flexing_second": 32}, "maxNumber": 26, "minNumber": 28, "playerMaxNumber": 41, "playerMinNumber": 3}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 96, "min": 43, "name": "CAR4oVQX"}, {"max": 26, "min": 33, "name": "eSKmete0"}, {"max": 20, "min": 74, "name": "e2sOFnZy"}], [{"max": 41, "min": 39, "name": "qnauPT9F"}, {"max": 36, "min": 43, "name": "CmVB59Tb"}, {"max": 11, "min": 59, "name": "b8TRMprH"}], [{"max": 35, "min": 71, "name": "mUc51gmt"}, {"max": 79, "min": 85, "name": "jVapvSvX"}, {"max": 30, "min": 17, "name": "sxEuYNvB"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 66, "role_flexing_second": 10}, "duration": 69, "max_number": 82, "min_number": 87, "player_max_number": 56, "player_min_number": 100}, {"combination": {"alliances": [[{"max": 13, "min": 58, "name": "khJRWHsw"}, {"max": 70, "min": 66, "name": "FQiqcEt4"}, {"max": 3, "min": 9, "name": "6Oq8hxFQ"}], [{"max": 31, "min": 45, "name": "yMJxvUoe"}, {"max": 53, "min": 60, "name": "cIOvJuPx"}, {"max": 32, "min": 10, "name": "mxx2pMcg"}], [{"max": 86, "min": 95, "name": "uoyi7DNO"}, {"max": 9, "min": 21, "name": "Fw4WbLWI"}, {"max": 32, "min": 50, "name": "f6isp9Xj"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 38, "role_flexing_second": 72}, "duration": 87, "max_number": 40, "min_number": 7, "player_max_number": 41, "player_min_number": 84}, {"combination": {"alliances": [[{"max": 85, "min": 50, "name": "CzHfiThJ"}, {"max": 49, "min": 12, "name": "GgDAS13b"}, {"max": 88, "min": 31, "name": "peFlUJka"}], [{"max": 36, "min": 69, "name": "Z6UpyUov"}, {"max": 21, "min": 45, "name": "oY8BzGyB"}, {"max": 58, "min": 71, "name": "Pj228h22"}], [{"max": 6, "min": 88, "name": "4FfK0MHL"}, {"max": 0, "min": 22, "name": "BEpm6O9I"}, {"max": 20, "min": 79, "name": "brpHKiuO"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 57, "role_flexing_second": 51}, "duration": 84, "max_number": 92, "min_number": 92, "player_max_number": 92, "player_min_number": 57}], "batch_size": 14, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 56, "flex_flat_step_range": 61, "flex_immunity_count": 72, "flex_range_max": 34, "flex_rate_ms": 90, "flex_step_max": 84, "force_authority_match": true, "initial_step_range": 90, "mmr_max": 16, "mmr_mean": 47, "mmr_min": 89, "mmr_std_dev": 62, "override_mmr_data": true, "use_bucket_mmr": false, "use_flat_flex_step": false}, "flexingRules": [{"attribute": "QeZhzZWc", "criteria": "ZlpT2hLW", "duration": 56, "reference": 0.7090698326872984}, {"attribute": "oQlgBLaf", "criteria": "MTkk68J5", "duration": 20, "reference": 0.7541092072023263}, {"attribute": "YhWYFlSG", "criteria": "4CzOFJQw", "duration": 79, "reference": 0.2534061580165585}], "match_options": {"options": [{"name": "n5mjRlcZ", "type": "JCzYSjre"}, {"name": "GOGPrajn", "type": "4iw6arDA"}, {"name": "QnlC2t74", "type": "Fi1A9hPT"}]}, "matchingRules": [{"attribute": "fp5HX08k", "criteria": "Da5L3fGu", "reference": 0.824579817194914}, {"attribute": "piQiVKAd", "criteria": "tshH8DvE", "reference": 0.026430083903497215}, {"attribute": "S9zK1dSg", "criteria": "pgdgbGyO", "reference": 0.2011178274100336}], "sort_ticket": {"search_result": "wHorgAAn", "ticket_queue": "em7tdOQY"}, "sort_tickets": [{"search_result": "xrYab2yO", "threshold": 27, "ticket_queue": "TR3ZUjsh"}, {"search_result": "WoWlvCog", "threshold": 14, "ticket_queue": "n3ovcbS6"}, {"search_result": "rmlr1Yfn", "threshold": 16, "ticket_queue": "r10N65hi"}], "sub_game_modes": {}, "ticket_flexing_selection": "O9yUdhTf", "ticket_flexing_selections": [{"selection": "9dmsRh0g", "threshold": 67}, {"selection": "FKQRq15x", "threshold": 35}, {"selection": "ffUqJSJA", "threshold": 41}], "use_newest_ticket_for_flexing": false}, "sessionQueueTimeoutSeconds": 52, "socialMatchmaking": false, "sub_gamemode_selection": "random", "ticket_observability_enable": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName 'L4LfcPEP' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName 'uiDZTMjH' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName 'ssU3HJpM' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 73}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName 'u2VMeojS' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName 'NHZhsEAl' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "3oniLAnn", "count": 10, "mmrMax": 0.4436801855713175, "mmrMean": 0.312687784460173, "mmrMin": 0.8882454399998402, "mmrStdDev": 0.2795096199906544}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'ZzIoSjCl' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 30, "party_attributes": {"WgSDT1Go": {}, "KL9jpNoj": {}, "LSalnrEE": {}}, "party_id": "tCylCxhp", "party_members": [{"extra_attributes": {"rq3mRpFk": {}, "hKXS1TZq": {}, "gTUfmM3z": {}}, "user_id": "bB5APFNG"}, {"extra_attributes": {"TWJWM1rF": {}, "aU8RCSPc": {}, "VPE4OxA9": {}}, "user_id": "Tu2S5hYS"}, {"extra_attributes": {"1LxWW7y4": {}, "GAgd9iAG": {}, "bXXVQsRV": {}}, "user_id": "2OAakdZe"}], "ticket_created_at": 44, "ticket_id": "bPodXNt0"}, {"first_ticket_created_at": 2, "party_attributes": {"95hnDGu7": {}, "LLMX7J1V": {}, "AjN97Rzd": {}}, "party_id": "O0Mnl0It", "party_members": [{"extra_attributes": {"nWjYU9ph": {}, "1VQWyOTc": {}, "tSjlVOmj": {}}, "user_id": "PecqhSHS"}, {"extra_attributes": {"DXc9So8f": {}, "7o6uom09": {}, "uIikR7SL": {}}, "user_id": "rpigEjaA"}, {"extra_attributes": {"ipn2Qa5s": {}, "XMMLSQpB": {}, "a4Kv57l3": {}}, "user_id": "y335OJkO"}], "ticket_created_at": 1, "ticket_id": "DjMftrAv"}, {"first_ticket_created_at": 30, "party_attributes": {"pbMTKECa": {}, "SWeieiZH": {}, "QI2XIUZI": {}}, "party_id": "nYT0KMda", "party_members": [{"extra_attributes": {"o4AxepIS": {}, "DamOmH6f": {}, "XPME9rLm": {}}, "user_id": "pIDJhAxU"}, {"extra_attributes": {"oAbIwNzQ": {}, "cxliv92m": {}, "bpSlv42m": {}}, "user_id": "rqMtpJv9"}, {"extra_attributes": {"vOFPStOx": {}, "KLh49RxS": {}, "9a8Ky0Bs": {}}, "user_id": "M5yZozNX"}], "ticket_created_at": 24, "ticket_id": "8i2wIiZS"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName 'jQJe7dQC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 37}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'CPbvcwz6' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'FVDd78Pj' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'XkzFeojE' \
    --matchID 'rdze7LgE' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["sTETUGDu", "Jp3YM9x5", "to005rOu"], "party_id": "Tiil7vO8", "user_id": "3NRDCqS5"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'pehVmObi' \
    --matchID 'EEoS2Pmd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'bSGLd7HX' \
    --matchID 'jpjfc3a8' \
    --namespace "$AB_NAMESPACE" \
    --userID 'w7dnsL9X' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName 'TNrXLnJu' \
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
    --channelName 'NXPL56KV' \
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