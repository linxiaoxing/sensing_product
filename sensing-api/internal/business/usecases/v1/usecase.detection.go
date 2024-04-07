package v1

import (
	"context"
	"errors"
	"net/http"

	V1Domains "github.com/yokusp/sensing-api/internal/business/domains/v1"
)

type detectionUsecase struct {
	repo V1Domains.DetectionRepository
}

func NewDetectionUsecase(repo V1Domains.DetectionRepository) V1Domains.DetectionUsecase {
	return &detectionUsecase{
		repo: repo,
	}
}

func (uc *detectionUsecase) GetDetectionHistory(ctx context.Context, inDom *V1Domains.DetectionHistoryReqDomain) (outDom []V1Domains.DetectionHistoryRepDomain, statusCode int, err error) {
	detection, err := uc.repo.GetDetectionHistory(ctx, inDom.ServiceId)
	if err != nil {
		return []V1Domains.DetectionHistoryRepDomain{}, http.StatusNotFound, errors.New("serviceId not found")
	}

	return detection, http.StatusOK, nil
}
