PHONY: start
start:
	@docker compose up -d || true
restart:
	@docker compose restart || true
stop:
	@docker compose down || true

.PHONY: console
console:
	@docker compose exec vintage-story screen -r vintagestory

.PHONY: clean-data
clean-data:
	rm -r ./server-data
