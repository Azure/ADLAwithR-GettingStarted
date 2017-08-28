
models = read.table("outex7a.txt", header = FALSE, stringsAsFactors=FALSE)
colnames(models) <- c("Par", "Model")

.libPaths(c(.libPaths(), getwd()))
if (require(base64enc)==FALSE)
{
  unzip('base64enc.zip')
  require(base64enc)
}
partition<-inputFromUSQL$Par[1] +1
modelForPartition <- unserialize(base64decode(models$Model[partition]))
outputToUSQL=data.frame(Prediction=predict(modelForPartition, inputFromUSQL)) 