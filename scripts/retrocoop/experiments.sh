for DATASET in imagenet
do
    for BACKBONE in rn50
    do
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE}_ep50 end 16 1 False False
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE}_ep50 end 16 1 False True
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE}_ep100 end 16 2 False False
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE}_ep100 end 16 2 False True
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE}_ep100 end 16 4 False False
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE}_ep100 end 16 4 False True
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE} end 16 8 False False
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE} end 16 8 False True
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE} end 16 16 False Flase
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE} end 16 16 False True
    done
done