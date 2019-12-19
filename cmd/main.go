package main

import (
	"fmt"
	"go.uber.org/zap"
)

func main() {
	fmt.Println("Hello World")
	logger, _ := zap.NewProduction()
	defer logger.Sync()
	sugar := logger.Sugar()
	sugar.Infof("Hello World")

}
