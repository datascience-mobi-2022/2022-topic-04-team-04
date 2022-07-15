TRAs_mousedata
TRAs_genetranscript_total = rownames(TRAs_mousedata)
View(TRAs_genetranscript_total)
write.csv(TRAs_genetranscript_total,"TRA_names.csv", row.names = FALSE)
write.csv(TRA_total, "TRAtotal_names.csv", row.names = FALSE)

TRA_names_genesymb = cbind(TRA_total[,1], TRA_total[,3])
View(TRA_names_genesymb)
write.csv(TRA_names_genesymb, "TRAtotal_names.csv", row.names= FALSE)
