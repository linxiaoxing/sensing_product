package records

type DetectionHistory struct {
	Begin     *int64                 `db:"begin_time"`
	End       *int64                 `db:"end_time"`
	LastDocID *string                `db:"last_doc_id"`
	Data      []DetectionHistoryItem `db:"data"`
}

// DetectionHistoryItemData 構造体
type DetectionHistoryItem struct {
	Category            string  `db:"category"`
	DetectionID         string  `db:"detection_id"`
	DetectedLocation    string  `db:"detected_location"`
	RecordingDate       int64   `db:"recording_date"`
	FSModeSetTrackingID *string `db:"fs_mode_set_tracking_id"`
	DetectionTrackingID *string `db:"detection_tracking_id"`
}

type DetectionRecord struct {
	Begin               *int64  `db:"begin_time"`
	End                 *int64  `db:"end_time"`
	LastDocID           string  `db:"last_doc_id"`
	Category            string  `db:"category"`
	DetectionID         string  `db:"detection_id"`
	DetectedLocation    string  `db:"detected_location"`
	RecordingDate       int64   `db:"recording_date"`
	FSModeSetTrackingID *string `db:"fs_mode_set_tracking_id"`
	DetectionTrackingID *string `db:"detection_tracking_id"`
}

type DetectionHistorySelect struct {
	Begin               int64  `db:"begin_time"`
	End                 int64  `db:"end_time"`
	LastDocID           string `db:"last_doc_id"`
	Category            string `db:"category"`
	DetectionID         string `db:"detection_id"`
	DetectedLocation    string `db:"detected_location"`
	RecordingDate       int64  `db:"recording_date"`
	FSModeSetTrackingID string `db:"fs_mode_set_tracking_id"`
	DetectionTrackingID string `db:"detection_tracking_id"`
	// CreatedAt           time.Time  `db:"created_at"`
	// UpdatedAt           *time.Time `db:"updated_at"`
	// DeletedAt           *time.Time `db:"deleted_at"`
}
