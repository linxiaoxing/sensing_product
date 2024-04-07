package requests

import (
	V1Domains "github.com/yokusp/sensing-api/internal/business/domains/v1"
)

// DetectionHistoryRequest は検知履歴リクエストの構造体です。
type DetectionHistoryRequest struct {
	ServiceId           string   `json:"serviceId" validate:"required"`
	Categories          []string `json:"categories"`
	Begin               int64    `json:"begin"`
	End                 int64    `json:"end"`
	FsModeSetTrackingID string   `json:"fsModeSetTrackingId"`
	DetectionTrackingID string   `json:"detectionTrackingId"`
	TimeOrder           string   `json:"timeOrder"`
}

// Mapping Login Request to Domain User
func (d *DetectionHistoryRequest) ToV1DetectionHistoryDomain() *V1Domains.DetectionHistoryReqDomain {
	return &V1Domains.DetectionHistoryReqDomain{
		ServiceId: d.ServiceId,
	}
}
