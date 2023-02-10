for DATASET in imagenet
do
    for BACKBONE in rn50
    do
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE}_ep100 end 16 4 False
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE} end 16 8 False
        bash scripts/retrocoop/main.sh ${DATASET} ${BACKBONE} end 16 16 False
    done
done