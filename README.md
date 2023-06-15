# Test_MS_segmentation_models_3T_7T_from_Marseille
Repository to test MS lesion segmentation models in 3T and 7T MP2RAGE images from [Marseille lab](https://crmbm.univ-amu.fr/)

## Model to test: [model_seg_ms_mp2rage](https://github.com/ivadomed/model_seg_ms_mp2rage)

release: [r20230210](https://github.com/ivadomed/model_seg_ms_mp2rage/releases/tag/r20230210) 

Based on script: https://github.com/ivadomed/model_seg_ms_mp2rage/issues/63#issue-1562548573 


 - [x] 3T MP2RAGE

Related in https://github.com/ivadomed/model_seg_ms_mp2rage/issues/63#issuecomment-1568903640

Continuous Dice Coefficient for "soft masks" based on this [implementation](https://github.com/rubyshamir/cDC/blob/main/continuous_Dice_coefficient.py) and the Classic Dice between the GT and binarized masks (thresholding  at 1/5 = 0.2) because we have 5 segmentation models. 

![image](https://github.com/ivadomed/model_seg_ms_mp2rage/assets/77469192/5958a6ea-bec9-4dc1-80d0-90db7e6c5fab)

There are 2 empy masks from GT (subject 3 and 4)

![UNI_cor](https://github.com/Nilser3/Test_MS_segmentation_models_3T_7T_from_Marseille/assets/77469192/cb01b93f-8d40-42f2-9e40-5dcdb7263d92)

## 7T MP2RAGE
- [ ] isotropic images
![7T_iso](https://github.com/Nilser3/Test_MS_segmentation_models_3T_7T_from_Marseille/assets/77469192/eb35960f-c386-4ed1-a209-cc020922da46)


- [ ] anisotropic images (Same subject)
![7T_aniso](https://github.com/Nilser3/Test_MS_segmentation_models_3T_7T_from_Marseille/assets/77469192/792ee4c3-6652-4a2e-9ca3-83684525376c)

*subject with 3 lesions, 2 were segmented, one was not detected*
![image](https://github.com/Nilser3/Test_MS_segmentation_models_3T_7T_from_Marseille/assets/77469192/0a5fbc41-c7e5-4a7f-a749-bedd765b7efa)

## Model CanProCo (based on STIR/PSIR)

