export URL="https://api.telegram.org/bot849188292:AAHcxuttO9K3KDzgYsfOxxLq2cPJ9GFXfL4/sendMessage"
curl \
    --data-urlencode "chat_id=855591402" \
    --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers]" \
    ${URL}


curl \
    --data-urlencode "chat_id=855591402" \
    --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round0 Command1 Start [$(date +"%m/%d %H:%M:%S")]" \
    ${URL}
python src/c001__train_fixer.py --round_name round0 --gpu_id 0 --max_epoch 2
curl \
    --data-urlencode "chat_id=855591402" \
    --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round0 Command1 Done [$(date +"%m/%d %H:%M:%S")]" \
    ${URL}
    
curl \
    --data-urlencode "chat_id=855591402" \
    --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round0 Command2 Start [$(date +"%m/%d %H:%M:%S")]" \
    ${URL}
python src/c003__run_fixer.py   --round_name round0 --gpu_ids '0'
curl \
    --data-urlencode "chat_id=855591402" \
    --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round0 Command2 Done [$(date +"%m/%d %H:%M:%S")]" \
    ${URL}

curl \
    --data-urlencode "chat_id=855591402" \
    --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round0 Command3 Start [$(date +"%m/%d %H:%M:%S")]" \
    ${URL}
python src/c005__eval_fixer.py  --round_name round0
curl \
    --data-urlencode "chat_id=855591402" \
    --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round0 Command3 Done [$(date +"%m/%d %H:%M:%S")]" \
    ${URL}
