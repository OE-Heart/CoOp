#!/bin/bash

# custom config
DATA=/newdisk2/oyx/ILSVRC/Data/CLS-LOC/
TRAINER=RetroCoOp

DATASET=$1
CFG=$2  # config file
CTP=$3  # class token position (end or middle)
NCTX=$4  # number of context tokens
SHOTS=$5  # number of shots (1, 2, 4, 8, 16)
CSC=$6  # class-specific context (False or True)
TWK=$7  # train with knn (False or True)

for SEED in 1 2 3
do
    OUTPUT_DIR=output/${DATASET}/${TRAINER}/${CFG}_${SHOTS}shots/nctx${NCTX}_csc${CSC}_ctp${CTP}_twk${TWK}/seed${SEED}
    CACHE_DIR=cache/${DATASET}/${TRAINER}/${CFG}_${SHOTS}shots/nctx${NCTX}_csc${CSC}_ctp${CTP}_twk${TWK}/seed${SEED}
    if [ -d "$DIR" ]; then
        echo "Oops! The results exist at ${DIR} (so skip this job)"
    else
        python train.py \
        --root ${DATA} \
        --seed ${SEED} \
        --trainer ${TRAINER} \
        --dataset-config-file configs/datasets/${DATASET}.yaml \
        --config-file configs/trainers/${TRAINER}/${CFG}.yaml \
        --output-dir ${OUTPUT_DIR} \
        --cache-dir ${CACHE_DIR} \
        TRAINER.RETROCOOP.N_CTX ${NCTX} \
        TRAINER.RETROCOOP.CSC ${CSC} \
        TRAINER.RETROCOOP.CLASS_TOKEN_POSITION ${CTP} \
        TRAINER.RETRIEVE.train_with_knn ${TWK} \
        DATASET.NUM_SHOTS ${SHOTS}
    fi
done