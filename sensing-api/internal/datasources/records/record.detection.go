package records

type DetectionHistory struct {
	Begin     *int64                 `db:"begin_time"`
	End       *int64                 `db:"end_time"`
	LastDocID *string                `db:"lastDocId"`
	Data      []DetectionHistoryItem `db:"data"`
}

// DetectionHistoryItemData 構造体
type DetectionHistoryItem struct {
	Category            string  `db:"category"`
	DetectionID         string  `db:"detectionId"`
	DetectedLocation    string  `db:"detectedLocation"`
	RecordingDate       int64   `db:"recordingDate"`
	FSModeSetTrackingID *string `db:"fsModeSetTrackingId,omitempty"`
	DetectionTrackingID *string `db:"detectionTrackingId,omitempty"`
}
