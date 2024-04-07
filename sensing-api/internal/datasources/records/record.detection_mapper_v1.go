package records

import (
	V1Domains "github.com/yokusp/sensing-api/internal/business/domains/v1"
	"github.com/yokusp/sensing-api/internal/utils"
)

func (u *DetectionRecord) ToV1ItemDomain() V1Domains.DetectionHistoryItem {
	return V1Domains.DetectionHistoryItem{
		Category:            u.Category,
		DetectionID:         u.DetectionID,
		DetectedLocation:    u.DetectedLocation,
		RecordingDate:       u.RecordingDate,
		FSModeSetTrackingID: u.FSModeSetTrackingID,
		DetectionTrackingID: u.DetectionTrackingID,
	}
}

func ToArrayOfDetectionHistoryV1Domain(u *[]DetectionRecord) []V1Domains.DetectionHistoryRepDomain {
	var result []V1Domains.DetectionHistoryRepDomain
	var keys []int64
	for _, val := range *u {
		if !utils.ContainsInt(keys, val.Begin) {
			keys = append(keys, *val.Begin)
		}
	}
	for _, key := range keys {
		var data []V1Domains.DetectionHistoryItem
		var begin *int64
		var end *int64
		var lastDocID *string
		for _, val := range *u {
			if key == *val.Begin {
				data = append(data, val.ToV1ItemDomain())
				begin = val.Begin
				end = val.End
				lastDocID = &val.LastDocID
			}
		}
		history := V1Domains.DetectionHistoryRepDomain{
			Begin:     begin,
			End:       end,
			LastDocID: lastDocID,
		}
		result = append(result, history)
	}
	return result
}
