-- Current sql file was generated after introspecting the database
-- If you want to run this migration please uncomment this code before executing migrations
/*
CREATE TABLE `achievements` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`icon` varchar(255) NOT NULL,
	`description` varchar(255) NOT NULL,
	`activity_type` enum('cycle','yoga','hiit','running','rowing','swimming','hiking','pilates','core_training','steps','meal_count','perfect_month','other','water_intake') NOT NULL DEFAULT 'other',
	`frequency` enum('daily','weekly','monthly') NOT NULL DEFAULT 'daily',
	`reward_points` int(11) NOT NULL DEFAULT 0,
	`goal` decimal(20,2) unsigned NOT NULL DEFAULT '0.00',
	`is_active` tinyint NOT NULL DEFAULT 1,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP
);
--> statement-breakpoint
CREATE TABLE `active_exercise` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`description` json NOT NULL,
	`activity_level_rate` double(8,2) NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	`active` tinyint NOT NULL DEFAULT 1
);
--> statement-breakpoint
CREATE TABLE `addresses` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`area_id` int(10) unsigned NOT NULL,
	`address_type` varchar(255) NOT NULL,
	`address_name` varchar(255),
	`block` varchar(255),
	`street` varchar(255),
	`building` varchar(255),
	`floor` varchar(255),
	`apartment_number` varchar(255),
	`additional_directions` varchar(255),
	`lat` decimal(10,8),
	`lng` decimal(11,8),
	`full_address` text,
	`address_details` text,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	`deleted_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `admins` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(60),
	`email` varchar(255) NOT NULL,
	`mobile` varchar(20),
	`password` varchar(255),
	`email_verified_at` datetime,
	`gender` tinyint,
	`status` tinyint NOT NULL DEFAULT 1,
	`ip_address` varchar(255),
	`remember_token` varchar(100),
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	CONSTRAINT `admins_email_unique` UNIQUE(`email`)
);
--> statement-breakpoint
CREATE TABLE `allergies` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`image` varchar(255) NOT NULL,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `allergy_meals` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`meal_id` bigint(20) unsigned NOT NULL,
	`allergy_id` int(10) unsigned NOT NULL,
	`created_at` timestamp DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `unique_meal_allergy` UNIQUE(`meal_id`,`allergy_id`)
);
--> statement-breakpoint
CREATE TABLE `app_requests` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`country_id` int(11) NOT NULL,
	`city_id` int(11) NOT NULL,
	`email` varchar(255) NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `app_settings` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`name` json,
	`description` json,
	`section` varchar(255) NOT NULL,
	`key` varchar(255) NOT NULL,
	`value` varchar(255) NOT NULL,
	`extra` json,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `areas` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`city_id` bigint(20) unsigned NOT NULL,
	`status` tinyint DEFAULT 1,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	`deleted_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `branches` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`restaurant_id` bigint(20) unsigned NOT NULL,
	`name` json NOT NULL,
	`country_id` bigint(20) unsigned,
	`city_id` bigint(20) unsigned,
	`commission` double(8,2) unsigned,
	`delivery_pick_up_id` int(10) unsigned,
	`slug_name` varchar(255),
	`lat` decimal(10,8),
	`lng` decimal(11,8),
	`email` varchar(255),
	`cc_emails` text,
	`address` varchar(255),
	`phone_number` varchar(255),
	`status` tinyint NOT NULL DEFAULT 1,
	`delivery_type` varchar(255) DEFAULT 'Quiqup',
	`branch_type` varchar(255) DEFAULT 'Countd',
	`grubtech_store_id` varchar(255),
	`grubtech_menu_id` varchar(255),
	`push_modifiers` tinyint NOT NULL DEFAULT 1,
	`created_at` timestamp,
	`updated_at` timestamp,
	`deleted_at` timestamp,
	CONSTRAINT `branches_slug_name_unique` UNIQUE(`slug_name`)
);
--> statement-breakpoint
CREATE TABLE `branch_area_delivery` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`branch_id` bigint(20) unsigned NOT NULL,
	`area_id` int(10) unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `branch_delivery_slots` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`branch_id` bigint(20) unsigned NOT NULL,
	`delivery_slot_id` int(10) unsigned NOT NULL
);
--> statement-breakpoint
CREATE TABLE `canceled_subscriptions` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`order_id` bigint(20) unsigned NOT NULL,
	`payment_intent` varchar(255) NOT NULL,
	`no_of_delivered_meals` tinyint NOT NULL,
	`no_of_remaining_meals` tinyint NOT NULL,
	`cost_delivered_meals` double(8,2) NOT NULL,
	`cost_remaining_meals` double(8,2) NOT NULL,
	`total_paid` double(8,2) NOT NULL,
	`total_refund` double(8,2) NOT NULL,
	`status` tinyint NOT NULL,
	`status_text` varchar(255),
	`refund_id` varchar(255),
	`failure_reason` varchar(255),
	`cancellation_reason` text,
	`refund_response` json,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `challenge_v2_s` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`description` varchar(255) NOT NULL,
	`invite_code` varchar(255) NOT NULL,
	`image` varchar(255) NOT NULL,
	`start_date` date NOT NULL,
	`end_date` date NOT NULL,
	`reward_description` varchar(255) NOT NULL,
	`reward_image` varchar(255) NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	`challenge_type` enum('public','private') NOT NULL DEFAULT 'public',
	`challenge_status` enum('active','inactive') NOT NULL DEFAULT 'active',
	`max_participants` int(11) NOT NULL DEFAULT 100,
	`banner_image` varchar(255) NOT NULL,
	CONSTRAINT `challenge_v2_s_invite_code_unique` UNIQUE(`invite_code`)
);
--> statement-breakpoint
CREATE TABLE `challenge_v2_user_stats` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`challenge_v2_id` bigint(20) unsigned NOT NULL,
	`points` int(11) NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	`last_synced_points` int(11) unsigned NOT NULL,
	CONSTRAINT `challenge_v2_user_stats_user_id_challenge_v2_id_unique` UNIQUE(`user_id`,`challenge_v2_id`)
);
--> statement-breakpoint
CREATE TABLE `channel_models` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `cities` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`country_id` bigint(20) unsigned NOT NULL,
	`name` json NOT NULL,
	`status` tinyint DEFAULT 1
);
--> statement-breakpoint
CREATE TABLE `companies` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp,
	`deleted_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `countries` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`status` tinyint DEFAULT 0,
	`image` varchar(255),
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `coupons` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`type_from` varchar(255) NOT NULL,
	`referred_user_id` bigint(20) unsigned NOT NULL,
	`code` varchar(255) NOT NULL,
	`discount` double(8,2) NOT NULL,
	`currency` varchar(255) NOT NULL,
	`status` tinyint NOT NULL,
	`expiration_date` date NOT NULL,
	`no_of_used` tinyint NOT NULL DEFAULT 0,
	`max_usage` tinyint NOT NULL DEFAULT 1,
	`description` text NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `coupons_code_unique` UNIQUE(`code`)
);
--> statement-breakpoint
CREATE TABLE `daily_slots` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`delivery_id` int(10) unsigned NOT NULL,
	`order` int(11),
	`created_at` timestamp,
	`updated_at` timestamp,
	`deleted_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `daily_slot_diet_calories` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`diet_id` int(10) unsigned NOT NULL,
	`daily_slot_id` int(10) unsigned NOT NULL,
	`calories` int(11) NOT NULL DEFAULT 0,
	CONSTRAINT `diet_id` UNIQUE(`diet_id`,`daily_slot_id`)
);
--> statement-breakpoint
CREATE TABLE `daily_user_activity_logs` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`calories` decimal(20,2) unsigned NOT NULL DEFAULT '0.00',
	`duration` bigint(20) unsigned NOT NULL DEFAULT 0,
	`rawCount` decimal(20,2) unsigned NOT NULL DEFAULT '0.00',
	`rawUnits` varchar(255) NOT NULL,
	`date` date NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	`activity_type` enum('cycle','yoga','hiit','running','rowing','swimming','hiking','pilates','core_training','steps','other','water_intake') NOT NULL DEFAULT 'other',
	`distance` decimal(20,2) unsigned NOT NULL DEFAULT '0.00',
	CONSTRAINT `user_activity_type_date_unique` UNIQUE(`user_id`,`activity_type`,`date`)
);
--> statement-breakpoint
CREATE TABLE `deleted_users` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` int(11) NOT NULL,
	`email` varchar(255) NOT NULL,
	`phone` varchar(255) NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `deliveries` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`status` tinyint DEFAULT 1,
	`created_at` timestamp,
	`updated_at` timestamp,
	`deleted_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `delivery_address_branches` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_delivery_address_id` bigint(20) unsigned NOT NULL,
	`branch_id` bigint(20) unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `delivery_orders` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_meal_group_id` int(10) unsigned NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`daily_slot_id` bigint(20) unsigned NOT NULL,
	`is_default` tinyint NOT NULL,
	`branch_id` bigint(20) unsigned NOT NULL,
	`delivery_id` int(10) unsigned NOT NULL,
	`delivery_slot_id` int(10) unsigned NOT NULL,
	`delivery_address_id` int(10) unsigned NOT NULL,
	`delivery_address_formatted` json,
	`delivery_time_from` datetime NOT NULL,
	`delivery_time_to` datetime NOT NULL,
	`status` tinyint NOT NULL DEFAULT 0,
	`last_status_date` datetime,
	`delivery_provider` varchar(255),
	`delivery_order_id` varchar(255),
	`driver_order_status_id` int(11),
	`driver_order_status` varchar(255),
	`last_driver_status_date` datetime,
	`grubtech_order_id` varchar(255),
	`grub_response` json,
	`order_notes` text,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `delivery_orders_status_logs` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`delivery_order_id` int(10) unsigned NOT NULL,
	`status_from` varchar(255) NOT NULL,
	`status_to` varchar(255) NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `delivery_order_meals` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`delivery_order_id` bigint(20) unsigned NOT NULL,
	`meal_id` bigint(20) unsigned NOT NULL,
	`branch_commission` double(8,2) unsigned,
	`meal_selling_price` double(8,2) unsigned,
	`meal_date` date NOT NULL,
	`rate` tinyint,
	`reason` varchar(255),
	`comment` text,
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `delivery_slots` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`delivery_id` int(10) unsigned NOT NULL,
	`time_from` time NOT NULL,
	`time_to` time NOT NULL,
	`for_tomorrow` tinyint DEFAULT 0,
	`created_at` timestamp,
	`updated_at` timestamp,
	`deleted_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `diets` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`daily_calories` int(11) NOT NULL,
	`is_active` tinyint NOT NULL DEFAULT 0,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `diet_goal` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`goal_id` int(10) unsigned NOT NULL,
	`diet_id` int(10) unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `diet_plans` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`diet_type_id` int(10) unsigned NOT NULL,
	`diet_id` int(10) unsigned NOT NULL,
	`day_kcal_min` double(8,2) NOT NULL DEFAULT 0,
	`day_kcal_max` double(8,2) NOT NULL DEFAULT 0,
	`day_carb_min` double(8,2) NOT NULL DEFAULT 0,
	`day_carb_max` double(8,2) NOT NULL,
	`day_fat_min` double(8,2) NOT NULL,
	`day_fat_max` double(8,2) NOT NULL,
	`day_protein_min` double(8,2) NOT NULL DEFAULT 0,
	`day_protein_max` double(8,2) NOT NULL DEFAULT 100,
	`diet_plan_price_weekly` decimal(10,2) NOT NULL DEFAULT '0.00',
	`diet_plan_price_monthly` decimal(8,2) NOT NULL,
	`deleted_at` timestamp,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	`map_resturants` json
);
--> statement-breakpoint
CREATE TABLE `diet_plan_daily_slots` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`diet_plan_id` int(10) unsigned NOT NULL,
	`daily_slot_id` int(10) unsigned NOT NULL,
	`meal_note` json NOT NULL,
	`meal_kcal_min` double(8,2) NOT NULL DEFAULT 0,
	`meal_kcal_max` double(8,2) NOT NULL DEFAULT 100,
	`meal_carb_min` varchar(255) NOT NULL DEFAULT 0,
	`meal_carb_max` double(8,2) NOT NULL DEFAULT 100,
	`meal_fat_min` double(8,2) NOT NULL DEFAULT 0,
	`meal_fat_max` double(8,2) NOT NULL DEFAULT 100,
	`meal_protein_min` double(8,2) NOT NULL DEFAULT 0,
	`meal_protein_max` double(8,2) NOT NULL DEFAULT 100,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `diet_plan_menus` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`meal_id` bigint(20) unsigned NOT NULL,
	`restaurant_id` bigint(20) unsigned NOT NULL,
	`day` date NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `diet_plan_packages` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`image` varchar(255),
	`diet_plan_id` int(10) unsigned NOT NULL,
	`weekly_price` decimal(10,2) NOT NULL DEFAULT '0.00',
	`monthly_price` decimal(10,2) NOT NULL DEFAULT '0.00',
	`days` enum('5','6'),
	`description` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	`status` tinyint NOT NULL DEFAULT 1,
	`ramadan_package` tinyint NOT NULL DEFAULT 0,
	`color` varchar(255),
	`sort` int(10) unsigned DEFAULT 1,
	`deleted_at` timestamp,
	`is_trial` tinyint DEFAULT 0,
	`trial_days` tinyint,
	`stripe_weekly_price_id` varchar(40),
	`stripe_monthly_price_id` varchar(40),
	`stripe_product_id` varchar(40)
);
--> statement-breakpoint
CREATE TABLE `diet_plan_packages_bkp` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`image` varchar(255),
	`diet_plan_id` int(10) unsigned NOT NULL,
	`weekly_price` decimal(10,2) NOT NULL DEFAULT '0.00',
	`monthly_price` decimal(10,2) NOT NULL DEFAULT '0.00',
	`description` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	`status` tinyint NOT NULL DEFAULT 1
);
--> statement-breakpoint
CREATE TABLE `diet_plan_package_daily_slot` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`diet_plan_package_id` int(10) unsigned NOT NULL,
	`diet_plan_daily_slot_id` int(10) unsigned NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	`deleted_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `diet_plan_package_daily_slot_bkp` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`diet_plan_package_id` int(10) unsigned NOT NULL,
	`diet_plan_daily_slot_id` int(10) unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `diet_types` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`image` varchar(255),
	`subtitle` json,
	`description` json,
	`name_two` json,
	`description_two` json,
	`is_active` tinyint NOT NULL DEFAULT 0,
	`sort` int(10) unsigned NOT NULL DEFAULT 1,
	`created_at` timestamp,
	`updated_at` timestamp,
	`deleted_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `diet_type_meals` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`meal_id` bigint(20) unsigned NOT NULL,
	`diet_type_id` int(10) unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `email_queue` (
	`id` int(11) unsigned AUTO_INCREMENT NOT NULL,
	`scheduled_at` datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	`payload` json,
	`user_id` bigint(20) unsigned NOT NULL,
	`sendgrid_template_id` varchar(100) NOT NULL,
	`pending` tinyint NOT NULL DEFAULT 1
);
--> statement-breakpoint
CREATE TABLE `failed_jobs` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`uuid` varchar(255) NOT NULL,
	`connection` text NOT NULL,
	`queue` text NOT NULL,
	`payload` longtext NOT NULL,
	`exception` longtext NOT NULL,
	`failed_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	CONSTRAINT `failed_jobs_uuid_unique` UNIQUE(`uuid`)
);
--> statement-breakpoint
CREATE TABLE `faqs` (
	`id` int(11) unsigned AUTO_INCREMENT NOT NULL,
	`question` varchar(1000) NOT NULL,
	`answer` varchar(10000) NOT NULL
);
--> statement-breakpoint
CREATE TABLE `favorite_user_meals` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`meal_id` bigint(20) unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `food_notifications` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`description` json NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `goals` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`parent_id` int(10) unsigned NOT NULL DEFAULT 0,
	`deficit` double(8,2) NOT NULL DEFAULT 0,
	`created_at` timestamp,
	`updated_at` timestamp,
	`deleted_at` timestamp,
	`deficit_percentage` decimal(11,2) NOT NULL DEFAULT '0.00'
);
--> statement-breakpoint
CREATE TABLE `goal_diet_plan` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`goal_id` int(10) unsigned NOT NULL,
	`diet_plan_id` int(10) unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `invited_colleagues` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`challenge_id` bigint(20) unsigned NOT NULL,
	`email` varchar(255) NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `jobs` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`queue` varchar(255) NOT NULL,
	`payload` longtext NOT NULL,
	`attempts` tinyint NOT NULL,
	`reserved_at` int(10) unsigned,
	`available_at` int(10) unsigned NOT NULL,
	`created_at` int(10) unsigned NOT NULL
);
--> statement-breakpoint
CREATE TABLE `leaderboards` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`challenge_id` bigint(20) unsigned NOT NULL,
	`rank` int(11),
	`points` int(11),
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP
);
--> statement-breakpoint
CREATE TABLE `meals` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`restaurant_id` bigint(20) unsigned NOT NULL,
	`name` json NOT NULL,
	`image` varchar(255),
	`restaurant_meal_name` varchar(255),
	`restaurant_meal_comment` text,
	`show_meal_component` tinyint DEFAULT 0,
	`no_cutlery` tinyint DEFAULT 0,
	`description` json,
	`selling_price` decimal(10,2) NOT NULL,
	`kcal` double DEFAULT 0,
	`protein` double DEFAULT 0,
	`carbs` double DEFAULT 0,
	`fat` double DEFAULT 0,
	`status` tinyint NOT NULL DEFAULT 1,
	`is_default` tinyint,
	`flag_color` tinyint NOT NULL DEFAULT 1,
	`test_mode` tinyint DEFAULT 0,
	`grubtech_external_id` varchar(255),
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp,
	`default_days` json,
	`birds_eye_view_image` varchar(255)
);
--> statement-breakpoint
CREATE TABLE `meals_components_pivot` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`meal_id` bigint(20) unsigned NOT NULL,
	`meal_component_id` bigint(20) unsigned NOT NULL,
	`quantity` double(8,2) NOT NULL DEFAULT 1,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `meals_orders_reports_view` (
	`id` bigint(20) unsigned NOT NULL DEFAULT 0,
	`restaurant_id` bigint(20) unsigned NOT NULL,
	`meal_ar_name` longtext,
	`meal_en_name` longtext,
	`restaurant_meal_name` varchar(255),
	`restaurant_meal_comment` text,
	`total` bigint(21) NOT NULL DEFAULT 0,
	`selling_price` decimal(10,2) NOT NULL,
	`meal_date` date NOT NULL
);
--> statement-breakpoint
CREATE TABLE `meal_branch` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`meal_id` bigint(20) unsigned NOT NULL,
	`branch_id` bigint(20) unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `meal_components` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`weight_gram` decimal(10,3) NOT NULL,
	`cost_gram` decimal(10,3) NOT NULL,
	`actual_cost_gram` decimal(10,3) NOT NULL,
	`allergy_id` int(10) unsigned,
	`restaurant_id` bigint(20) unsigned NOT NULL,
	`show_in_restaurant` tinyint DEFAULT 1,
	`show_in_app` tinyint DEFAULT 1,
	`kcal` double(8,2) NOT NULL,
	`protein` double(8,2) NOT NULL DEFAULT 0,
	`carbs` double(8,2) NOT NULL DEFAULT 0,
	`fat` double(8,2) NOT NULL DEFAULT 0,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `meal_daily_slot` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`meal_id` bigint(20) unsigned NOT NULL,
	`daily_slot_id` int(10) unsigned NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP
);
--> statement-breakpoint
CREATE TABLE `meal_diet_plan` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`diet_plan_id` int(10) unsigned NOT NULL,
	`meal_id` bigint(20) unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `meal_group_status` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`status_name` json NOT NULL
);
--> statement-breakpoint
CREATE TABLE `migrations` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`migration` varchar(255) NOT NULL,
	`batch` int(11) NOT NULL
);
--> statement-breakpoint
CREATE TABLE `orders` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`diet_plan_id` bigint(20) unsigned NOT NULL,
	`diet_plan_package_id` int(10) unsigned,
	`subscription_days` int(10) unsigned NOT NULL,
	`currency` varchar(10) DEFAULT 'AED',
	`amount` double(8,2) NOT NULL,
	`discount` int(11),
	`promo_code_id` bigint(20) unsigned,
	`delivery` double(8,2) NOT NULL,
	`total_amount` double(8,2) NOT NULL,
	`payment_method` varchar(255),
	`starting_date` date,
	`expiration_date` date,
	`delivery_days` json,
	`status` tinyint DEFAULT 0,
	`tax_percentage` double(8,2) unsigned,
	`description` text,
	`canceled_subscription_id` bigint(20) unsigned,
	`invitation_code` varchar(255),
	`invitation_discount` double(8,2),
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	`bag_deposit` float NOT NULL DEFAULT 0
);
--> statement-breakpoint
CREATE TABLE `order_notifications` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`description` json NOT NULL,
	`daily_slot_id` int(10) unsigned NOT NULL,
	`order_status` tinyint,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `partners` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`image` varchar(255) NOT NULL,
	`sort` int(10) unsigned DEFAULT 1,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `password_resets` (
	`email` varchar(255) NOT NULL,
	`token` varchar(255) NOT NULL,
	`created_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `payment_transactions` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`cart_id` varchar(63) NOT NULL,
	`initial_cart_id` varchar(255),
	`related_tran_ref` varchar(255),
	`bag_deposit` float NOT NULL DEFAULT 0,
	`payment_method` varchar(255),
	`order_id` bigint(20) unsigned NOT NULL,
	`water_bottle_order` tinyint DEFAULT 0,
	`user_id` bigint(20) unsigned,
	`promo_code_id` bigint(20) unsigned,
	`store_id` int(11) NOT NULL,
	`test_mode` tinyint NOT NULL DEFAULT 0,
	`amount` double NOT NULL,
	`currency` varchar(255) NOT NULL DEFAULT 'AED',
	`description` varchar(255) NOT NULL,
	`ivp_trantype` varchar(255) NOT NULL,
	`tran_ref` varchar(255),
	`success_url` varchar(255) NOT NULL,
	`canceled_url` varchar(255) NOT NULL,
	`declined_url` varchar(255) NOT NULL,
	`billing_fname` varchar(255),
	`billing_sname` varchar(255),
	`billing_address_1` varchar(255),
	`billing_address_2` varchar(255),
	`billing_city` varchar(255),
	`billing_region` varchar(255),
	`billing_zip` varchar(255),
	`billing_country` varchar(255),
	`billing_email` varchar(255),
	`billing_phone` varchar(255),
	`lang_code` varchar(255),
	`trx_reference` varchar(255),
	`approved` tinyint,
	`response` json,
	`status` tinyint NOT NULL DEFAULT 0,
	`status_text` varchar(255),
	`repeat_amount` decimal(8,2),
	`repeat_period` enum('W','M'),
	`repeat_start` date,
	`repeat_interval` int(11) DEFAULT 1,
	`repeat_term` smallint(5) unsigned DEFAULT 0,
	`repeat_final` decimal(8,2) DEFAULT '0.00',
	`extra` json,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP'
);
--> statement-breakpoint
CREATE TABLE `promo_codes` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`code` varchar(255) NOT NULL,
	`max_usage` int(11),
	`expiration_date` date,
	`no_of_used` int(11) DEFAULT 0,
	`discount` int(11) NOT NULL,
	`discount_type` enum('Fixed','Percentage') NOT NULL,
	`commission` int(10) unsigned,
	`commission_type` enum('Fixed','Percentage'),
	`subscription_type` tinyint NOT NULL DEFAULT 3,
	`partner_name` varchar(255),
	`deleted_at` timestamp,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `UNIQUE_CODE` UNIQUE(`code`)
);
--> statement-breakpoint
CREATE TABLE `push_notification_devices` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`pn_token` varchar(500) NOT NULL,
	`device` varchar(255) NOT NULL,
	`pn_test_mode` tinyint DEFAULT 0,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `push_tokens` (
	`id` int(11) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`platform` enum('android','ios','unknown') NOT NULL DEFAULT 'unknown',
	`token` varchar(1000) NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `token` UNIQUE(`token`)
);
--> statement-breakpoint
CREATE TABLE `quiqup_delivery_zones` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`code` varchar(255) NOT NULL,
	`variant` varchar(255) NOT NULL,
	`zone_name` varchar(255) NOT NULL,
	`zone_code` varchar(255) NOT NULL,
	`geometry_coordinates` json NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `reasons` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `refer_companies` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	`company_name` varchar(255) NOT NULL,
	`work_email` varchar(255) NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP
);
--> statement-breakpoint
CREATE TABLE `replaced_meals` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`user_meal_group_id` bigint(20) unsigned NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`meal_date` date NOT NULL,
	`previous_meal_id` bigint(20) unsigned NOT NULL,
	`daily_slot_id` int(10) unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `restaurants` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`status` tinyint NOT NULL DEFAULT 1,
	`company_id` bigint(20) unsigned,
	`test_mode` tinyint DEFAULT 0,
	`image` varchar(255),
	`deleted_at` timestamp,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `restaurant_meals_reports` (
	`id` bigint(20) unsigned NOT NULL DEFAULT 0,
	`restaurant_id` bigint(20) unsigned NOT NULL,
	`total` bigint(21) NOT NULL DEFAULT 0,
	`selling_price` decimal(10,2) NOT NULL,
	`restaurant_ar_name` longtext,
	`restaurant_en_name` longtext,
	`meal_ar_name` longtext,
	`meal_en_name` longtext,
	`restaurant_meal_name` varchar(255),
	`restaurant_meal_comment` text
);
--> statement-breakpoint
CREATE TABLE `restaurant_orders_reports` (
	`id` bigint(20) unsigned NOT NULL DEFAULT 0,
	`restaurant_ar_name` longtext,
	`restaurant_en_name` longtext,
	`total_pending` bigint(21),
	`total_delivered_drivers` bigint(21),
	`total_dispatched` bigint(21),
	`total_orders` bigint(21) NOT NULL DEFAULT 0
);
--> statement-breakpoint
CREATE TABLE `rewards_redemption` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`rewards_response_pk` bigint(20),
	`rewards_redeemed` int(11),
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `sample_meals` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`diet_type_id` bigint(20) unsigned NOT NULL,
	`day_1` json,
	`day_2` json,
	`day_3` json,
	`day_4` json,
	`day_5` json,
	`created_at` timestamp,
	`updated_at` timestamp,
	`diet_plan_id` int(10) NOT NULL
);
--> statement-breakpoint
CREATE TABLE `trainers` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`name` varchar(255) NOT NULL,
	`email` varchar(100) NOT NULL,
	`mobile` varchar(20),
	`image` varchar(2000),
	`gender` enum('male','female','na') NOT NULL DEFAULT 'na',
	`active` tinyint NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	`firebase_uid` varchar(200) NOT NULL,
	`last_signed_in` timestamp NOT NULL,
	`referral_link` varchar(200) NOT NULL,
	`invitation_code` varchar(100) NOT NULL,
	CONSTRAINT `firebase_uid` UNIQUE(`firebase_uid`),
	CONSTRAINT `invitation_code` UNIQUE(`invitation_code`)
);
--> statement-breakpoint
CREATE TABLE `trainer_leads` (
	`id` int(11) unsigned AUTO_INCREMENT NOT NULL,
	`first_name` varchar(200) NOT NULL,
	`last_name` varchar(200) NOT NULL,
	`gender` enum('male','female','na') NOT NULL DEFAULT 'na',
	`mobile` varchar(9) NOT NULL,
	`status` enum('pending','signed_up','subscribed','cancelled','deleted') NOT NULL DEFAULT 'pending',
	`total_revenue` float(11,2) unsigned NOT NULL DEFAULT 0,
	`converted_user_id` bigint(20) unsigned,
	`trainer_id` bigint(20) unsigned NOT NULL,
	`sign_up_at` timestamp,
	`converted_at` timestamp,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	`deleted_at` timestamp,
	`data_sharing_consent` tinyint NOT NULL DEFAULT 0,
	CONSTRAINT `mobile` UNIQUE(`mobile`)
);
--> statement-breakpoint
CREATE TABLE `trainer_lead_earnings` (
	`id` int(11) unsigned AUTO_INCREMENT NOT NULL,
	`trainer_lead_id` int(11) unsigned NOT NULL,
	`amount` float(11,2) unsigned NOT NULL,
	`payment_intent_id` varchar(100) NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`update_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `trainer_lead_id` UNIQUE(`trainer_lead_id`,`payment_intent_id`),
	CONSTRAINT `payment_intent_id` UNIQUE(`payment_intent_id`)
);
--> statement-breakpoint
CREATE TABLE `trainer_payouts` (
	`id` int(11) unsigned AUTO_INCREMENT NOT NULL,
	`trainer_id` bigint(20) NOT NULL,
	`amount` float(10,2) NOT NULL DEFAULT 0,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	`payout_month_year` varchar(5) NOT NULL,
	CONSTRAINT `trainer_id` UNIQUE(`trainer_id`,`payout_month_year`)
);
--> statement-breakpoint
CREATE TABLE `update_transaction_logs` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`response` json NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `users` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`first_name` varchar(60),
	`last_name` varchar(60),
	`email` varchar(255),
	`mobile` varchar(20) NOT NULL,
	`uuid` varchar(255),
	`gender` tinyint,
	`image` varchar(255),
	`country_id` int(10) unsigned,
	`birthday` date,
	`height` decimal(8,2),
	`height_measure` varchar(6),
	`weight` decimal(8,2),
	`weight_measure` varchar(6),
	`weight_goal` decimal(8,2),
	`status` tinyint NOT NULL DEFAULT 1,
	`goal_id` int(10) unsigned,
	`diet_plan_id` int(10) unsigned,
	`diet_plan_package_id` int(10) unsigned,
	`ip_address` varchar(255),
	`active_exercise_id` int(10) unsigned,
	`custom_target_TDEE` smallint(5) unsigned,
	`custom_target_exercise` smallint(5) unsigned,
	`subscription_days` int(10) unsigned,
	`delivery_days` json,
	`device_type` varchar(255),
	`invitation_code` varchar(255),
	`invitation_link` varchar(255),
	`invited_by_code` varchar(255),
	`points` int(11) DEFAULT 0,
	`deleted_at` timestamp,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	`stripe_id` varchar(255),
	`card_brand` varchar(255),
	`card_last_four` varchar(4),
	`challenge_v2_id` bigint(20) unsigned,
	`hubspot_id` bigint(20) unsigned,
	`firebase_uid` varchar(50),
	CONSTRAINT `users_mobile_unique` UNIQUE(`mobile`),
	CONSTRAINT `users_invitation_code_unique` UNIQUE(`invitation_code`)
);
--> statement-breakpoint
CREATE TABLE `users_promo_codes` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`promo_code_id` bigint(20) unsigned NOT NULL,
	`order_id` bigint(20) unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `user_achievements` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`achievement_id` bigint(20) unsigned NOT NULL,
	`date` date NOT NULL DEFAULT '2023-05-25',
	`is_claimed` tinyint NOT NULL DEFAULT 0,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	CONSTRAINT `user_achievement_date_unique` UNIQUE(`user_id`,`achievement_id`,`date`)
);
--> statement-breakpoint
CREATE TABLE `user_activity_logs` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`action_by_id` bigint(20) unsigned,
	`action_by` varchar(255) NOT NULL,
	`action` text NOT NULL,
	`payload` json,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `user_allergy` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`allergy_id` int(10) unsigned NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `user_comments` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`created_by` bigint(20) unsigned NOT NULL,
	`reason_id` bigint(20) unsigned NOT NULL,
	`channel_id` bigint(20) unsigned,
	`comment` longtext NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `user_delivery_address` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`address_id` int(10) unsigned NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`delivery_id` int(10) unsigned NOT NULL,
	`delivery_slot_id` int(10) unsigned NOT NULL,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP
);
--> statement-breakpoint
CREATE TABLE `user_diet_plan_log` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`from_diet_plan_id` int(10) unsigned,
	`to_diet_plan_id` int(10) unsigned,
	`from_subscription_days` int(10) unsigned,
	`to_subscription_days` int(10) unsigned,
	`from_diet_plan_package_id` int(10) unsigned,
	`to_diet_plan_package_id` int(10) unsigned,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `user_google_tokens` (
	`id` int(11) unsigned AUTO_INCREMENT NOT NULL,
	`access_token` varchar(1000) NOT NULL,
	`refresh_token` varchar(1000) NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`expires_at` bigint(30) unsigned,
	`token_type` varchar(200),
	`id_token` varchar(200),
	`scope` varchar(1000) NOT NULL,
	CONSTRAINT `user_id` UNIQUE(`user_id`)
);
--> statement-breakpoint
CREATE TABLE `user_invitations` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`invited_by` bigint(20) unsigned NOT NULL,
	`discount` double(8,2) NOT NULL,
	`currency` varchar(255) NOT NULL,
	`invitation_code` varchar(255) NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `user_leads` (
	`id` int(11) unsigned AUTO_INCREMENT NOT NULL,
	`first_name` varchar(200) NOT NULL,
	`last_name` varchar(200) NOT NULL,
	`mobile` varchar(13) NOT NULL,
	`address` varchar(400),
	`email` varchar(200) NOT NULL,
	`city` varchar(25)
);
--> statement-breakpoint
CREATE TABLE `user_meal_groups` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`meal_date` date NOT NULL,
	`meal_id` bigint(20) unsigned,
	`daily_slot_id` int(10) unsigned NOT NULL,
	`is_default` tinyint NOT NULL DEFAULT 0,
	`delivery_id` int(10) unsigned NOT NULL,
	`delivery_slot_id` int(10) unsigned NOT NULL,
	`delivery_address_id` int(10) unsigned NOT NULL,
	`delivery_address_formatted` json,
	`delivery_time_from` datetime NOT NULL,
	`delivery_time_to` datetime NOT NULL,
	`status` tinyint NOT NULL DEFAULT 2,
	`skip_meal_added` tinyint NOT NULL DEFAULT 0,
	`daily_meal_removed` tinyint NOT NULL DEFAULT 0,
	`last_status_date` datetime NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`order_notes` text,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	`deleted_at` timestamp,
	`deleted_by_user_at` datetime,
	CONSTRAINT `unique_meal_group_identifier` UNIQUE(`user_id`,`meal_date`,`daily_slot_id`)
);
--> statement-breakpoint
CREATE TABLE `user_meal_groups_history` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`meal_date` date NOT NULL,
	`meal_id` bigint(20) unsigned,
	`daily_slot_id` int(10) unsigned NOT NULL,
	`delivery_id` int(10) unsigned NOT NULL,
	`delivery_slot_id` int(10) unsigned NOT NULL,
	`is_default` tinyint NOT NULL DEFAULT 1,
	`delivery_address_id` int(10) unsigned NOT NULL,
	`delivery_address_formatted` json,
	`delivery_time_from` datetime NOT NULL,
	`delivery_time_to` datetime NOT NULL,
	`status` tinyint NOT NULL,
	`last_status_date` datetime,
	`order_notes` text,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `user_order_coupons` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`order_id` bigint(20) unsigned NOT NULL,
	`coupon_id` bigint(20) unsigned NOT NULL,
	`status` tinyint NOT NULL,
	`water_bottle_order` tinyint DEFAULT 0,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `user_subscription` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`starting_date` date NOT NULL,
	`plan_start_date` date NOT NULL,
	`expiration_date` date NOT NULL,
	`diet_plan_price` double(8,2) NOT NULL,
	`delivery_price` double(8,2) NOT NULL,
	`tax_percentage` double(8,2),
	`total_amount` double(8,2) NOT NULL,
	`subscription_days` int(10) unsigned NOT NULL,
	`delivery_days` json,
	`diet_plan_id` int(10) unsigned,
	`diet_plan_package_id` int(10) unsigned,
	`currency` varchar(10) NOT NULL DEFAULT 'AED',
	`payment_method` varchar(255),
	`payment_token` varchar(255),
	`initial_transaction_ref` varchar(255),
	`cart_id` varchar(255),
	`last_success_payment` datetime,
	`last_success_transaction_ref` varchar(255),
	`status` int(10) unsigned NOT NULL DEFAULT 0,
	`auto_renew` tinyint NOT NULL DEFAULT 0,
	`created_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
	`updated_at` timestamp NOT NULL DEFAULT 'CURRENT_TIMESTAMP' ON UPDATE CURRENT_TIMESTAMP,
	`bag_deposit` double,
	CONSTRAINT `user_id` UNIQUE(`user_id`)
);
--> statement-breakpoint
CREATE TABLE `user_weight_logs` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`weight` decimal(8,2) NOT NULL,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `verification_requests` (
	`id` int(10) unsigned AUTO_INCREMENT NOT NULL,
	`mobile` varchar(255) NOT NULL,
	`uuid` varchar(255) NOT NULL,
	`activation_code` varchar(255),
	`activated` tinyint NOT NULL DEFAULT 0,
	`ip_address` varchar(255),
	`disabled` tinyint NOT NULL DEFAULT 0,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `water_bottle_orders` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`user_id` bigint(20) unsigned NOT NULL,
	`quantity` int(11) NOT NULL,
	`delivery_status` enum('Pending','Delivered') NOT NULL,
	`payment_status` enum('Pending','Success','Fail') NOT NULL,
	`currency` varchar(255),
	`amount` double(8,2),
	`discount` int(11),
	`promo_code_id` int(11),
	`delivery` double(8,2),
	`total_amount` double(8,2),
	`payment_method` varchar(255),
	`description` varchar(255),
	`tax_percentage` double(8,2),
	`invitation_code` varchar(255),
	`invitation_discount` double(8,2),
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE TABLE `water_notifications` (
	`id` bigint(20) unsigned AUTO_INCREMENT NOT NULL,
	`name` json NOT NULL,
	`description` json NOT NULL,
	`water_count` tinyint NOT NULL,
	`reminder_hour` tinyint NOT NULL,
	`days` json,
	`created_at` timestamp,
	`updated_at` timestamp
);
--> statement-breakpoint
CREATE INDEX `allergy_meals_meal_id_index` ON `allergy_meals` (`meal_id`);--> statement-breakpoint
CREATE INDEX `allergy_meals_allergy_id_index` ON `allergy_meals` (`allergy_id`);--> statement-breakpoint
CREATE INDEX `branches_country_id_index` ON `branches` (`country_id`);--> statement-breakpoint
CREATE INDEX `branches_city_id_index` ON `branches` (`city_id`);--> statement-breakpoint
CREATE INDEX `canceled_subscriptions_user_id_index` ON `canceled_subscriptions` (`user_id`);--> statement-breakpoint
CREATE INDEX `canceled_subscriptions_order_id_index` ON `canceled_subscriptions` (`order_id`);--> statement-breakpoint
CREATE INDEX `coupons_user_id_index` ON `coupons` (`user_id`);--> statement-breakpoint
CREATE INDEX `coupons_referred_user_id_index` ON `coupons` (`referred_user_id`);--> statement-breakpoint
CREATE INDEX `daily_slot_id` ON `daily_slot_diet_calories` (`daily_slot_id`);--> statement-breakpoint
CREATE INDEX `delivery_address_branches_user_delivery_address_id_index` ON `delivery_address_branches` (`user_delivery_address_id`);--> statement-breakpoint
CREATE INDEX `delivery_address_branches_branch_id_index` ON `delivery_address_branches` (`branch_id`);--> statement-breakpoint
CREATE INDEX `delivery_orders_user_id_index` ON `delivery_orders` (`user_id`);--> statement-breakpoint
CREATE INDEX `delivery_orders_daily_slot_id_index` ON `delivery_orders` (`daily_slot_id`);--> statement-breakpoint
CREATE INDEX `delivery_orders_branch_id_index` ON `delivery_orders` (`branch_id`);--> statement-breakpoint
CREATE INDEX `delivery_id` ON `delivery_orders` (`delivery_id`);--> statement-breakpoint
CREATE INDEX `delivery_orders_id_index` ON `delivery_orders` (`id`);--> statement-breakpoint
CREATE INDEX `delivery_orders_status_logs_delivery_order_id_index` ON `delivery_orders_status_logs` (`delivery_order_id`);--> statement-breakpoint
CREATE INDEX `delivery_order_id` ON `delivery_order_meals` (`delivery_order_id`);--> statement-breakpoint
CREATE INDEX `diet_id` ON `diet_plans` (`diet_id`);--> statement-breakpoint
CREATE INDEX `daily_slot_id` ON `diet_plan_daily_slots` (`daily_slot_id`);--> statement-breakpoint
CREATE INDEX `diet_plan_id` ON `diet_plan_daily_slots` (`diet_plan_id`);--> statement-breakpoint
CREATE INDEX `diet_plan_menus_meal_id_index` ON `diet_plan_menus` (`meal_id`);--> statement-breakpoint
CREATE INDEX `diet_plan_menus_restaurant_id_index` ON `diet_plan_menus` (`restaurant_id`);--> statement-breakpoint
CREATE INDEX `diet_plan_menus_day_index` ON `diet_plan_menus` (`day`);--> statement-breakpoint
CREATE INDEX `diet_plan_packages_diet_plan_id_index` ON `diet_plan_packages` (`diet_plan_id`);--> statement-breakpoint
CREATE INDEX `diet_plan_packages_diet_plan_id_index` ON `diet_plan_packages_bkp` (`diet_plan_id`);--> statement-breakpoint
CREATE INDEX `diet_plan_daily_slot_id` ON `diet_plan_package_daily_slot` (`diet_plan_daily_slot_id`);--> statement-breakpoint
CREATE INDEX `diet_plan_package_id` ON `diet_plan_package_daily_slot` (`diet_plan_package_id`);--> statement-breakpoint
CREATE INDEX `diet_type_meals_meal_id_index` ON `diet_type_meals` (`meal_id`);--> statement-breakpoint
CREATE INDEX `diet_type_meals_diet_type_id_index` ON `diet_type_meals` (`diet_type_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `email_queue` (`user_id`);--> statement-breakpoint
CREATE INDEX `invited_colleagues_challenge_id_index` ON `invited_colleagues` (`challenge_id`);--> statement-breakpoint
CREATE INDEX `jobs_queue_index` ON `jobs` (`queue`);--> statement-breakpoint
CREATE INDEX `challenge_id` ON `leaderboards` (`challenge_id`);--> statement-breakpoint
CREATE INDEX `meal_id` ON `meal_daily_slot` (`meal_id`);--> statement-breakpoint
CREATE INDEX `daily_slot_id` ON `meal_daily_slot` (`daily_slot_id`);--> statement-breakpoint
CREATE INDEX `orders_user_id_index` ON `orders` (`user_id`);--> statement-breakpoint
CREATE INDEX `orders_diet_plan_id_index` ON `orders` (`diet_plan_id`);--> statement-breakpoint
CREATE INDEX `orders_promo_code_id_index` ON `orders` (`promo_code_id`);--> statement-breakpoint
CREATE INDEX `orders_invitation_code_index` ON `orders` (`invitation_code`);--> statement-breakpoint
CREATE INDEX `orders_canceled_subscription_id_index` ON `orders` (`canceled_subscription_id`);--> statement-breakpoint
CREATE INDEX `order_notifications_daily_slot_id_index` ON `order_notifications` (`daily_slot_id`);--> statement-breakpoint
CREATE INDEX `password_resets_email_index` ON `password_resets` (`email`);--> statement-breakpoint
CREATE INDEX `payment_transactions_user_id_index` ON `payment_transactions` (`user_id`);--> statement-breakpoint
CREATE INDEX `user_id` ON `push_tokens` (`user_id`);--> statement-breakpoint
CREATE INDEX `quiqup_delivery_zones_code_index` ON `quiqup_delivery_zones` (`code`);--> statement-breakpoint
CREATE INDEX `quiqup_delivery_zones_variant_index` ON `quiqup_delivery_zones` (`variant`);--> statement-breakpoint
CREATE INDEX `replaced_meals_user_id_meal_date_index` ON `replaced_meals` (`user_id`,`meal_date`);--> statement-breakpoint
CREATE INDEX `converted_user_id` ON `trainer_leads` (`converted_user_id`);--> statement-breakpoint
CREATE INDEX `trainer_id` ON `trainer_leads` (`trainer_id`);--> statement-breakpoint
CREATE INDEX `users_stripe_id_index` ON `users` (`stripe_id`);--> statement-breakpoint
CREATE INDEX `users_invited_by_code_index` ON `users` (`invited_by_code`);--> statement-breakpoint
CREATE INDEX `user_comments_user_id_index` ON `user_comments` (`user_id`);--> statement-breakpoint
CREATE INDEX `user_comments_created_by_index` ON `user_comments` (`created_by`);--> statement-breakpoint
CREATE INDEX `user_comments_reason_id_index` ON `user_comments` (`reason_id`);--> statement-breakpoint
CREATE INDEX `user_comments_channel_id_index` ON `user_comments` (`channel_id`);--> statement-breakpoint
CREATE INDEX `user_invitations_user_id_index` ON `user_invitations` (`user_id`);--> statement-breakpoint
CREATE INDEX `user_invitations_invited_by_index` ON `user_invitations` (`invited_by`);--> statement-breakpoint
CREATE INDEX `user_meal_groups_user_id_meal_date_index` ON `user_meal_groups` (`user_id`,`meal_date`);--> statement-breakpoint
CREATE INDEX `user_meal_groups_meal_id_foreign` ON `user_meal_groups` (`meal_id`);--> statement-breakpoint
CREATE INDEX `user_meal_groups_daily_slot_id_foreign` ON `user_meal_groups` (`daily_slot_id`);--> statement-breakpoint
CREATE INDEX `delivery_id` ON `user_meal_groups` (`delivery_id`);--> statement-breakpoint
CREATE INDEX `delivery_slot_id` ON `user_meal_groups` (`delivery_slot_id`);--> statement-breakpoint
CREATE INDEX `user_meal_groups_history_user_id_meal_date_index` ON `user_meal_groups_history` (`user_id`,`meal_date`);--> statement-breakpoint
CREATE INDEX `user_meal_groups_history_meal_id_foreign` ON `user_meal_groups_history` (`meal_id`);--> statement-breakpoint
CREATE INDEX `user_order_coupons_user_id_index` ON `user_order_coupons` (`user_id`);--> statement-breakpoint
CREATE INDEX `user_order_coupons_order_id_index` ON `user_order_coupons` (`order_id`);--> statement-breakpoint
CREATE INDEX `user_order_coupons_coupon_id_index` ON `user_order_coupons` (`coupon_id`);--> statement-breakpoint
CREATE INDEX `user_subscription_user_id_index` ON `user_subscription` (`user_id`);--> statement-breakpoint
CREATE INDEX `diet_plan_package_id` ON `user_subscription` (`diet_plan_package_id`);--> statement-breakpoint
CREATE INDEX `diet_plan_id` ON `user_subscription` (`diet_plan_id`);--> statement-breakpoint
CREATE INDEX `user_weight_logs_user_id_index` ON `user_weight_logs` (`user_id`);--> statement-breakpoint
ALTER TABLE `addresses` ADD CONSTRAINT `addresses_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `addresses` ADD CONSTRAINT `addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `areas` ADD CONSTRAINT `areas_city_id_foreign` FOREIGN KEY (`city_id`) REFERENCES `cities`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `branches` ADD CONSTRAINT `branches_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `branch_area_delivery` ADD CONSTRAINT `branch_area_delivery_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `branch_area_delivery` ADD CONSTRAINT `branch_area_delivery_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `challenge_v2_user_stats` ADD CONSTRAINT `challenge_v2_user_stats_challenge_v2_id_foreign` FOREIGN KEY (`challenge_v2_id`) REFERENCES `challenge_v2_s`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `challenge_v2_user_stats` ADD CONSTRAINT `challenge_v2_user_stats_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `daily_slot_diet_calories` ADD CONSTRAINT `daily_slot_diet_calories_ibfk_1` FOREIGN KEY (`diet_id`) REFERENCES `diets`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `daily_slot_diet_calories` ADD CONSTRAINT `daily_slot_diet_calories_ibfk_2` FOREIGN KEY (`daily_slot_id`) REFERENCES `daily_slots`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `daily_user_activity_logs` ADD CONSTRAINT `daily_user_activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `delivery_orders` ADD CONSTRAINT `delivery_orders_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `delivery_orders` ADD CONSTRAINT `delivery_orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `delivery_order_meals` ADD CONSTRAINT `delivery_order_meals_delivery_order_id_foreign` FOREIGN KEY (`delivery_order_id`) REFERENCES `delivery_orders`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `delivery_slots` ADD CONSTRAINT `delivery_slots_delivery_id_foreign` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `diet_goal` ADD CONSTRAINT `diet_goal_diet_id_foreign` FOREIGN KEY (`diet_id`) REFERENCES `diets`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `diet_goal` ADD CONSTRAINT `diet_goal_goal_id_foreign` FOREIGN KEY (`goal_id`) REFERENCES `goals`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `diet_plans` ADD CONSTRAINT `diet_plans_diet_type_id_foreign` FOREIGN KEY (`diet_type_id`) REFERENCES `diet_types`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `diet_plans` ADD CONSTRAINT `diet_plans_ibfk_1` FOREIGN KEY (`diet_id`) REFERENCES `diets`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `diet_plan_daily_slots` ADD CONSTRAINT `diet_plan_daily_slots_ibfk_1` FOREIGN KEY (`daily_slot_id`) REFERENCES `daily_slots`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `diet_plan_daily_slots` ADD CONSTRAINT `diet_plan_daily_slots_ibfk_2` FOREIGN KEY (`diet_plan_id`) REFERENCES `diet_plans`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `diet_plan_menus` ADD CONSTRAINT `diet_plan_menus_ibfk_1` FOREIGN KEY (`meal_id`) REFERENCES `meals`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `diet_plan_packages` ADD CONSTRAINT `diet_plan_packages_ibfk_1` FOREIGN KEY (`diet_plan_id`) REFERENCES `diet_plans`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `diet_plan_package_daily_slot` ADD CONSTRAINT `diet_plan_package_daily_slot_ibfk_1` FOREIGN KEY (`diet_plan_daily_slot_id`) REFERENCES `diet_plan_daily_slots`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `diet_plan_package_daily_slot` ADD CONSTRAINT `diet_plan_package_daily_slot_ibfk_2` FOREIGN KEY (`diet_plan_package_id`) REFERENCES `diet_plan_packages`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `email_queue` ADD CONSTRAINT `email_queue_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `leaderboards` ADD CONSTRAINT `leaderboards_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenge_v2_s`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `leaderboards` ADD CONSTRAINT `leaderboards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `meals_components_pivot` ADD CONSTRAINT `meals_components_pivot_meal_component_id_foreign` FOREIGN KEY (`meal_component_id`) REFERENCES `meal_components`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `meals_components_pivot` ADD CONSTRAINT `meals_components_pivot_meal_id_foreign` FOREIGN KEY (`meal_id`) REFERENCES `meals`(`id`) ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `meal_branch` ADD CONSTRAINT `meal_branch_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `meal_branch` ADD CONSTRAINT `meal_branch_meal_id_foreign` FOREIGN KEY (`meal_id`) REFERENCES `meals`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `meal_components` ADD CONSTRAINT `meal_components_allergy_id_foreign` FOREIGN KEY (`allergy_id`) REFERENCES `allergies`(`id`) ON DELETE set null ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `meal_daily_slot` ADD CONSTRAINT `meal_daily_slot_ibfk_1` FOREIGN KEY (`meal_id`) REFERENCES `meals`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `meal_daily_slot` ADD CONSTRAINT `meal_daily_slot_ibfk_2` FOREIGN KEY (`daily_slot_id`) REFERENCES `daily_slots`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `meal_diet_plan` ADD CONSTRAINT `meal_diet_plan_diet_plan_id_foreign` FOREIGN KEY (`diet_plan_id`) REFERENCES `diet_plans`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `meal_diet_plan` ADD CONSTRAINT `meal_diet_plan_meal_id_foreign` FOREIGN KEY (`meal_id`) REFERENCES `meals`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `push_notification_devices` ADD CONSTRAINT `push_notification_devices_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `push_tokens` ADD CONSTRAINT `push_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `restaurants` ADD CONSTRAINT `restaurants_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies`(`id`) ON DELETE set null ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `trainer_leads` ADD CONSTRAINT `trainer_leads_ibfk_1` FOREIGN KEY (`converted_user_id`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `trainer_leads` ADD CONSTRAINT `trainer_leads_ibfk_2` FOREIGN KEY (`trainer_id`) REFERENCES `trainers`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `trainer_lead_earnings` ADD CONSTRAINT `trainer_lead_earnings_ibfk_1` FOREIGN KEY (`trainer_lead_id`) REFERENCES `trainer_leads`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `users` ADD CONSTRAINT `users_active_exercise_id_foreign` FOREIGN KEY (`active_exercise_id`) REFERENCES `active_exercise`(`id`) ON DELETE set null ON UPDATE set null;--> statement-breakpoint
ALTER TABLE `users` ADD CONSTRAINT `users_challenge_v2_id_foreign` FOREIGN KEY (`challenge_v2_id`) REFERENCES `challenge_v2_s`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `users` ADD CONSTRAINT `users_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `users` ADD CONSTRAINT `users_diet_plan_id_foreign` FOREIGN KEY (`diet_plan_id`) REFERENCES `diet_plans`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `users` ADD CONSTRAINT `users_diet_plan_package_id_foreign` FOREIGN KEY (`diet_plan_package_id`) REFERENCES `diet_plan_packages`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `users` ADD CONSTRAINT `users_goal_id_foreign` FOREIGN KEY (`goal_id`) REFERENCES `goals`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `user_achievements` ADD CONSTRAINT `user_achievements_achievement_id_foreign` FOREIGN KEY (`achievement_id`) REFERENCES `achievements`(`id`) ON DELETE cascade ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `user_achievements` ADD CONSTRAINT `user_achievements_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `user_allergy` ADD CONSTRAINT `user_allergy_allergy_id_foreign` FOREIGN KEY (`allergy_id`) REFERENCES `allergies`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_allergy` ADD CONSTRAINT `user_allergy_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_delivery_address` ADD CONSTRAINT `user_delivery_address_delivery_id_foreign` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_delivery_address` ADD CONSTRAINT `user_delivery_address_delivery_slot_id_foreign` FOREIGN KEY (`delivery_slot_id`) REFERENCES `delivery_slots`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` ADD CONSTRAINT `user_diet_plan_log_from_diet_plan_id_foreign` FOREIGN KEY (`from_diet_plan_id`) REFERENCES `diet_plans`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` ADD CONSTRAINT `user_diet_plan_log_to_diet_plan_id_foreign` FOREIGN KEY (`to_diet_plan_id`) REFERENCES `diet_plans`(`id`) ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE `user_diet_plan_log` ADD CONSTRAINT `user_diet_plan_log_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_google_tokens` ADD CONSTRAINT `user_google_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_meal_groups` ADD CONSTRAINT `user_meal_groups_daily_slot_id_fk` FOREIGN KEY (`daily_slot_id`) REFERENCES `daily_slots`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_meal_groups` ADD CONSTRAINT `user_meal_groups_delivery_address_id_foreign` FOREIGN KEY (`delivery_address_id`) REFERENCES `addresses`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_meal_groups` ADD CONSTRAINT `user_meal_groups_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `deliveries`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `user_meal_groups` ADD CONSTRAINT `user_meal_groups_ibfk_2` FOREIGN KEY (`delivery_slot_id`) REFERENCES `delivery_slots`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `user_meal_groups` ADD CONSTRAINT `user_meal_groups_meal_id_fk` FOREIGN KEY (`meal_id`) REFERENCES `meals`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_meal_groups` ADD CONSTRAINT `user_meal_groups_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE cascade ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_meal_groups_history` ADD CONSTRAINT `user_meal_groups_history_daily_slot_id_foreign` FOREIGN KEY (`daily_slot_id`) REFERENCES `daily_slots`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_meal_groups_history` ADD CONSTRAINT `user_meal_groups_history_delivery_address_id_foreign` FOREIGN KEY (`delivery_address_id`) REFERENCES `addresses`(`id`) ON DELETE restrict ON UPDATE cascade;--> statement-breakpoint
ALTER TABLE `user_subscription` ADD CONSTRAINT `user_subscription_ibfk_1` FOREIGN KEY (`diet_plan_package_id`) REFERENCES `diet_plan_packages`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `user_subscription` ADD CONSTRAINT `user_subscription_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE restrict ON UPDATE restrict;--> statement-breakpoint
ALTER TABLE `user_subscription` ADD CONSTRAINT `user_subscription_ibfk_3` FOREIGN KEY (`diet_plan_id`) REFERENCES `diet_plans`(`id`) ON DELETE restrict ON UPDATE restrict;
*/