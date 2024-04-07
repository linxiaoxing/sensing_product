package records

type DetectionHistory struct {
	Begin     *int64                 `json:"begin"`
	End       *int64                 `json:"end"`
	LastDocID *string                `json:"lastDocId"`
	Data      []DetectionHistoryItem `json:"data"`
}

// DetectionHistoryItemData 構造体
type DetectionHistoryItem struct {
	Category            string  `json:"category"`
	DetectionID         string  `json:"detectionId"`
	DetectedLocation    string  `json:"detectedLocation"`
	RecordingDate       int64   `json:"recordingDate"`
	FSModeSetTrackingID *string `json:"fsModeSetTrackingId,omitempty"`
	DetectionTrackingID *string `json:"detectionTrackingId,omitempty"`
}
