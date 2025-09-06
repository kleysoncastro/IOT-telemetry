migrate:
	./pkg/migrate -source file://$(shell pwd)/migration -database postgresql://emqx_user:emqx_password@localhost:5432/emqx_auth?sslmode=disable $(ACTION)
