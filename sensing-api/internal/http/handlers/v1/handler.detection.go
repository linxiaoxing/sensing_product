package v1

import (
	"net/http"

	"github.com/gin-gonic/gin"
	V1Domains "github.com/yokusp/sensing-api/internal/business/domains/v1"
	"github.com/yokusp/sensing-api/internal/http/datatransfers/requests"
	"github.com/yokusp/sensing-api/internal/http/datatransfers/responses"
	"github.com/yokusp/sensing-api/pkg/validators"
)

type DetectHandler struct {
	usecase V1Domains.DetectionUsecase
}

func NewDetectHandler(usecase V1Domains.DetectionUsecase) DetectHandler {
	return DetectHandler{
		usecase: usecase,
	}
}

func (userH DetectHandler) GetDetectionHistory(ctx *gin.Context) {
	var DetectionRequest requests.DetectionHistoryRequest
	if err := ctx.ShouldBindJSON(&DetectionRequest); err != nil {
		NewErrorResponse(ctx, http.StatusBadRequest, err.Error())
		return
	}

	if err := validators.ValidatePayloads(DetectionRequest); err != nil {
		NewErrorResponse(ctx, http.StatusBadRequest, err.Error())
		return
	}

	detectionDomain, statusCode, err := userH.usecase.GetDetectionHistory(ctx.Request.Context(), DetectionRequest.ToV1DetectionHistoryDomain())
	if err != nil {
		NewErrorResponse(ctx, statusCode, err.Error())
		return
	}

	NewSuccessResponse(ctx, statusCode, "login success", responses.FromV1DetectionHistoryDomain(detectionDomain))
}
