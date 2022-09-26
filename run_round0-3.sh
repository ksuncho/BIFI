export URL="https://api.telegram.org/bot849188292:AAHcxuttO9K3KDzgYsfOxxLq2cPJ9GFXfL4/sendMessage"

# #Round0
# curl \
#     --data-urlencode "chat_id=855591402" \
#     --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round0 Command1 Start [$(date +"%m/%d %H:%M:%S")]" \
#     ${URL}
# python src/c001__train_fixer.py --round_name round0 --gpu_id 0 --max_epoch 2
# curl \
#     --data-urlencode "chat_id=855591402" \
#     --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round0 Command1 Done [$(date +"%m/%d %H:%M:%S")]" \
#     ${URL}
    
# curl \
#     --data-urlencode "chat_id=855591402" \
#     --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round0 Command2 Start [$(date +"%m/%d %H:%M:%S")]" \
#     ${URL}
# python src/c003__run_fixer.py   --round_name round0 --gpu_ids '0'
# curl \
#     --data-urlencode "chat_id=855591402" \
#     --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round0 Command2 Done [$(date +"%m/%d %H:%M:%S")]" \
#     ${URL}

# curl \
#     --data-urlencode "chat_id=855591402" \
#     --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round0 Command3 Start [$(date +"%m/%d %H:%M:%S")]" \
#     ${URL}
# python src/c005__eval_fixer.py  --round_name round0
# curl \
#     --data-urlencode "chat_id=855591402" \
#     --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round0 Command3 Done [$(date +"%m/%d %H:%M:%S")]" \
#     ${URL}

# #Round1
# curl \
#     --data-urlencode "chat_id=855591402" \
#     --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round1 Train Breaker Start [$(date +"%m/%d %H:%M:%S")]" \
#     ${URL}
# python src/c006__generate_paired_data_from_fixer.py --round_name round0 --out_round_name round1-BIFI-part1
# python src/c002__train_breaker.py --round_name round1-BIFI-part1 --gpu_id 0 --max_epoch 3
# python src/c004__run_breaker.py   --round_name round1-BIFI-part1 --gpu_ids '0'
# curl \
#     --data-urlencode "chat_id=855591402" \
#     --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round1 Train Breaker Done [$(date +"%m/%d %H:%M:%S")]" \
#     ${URL}

curl \
    --data-urlencode "chat_id=855591402" \
    --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round1 Train Fixer Start [$(date +"%m/%d %H:%M:%S")]" \
    ${URL}
python src/c007__generate_paired_data_from_breaker.py --round_name round1-BIFI-part1 --out_round_name round1-BIFI-part2
python src/c001__train_fixer.py --round_name round1-BIFI-part2 --gpu_id 0 --max_epoch 2 --continue_from 'data/round0/model-fixer/checkpoint_last.pt'
python src/c003__run_fixer.py   --round_name round1-BIFI-part2 --gpu_ids '0'
python src/c005__eval_fixer.py  --round_name round1-BIFI-part2
curl \
    --data-urlencode "chat_id=855591402" \
    --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round1 Train Fixer Done [$(date +"%m/%d %H:%M:%S")]" \
    ${URL}


# #Round2
# curl \
#     --data-urlencode "chat_id=855591402" \
#     --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round2 Train Breaker Start [$(date +"%m/%d %H:%M:%S")]" \
#     ${URL}
# python src/c006__generate_paired_data_from_fixer.py --round_name round1-BIFI-part2 --out_round_name round2-BIFI-part1
# python src/c002__train_breaker.py --round_name round2-BIFI-part1 --gpu_id 0 --max_epoch 3 --continue_from 'data/round1-BIFI-part1/model-breaker/checkpoint_last.pt'
# python src/c004__run_breaker.py   --round_name round2-BIFI-part1 --gpu_ids '0'
# curl \
#     --data-urlencode "chat_id=855591402" \
#     --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round2 Train Breaker Done [$(date +"%m/%d %H:%M:%S")]" \
#     ${URL}

# curl \
#     --data-urlencode "chat_id=855591402" \
#     --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round2 Train Fixer Start [$(date +"%m/%d %H:%M:%S")]" \
#     ${URL}
# python src/c007__generate_paired_data_from_breaker.py --round_name round2-BIFI-part1 --out_round_name round2-BIFI-part2
# python src/c001__train_fixer.py --round_name round2-BIFI-part2 --gpu_id 0 --max_epoch 2 --continue_from 'data/round1-BIFI-part2/model-fixer/checkpoint_last.pt'
# python src/c003__run_fixer.py   --round_name round2-BIFI-part2 --gpu_ids '0'
# python src/c005__eval_fixer.py  --round_name round2-BIFI-part2
# curl \
#     --data-urlencode "chat_id=855591402" \
#     --data-urlencode "text=[BIFI 01][BERT_LARGE with 6 layers] Round2 Train Fixer Done [$(date +"%m/%d %H:%M:%S")]" \
#     ${URL}