package responses

import (
	V1Domains "github.com/yokusp/sensing-api/internal/business/domains/v1"
)

type DetectionHistoryListResponse struct {
	Data []DetectionHistoryResponse `json:"datas"`
}

type DetectionHistoryResponse struct {
	Begin     *int64                         `json:"begin"`
	End       *int64                         `json:"end"`
	LastDocID *string                        `json:"lastDocId"`
	Data      []DetectionHistoryItemResponse `json:"data"`
}

type DetectionHistoryItemResponse struct {
	Category            string  `json:"category"`
	DetectionId         string  `json:"detectionId"`
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

func FromV1DetectionHistoryDomain(u []V1Domains.DetectionHistoryRepDomain) DetectionHistoryResponse {
	var histories []DetectionHistoryResponse
	// var history DetectionHistoryResponse
	// for _, val := range u {
	var dataList []DetectionHistoryItemResponse
	for _, item := range u[0].Data {
		i := DetectionHistoryItemResponse{
			Category:            item.Category,
			DetectionId:         item.DetectionId,
			DetectedLocation:    item.DetectedLocation,
			RecordingDate:       item.RecordingDate,
			FsModeSetTrackingID: item.FSModeSetTrackingID,
			DetectionTrackingID: item.DetectionTrackingID,
		}
		dataList = append(dataList, i)
	}
	history := DetectionHistoryResponse{
		Begin:     u[0].Begin,
		End:       u[0].End,
		LastDocID: u[0].LastDocID,
		Data:      dataList,
	}
	histories = append(histories, history)
	// }
	return history
	// return DetectionHistoryListResponse{
	// 	Data: histories,
	// }
}
