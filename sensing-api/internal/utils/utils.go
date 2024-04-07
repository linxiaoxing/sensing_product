package utils

func ContainsString(list []string, item string) bool {
	for _, value := range list {
		if value == item {
			return true
		}
	}
	return false
}

func ContainsInt(list []int64, item *int64) bool {
	for _, value := range list {
		if value == *item {
			return true
		}
	}
	return false
}
