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
	LastDocID *string                        `json:"lastDocID"`
	Data      []DetectionHistoryItemResponse `json:"data"`
}

type DetectionHistoryItemResponse struct {
	Category            string  `json:"category"`
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

func FromV1DetectionHistoryDomain(u []V1Domains.DetectionHistoryRepDomain) DetectionHistoryListResponse {
	var histories []DetectionHistoryResponse
	for _, val := range u {
		var dataList []DetectionHistoryItemResponse
		for _, item := range val.Data {
			i := DetectionHistoryItemResponse{
				Category:            item.Category,
				DetectionID:         item.DetectionID,
				DetectedLocation:    item.DetectedLocation,
				RecordingDate:       item.RecordingDate,
				FsModeSetTrackingID: item.FSModeSetTrackingID,
				DetectionTrackingID: item.DetectionTrackingID,
			}
			dataList = append(dataList, i)
		}
		history := DetectionHistoryResponse{
			Begin:     val.Begin,
			End:       val.End,
			LastDocID: val.LastDocID,
			Data:      dataList,
		}
		histories = append(histories, history)
	}
	return DetectionHistoryListResponse{
		Data: histories,
	}
}
