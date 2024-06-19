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
    --limit '95' \
    --offset '25' \
    > test.out 2>&1
eval_tap $? 4 'GetAllChannelsHandler' test.out

#- 5 CreateChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking createChannelHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatchOnDifferentTeam", "deployment": "EVklnbq2", "description": "Mo9aAU06", "find_match_timeout_seconds": 40, "game_mode": "FKKdZQ0S", "joinable": false, "max_delay_ms": 21, "region_expansion_range_ms": 51, "region_expansion_rate_ms": 50, "region_latency_initial_range_ms": 59, "region_latency_max_ms": 51, "rule_set": {"alliance": {"combination": {"alliances": [[{"max": 78, "min": 34, "name": "epsKEINS"}, {"max": 23, "min": 69, "name": "agowMVOs"}, {"max": 55, "min": 71, "name": "7ZK8aR4k"}], [{"max": 71, "min": 89, "name": "n6eqmqIG"}, {"max": 20, "min": 91, "name": "dglnaplo"}, {"max": 100, "min": 80, "name": "i8CDqyEh"}], [{"max": 47, "min": 11, "name": "K0GCKv3l"}, {"max": 99, "min": 75, "name": "aMZzldBS"}, {"max": 36, "min": 89, "name": "M7DoQTHH"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 76, "role_flexing_second": 82}, "max_number": 12, "min_number": 23, "player_max_number": 36, "player_min_number": 61}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 61, "min": 7, "name": "aIn3fAhm"}, {"max": 54, "min": 28, "name": "K9J9ZmGb"}, {"max": 2, "min": 22, "name": "Mj1ZSyrV"}], [{"max": 34, "min": 63, "name": "hjqDOxBQ"}, {"max": 1, "min": 79, "name": "0jHcmAH2"}, {"max": 68, "min": 1, "name": "k8z4eSQX"}], [{"max": 88, "min": 59, "name": "9MbRTqJW"}, {"max": 25, "min": 18, "name": "1VfiVpoK"}, {"max": 37, "min": 8, "name": "hsRZqrdM"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 74, "role_flexing_second": 71}, "duration": 30, "max_number": 68, "min_number": 67, "player_max_number": 18, "player_min_number": 32}, {"combination": {"alliances": [[{"max": 0, "min": 22, "name": "4ZcxPDYt"}, {"max": 27, "min": 13, "name": "N4bUvwNZ"}, {"max": 52, "min": 96, "name": "CRKQ4DFY"}], [{"max": 24, "min": 31, "name": "BN9laCHZ"}, {"max": 26, "min": 29, "name": "QmwXBXAa"}, {"max": 93, "min": 29, "name": "GOHI1gz5"}], [{"max": 53, "min": 65, "name": "PoOtVud2"}, {"max": 13, "min": 82, "name": "HrFcxxNH"}, {"max": 83, "min": 78, "name": "q68Gi59I"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 76, "role_flexing_second": 67}, "duration": 5, "max_number": 93, "min_number": 93, "player_max_number": 24, "player_min_number": 46}, {"combination": {"alliances": [[{"max": 46, "min": 79, "name": "XWCtCEc4"}, {"max": 63, "min": 19, "name": "auUfRkan"}, {"max": 93, "min": 98, "name": "2sL42Nsc"}], [{"max": 18, "min": 94, "name": "LilJccdW"}, {"max": 1, "min": 37, "name": "ezgl56ls"}, {"max": 41, "min": 56, "name": "VrgSfz0c"}], [{"max": 83, "min": 94, "name": "Qdggh36e"}, {"max": 50, "min": 55, "name": "kmyz18ei"}, {"max": 55, "min": 37, "name": "TlrY8Iod"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 33, "role_flexing_second": 4}, "duration": 81, "max_number": 55, "min_number": 78, "player_max_number": 15, "player_min_number": 97}], "batch_size": 45, "bucket_mmr_rule": {"disable_authority": false, "flex_authority_count": 32, "flex_flat_step_range": 92, "flex_immunity_count": 9, "flex_range_max": 66, "flex_rate_ms": 12, "flex_step_max": 73, "force_authority_match": false, "initial_step_range": 89, "mmr_max": 92, "mmr_mean": 44, "mmr_min": 77, "mmr_std_dev": 86, "override_mmr_data": false, "use_bucket_mmr": true, "use_flat_flex_step": true}, "flexing_rule": [{"attribute": "NZ7qhmUN", "criteria": "5vAdVyQD", "duration": 18, "reference": 0.29683430085093165}, {"attribute": "Qsv906sa", "criteria": "Fjqf9nD3", "duration": 81, "reference": 0.25441295775819905}, {"attribute": "BYDN0Bc3", "criteria": "fLfPMqGf", "duration": 14, "reference": 0.1529344457500409}], "match_options": {"options": [{"name": "9TX8wBli", "type": "oakyiijV"}, {"name": "KwDagfuH", "type": "EyaI0Fwt"}, {"name": "f6LPe28M", "type": "heWqbSAI"}]}, "matching_rule": [{"attribute": "xy3B2GoQ", "criteria": "0OmzO8C6", "reference": 0.5289874231949284}, {"attribute": "0xOGa7fE", "criteria": "gv37P8xA", "reference": 0.5673320936095966}, {"attribute": "Uurgurla", "criteria": "YtkWVDzz", "reference": 0.0747061935227249}], "rebalance_enable": true, "sort_ticket": {"search_result": "NQPQXFvM", "ticket_queue": "wNL7wqXe"}, "sort_tickets": [{"search_result": "KWhD88On", "threshold": 75, "ticket_queue": "Yp1upku8"}, {"search_result": "mK2JMf9O", "threshold": 11, "ticket_queue": "GLJdKq4i"}, {"search_result": "pvVs0btF", "threshold": 45, "ticket_queue": "hSRQu0rd"}], "sub_game_modes": {"VY585cJx": {"alliance": {"combination": {"alliances": [[{"max": 77, "min": 57, "name": "tkAoO7T2"}, {"max": 80, "min": 89, "name": "9Txzeeo5"}, {"max": 15, "min": 56, "name": "VJvBsEd4"}], [{"max": 71, "min": 81, "name": "Qnf91Wkm"}, {"max": 25, "min": 39, "name": "gxj6RQYr"}, {"max": 1, "min": 21, "name": "QzWIGTv3"}], [{"max": 76, "min": 80, "name": "APSad0bO"}, {"max": 90, "min": 88, "name": "1USSfb2Q"}, {"max": 11, "min": 81, "name": "usw6ldfi"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 81, "role_flexing_second": 56}, "max_number": 32, "min_number": 24, "player_max_number": 7, "player_min_number": 64}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 29, "min": 8, "name": "XUEObam6"}, {"max": 42, "min": 41, "name": "7Nee2ziK"}, {"max": 41, "min": 96, "name": "8MNNZYfA"}], [{"max": 78, "min": 74, "name": "2YEa9Kce"}, {"max": 15, "min": 50, "name": "EGvqdxfj"}, {"max": 57, "min": 68, "name": "EpTTujpy"}], [{"max": 37, "min": 41, "name": "tP0PcPeA"}, {"max": 82, "min": 99, "name": "UAnO1jao"}, {"max": 39, "min": 10, "name": "zp9wzXUs"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 74, "role_flexing_second": 82}, "duration": 79, "max_number": 84, "min_number": 84, "player_max_number": 90, "player_min_number": 42}, {"combination": {"alliances": [[{"max": 80, "min": 48, "name": "gALfASbk"}, {"max": 63, "min": 64, "name": "twvqyxSg"}, {"max": 24, "min": 16, "name": "cEAQqIlc"}], [{"max": 6, "min": 23, "name": "pbpabujM"}, {"max": 43, "min": 36, "name": "pVVAvY0n"}, {"max": 2, "min": 50, "name": "itY8akoF"}], [{"max": 88, "min": 57, "name": "Rh2xfzrh"}, {"max": 57, "min": 53, "name": "jexXpJtZ"}, {"max": 42, "min": 69, "name": "q7DEYBDk"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 37, "role_flexing_second": 62}, "duration": 29, "max_number": 40, "min_number": 94, "player_max_number": 83, "player_min_number": 93}, {"combination": {"alliances": [[{"max": 12, "min": 41, "name": "jLft05Fw"}, {"max": 28, "min": 18, "name": "orAiIFVl"}, {"max": 66, "min": 65, "name": "zi97ZLz4"}], [{"max": 90, "min": 32, "name": "ShN5FPYL"}, {"max": 25, "min": 86, "name": "7KwaE7Z2"}, {"max": 61, "min": 85, "name": "SuqC7Hpd"}], [{"max": 64, "min": 94, "name": "J9pvzRSr"}, {"max": 88, "min": 18, "name": "w1A2YtpR"}, {"max": 18, "min": 87, "name": "k5NDslJu"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 69, "role_flexing_second": 17}, "duration": 26, "max_number": 48, "min_number": 8, "player_max_number": 89, "player_min_number": 16}], "name": "PHcmcsdl"}, "k4CJFPBX": {"alliance": {"combination": {"alliances": [[{"max": 4, "min": 48, "name": "aOaVBM8y"}, {"max": 7, "min": 57, "name": "lEL2Z8aq"}, {"max": 27, "min": 33, "name": "JLjdlq9H"}], [{"max": 92, "min": 92, "name": "BeMeoFrc"}, {"max": 60, "min": 96, "name": "Q17l1vrz"}, {"max": 86, "min": 53, "name": "JPJKVtKc"}], [{"max": 29, "min": 77, "name": "37ZHY0bV"}, {"max": 63, "min": 47, "name": "79aAnrf1"}, {"max": 64, "min": 4, "name": "YHcg5rIf"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 40, "role_flexing_second": 27}, "max_number": 46, "min_number": 39, "player_max_number": 8, "player_min_number": 6}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 5, "min": 77, "name": "G2thcUA6"}, {"max": 90, "min": 97, "name": "0o3EF7TR"}, {"max": 76, "min": 0, "name": "ccd6sCro"}], [{"max": 93, "min": 31, "name": "kKzgbQRj"}, {"max": 85, "min": 55, "name": "aERzQADp"}, {"max": 64, "min": 65, "name": "HfCIMPBj"}], [{"max": 14, "min": 76, "name": "0egkAs2s"}, {"max": 55, "min": 2, "name": "4UbEdKU8"}, {"max": 59, "min": 82, "name": "Fcj7tF6z"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 1, "role_flexing_second": 52}, "duration": 70, "max_number": 92, "min_number": 3, "player_max_number": 26, "player_min_number": 100}, {"combination": {"alliances": [[{"max": 8, "min": 72, "name": "cyg6hctL"}, {"max": 100, "min": 39, "name": "sQAhdbE7"}, {"max": 34, "min": 41, "name": "YNZVCDQa"}], [{"max": 51, "min": 69, "name": "0kxwAweo"}, {"max": 56, "min": 17, "name": "bEA6wCcy"}, {"max": 70, "min": 79, "name": "3secKUg3"}], [{"max": 26, "min": 38, "name": "ueppP0DA"}, {"max": 31, "min": 44, "name": "1Vi7tzgy"}, {"max": 4, "min": 58, "name": "3kCKfPuS"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 39, "role_flexing_second": 65}, "duration": 14, "max_number": 63, "min_number": 73, "player_max_number": 16, "player_min_number": 97}, {"combination": {"alliances": [[{"max": 99, "min": 63, "name": "znCfEKYl"}, {"max": 87, "min": 26, "name": "QAn3MUIs"}, {"max": 45, "min": 9, "name": "hl2lhVeB"}], [{"max": 34, "min": 61, "name": "GOE8wku2"}, {"max": 17, "min": 95, "name": "mfSJOxBk"}, {"max": 20, "min": 71, "name": "nERoDJzD"}], [{"max": 96, "min": 74, "name": "a1fyCEOW"}, {"max": 40, "min": 95, "name": "HMduWkrl"}, {"max": 18, "min": 23, "name": "VCjffA5s"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 3, "role_flexing_second": 30}, "duration": 94, "max_number": 81, "min_number": 20, "player_max_number": 90, "player_min_number": 62}], "name": "4WFdGvUg"}, "0zzxOqbL": {"alliance": {"combination": {"alliances": [[{"max": 81, "min": 32, "name": "f0nd8Yqa"}, {"max": 64, "min": 25, "name": "MvaKYGnA"}, {"max": 70, "min": 88, "name": "zpmNIz2W"}], [{"max": 33, "min": 92, "name": "mZOewbSz"}, {"max": 59, "min": 10, "name": "xmaGBuQx"}, {"max": 30, "min": 37, "name": "rKbDqnXg"}], [{"max": 33, "min": 27, "name": "GCgPypv1"}, {"max": 86, "min": 29, "name": "8BxNeKWD"}, {"max": 63, "min": 5, "name": "kgokqYce"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 92, "role_flexing_second": 53}, "max_number": 39, "min_number": 69, "player_max_number": 75, "player_min_number": 51}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 48, "min": 60, "name": "xx2obb3k"}, {"max": 22, "min": 54, "name": "2s5AZF9Z"}, {"max": 9, "min": 88, "name": "Xb0jCyvT"}], [{"max": 78, "min": 53, "name": "sEx3M3ky"}, {"max": 14, "min": 56, "name": "EmPQWNqM"}, {"max": 14, "min": 87, "name": "3HjOEguZ"}], [{"max": 49, "min": 15, "name": "sLFF0Zyb"}, {"max": 81, "min": 51, "name": "FuseFEW2"}, {"max": 50, "min": 19, "name": "SLQn5XBm"}]], "has_combination": false, "role_flexing_enable": false, "role_flexing_player": 1, "role_flexing_second": 5}, "duration": 7, "max_number": 7, "min_number": 97, "player_max_number": 50, "player_min_number": 59}, {"combination": {"alliances": [[{"max": 56, "min": 88, "name": "1PLpBkrL"}, {"max": 48, "min": 73, "name": "8sdhS3Px"}, {"max": 75, "min": 15, "name": "uc4XVDbc"}], [{"max": 12, "min": 60, "name": "o3WmzIdv"}, {"max": 100, "min": 62, "name": "6vzwQuIU"}, {"max": 70, "min": 20, "name": "a8KxBKqa"}], [{"max": 41, "min": 99, "name": "kw7GJ7Nr"}, {"max": 4, "min": 74, "name": "W6CjHEQV"}, {"max": 89, "min": 99, "name": "JaXveJoU"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 3, "role_flexing_second": 39}, "duration": 85, "max_number": 53, "min_number": 85, "player_max_number": 70, "player_min_number": 8}, {"combination": {"alliances": [[{"max": 81, "min": 63, "name": "6j0EKs7Z"}, {"max": 29, "min": 0, "name": "0lgwZjvd"}, {"max": 3, "min": 42, "name": "IzwRaDsh"}], [{"max": 62, "min": 50, "name": "Y3u68lAc"}, {"max": 75, "min": 78, "name": "WDRf13VW"}, {"max": 74, "min": 39, "name": "gP5kOv2h"}], [{"max": 45, "min": 16, "name": "uXtVtTIt"}, {"max": 100, "min": 32, "name": "jBSSJZbC"}, {"max": 15, "min": 53, "name": "sBoSo0J3"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 95, "role_flexing_second": 71}, "duration": 30, "max_number": 90, "min_number": 19, "player_max_number": 72, "player_min_number": 80}], "name": "wxnINpMs"}}, "ticket_flexing_selection": "XrEGicad", "ticket_flexing_selections": [{"selection": "BTfbaGQm", "threshold": 91}, {"selection": "mhCJqTPI", "threshold": 60}, {"selection": "lyagugnO", "threshold": 43}], "use_newest_ticket_for_flexing": true}, "session_queue_timeout_seconds": 67, "social_matchmaking": true, "sub_gamemode_selection": "ticketOrder", "ticket_observability_enable": false, "use_sub_gamemode": false}' \
    > test.out 2>&1
eval_tap $? 5 'CreateChannelHandler' test.out

#- 6 GetMatchPoolMetric
./ng net.accelbyte.sdk.cli.Main matchmaking getMatchPoolMetric \
    --channelName 'FJvqK1er' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 6 'GetMatchPoolMetric' test.out

#- 7 DeleteChannelHandler
./ng net.accelbyte.sdk.cli.Main matchmaking deleteChannelHandler \
    --channel 'NLnPKxNd' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 7 'DeleteChannelHandler' test.out

#- 8 StoreMatchResults
./ng net.accelbyte.sdk.cli.Main matchmaking storeMatchResults \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "J66XvyyS", "players": [{"results": [{"attribute": "lVuW24zY", "value": 0.4756722771222486}, {"attribute": "mU7bpp1j", "value": 0.45315833324835464}, {"attribute": "eAMxbuM4", "value": 0.5339935317684541}], "user_id": "KYeiQn65"}, {"results": [{"attribute": "bVOGLYg2", "value": 0.9261171891209509}, {"attribute": "SBMhVO1Q", "value": 0.677412318352689}, {"attribute": "lildWJcl", "value": 0.4330297927134509}], "user_id": "xk1NmyMY"}, {"results": [{"attribute": "vabibd39", "value": 0.10445942789354512}, {"attribute": "OszLG8aH", "value": 0.7590218695885368}, {"attribute": "zc0fouDt", "value": 0.8268733170848481}], "user_id": "UG5xhdOi"}]}' \
    > test.out 2>&1
eval_tap $? 8 'StoreMatchResults' test.out

#- 9 Rebalance
./ng net.accelbyte.sdk.cli.Main matchmaking rebalance \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "EgdULKTK"}' \
    > test.out 2>&1
eval_tap $? 9 'Rebalance' test.out

#- 10 QueueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking queueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"channel": "FV0fOC9R", "client_version": "cW8ct8yY", "deployment": "WqSPLgzX", "error_code": 45, "error_message": "BfZzR2Gw", "game_mode": "k7cBnPHJ", "is_mock": "ylVMZYWV", "joinable": true, "match_id": "hCUinuuO", "matching_allies": [{"matching_parties": [{"first_ticket_created_at": 18, "party_attributes": {"OxSDz6ab": {}, "M4wUGoa6": {}, "ZNCB26nJ": {}}, "party_id": "Xgv6cQC6", "party_members": [{"extra_attributes": {"RsOKPB94": {}, "dMhKiSWZ": {}, "RUD9X08Q": {}}, "user_id": "9XbWwvbB"}, {"extra_attributes": {"LPqmqVR9": {}, "oUbvaDXX": {}, "PGdpL60G": {}}, "user_id": "7WoVykUi"}, {"extra_attributes": {"j8s6883k": {}, "M2dDAubO": {}, "oDiDwigJ": {}}, "user_id": "fV42fTex"}], "ticket_created_at": 92, "ticket_id": "lyWggmHW"}, {"first_ticket_created_at": 93, "party_attributes": {"LJ0Uc76a": {}, "e0S3J7g6": {}, "sXGXNHeO": {}}, "party_id": "K1eZgcD0", "party_members": [{"extra_attributes": {"ZY0tkQH4": {}, "fx4vtcvA": {}, "1gEVyWaN": {}}, "user_id": "IXQ3gu04"}, {"extra_attributes": {"rnSW04a9": {}, "uap9bPlF": {}, "2UKyUpLw": {}}, "user_id": "XI6gqTGs"}, {"extra_attributes": {"ym16sj72": {}, "Q62oxiiy": {}, "XTmuBpkb": {}}, "user_id": "IVBjIlRo"}], "ticket_created_at": 82, "ticket_id": "tCYhFPOz"}, {"first_ticket_created_at": 74, "party_attributes": {"2lm6jFGi": {}, "eUoaIQ8j": {}, "dihEARYs": {}}, "party_id": "qmjfI348", "party_members": [{"extra_attributes": {"RTh4WeLN": {}, "XFP8q54s": {}, "G6btkaIw": {}}, "user_id": "uIB0AQ5I"}, {"extra_attributes": {"VRV3CUew": {}, "cRO2QwO7": {}, "f2MyyspD": {}}, "user_id": "EuzY52Z1"}, {"extra_attributes": {"QtRoDx4d": {}, "RQVd5Bsm": {}, "O9TuBmoY": {}}, "user_id": "deDySsai"}], "ticket_created_at": 17, "ticket_id": "kykZLr5X"}]}, {"matching_parties": [{"first_ticket_created_at": 67, "party_attributes": {"QxV1ul3R": {}, "RMHJZELw": {}, "sHoPCW9k": {}}, "party_id": "Ypr3CIlS", "party_members": [{"extra_attributes": {"chzOBNDy": {}, "35LkwfRU": {}, "zqkYa5jg": {}}, "user_id": "bkqe0CKk"}, {"extra_attributes": {"Z8RuftZL": {}, "niOlIOYU": {}, "G6KYZ7IA": {}}, "user_id": "K5qHGPBv"}, {"extra_attributes": {"dnSMhnle": {}, "6eEsrN8e": {}, "9x6FEUNX": {}}, "user_id": "X9GvLU6L"}], "ticket_created_at": 80, "ticket_id": "3cvD5Ifa"}, {"first_ticket_created_at": 12, "party_attributes": {"rA9V1bh9": {}, "swoM4WlX": {}, "xRLvXSKr": {}}, "party_id": "Jpfm3ms0", "party_members": [{"extra_attributes": {"XxKWW6dp": {}, "wKEnP9Zc": {}, "2Tw5Js7o": {}}, "user_id": "BbgOQFOh"}, {"extra_attributes": {"y2uKyf2y": {}, "vZy2dZV2": {}, "iSfXUgDH": {}}, "user_id": "2MlFElGx"}, {"extra_attributes": {"dhyGCuiK": {}, "Jbs2tXku": {}, "ng4VDwyW": {}}, "user_id": "lKDM1c9I"}], "ticket_created_at": 73, "ticket_id": "LMloyu6r"}, {"first_ticket_created_at": 85, "party_attributes": {"G5gHVsq9": {}, "N76hIcGs": {}, "ufCOdDj8": {}}, "party_id": "RMvZmdQv", "party_members": [{"extra_attributes": {"VhRQWmwM": {}, "X4XY4HJx": {}, "4TALtOTt": {}}, "user_id": "RsZ6MfRH"}, {"extra_attributes": {"kScsrTNp": {}, "HWaUPIAD": {}, "ZRI8gB0i": {}}, "user_id": "5H1qjlpB"}, {"extra_attributes": {"SVpWHMxV": {}, "IUom8qwU": {}, "08GaszYX": {}}, "user_id": "SWHNvZ6T"}], "ticket_created_at": 51, "ticket_id": "rmDQdJFn"}]}, {"matching_parties": [{"first_ticket_created_at": 12, "party_attributes": {"lgA7D9ne": {}, "cAKsxCTc": {}, "Ku80yVK1": {}}, "party_id": "qVlRWSqX", "party_members": [{"extra_attributes": {"pDyT6KA3": {}, "9ahJAbuq": {}, "nfAhqK77": {}}, "user_id": "z9thnqL5"}, {"extra_attributes": {"kr0DThHa": {}, "ObODvYtx": {}, "HH8zIfj7": {}}, "user_id": "xtOnYrVH"}, {"extra_attributes": {"YvAWrJoI": {}, "aWASPk90": {}, "Tg6uhU6v": {}}, "user_id": "6j5jZkaP"}], "ticket_created_at": 91, "ticket_id": "ZIABKSkK"}, {"first_ticket_created_at": 6, "party_attributes": {"QKXzFgin": {}, "bfINy5UI": {}, "P9kApGqW": {}}, "party_id": "IyS5tqy4", "party_members": [{"extra_attributes": {"tGQV96Dn": {}, "tPZFpVD7": {}, "144rXqLT": {}}, "user_id": "1l74xtgf"}, {"extra_attributes": {"Oqq1wK6b": {}, "76Hv9BEU": {}, "ihiG4E8x": {}}, "user_id": "zSLtWEdj"}, {"extra_attributes": {"m3A1hs9M": {}, "j5lbGc5t": {}, "e2z0oed9": {}}, "user_id": "SdfpP4Rw"}], "ticket_created_at": 67, "ticket_id": "7ciW6Qxl"}, {"first_ticket_created_at": 91, "party_attributes": {"2l14vxy7": {}, "ydbzBVKU": {}, "UFBPsXd6": {}}, "party_id": "YAuK7FHr", "party_members": [{"extra_attributes": {"K4imqgZw": {}, "I5wO47pO": {}, "wPl5lW84": {}}, "user_id": "N3c2fGQ6"}, {"extra_attributes": {"wY05pfbU": {}, "lrJ2vjwx": {}, "YyeCl8BB": {}}, "user_id": "zJAB097w"}, {"extra_attributes": {"26eE9DKx": {}, "XYwfeWjv": {}, "feb6XPd8": {}}, "user_id": "Bo5qmk9l"}], "ticket_created_at": 6, "ticket_id": "pEWKCHMO"}]}], "namespace": "XQJwiTXP", "party_attributes": {"8YYVVsTl": {}, "c2wFnPdQ": {}, "JvvaOXTn": {}}, "party_id": "c22woz1s", "queued_at": 54, "region": "QHV8V1kq", "server_name": "ULVeEl01", "status": "A7uHvEvB", "ticket_id": "JZHurovW", "ticket_ids": ["gDNGGZ2E", "2G0pDvcK", "Q73xauUm"], "updated_at": "1976-10-18T00:00:00Z"}' \
    > test.out 2>&1
eval_tap $? 10 'QueueSessionHandler' test.out

#- 11 DequeueSessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking dequeueSessionHandler \
    --namespace "$AB_NAMESPACE" \
    --body '{"match_id": "DegElMnz"}' \
    > test.out 2>&1
eval_tap $? 11 'DequeueSessionHandler' test.out

#- 12 QuerySessionHandler
./ng net.accelbyte.sdk.cli.Main matchmaking querySessionHandler \
    --matchID 'XbVwRyYT' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 12 'QuerySessionHandler' test.out

#- 13 UpdatePlayTimeWeight
./ng net.accelbyte.sdk.cli.Main matchmaking updatePlayTimeWeight \
    --namespace "$AB_NAMESPACE" \
    --body '{"playtime": 10, "userID": "Wf7uc3oF", "weight": 0.3461299664188816}' \
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
    --matchIDs 'SWy5zrsP' \
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
    --strategy 'vfFdAls1' \
    > test.out 2>&1
eval_tap $? 17 'ImportChannels' test.out

#- 18 GetSingleMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getSingleMatchmakingChannel \
    --channelName 'RVhtvIr1' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 18 'GetSingleMatchmakingChannel' test.out

#- 19 UpdateMatchmakingChannel
./ng net.accelbyte.sdk.cli.Main matchmaking updateMatchmakingChannel \
    --channelName 'cHBja2iV' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_player_option": "blockedPlayerCanMatch", "deployment": "eGbvxJDQ", "description": "Rtax4Jmb", "findMatchTimeoutSeconds": 99, "joinable": false, "max_delay_ms": 88, "region_expansion_range_ms": 10, "region_expansion_rate_ms": 91, "region_latency_initial_range_ms": 22, "region_latency_max_ms": 15, "ruleSet": {"alliance": {"combination": {"alliances": [[{"max": 42, "min": 3, "name": "lCDjAfe4"}, {"max": 0, "min": 22, "name": "gvBd93cS"}, {"max": 99, "min": 96, "name": "NGFo26xv"}], [{"max": 39, "min": 18, "name": "Jg0rEeNj"}, {"max": 44, "min": 72, "name": "fQYMKH4Z"}, {"max": 61, "min": 93, "name": "Xq3u7R1g"}], [{"max": 62, "min": 62, "name": "3LAZjfFS"}, {"max": 80, "min": 8, "name": "CFGx0a4e"}, {"max": 38, "min": 27, "name": "QNVBdhLx"}]], "has_combination": false, "role_flexing_enable": true, "role_flexing_player": 43, "role_flexing_second": 51}, "maxNumber": 58, "minNumber": 3, "playerMaxNumber": 35, "playerMinNumber": 77}, "alliance_flexing_rule": [{"combination": {"alliances": [[{"max": 17, "min": 28, "name": "e1dZZaDS"}, {"max": 96, "min": 65, "name": "X9m6RaQg"}, {"max": 40, "min": 64, "name": "EXtaMdF5"}], [{"max": 79, "min": 34, "name": "nBzVl2S6"}, {"max": 5, "min": 69, "name": "R7BTy8h8"}, {"max": 57, "min": 46, "name": "izgLqOG2"}], [{"max": 50, "min": 48, "name": "mzDIwLvb"}, {"max": 14, "min": 94, "name": "Hhr76Mnb"}, {"max": 72, "min": 94, "name": "btkCVlJK"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 37, "role_flexing_second": 65}, "duration": 52, "max_number": 95, "min_number": 24, "player_max_number": 92, "player_min_number": 89}, {"combination": {"alliances": [[{"max": 89, "min": 75, "name": "7UzEQtgi"}, {"max": 2, "min": 9, "name": "3ONIrOeb"}, {"max": 52, "min": 25, "name": "sgxhcbSy"}], [{"max": 68, "min": 53, "name": "6UDlT1xx"}, {"max": 16, "min": 75, "name": "60voOTsd"}, {"max": 25, "min": 82, "name": "qeUV7vIh"}], [{"max": 74, "min": 86, "name": "WGDrgYVC"}, {"max": 76, "min": 98, "name": "PWLVDjOu"}, {"max": 13, "min": 70, "name": "Dtqoh4jq"}]], "has_combination": true, "role_flexing_enable": true, "role_flexing_player": 29, "role_flexing_second": 14}, "duration": 43, "max_number": 97, "min_number": 40, "player_max_number": 69, "player_min_number": 37}, {"combination": {"alliances": [[{"max": 20, "min": 63, "name": "ZHfDyGM3"}, {"max": 50, "min": 75, "name": "vZfXTX4i"}, {"max": 52, "min": 43, "name": "aKYCUamA"}], [{"max": 85, "min": 82, "name": "RG5MuUyF"}, {"max": 31, "min": 3, "name": "1NcD7vzw"}, {"max": 39, "min": 63, "name": "scZ0ITpM"}], [{"max": 83, "min": 61, "name": "FrWbcL7t"}, {"max": 8, "min": 1, "name": "sjf9tcJg"}, {"max": 67, "min": 94, "name": "o0XTNbdN"}]], "has_combination": true, "role_flexing_enable": false, "role_flexing_player": 67, "role_flexing_second": 0}, "duration": 91, "max_number": 42, "min_number": 98, "player_max_number": 32, "player_min_number": 81}], "batch_size": 88, "bucket_mmr_rule": {"disable_authority": true, "flex_authority_count": 32, "flex_flat_step_range": 49, "flex_immunity_count": 41, "flex_range_max": 96, "flex_rate_ms": 8, "flex_step_max": 13, "force_authority_match": true, "initial_step_range": 93, "mmr_max": 97, "mmr_mean": 89, "mmr_min": 97, "mmr_std_dev": 52, "override_mmr_data": true, "use_bucket_mmr": true, "use_flat_flex_step": false}, "flexingRules": [{"attribute": "4AHdLVhw", "criteria": "dMrdmUr4", "duration": 40, "reference": 0.48608723330385106}, {"attribute": "tPbjZmSn", "criteria": "dp36zA3P", "duration": 64, "reference": 0.9646013517173196}, {"attribute": "7gKzQcrF", "criteria": "4ECMLiX6", "duration": 80, "reference": 0.24515292433684965}], "match_options": {"options": [{"name": "TtxnJqug", "type": "l05Kj1gN"}, {"name": "0LM5KSB4", "type": "bNTVUnPD"}, {"name": "eYUgjXNG", "type": "nEFEkwaM"}]}, "matchingRules": [{"attribute": "hxZD5MkA", "criteria": "ZBigEFsD", "reference": 0.459290865659681}, {"attribute": "MPGs8l1g", "criteria": "jjK86N7v", "reference": 0.5468106658898597}, {"attribute": "qf7VxbkF", "criteria": "aNwCQYID", "reference": 0.5741251577560781}], "sort_ticket": {"search_result": "73XrbeNR", "ticket_queue": "6Z8a6Cyi"}, "sort_tickets": [{"search_result": "MvK19QeG", "threshold": 47, "ticket_queue": "fjuasqU9"}, {"search_result": "Ni4dKE94", "threshold": 7, "ticket_queue": "GspYs2Qx"}, {"search_result": "vczzPf0b", "threshold": 17, "ticket_queue": "rS0aShwL"}], "sub_game_modes": {}, "ticket_flexing_selection": "70GKoAG5", "ticket_flexing_selections": [{"selection": "kR2ROmKh", "threshold": 85}, {"selection": "0kSwLLMY", "threshold": 54}, {"selection": "ZxwkrF1U", "threshold": 47}], "use_newest_ticket_for_flexing": false}, "sessionQueueTimeoutSeconds": 8, "socialMatchmaking": false, "sub_gamemode_selection": "ticketOrder", "ticket_observability_enable": false, "use_sub_gamemode": true}' \
    > test.out 2>&1
eval_tap $? 19 'UpdateMatchmakingChannel' test.out

#- 20 CleanAllMocks
./ng net.accelbyte.sdk.cli.Main matchmaking cleanAllMocks \
    --channelName 'wEYd5uwF' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 20 'CleanAllMocks' test.out

#- 21 GetAllMockMatches
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockMatches \
    --channelName 'IOXf8h6W' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 21 'GetAllMockMatches' test.out

#- 22 GetMockMatchesByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockMatchesByTimestamp \
    --channelName 'aIzt576S' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 89}' \
    > test.out 2>&1
eval_tap $? 22 'GetMockMatchesByTimestamp' test.out

#- 23 GetAllMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking getAllMockTickets \
    --channelName 'gYqStW5i' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 23 'GetAllMockTickets' test.out

#- 24 CreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking createMockTickets \
    --channelName 'b1iwPAJs' \
    --namespace "$AB_NAMESPACE" \
    --body '{"attribute_name": "AwXia7mc", "count": 78, "mmrMax": 0.8470702273368997, "mmrMean": 0.3571976352749803, "mmrMin": 0.4943257728951378, "mmrStdDev": 0.45480918432653195}' \
    > test.out 2>&1
eval_tap $? 24 'CreateMockTickets' test.out

#- 25 BulkCreateMockTickets
./ng net.accelbyte.sdk.cli.Main matchmaking bulkCreateMockTickets \
    --channelName 'rZR60sJ6' \
    --namespace "$AB_NAMESPACE" \
    --body '[{"first_ticket_created_at": 37, "party_attributes": {"SF4dLm9l": {}, "oDv5GYl2": {}, "zA59EtjA": {}}, "party_id": "3uto63vl", "party_members": [{"extra_attributes": {"5oBxyfPl": {}, "hDneCw8O": {}, "P0go2l4R": {}}, "user_id": "LTovznaT"}, {"extra_attributes": {"8J5npKQz": {}, "3oLH0cRw": {}, "Mq4OCaA8": {}}, "user_id": "lssLi9Tr"}, {"extra_attributes": {"tLojfRpC": {}, "qij86Ae9": {}, "v3NpQLbO": {}}, "user_id": "jLhRsYNQ"}], "ticket_created_at": 14, "ticket_id": "7Hc8HaaS"}, {"first_ticket_created_at": 8, "party_attributes": {"Z1pr6aBg": {}, "bP3Nus36": {}, "46ib52BL": {}}, "party_id": "S0QaRZOQ", "party_members": [{"extra_attributes": {"mZB9eAY5": {}, "5FmzExrS": {}, "UyH6SFo0": {}}, "user_id": "edyxm4Py"}, {"extra_attributes": {"crD72Ieh": {}, "zhTsUTe2": {}, "MdkAebp2": {}}, "user_id": "KJ4pIz4U"}, {"extra_attributes": {"YvZbKwdy": {}, "iOaSYlls": {}, "70HnuL6D": {}}, "user_id": "Jzdu0DFr"}], "ticket_created_at": 74, "ticket_id": "qy3USA5S"}, {"first_ticket_created_at": 67, "party_attributes": {"kIHuO2dw": {}, "GVILTSpv": {}, "8Kwm5KbH": {}}, "party_id": "MqWz6ywb", "party_members": [{"extra_attributes": {"h3LCLww0": {}, "eJIVeT9r": {}, "kxML9D0f": {}}, "user_id": "cyu7xUzs"}, {"extra_attributes": {"7o0tA8p7": {}, "Ah9DIwCI": {}, "Gak2AtJL": {}}, "user_id": "aPmyTCr1"}, {"extra_attributes": {"K0O6MUe3": {}, "1QEMQxFt": {}, "hpDVtrKF": {}}, "user_id": "4fx7DK74"}], "ticket_created_at": 16, "ticket_id": "gm8HLj4E"}]' \
    > test.out 2>&1
eval_tap $? 25 'BulkCreateMockTickets' test.out

#- 26 GetMockTicketsByTimestamp
./ng net.accelbyte.sdk.cli.Main matchmaking getMockTicketsByTimestamp \
    --channelName '6Z3r8U5e' \
    --namespace "$AB_NAMESPACE" \
    --body '{"timestamp_after": 57}' \
    > test.out 2>&1
eval_tap $? 26 'GetMockTicketsByTimestamp' test.out

#- 27 GetAllPartyInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllPartyInChannel \
    --channelName 'bFd6NMtQ' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 27 'GetAllPartyInChannel' test.out

#- 28 GetAllSessionsInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking getAllSessionsInChannel \
    --channelName 'S0DylZDD' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 28 'GetAllSessionsInChannel' test.out

#- 29 AddUserIntoSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking addUserIntoSessionInChannel \
    --channelName 'bYgh1RJb' \
    --matchID 'li8w2UCC' \
    --namespace "$AB_NAMESPACE" \
    --body '{"blocked_players": ["5T6GeSf7", "4pxaExa7", "kyiezEg0"], "party_id": "9vY1yFAj", "user_id": "dapIiDsx"}' \
    > test.out 2>&1
eval_tap $? 29 'AddUserIntoSessionInChannel' test.out

#- 30 DeleteSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteSessionInChannel \
    --channelName 'skOh1Nxm' \
    --matchID '6EBIXIAm' \
    --namespace "$AB_NAMESPACE" \
    > test.out 2>&1
eval_tap $? 30 'DeleteSessionInChannel' test.out

#- 31 DeleteUserFromSessionInChannel
./ng net.accelbyte.sdk.cli.Main matchmaking deleteUserFromSessionInChannel \
    --channelName 'YKLzvYez' \
    --matchID 'EFME1H5L' \
    --namespace "$AB_NAMESPACE" \
    --userID 'idW1Ybd3' \
    > test.out 2>&1
eval_tap $? 31 'DeleteUserFromSessionInChannel' test.out

#- 32 GetStatData
./ng net.accelbyte.sdk.cli.Main matchmaking getStatData \
    --channelName 'oxqmiHze' \
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
    --channelName 'JIBOmebX' \
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