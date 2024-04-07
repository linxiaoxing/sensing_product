package responses

import (
	V1Domains "github.com/yokusp/sensing-api/internal/business/domains/v1"
)

type DetectionHistoryResponse struct {
	Begin     *int64  `json:"begin"`
	End       *int64  `json:"end"`
	LastDocID *string `json:"lastDocID"`
	Data      []DetectionHistoryItemResponse
}

type DetectionHistoryItemResponse struct {
	Categories          string  `json:"categories"`
	DetectionID         string  `json:"detectionID"`
	DetectedLocation    string  `json:"detectedLocation"`
	RecordingDate       int64   `json:"recordingDate"`
	FsModeSetTrackingID *string `json:"fsModeSetTrackingId"`
	DetectionTrackingID *string `json:"detectionTrackingId"`
}

// func (u *DetectionHistoryResponse) ToDetectionHistoryDomain() V1Domains.DetectionHistoryRepDomain {
// 	return V1Domains.DetectionHistoryRepDomain{
// 		Begin:               u.Begin,
// 		End:                 u.End,
// 		LastDocID: u.LastDocID,
// 		Data: u.Data,
// 	}
// }

func FromV1DetectionHistoryDomain(u V1Domains.DetectionHistoryRepDomain) DetectionHistoryResponse {
	var dataList []DetectionHistoryItemResponse
	for _, item := range u.Data {
		i := DetectionHistoryItemResponse{
			Categories:          item.Categories,
			DetectionID:         item.DetectionID,
			DetectedLocation:    item.DetectedLocation,
			RecordingDate:       item.RecordingDate,
			FsModeSetTrackingID: item.FsModeSetTrackingID,
			DetectionTrackingID: item.DetectionTrackingID,
		}
		dataList = append(dataList, i)
	}
	return DetectionHistoryResponse{
		Begin:     u.Begin,
		End:       u.End,
		LastDocID: u.LastDocID,
		Data:      dataList,
	}
}
