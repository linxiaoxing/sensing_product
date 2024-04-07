package v1

import (
	"context"
	"time"
)

type DetectionHistoryReqDomain struct {
	Id                  string
	ServiceId           string
	Categories          string
	Begin               int64
	End                 int64
	FsModeSetTrackingID string
	DetectionTrackingID string
	TimeOrder           string
	CreatedAt           time.Time
	UpdatedAt           *time.Time
	DeletedAt           *time.Time
}

type DetectionHistoryRepDomain struct {
	Begin     *int64
	End       *int64
	LastDocID *string
	Data      []DetectionHistoryItem
}

type DetectionHistoryItem struct {
	Categories          string
	DetectionID         string
	DetectedLocation    string
	RecordingDate       int64
	FsModeSetTrackingID *string
	DetectionTrackingID *string
}

type DetectionUsecase interface {
	GetDetectionHistory(ctx context.Context, inDom *DetectionHistoryReqDomain) (outDom DetectionHistoryRepDomain, statusCode int, err error)
}

type DetectionRepository interface {
	GetDetectionHistory(ctx context.Context, inDom *DetectionHistoryReqDomain) (outDom DetectionHistoryRepDomain, err error)
}
