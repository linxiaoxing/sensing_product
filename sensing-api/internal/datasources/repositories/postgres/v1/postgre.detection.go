package v1

import (
	"context"

	"github.com/jmoiron/sqlx"
	V1Domains "github.com/yokusp/sensing-api/internal/business/domains/v1"
	"github.com/yokusp/sensing-api/internal/datasources/records"
)

type postgreDetectionRepository struct {
	conn *sqlx.DB
}

func NewDetectionRepository(conn *sqlx.DB) V1Domains.DetectionRepository {
	return &postgreDetectionRepository{
		conn: conn,
	}
}

func (r *postgreDetectionRepository) GetDetectionHistory(ctx context.Context, inDom *V1Domains.DetectionHistoryReqDomain) (outDomain V1Domains.DetectionHistoryRepDomain, err error) {
	detectionRecord := records.FromDetectionV1Domain()

	err = r.conn.GetContext(ctx, &detectionRecord, `SELECT * FROM detection WHERE "serviceId" = $1`, inDom.ServiceId)
	if err != nil {
		return V1Domains.DetectionHistoryRepDomain{}, err
	}

	return detectionRecord.ToV1Domain(), nil
}
