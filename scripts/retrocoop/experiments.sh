for DATASET in imagenet
do
    for BACKBONE in rn50
    do
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE}_ep50 end 16 1 False 0.2
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE}_ep100 end 16 2 False 0.2
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE}_ep100 end 16 4 False 0.2
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE} end 16 8 False 0.2
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE} end 16 16 False 0.2
    done
done