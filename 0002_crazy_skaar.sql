CREATE TABLE `user_activity_data_sources` (
	`id` bigint AUTO_INCREMENT NOT NULL,
	`user_id` bigint NOT NULL,
	`data_source_id` bigint NOT NULL,
	`type` enum('steps_and_duration','calories','distance','activity') NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT 'now()',
	`updated_at` timestamp NOT NULL DEFAULT 'now()' ON UPDATE CURRENT_TIMESTAMP
);
--> statement-breakpoint