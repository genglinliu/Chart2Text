python3 model/train.py \
    --model_path "experiments" \
    --exp_name "chart2text" \
    --exp_id "run1" \
    --train_cs_table_path data/train/trainData.txt.pth \
    --train_sm_table_path data/train/trainData.txt.pth \
    --train_sm_summary_path data/train/trainSummary.txt.pth \
    --valid_table_path data/valid/validData.txt.pth \
    --valid_summary_path data/valid/validSummary.txt.pth \
    --cs_step True \
    --lambda_cs "1" \
    --sm_step True \
    --lambda_sm "1" \
    --label_smoothing 0.05 \
    --sm_step_with_cc_loss False \
    --sm_step_with_cs_proba False \
    --share_inout_emb True \
    --share_srctgt_emb False \
    --sinusoidal_embeddings False \
    --emb_dim 512 \
    --enc_n_layers 1 \
    --dec_n_layers 6 \
    --dropout 0.1 \
    --save_periodic 40 \
    --batch_size 6 \
    --beam_size 4 \
    --epoch_size 1000 \
    --max_epoch 121 \
    --eval_bleu True \
    --validation_metrics valid_mt_bleu


python3 model/summarize.py --model_path MAY06-100.pth --table_path data/test/testData.txt \
--output_path results/templateOutput_506_beam=4_batch=8.txt --beam_size 4 --batch_size 8


python3 model/summarize.py --model_path periodic-75.pth --table_path data_testing/trainData.txt \
--output_path data_testing/504Test_beam=4_batch=8.txt --beam_size 4 --batch_size 8

perl scripts/model/src/evaluation/multi-bleu.perl data/test/testOriginalSummary.txt < results/may06/generated-506-p100.txt

200 epochs:
BLEU = 21.10, 51.1/25.2/16.9/12.8 (BP=0.917, ratio=0.920, hyp_len=37841, ref_len=41116)

100 epochs:
BLEU = 21.77, 53.7/27.9/19.0/14.5 (BP=0.858, ratio=0.867, hyp_len=35657, ref_len=41116)

