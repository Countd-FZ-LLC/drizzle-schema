DROP TABLE `invited_colleagues`;--> statement-breakpoint
ALTER TABLE `addresses` DROP FOREIGN KEY `addresses_area_id_foreign`;
--> statement-breakpoint
ALTER TABLE `addresses` DROP FOREIGN KEY `addresses_user_id_foreign`;
--> statement-breakpoint
ALTER TABLE `areas` DROP FOREIGN KEY `areas_city_id_foreign`;
--> statement-breakpoint
ALTER TABLE `branches` DROP FOREIGN KEY `branches_restaurant_id_foreign`;
--> statement-breakpoint
ALTER TABLE `branch_area_delivery` DROP FOREIGN KEY `branch_area_delivery_area_id_foreign`;
--> statement-breakpoint
ALTER TABLE `branch_area_delivery` DROP FOREIGN KEY `branch_area_delivery_branch_id_foreign`;
--> statement-breakpoint
ALTER TABLE `challenge_v2_user_stats` DROP FOREIGN KEY `challenge_v2_user_stats_challenge_v2_id_foreign`;
--> statement-breakpoint
ALTER TABLE `challenge_v2_user_stats` DROP FOREIGN KEY `challenge_v2_user_stats_user_id_foreign`;
--> statement-breakpoint
ALTER TABLE `daily_slot_diet_calories` DROP FOREIGN KEY `daily_slot_diet_calories_ibfk_1`;
--> statement-breakpoint
ALTER TABLE `daily_slot_diet_calories` DROP FOREIGN KEY `daily_slot_diet_calories_ibfk_2`;
--> statement-breakpoint
ALTER TABLE `daily_user_activity_logs` DROP FOREIGN KEY `daily_user_activity_logs_user_id_foreign`;
--> statement-breakpoint
ALTER TABLE `delivery_orders` DROP FOREIGN KEY `delivery_orders_ibfk_1`;
--> statement-breakpoint
ALTER TABLE `delivery_orders` DROP FOREIGN KEY `delivery_orders_ibfk_2`;
--> statement-breakpoint
ALTER TABLE `delivery_order_meals` DROP FOREIGN KEY `delivery_order_meals_delivery_order_id_foreign`;
--> statement-breakpoint
ALTER TABLE `delivery_slots` DROP FOREIGN KEY `delivery_slots_delivery_id_foreign`;
--> statement-breakpoint
ALTER TABLE `diet_goal` DROP FOREIGN KEY `diet_goal_diet_id_foreign`;
--> statement-breakpoint
ALTER TABLE `diet_goal` DROP FOREIGN KEY `diet_goal_goal_id_foreign`;
--> statement-breakpoint
ALTER TABLE `diet_plans` DROP FOREIGN KEY `diet_plans_diet_type_id_foreign`;
--> statement-breakpoint
ALTER TABLE `diet_plans` DROP FOREIGN KEY `diet_plans_ibfk_1`;
--> statement-breakpoint
ALTER TABLE `diet_plan_daily_slots` DROP FOREIGN KEY `diet_plan_daily_slots_ibfk_1`;
--> statement-breakpoint
ALTER TABLE `diet_plan_daily_slots` DROP FOREIGN KEY `diet_plan_daily_slots_ibfk_2`;
--> statement-breakpoint
ALTER TABLE `diet_plan_menus` DROP FOREIGN KEY `diet_plan_menus_ibfk_1`;
--> statement-breakpoint
ALTER TABLE `diet_plan_packages` DROP FOREIGN KEY `diet_plan_packages_ibfk_1`;
--> statement-breakpoint
ALTER TABLE `diet_plan_package_daily_slot` DROP FOREIGN KEY `diet_plan_package_daily_slot_ibfk_1`;
--> statement-breakpoint
ALTER TABLE `diet_plan_package_daily_slot` DROP FOREIGN KEY `diet_plan_package_daily_slot_ibfk_2`;
--> statement-breakpoint
ALTER TABLE `email_queue` DROP FOREIGN KEY `email_queue_ibfk_1`;
--> statement-breakpoint
ALTER TABLE `leaderboards` DROP FOREIGN KEY `leaderboards_ibfk_1`;
--> statement-breakpoint
ALTER TABLE `leaderboards` DROP FOREIGN KEY `leaderboards_user_id_foreign`;
--> statement-breakpoint
ALTER TABLE `meals_components_pivot` DROP FOREIGN KEY `meals_components_pivot_meal_component_id_foreign`;
--> statement-breakpoint
ALTER TABLE `meals_components_pivot` DROP FOREIGN KEY `meals_components_pivot_meal_id_foreign`;
--> statement-breakpoint
ALTER TABLE `meal_branch` DROP FOREIGN KEY `meal_branch_branch_id_foreign`;
--> statement-breakpoint
ALTER TABLE `meal_branch` DROP FOREIGN KEY `meal_branch_meal_id_foreign`;
--> statement-breakpoint
ALTER TABLE `meal_components` DROP FOREIGN KEY `meal_components_allergy_id_foreign`;
--> statement-breakpoint
ALTER TABLE `meal_daily_slot` DROP FOREIGN KEY `meal_daily_slot_ibfk_1`;
--> statement-breakpoint
ALTER TABLE `meal_daily_slot` DROP FOREIGN KEY `meal_daily_slot_ibfk_2`;
--> statement-breakpoint
ALTER TABLE `meal_diet_plan` DROP FOREIGN KEY `meal_diet_plan_diet_plan_id_foreign`;
--> statement-breakpoint
ALTER TABLE `meal_diet_plan` DROP FOREIGN KEY `meal_diet_plan_meal_id_foreign`;
--> statement-breakpoint
ALTER TABLE `push_notification_devices` DROP FOREIGN KEY `push_notification_devices_user_id_foreign`;
--> statement-breakpoint
ALTER TABLE `push_tokens` DROP FOREIGN KEY `push_tokens_ibfk_1`;
--> statement-breakpoint
ALTER TABLE `restaurants` DROP FOREIGN KEY `restaurants_company_id_foreign`;
--> statement-breakpoint
ALTER TABLE `trainer_leads` DROP FOREIGN KEY `trainer_leads_ibfk_1`;
--> statement-breakpoint
ALTER TABLE `trainer_leads` DROP FOREIGN KEY `trainer_leads_ibfk_2`;
--> statement-breakpoint
ALTER TABLE `trainer_lead_earnings` DROP FOREIGN KEY `trainer_lead_earnings_ibfk_1`;
--> statement-breakpoint
ALTER TABLE `users` DROP FOREIGN KEY `users_active_exercise_id_foreign`;
--> statement-breakpoint
ALTER TABLE `users` DROP FOREIGN KEY `users_challenge_v2_id_foreign`;
--> statement-breakpoint
ALTER TABLE `users` DROP FOREIGN KEY `users_country_id_foreign`;
--> statement-breakpoint
ALTER TABLE `users` DROP FOREIGN KEY `users_diet_plan_id_foreign`;
--> statement-breakpoint
ALTER TABLE `users` DROP FOREIGN KEY `users_diet_plan_package_id_foreign`;
--> statement-breakpoint
ALTER TABLE `users` DROP FOREIGN KEY `users_goal_id_foreign`;
--> statement-breakpoint
ALTER TABLE `user_achievements` DROP FOREIGN KEY `user_achievements_achievement_id_foreign`;
--> statement-breakpoint
ALTER TABLE `user_achievements` DROP FOREIGN KEY `user_achievements_user_id_foreign`;
--> statement-breakpoint
ALTER TABLE `user_allergy` DROP FOREIGN KEY `user_allergy_allergy_id_foreign`;
--> statement-breakpoint
ALTER TABLE `user_allergy` DROP FOREIGN KEY `user_allergy_user_id_foreign`;
--> statement-breakpoint
ALTER TABLE `user_delivery_address` DROP FOREIGN KEY `user_delivery_address_delivery_id_foreign`;
--> statement-breakpoint
ALTER TABLE `user_delivery_address` DROP FOREIGN KEY `user_delivery_address_delivery_slot_id_foreign`;
--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` DROP FOREIGN KEY `user_diet_plan_log_from_diet_plan_id_foreign`;
--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` DROP FOREIGN KEY `user_diet_plan_log_to_diet_plan_id_foreign`;
--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` DROP FOREIGN KEY `user_diet_plan_log_user_id_foreign`;
--> statement-breakpoint
ALTER TABLE `user_google_tokens` DROP FOREIGN KEY `user_google_tokens_ibfk_1`;
--> statement-breakpoint
ALTER TABLE `user_meal_groups` DROP FOREIGN KEY `user_meal_groups_daily_slot_id_fk`;
--> statement-breakpoint
ALTER TABLE `user_meal_groups` DROP FOREIGN KEY `user_meal_groups_delivery_address_id_foreign`;
--> statement-breakpoint
ALTER TABLE `user_meal_groups` DROP FOREIGN KEY `user_meal_groups_ibfk_1`;
--> statement-breakpoint
ALTER TABLE `user_meal_groups` DROP FOREIGN KEY `user_meal_groups_ibfk_2`;
--> statement-breakpoint
ALTER TABLE `user_meal_groups` DROP FOREIGN KEY `user_meal_groups_meal_id_fk`;
--> statement-breakpoint
ALTER TABLE `user_meal_groups` DROP FOREIGN KEY `user_meal_groups_user_id_fk`;
--> statement-breakpoint
ALTER TABLE `user_meal_groups_history` DROP FOREIGN KEY `user_meal_groups_history_daily_slot_id_foreign`;
--> statement-breakpoint
ALTER TABLE `user_meal_groups_history` DROP FOREIGN KEY `user_meal_groups_history_delivery_address_id_foreign`;
--> statement-breakpoint
ALTER TABLE `user_subscription` DROP FOREIGN KEY `user_subscription_ibfk_1`;
--> statement-breakpoint
ALTER TABLE `user_subscription` DROP FOREIGN KEY `user_subscription_ibfk_2`;
--> statement-breakpoint
ALTER TABLE `user_subscription` DROP FOREIGN KEY `user_subscription_ibfk_3`;
--> statement-breakpoint
DROP INDEX `delivery_orders_daily_slot_id_index` ON `delivery_orders`;--> statement-breakpoint
DROP INDEX `delivery_orders_id_index` ON `delivery_orders`;--> statement-breakpoint
DROP INDEX `quiqup_delivery_zones_code_index` ON `quiqup_delivery_zones`;--> statement-breakpoint
DROP INDEX `quiqup_delivery_zones_variant_index` ON `quiqup_delivery_zones`;--> statement-breakpoint
ALTER TABLE `achievements` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `achievements` MODIFY COLUMN `reward_points` int NOT NULL;--> statement-breakpoint
ALTER TABLE `achievements` MODIFY COLUMN `goal` decimal(20,2) NOT NULL DEFAULT '0.00';--> statement-breakpoint
ALTER TABLE `active_exercise` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `addresses` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `addresses` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `addresses` MODIFY COLUMN `area_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `admins` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `allergies` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `allergy_meals` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `allergy_meals` MODIFY COLUMN `meal_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `allergy_meals` MODIFY COLUMN `allergy_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `app_requests` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `app_requests` MODIFY COLUMN `country_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `app_requests` MODIFY COLUMN `city_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `app_settings` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `areas` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `areas` MODIFY COLUMN `city_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `branches` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `branches` MODIFY COLUMN `restaurant_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `branches` MODIFY COLUMN `country_id` bigint;--> statement-breakpoint
ALTER TABLE `branches` MODIFY COLUMN `city_id` bigint;--> statement-breakpoint
ALTER TABLE `branches` MODIFY COLUMN `commission` double(8,2);--> statement-breakpoint
ALTER TABLE `branches` MODIFY COLUMN `delivery_pick_up_id` int;--> statement-breakpoint
ALTER TABLE `branch_area_delivery` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `branch_area_delivery` MODIFY COLUMN `branch_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `branch_area_delivery` MODIFY COLUMN `area_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `branch_delivery_slots` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `branch_delivery_slots` MODIFY COLUMN `branch_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `branch_delivery_slots` MODIFY COLUMN `delivery_slot_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `canceled_subscriptions` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `canceled_subscriptions` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `canceled_subscriptions` MODIFY COLUMN `order_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `challenge_v2_s` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `challenge_v2_s` MODIFY COLUMN `max_participants` int NOT NULL DEFAULT 100;--> statement-breakpoint
ALTER TABLE `challenge_v2_user_stats` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `challenge_v2_user_stats` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `challenge_v2_user_stats` MODIFY COLUMN `challenge_v2_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `challenge_v2_user_stats` MODIFY COLUMN `points` int NOT NULL;--> statement-breakpoint
ALTER TABLE `challenge_v2_user_stats` MODIFY COLUMN `last_synced_points` int NOT NULL;--> statement-breakpoint
ALTER TABLE `channel_models` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `cities` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `cities` MODIFY COLUMN `country_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `companies` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `countries` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `coupons` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `coupons` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `coupons` MODIFY COLUMN `referred_user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `daily_slots` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `daily_slots` MODIFY COLUMN `delivery_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `daily_slots` MODIFY COLUMN `order` int;--> statement-breakpoint
ALTER TABLE `daily_slot_diet_calories` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `daily_slot_diet_calories` MODIFY COLUMN `diet_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `daily_slot_diet_calories` MODIFY COLUMN `daily_slot_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `daily_slot_diet_calories` MODIFY COLUMN `calories` int NOT NULL;--> statement-breakpoint
ALTER TABLE `daily_user_activity_logs` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `daily_user_activity_logs` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `daily_user_activity_logs` MODIFY COLUMN `calories` decimal(20,2) NOT NULL DEFAULT '0.00';--> statement-breakpoint
ALTER TABLE `daily_user_activity_logs` MODIFY COLUMN `duration` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `daily_user_activity_logs` MODIFY COLUMN `rawCount` decimal(20,2) NOT NULL DEFAULT '0.00';--> statement-breakpoint
ALTER TABLE `daily_user_activity_logs` MODIFY COLUMN `distance` decimal(20,2) NOT NULL DEFAULT '0.00';--> statement-breakpoint
ALTER TABLE `deleted_users` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `deleted_users` MODIFY COLUMN `user_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `deliveries` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_address_branches` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_address_branches` MODIFY COLUMN `user_delivery_address_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_address_branches` MODIFY COLUMN `branch_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_orders` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_orders` MODIFY COLUMN `user_meal_group_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_orders` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_orders` MODIFY COLUMN `daily_slot_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_orders` MODIFY COLUMN `branch_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_orders` MODIFY COLUMN `delivery_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_orders` MODIFY COLUMN `delivery_slot_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_orders` MODIFY COLUMN `delivery_address_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_orders` MODIFY COLUMN `driver_order_status_id` int;--> statement-breakpoint
ALTER TABLE `delivery_orders_status_logs` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_orders_status_logs` MODIFY COLUMN `delivery_order_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_order_meals` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_order_meals` MODIFY COLUMN `delivery_order_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_order_meals` MODIFY COLUMN `meal_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_order_meals` MODIFY COLUMN `branch_commission` double(8,2);--> statement-breakpoint
ALTER TABLE `delivery_order_meals` MODIFY COLUMN `meal_selling_price` double(8,2);--> statement-breakpoint
ALTER TABLE `delivery_slots` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `delivery_slots` MODIFY COLUMN `delivery_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `diets` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `diets` MODIFY COLUMN `daily_calories` int NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_goal` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_goal` MODIFY COLUMN `goal_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_goal` MODIFY COLUMN `diet_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plans` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plans` MODIFY COLUMN `diet_type_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plans` MODIFY COLUMN `diet_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plans` MODIFY COLUMN `day_kcal_min` double(8,2) NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plans` MODIFY COLUMN `day_kcal_max` double(8,2) NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plans` MODIFY COLUMN `day_carb_min` double(8,2) NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plans` MODIFY COLUMN `day_protein_min` double(8,2) NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_daily_slots` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_daily_slots` MODIFY COLUMN `diet_plan_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_daily_slots` MODIFY COLUMN `daily_slot_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_daily_slots` MODIFY COLUMN `meal_kcal_min` double(8,2) NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_daily_slots` MODIFY COLUMN `meal_carb_min` varchar(255) NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_daily_slots` MODIFY COLUMN `meal_fat_min` double(8,2) NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_daily_slots` MODIFY COLUMN `meal_protein_min` double(8,2) NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_menus` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_menus` MODIFY COLUMN `meal_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_menus` MODIFY COLUMN `restaurant_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_packages` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_packages` MODIFY COLUMN `diet_plan_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_packages` MODIFY COLUMN `sort` int DEFAULT 1;--> statement-breakpoint
ALTER TABLE `diet_plan_packages_bkp` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_packages_bkp` MODIFY COLUMN `diet_plan_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_package_daily_slot` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_package_daily_slot` MODIFY COLUMN `diet_plan_package_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_package_daily_slot` MODIFY COLUMN `diet_plan_daily_slot_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_package_daily_slot_bkp` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_package_daily_slot_bkp` MODIFY COLUMN `diet_plan_package_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_plan_package_daily_slot_bkp` MODIFY COLUMN `diet_plan_daily_slot_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_types` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_types` MODIFY COLUMN `sort` int NOT NULL DEFAULT 1;--> statement-breakpoint
ALTER TABLE `diet_type_meals` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_type_meals` MODIFY COLUMN `meal_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `diet_type_meals` MODIFY COLUMN `diet_type_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `email_queue` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `email_queue` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `failed_jobs` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `faqs` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `favorite_user_meals` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `favorite_user_meals` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `favorite_user_meals` MODIFY COLUMN `meal_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `food_notifications` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `goals` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `goals` MODIFY COLUMN `parent_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `goals` MODIFY COLUMN `deficit` double(8,2) NOT NULL;--> statement-breakpoint
ALTER TABLE `goal_diet_plan` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `goal_diet_plan` MODIFY COLUMN `goal_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `goal_diet_plan` MODIFY COLUMN `diet_plan_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `jobs` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `jobs` MODIFY COLUMN `reserved_at` int;--> statement-breakpoint
ALTER TABLE `jobs` MODIFY COLUMN `available_at` int NOT NULL;--> statement-breakpoint
ALTER TABLE `jobs` MODIFY COLUMN `created_at` int NOT NULL;--> statement-breakpoint
ALTER TABLE `leaderboards` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `leaderboards` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `leaderboards` MODIFY COLUMN `challenge_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `leaderboards` MODIFY COLUMN `rank` int;--> statement-breakpoint
ALTER TABLE `leaderboards` MODIFY COLUMN `points` int;--> statement-breakpoint
ALTER TABLE `meals` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `meals` MODIFY COLUMN `restaurant_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `meals` MODIFY COLUMN `kcal` double;--> statement-breakpoint
ALTER TABLE `meals` MODIFY COLUMN `protein` double;--> statement-breakpoint
ALTER TABLE `meals` MODIFY COLUMN `carbs` double;--> statement-breakpoint
ALTER TABLE `meals` MODIFY COLUMN `fat` double;--> statement-breakpoint
ALTER TABLE `meals_components_pivot` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `meals_components_pivot` MODIFY COLUMN `meal_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `meals_components_pivot` MODIFY COLUMN `meal_component_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `meals_orders_reports_view` MODIFY COLUMN `id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `meals_orders_reports_view` MODIFY COLUMN `restaurant_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `meals_orders_reports_view` MODIFY COLUMN `total` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `meal_branch` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `meal_branch` MODIFY COLUMN `meal_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `meal_branch` MODIFY COLUMN `branch_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `meal_components` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `meal_components` MODIFY COLUMN `allergy_id` int;--> statement-breakpoint
ALTER TABLE `meal_components` MODIFY COLUMN `restaurant_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `meal_components` MODIFY COLUMN `protein` double(8,2) NOT NULL;--> statement-breakpoint
ALTER TABLE `meal_components` MODIFY COLUMN `carbs` double(8,2) NOT NULL;--> statement-breakpoint
ALTER TABLE `meal_components` MODIFY COLUMN `fat` double(8,2) NOT NULL;--> statement-breakpoint
ALTER TABLE `meal_daily_slot` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `meal_daily_slot` MODIFY COLUMN `meal_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `meal_daily_slot` MODIFY COLUMN `daily_slot_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `meal_diet_plan` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `meal_diet_plan` MODIFY COLUMN `diet_plan_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `meal_diet_plan` MODIFY COLUMN `meal_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `meal_group_status` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `migrations` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `migrations` MODIFY COLUMN `batch` int NOT NULL;--> statement-breakpoint
ALTER TABLE `orders` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `orders` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `orders` MODIFY COLUMN `diet_plan_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `orders` MODIFY COLUMN `diet_plan_package_id` int;--> statement-breakpoint
ALTER TABLE `orders` MODIFY COLUMN `subscription_days` int NOT NULL;--> statement-breakpoint
ALTER TABLE `orders` MODIFY COLUMN `discount` int;--> statement-breakpoint
ALTER TABLE `orders` MODIFY COLUMN `promo_code_id` bigint;--> statement-breakpoint
ALTER TABLE `orders` MODIFY COLUMN `tax_percentage` double(8,2);--> statement-breakpoint
ALTER TABLE `orders` MODIFY COLUMN `canceled_subscription_id` bigint;--> statement-breakpoint
ALTER TABLE `orders` MODIFY COLUMN `bag_deposit` float NOT NULL;--> statement-breakpoint
ALTER TABLE `order_notifications` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `order_notifications` MODIFY COLUMN `daily_slot_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `partners` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `partners` MODIFY COLUMN `sort` int DEFAULT 1;--> statement-breakpoint
ALTER TABLE `payment_transactions` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `payment_transactions` MODIFY COLUMN `bag_deposit` float NOT NULL;--> statement-breakpoint
ALTER TABLE `payment_transactions` MODIFY COLUMN `order_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `payment_transactions` MODIFY COLUMN `user_id` bigint;--> statement-breakpoint
ALTER TABLE `payment_transactions` MODIFY COLUMN `promo_code_id` bigint;--> statement-breakpoint
ALTER TABLE `payment_transactions` MODIFY COLUMN `store_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `payment_transactions` MODIFY COLUMN `repeat_interval` int DEFAULT 1;--> statement-breakpoint
ALTER TABLE `payment_transactions` MODIFY COLUMN `repeat_term` smallint;--> statement-breakpoint
ALTER TABLE `promo_codes` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `promo_codes` MODIFY COLUMN `max_usage` int;--> statement-breakpoint
ALTER TABLE `promo_codes` MODIFY COLUMN `no_of_used` int;--> statement-breakpoint
ALTER TABLE `promo_codes` MODIFY COLUMN `discount` int NOT NULL;--> statement-breakpoint
ALTER TABLE `promo_codes` MODIFY COLUMN `commission` int;--> statement-breakpoint
ALTER TABLE `push_notification_devices` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `push_notification_devices` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `push_tokens` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `push_tokens` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `quiqup_delivery_zones` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `reasons` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `refer_companies` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `refer_companies` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `replaced_meals` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `replaced_meals` MODIFY COLUMN `user_meal_group_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `replaced_meals` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `replaced_meals` MODIFY COLUMN `previous_meal_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `replaced_meals` MODIFY COLUMN `daily_slot_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `restaurants` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `restaurants` MODIFY COLUMN `company_id` bigint;--> statement-breakpoint
ALTER TABLE `restaurant_meals_reports` MODIFY COLUMN `id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `restaurant_meals_reports` MODIFY COLUMN `restaurant_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `restaurant_meals_reports` MODIFY COLUMN `total` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `restaurant_orders_reports` MODIFY COLUMN `id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `restaurant_orders_reports` MODIFY COLUMN `total_pending` bigint;--> statement-breakpoint
ALTER TABLE `restaurant_orders_reports` MODIFY COLUMN `total_delivered_drivers` bigint;--> statement-breakpoint
ALTER TABLE `restaurant_orders_reports` MODIFY COLUMN `total_dispatched` bigint;--> statement-breakpoint
ALTER TABLE `restaurant_orders_reports` MODIFY COLUMN `total_orders` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `rewards_redemption` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `rewards_redemption` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `rewards_redemption` MODIFY COLUMN `rewards_response_pk` bigint;--> statement-breakpoint
ALTER TABLE `rewards_redemption` MODIFY COLUMN `rewards_redeemed` int;--> statement-breakpoint
ALTER TABLE `sample_meals` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `sample_meals` MODIFY COLUMN `diet_type_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `sample_meals` MODIFY COLUMN `diet_plan_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `trainers` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `trainer_leads` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `trainer_leads` MODIFY COLUMN `converted_user_id` bigint;--> statement-breakpoint
ALTER TABLE `trainer_leads` MODIFY COLUMN `trainer_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `trainer_lead_earnings` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `trainer_lead_earnings` MODIFY COLUMN `trainer_lead_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `trainer_payouts` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `trainer_payouts` MODIFY COLUMN `trainer_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `update_transaction_logs` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `country_id` int;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `goal_id` int;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `diet_plan_id` int;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `diet_plan_package_id` int;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `active_exercise_id` int;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `custom_target_TDEE` smallint;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `custom_target_exercise` smallint;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `subscription_days` int;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `points` int;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `challenge_v2_id` bigint;--> statement-breakpoint
ALTER TABLE `users` MODIFY COLUMN `hubspot_id` bigint;--> statement-breakpoint
ALTER TABLE `users_promo_codes` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `users_promo_codes` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `users_promo_codes` MODIFY COLUMN `promo_code_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `users_promo_codes` MODIFY COLUMN `order_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_achievements` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `user_achievements` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_achievements` MODIFY COLUMN `achievement_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_activity_logs` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `user_activity_logs` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_activity_logs` MODIFY COLUMN `action_by_id` bigint;--> statement-breakpoint
ALTER TABLE `user_allergy` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `user_allergy` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_allergy` MODIFY COLUMN `allergy_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `user_comments` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `user_comments` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_comments` MODIFY COLUMN `created_by` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_comments` MODIFY COLUMN `reason_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_comments` MODIFY COLUMN `channel_id` bigint;--> statement-breakpoint
ALTER TABLE `user_delivery_address` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `user_delivery_address` MODIFY COLUMN `address_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `user_delivery_address` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_delivery_address` MODIFY COLUMN `delivery_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `user_delivery_address` MODIFY COLUMN `delivery_slot_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` MODIFY COLUMN `from_diet_plan_id` int;--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` MODIFY COLUMN `to_diet_plan_id` int;--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` MODIFY COLUMN `from_subscription_days` int;--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` MODIFY COLUMN `to_subscription_days` int;--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` MODIFY COLUMN `from_diet_plan_package_id` int;--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` MODIFY COLUMN `to_diet_plan_package_id` int;--> statement-breakpoint
ALTER TABLE `user_google_tokens` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `user_google_tokens` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_google_tokens` MODIFY COLUMN `expires_at` bigint;--> statement-breakpoint
ALTER TABLE `user_invitations` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `user_invitations` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_invitations` MODIFY COLUMN `invited_by` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_leads` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `user_meal_groups` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `user_meal_groups` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_meal_groups` MODIFY COLUMN `meal_id` bigint;--> statement-breakpoint
ALTER TABLE `user_meal_groups` MODIFY COLUMN `daily_slot_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `user_meal_groups` MODIFY COLUMN `delivery_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `user_meal_groups` MODIFY COLUMN `delivery_slot_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `user_meal_groups` MODIFY COLUMN `delivery_address_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `user_meal_groups_history` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `user_meal_groups_history` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_meal_groups_history` MODIFY COLUMN `meal_id` bigint;--> statement-breakpoint
ALTER TABLE `user_meal_groups_history` MODIFY COLUMN `daily_slot_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `user_meal_groups_history` MODIFY COLUMN `delivery_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `user_meal_groups_history` MODIFY COLUMN `delivery_slot_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `user_meal_groups_history` MODIFY COLUMN `delivery_address_id` int NOT NULL;--> statement-breakpoint
ALTER TABLE `user_order_coupons` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `user_order_coupons` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_order_coupons` MODIFY COLUMN `order_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_order_coupons` MODIFY COLUMN `coupon_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_subscription` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `user_subscription` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `user_subscription` MODIFY COLUMN `subscription_days` int NOT NULL;--> statement-breakpoint
ALTER TABLE `user_subscription` MODIFY COLUMN `diet_plan_id` int;--> statement-breakpoint
ALTER TABLE `user_subscription` MODIFY COLUMN `diet_plan_package_id` int;--> statement-breakpoint
ALTER TABLE `user_subscription` MODIFY COLUMN `status` int NOT NULL;--> statement-breakpoint
ALTER TABLE `user_weight_logs` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `user_weight_logs` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `verification_requests` MODIFY COLUMN `id` int AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `water_bottle_orders` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
ALTER TABLE `water_bottle_orders` MODIFY COLUMN `user_id` bigint NOT NULL;--> statement-breakpoint
ALTER TABLE `water_bottle_orders` MODIFY COLUMN `quantity` int NOT NULL;--> statement-breakpoint
ALTER TABLE `water_bottle_orders` MODIFY COLUMN `discount` int;--> statement-breakpoint
ALTER TABLE `water_bottle_orders` MODIFY COLUMN `promo_code_id` int;--> statement-breakpoint
ALTER TABLE `water_notifications` MODIFY COLUMN `id` bigint AUTO_INCREMENT NOT NULL;--> statement-breakpoint
CREATE INDEX `PRIMARY` ON `delivery_orders` (`id`);--> statement-breakpoint
CREATE INDEX `delivery_orders_id_index` ON `delivery_orders` (`daily_slot_id`);--> statement-breakpoint
CREATE INDEX `quiqup_delivery_zones_code_index` ON `quiqup_delivery_zones` (`variant`);--> statement-breakpoint
CREATE INDEX `quiqup_delivery_zones_variant_index` ON `quiqup_delivery_zones` (`code`);--> statement-breakpoint
ALTER TABLE `addresses` ADD CONSTRAINT `addresses_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `addresses` ADD CONSTRAINT `addresses_area_id_areas_id_fk` FOREIGN KEY (`area_id`) REFERENCES `areas`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `areas` ADD CONSTRAINT `areas_city_id_cities_id_fk` FOREIGN KEY (`city_id`) REFERENCES `cities`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `branches` ADD CONSTRAINT `branches_restaurant_id_restaurants_id_fk` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `branch_area_delivery` ADD CONSTRAINT `branch_area_delivery_branch_id_branches_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `branches`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `branch_area_delivery` ADD CONSTRAINT `branch_area_delivery_area_id_areas_id_fk` FOREIGN KEY (`area_id`) REFERENCES `areas`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `challenge_v2_user_stats` ADD CONSTRAINT `challenge_v2_user_stats_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `challenge_v2_user_stats` ADD CONSTRAINT `challenge_v2_user_stats_challenge_v2_id_challenge_v2_s_id_fk` FOREIGN KEY (`challenge_v2_id`) REFERENCES `challenge_v2_s`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `daily_slot_diet_calories` ADD CONSTRAINT `daily_slot_diet_calories_diet_id_diets_id_fk` FOREIGN KEY (`diet_id`) REFERENCES `diets`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `daily_slot_diet_calories` ADD CONSTRAINT `daily_slot_diet_calories_daily_slot_id_daily_slots_id_fk` FOREIGN KEY (`daily_slot_id`) REFERENCES `daily_slots`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `daily_user_activity_logs` ADD CONSTRAINT `daily_user_activity_logs_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `delivery_orders` ADD CONSTRAINT `delivery_orders_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `delivery_orders` ADD CONSTRAINT `delivery_orders_delivery_id_deliveries_id_fk` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `delivery_order_meals` ADD CONSTRAINT `delivery_order_meals_delivery_order_id_delivery_orders_id_fk` FOREIGN KEY (`delivery_order_id`) REFERENCES `delivery_orders`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `delivery_slots` ADD CONSTRAINT `delivery_slots_delivery_id_deliveries_id_fk` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `diet_goal` ADD CONSTRAINT `diet_goal_goal_id_goals_id_fk` FOREIGN KEY (`goal_id`) REFERENCES `goals`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `diet_goal` ADD CONSTRAINT `diet_goal_diet_id_diets_id_fk` FOREIGN KEY (`diet_id`) REFERENCES `diets`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `diet_plans` ADD CONSTRAINT `diet_plans_diet_type_id_diet_types_id_fk` FOREIGN KEY (`diet_type_id`) REFERENCES `diet_types`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `diet_plans` ADD CONSTRAINT `diet_plans_diet_id_diets_id_fk` FOREIGN KEY (`diet_id`) REFERENCES `diets`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `diet_plan_daily_slots` ADD CONSTRAINT `diet_plan_daily_slots_diet_plan_id_diet_plans_id_fk` FOREIGN KEY (`diet_plan_id`) REFERENCES `diet_plans`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `diet_plan_daily_slots` ADD CONSTRAINT `diet_plan_daily_slots_daily_slot_id_daily_slots_id_fk` FOREIGN KEY (`daily_slot_id`) REFERENCES `daily_slots`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `diet_plan_menus` ADD CONSTRAINT `diet_plan_menus_meal_id_meals_id_fk` FOREIGN KEY (`meal_id`) REFERENCES `meals`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `diet_plan_packages` ADD CONSTRAINT `diet_plan_packages_diet_plan_id_diet_plans_id_fk` FOREIGN KEY (`diet_plan_id`) REFERENCES `diet_plans`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `diet_plan_package_daily_slot` ADD CONSTRAINT `diet_plan_package_daily_slot_diet_plan_package_id_diet_plan_packages_id_fk` FOREIGN KEY (`diet_plan_package_id`) REFERENCES `diet_plan_packages`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `diet_plan_package_daily_slot` ADD CONSTRAINT `diet_plan_package_daily_slot_diet_plan_daily_slot_id_diet_plan_daily_slots_id_fk` FOREIGN KEY (`diet_plan_daily_slot_id`) REFERENCES `diet_plan_daily_slots`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `email_queue` ADD CONSTRAINT `email_queue_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `leaderboards` ADD CONSTRAINT `leaderboards_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `leaderboards` ADD CONSTRAINT `leaderboards_challenge_id_challenge_v2_s_id_fk` FOREIGN KEY (`challenge_id`) REFERENCES `challenge_v2_s`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `meals_components_pivot` ADD CONSTRAINT `meals_components_pivot_meal_id_meals_id_fk` FOREIGN KEY (`meal_id`) REFERENCES `meals`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `meals_components_pivot` ADD CONSTRAINT `meals_components_pivot_meal_component_id_meal_components_id_fk` FOREIGN KEY (`meal_component_id`) REFERENCES `meal_components`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `meal_branch` ADD CONSTRAINT `meal_branch_meal_id_meals_id_fk` FOREIGN KEY (`meal_id`) REFERENCES `meals`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `meal_branch` ADD CONSTRAINT `meal_branch_branch_id_branches_id_fk` FOREIGN KEY (`branch_id`) REFERENCES `branches`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `meal_components` ADD CONSTRAINT `meal_components_allergy_id_allergies_id_fk` FOREIGN KEY (`allergy_id`) REFERENCES `allergies`(`id`) ON DELETE set null ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `meal_daily_slot` ADD CONSTRAINT `meal_daily_slot_meal_id_meals_id_fk` FOREIGN KEY (`meal_id`) REFERENCES `meals`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `meal_daily_slot` ADD CONSTRAINT `meal_daily_slot_daily_slot_id_daily_slots_id_fk` FOREIGN KEY (`daily_slot_id`) REFERENCES `daily_slots`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `meal_diet_plan` ADD CONSTRAINT `meal_diet_plan_diet_plan_id_diet_plans_id_fk` FOREIGN KEY (`diet_plan_id`) REFERENCES `diet_plans`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `meal_diet_plan` ADD CONSTRAINT `meal_diet_plan_meal_id_meals_id_fk` FOREIGN KEY (`meal_id`) REFERENCES `meals`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `push_notification_devices` ADD CONSTRAINT `push_notification_devices_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `push_tokens` ADD CONSTRAINT `push_tokens_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `restaurants` ADD CONSTRAINT `restaurants_company_id_companies_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`) ON DELETE set null ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `trainer_leads` ADD CONSTRAINT `trainer_leads_converted_user_id_users_id_fk` FOREIGN KEY (`converted_user_id`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `trainer_leads` ADD CONSTRAINT `trainer_leads_trainer_id_trainers_id_fk` FOREIGN KEY (`trainer_id`) REFERENCES `trainers`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `trainer_lead_earnings` ADD CONSTRAINT `trainer_lead_earnings_trainer_lead_id_trainer_leads_id_fk` FOREIGN KEY (`trainer_lead_id`) REFERENCES `trainer_leads`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `users` ADD CONSTRAINT `users_country_id_countries_id_fk` FOREIGN KEY (`country_id`) REFERENCES `countries`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `users` ADD CONSTRAINT `users_goal_id_goals_id_fk` FOREIGN KEY (`goal_id`) REFERENCES `goals`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `users` ADD CONSTRAINT `users_diet_plan_id_diet_plans_id_fk` FOREIGN KEY (`diet_plan_id`) REFERENCES `diet_plans`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `users` ADD CONSTRAINT `users_diet_plan_package_id_diet_plan_packages_id_fk` FOREIGN KEY (`diet_plan_package_id`) REFERENCES `diet_plan_packages`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `users` ADD CONSTRAINT `users_active_exercise_id_active_exercise_id_fk` FOREIGN KEY (`active_exercise_id`) REFERENCES `active_exercise`(`id`) ON DELETE set null ON UPDATE set null;--> statement-breakpoint
ALTER TABLE `users` ADD CONSTRAINT `users_challenge_v2_id_challenge_v2_s_id_fk` FOREIGN KEY (`challenge_v2_id`) REFERENCES `challenge_v2_s`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `user_achievements` ADD CONSTRAINT `user_achievements_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `user_achievements` ADD CONSTRAINT `user_achievements_achievement_id_achievements_id_fk` FOREIGN KEY (`achievement_id`) REFERENCES `achievements`(`id`) ON DELETE cascade ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `user_allergy` ADD CONSTRAINT `user_allergy_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_allergy` ADD CONSTRAINT `user_allergy_allergy_id_allergies_id_fk` FOREIGN KEY (`allergy_id`) REFERENCES `allergies`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_delivery_address` ADD CONSTRAINT `user_delivery_address_delivery_id_deliveries_id_fk` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_delivery_address` ADD CONSTRAINT `user_delivery_address_delivery_slot_id_delivery_slots_id_fk` FOREIGN KEY (`delivery_slot_id`) REFERENCES `delivery_slots`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` ADD CONSTRAINT `user_diet_plan_log_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` ADD CONSTRAINT `user_diet_plan_log_from_diet_plan_id_diet_plans_id_fk` FOREIGN KEY (`from_diet_plan_id`) REFERENCES `diet_plans`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` ADD CONSTRAINT `user_diet_plan_log_to_diet_plan_id_diet_plans_id_fk` FOREIGN KEY (`to_diet_plan_id`) REFERENCES `diet_plans`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_google_tokens` ADD CONSTRAINT `user_google_tokens_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_meal_groups` ADD CONSTRAINT `user_meal_groups_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_meal_groups` ADD CONSTRAINT `user_meal_groups_meal_id_meals_id_fk` FOREIGN KEY (`meal_id`) REFERENCES `meals`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_meal_groups` ADD CONSTRAINT `user_meal_groups_daily_slot_id_daily_slots_id_fk` FOREIGN KEY (`daily_slot_id`) REFERENCES `daily_slots`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_meal_groups` ADD CONSTRAINT `user_meal_groups_delivery_id_deliveries_id_fk` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `user_meal_groups` ADD CONSTRAINT `user_meal_groups_delivery_slot_id_delivery_slots_id_fk` FOREIGN KEY (`delivery_slot_id`) REFERENCES `delivery_slots`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `user_meal_groups` ADD CONSTRAINT `user_meal_groups_delivery_address_id_addresses_id_fk` FOREIGN KEY (`delivery_address_id`) REFERENCES `addresses`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_meal_groups_history` ADD CONSTRAINT `user_meal_groups_history_daily_slot_id_daily_slots_id_fk` FOREIGN KEY (`daily_slot_id`) REFERENCES `daily_slots`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_meal_groups_history` ADD CONSTRAINT `user_meal_groups_history_delivery_address_id_addresses_id_fk` FOREIGN KEY (`delivery_address_id`) REFERENCES `addresses`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_subscription` ADD CONSTRAINT `user_subscription_user_id_users_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `user_subscription` ADD CONSTRAINT `user_subscription_diet_plan_id_diet_plans_id_fk` FOREIGN KEY (`diet_plan_id`) REFERENCES `diet_plans`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `user_subscription` ADD CONSTRAINT `user_subscription_diet_plan_package_id_diet_plan_packages_id_fk` FOREIGN KEY (`diet_plan_package_id`) REFERENCES `diet_plan_packages`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `trainer_leads` DROP COLUMN `total_revenue`;--> statement-breakpoint
ALTER TABLE `trainer_lead_earnings` DROP COLUMN `amount`;--> statement-breakpoint
ALTER TABLE `trainer_payouts` DROP COLUMN `amount`;