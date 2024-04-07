package v1

import (
	"context"

	"github.com/jmoiron/sqlx"
	V1Domains "github.com/yokusp/sensing-api/internal/business/domains/v1"
	"github.com/yokusp/sensing-api/internal/datasources/records"

	"fmt"
)

type postgreDetectionRepository struct {
	conn *sqlx.DB
}

func NewDetectionRepository(conn *sqlx.DB) V1Domains.DetectionRepository {
	return &postgreDetectionRepository{
		conn: conn,
	}
}

func (r *postgreDetectionRepository) GetDetectionHistory(ctx context.Context, serviceId string) (outDomain []V1Domains.DetectionHistoryRepDomain, err error) {
	detectionRecord := []records.DetectionRecord{}
	err = r.conn.SelectContext(ctx, &detectionRecord,
		`SELECT h.begin_time, h.end_time, h.last_doc_id, i.category, i.detection_id, i.detected_location, i.recording_date, i.fs_mode_set_tracking_id, i.detection_tracking_id
	FROM detection_history h
	INNER JOIN detection_history_items i ON h.begin_time = i.begin_time AND h.end_time = i.end_time`)
	if err != nil {

		return []V1Domains.DetectionHistoryRepDomain{}, err
	}
	fmt.Println("test", detectionRecord)
	return records.ToArrayOfDetectionHistoryV1Domain(&detectionRecord), nil
}
