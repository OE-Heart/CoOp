for DATASET in imagenet
do
    for BACKBONE in rn50 vit_b16
    do
        bash scripts/coop/main.sh ${DATASET} ${BACKBONE}_ep100 end 16 4 False
        bash scripts/coop/main.sh ${DATASET} ${BACKBONE} end 16 8 False
        bash scripts/coop/main.sh ${DATASET} ${BACKBONE} end 16 16 False
    done
done