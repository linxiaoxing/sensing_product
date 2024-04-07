package records

import (
	V1Domains "github.com/yokusp/sensing-api/internal/business/domains/v1"
)

func (u *DetectionHistory) ToV1Domain() V1Domains.DetectionHistoryRepDomain {
	return V1Domains.DetectionHistoryRepDomain{}
}

func FromDetectionV1Domain() DetectionHistory {
	return DetectionHistory{}
}
