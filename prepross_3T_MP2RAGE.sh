#!/bin/bash

list_sub=(00	01	02	03	04	05	06	07	08	09	10	11	12	13	14	15	16	17	18	19	20	21	22	23	24	25	26	27	28	29 30 31	32	33	34	35	36	37	38	39	40)
#list_sub=(00)
for sub in ${list_sub[@]}; do
#  fslchfiletype NIFTI_GZ  ../../data_sep_3T/sub${sub}/t1q_cor_resamp_seg.nii
  sct_maths -i ../../data_sep_3T/sub${sub}/t1q_cor_seg_rl.nii.gz -dilate 5 -shape ball -o ../../data_sep_3T/sub${sub}/SC_dil.nii.gz
  sct_maths -i ../../data_sep_3T/sub${sub}/SC_dil.nii.gz -dilate 32 -dim 1 -shape disk -o ../../data_sep_3T/sub${sub}/SC_dil_32.nii.gz
  sct_crop_image -i ../../data_sep_3T/sub${sub}/t1q_cor_resamp.nii.gz -m ../../data_sep_3T/sub${sub}/SC_dil_32.nii.gz -o ../../data_sep_3T/sub${sub}/${sub}t1q_crop.nii.gz
  sct_crop_image -i ../../data_sep_3T/sub${sub}/t1_mp2r_uni_crop_rl.nii.gz -m ../../data_sep_3T/sub${sub}/SC_dil_32.nii.gz -o ../../data_sep_3T/sub${sub}/${sub}UNI_crop.nii.gz
  sct_crop_image -i ../../data_sep_3T/sub${sub}/t1q_cor_LE_GT.nii.gz -m ../../data_sep_3T/sub${sub}/SC_dil_32.nii.gz -o ../../data_sep_3T/sub${sub}/${sub}lesion_GT_crop.nii.gz
  # Loop across models and run prediction
  list_seed=(01 02 03 04 05)
  for seed in ${list_seed[@]}; do
  	ivadomed_segment_image -i ../../data_sep_3T/sub${sub}/${sub}t1q_crop.nii.gz -m ../model_seg_lesion_mp2rage_r20230210_dil32_seed${seed}/model_seg_ms_lesion_mp2rage/ -s _pred${seed}
  	ivadomed_segment_image -i ../../data_sep_3T/sub${sub}/${sub}UNI_crop.nii.gz -m ../model_seg_lesion_mp2rage_r20230210_dil32_seed${seed}/model_seg_ms_lesion_mp2rage/ -s _pred${seed}
  done
    # Average
  sct_image -i ${sub}t1q_crop_pred*.nii.gz -concat t -o ../../data_sep_3T/sub${sub}/t1q_crop_predMean.nii.gz
  sct_image -i ${sub}UNI_crop_pred*.nii.gz -concat t -o ../../data_sep_3T/sub${sub}/UNI_crop_predMean.nii.gz
  sct_maths -i ../../data_sep_3T/sub${sub}/t1q_crop_predMean.nii.gz -mean t -o ../../data_sep_3T/sub${sub}/t1q_crop_predMean.nii.gz
  sct_maths -i ../../data_sep_3T/sub${sub}/UNI_crop_predMean.nii.gz -mean t -o ../../data_sep_3T/sub${sub}/UNI_crop_predMean.nii.gz
done
