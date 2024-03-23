package routes

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"log"
)

func RootHandler(ctx *gin.Context) {

	log.Println("api response")
	ctx.JSON(http.StatusOK, map[string]interface{}{
		"status":  true,
		"message": "welcome to an amazing api",
	})
}
