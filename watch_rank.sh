while true; do
  TIMESTAMP=$(date +%s)
  DATETIME=$(date -d @$TIMESTAMP "+%Y-%m-%d %H:%M:%S")
  RANK=$(curl -s https://tryhackme.com/api/user/rank/0b11stan | jq .userRank)
  echo "$DATETIME,$TIMESTAMP,$RANK" | tee -a rank.csv
  sleep 60
done
