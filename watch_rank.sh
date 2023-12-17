USERNAMES="0b11stan Ad4m5 AlbertLingot P0wned"

fetchrank() {
  USERNAME=$1
  USERFILE=ranks/$USERNAME.csv
  OLDRANK=$(tail -n 1 $USERFILE | cut -d ',' -f 3)
  TIMESTAMP=$(date +%s)
  DATETIME=$(date -d @$TIMESTAMP "+%Y-%m-%d %H:%M:%S")
  RANK=$(curl -s https://tryhackme.com/api/user/rank/$USERNAME | jq .userRank)
  if [[ "$RANK" != "$OLDRANK" ]]; then
    echo "$DATETIME,$TIMESTAMP,$RANK" | tee -a $USERFILE
  fi
}

while true; do
  for USERNAME in $USERNAMES; do
    fetchrank $USERNAME
  done
  sleep 60
done
