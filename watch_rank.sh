OLDRANK=$(tail -n 1 rank.csv | cut -d ',' -f 3)

while true; do
  TIMESTAMP=$(date +%s)
  DATETIME=$(date -d @$TIMESTAMP "+%Y-%m-%d %H:%M:%S")
  RANK=$(curl -s https://tryhackme.com/api/user/rank/0b11stan | jq .userRank)
  if [[ "$RANK" != "$OLDRANK" ]]; then
    echo "$DATETIME,$TIMESTAMP,$RANK" | tee -a rank.csv
    OLDRANK=$RANK
  fi
  sleep 60
done
