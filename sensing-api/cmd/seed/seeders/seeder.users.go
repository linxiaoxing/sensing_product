package seeders

import (
	"github.com/sirupsen/logrus"
	"github.com/yokusp/sensing-api/internal/constants"
	"github.com/yokusp/sensing-api/internal/datasources/records"
	"github.com/yokusp/sensing-api/pkg/helpers"
	"github.com/yokusp/sensing-api/pkg/logger"
)

var pass string
var UserData []records.Users

func init() {
	var err error
	pass, err = helpers.GenerateHash("12345")
	if err != nil {
		logger.Panic(err.Error(), logrus.Fields{constants.LoggerCategory: constants.LoggerCategorySeeder})
	}

	UserData = []records.Users{
		{
			Username: "patrick star 7",
			Email:    "patrick@gmail.com",
			Password: pass,
			Active:   true,
			RoleId:   1,
		},
		{
			Username: "john doe",
			Email:    "johndoe@gmail.com",
			Password: pass,
			Active:   false,
			RoleId:   2,
		},
	}
}
