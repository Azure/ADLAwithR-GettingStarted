
.libPaths(c(.libPaths(), getwd()))
if (require(base64enc)==FALSE)
    {
        unzip('base64enc.zip')
        require(base64enc)
    }

model <- unserialize(base64decode(rightFromUSQL$Model))
pred = predict(model, leftFromUSQL)
outputToUSQL=data.frame(Prediction=pred, MPar=rightFromUSQL$MPar, leftFromUSQL)
