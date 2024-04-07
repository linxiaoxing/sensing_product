package routes

import (
	"github.com/gin-gonic/gin"
	"github.com/jmoiron/sqlx"
	V1Usecase "github.com/yokusp/sensing-api/internal/business/usecases/v1"
	"github.com/yokusp/sensing-api/internal/datasources/caches"
	V1PostgresRepository "github.com/yokusp/sensing-api/internal/datasources/repositories/postgres/v1"
	V1Handler "github.com/yokusp/sensing-api/internal/http/handlers/v1"
	"github.com/yokusp/sensing-api/pkg/jwt"
	"github.com/yokusp/sensing-api/pkg/mailer"
)

type detectionRoutes struct {
	V1Handler      V1Handler.DetectHandler
	router         *gin.RouterGroup
	db             *sqlx.DB
	authMiddleware gin.HandlerFunc
}

func NewDetectionRoute(router *gin.RouterGroup, db *sqlx.DB, jwtService jwt.JWTService, redisCache caches.RedisCache, ristrettoCache caches.RistrettoCache, authMiddleware gin.HandlerFunc, mailer mailer.OTPMailer) *detectionRoutes {
	V1DetectRepository := V1PostgresRepository.NewDetectionRepository(db)
	V1DetectUsecase := V1Usecase.NewDetectionUsecase(V1DetectRepository)
	V1DetectHandler := V1Handler.NewDetectHandler(V1DetectUsecase)

	return &detectionRoutes{V1Handler: V1DetectHandler, router: router, db: db, authMiddleware: authMiddleware}
}

func (r *detectionRoutes) Routes() {
	// Routes V1
	V1Route := r.router.Group("/v1")
	{
		// DetectionHistory
		V1Route.GET("/detectionHistory/:serviceId", r.V1Handler.GetDetectionHistory)
	}

}
