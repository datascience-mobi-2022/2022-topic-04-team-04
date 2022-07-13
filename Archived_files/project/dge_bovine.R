load("normalizedbovine.rda")
bovine_ohneaffx= vsn.bovine[114:17520,]
namen=(substr(rownames(bovine_ohneaffx),0,18)[1:17407])
rownames(bovine_ohneaffx) <- c(namen)
bovine_ohneaffx= subset(bovine_ohneaffx, select= -c(16))
design2= model.matrix(~0+factor(c(1,1,2,2,3,3,4,4,5,5,6,6,7,7,8)))

colnames(design2)= c( "oocyte","one", "two","four", "eight","sixteen", "morula", "blastocyst")
fit_matched_bovine= lmFit(bovine_ohneaffx, design2)
contrast.matrixbovine= makeContrasts(oocyte-one,two-one,four-two, eight-four, morula-eight, blastocyst-morula,levels = design2)
fit_matched3= contrasts.fit(fit_matched_bovine, contrast.matrixbovine)
fit_matched3= eBayes(fit_matched3)

save(fit_matched3,file = "fit_matched3.rda" )
topTable(fit_matched3, coef=1)
dge_bovine= topTable(fit_matched3, coef=1, number=nrow(fit_matched3))

