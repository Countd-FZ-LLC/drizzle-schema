import { relations } from 'drizzle-orm';
import {
  mysqlTable,
  varchar,
  mysqlEnum,
  int,
  decimal,
  tinyint,
  timestamp,
  json,
  text,
  unique,
  datetime,
  index,
  date,
  time,
  longtext,
  double,
  float,
  smallint,
  bigint,
  customType,
  boolean,
} from 'drizzle-orm/mysql-core';

export const translatedString = customType<{
  data: string;
  driverData: { en: string; ar: string };
}>({
  dataType() {
    return 'json';
  },
  fromDriver(value) {
    return value.en;
  },
});

export const imagePath = customType<{ data: string; driverData: string }>({
  dataType() {
    return 'string';
  },
  fromDriver(value) {
    return ['https://countd-dev2.s3.us-east-2.amazonaws.com', value].join('/');
  },
});

export const achievements = mysqlTable('achievements', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  name: varchar('name', { length: 255 }).notNull(),
  icon: varchar('icon', { length: 255 }).notNull(),
  description: varchar('description', { length: 255 }).notNull(),
  activityType: mysqlEnum('activity_type', [
    'cycle',
    'yoga',
    'hiit',
    'running',
    'rowing',
    'swimming',
    'hiking',
    'pilates',
    'core_training',
    'steps',
    'meal_count',
    'perfect_month',
    'other',
    'water_intake',
  ])
    .default('other')
    .notNull(),
  frequency: mysqlEnum('frequency', ['daily', 'weekly', 'monthly'])
    .default('daily')
    .notNull(),
  rewardPoints: int('reward_points').default(0).notNull(),
  goal: decimal('goal', { precision: 20, scale: 2 }).default('0.00').notNull(),
  isActive: boolean('is_active').default(true),
  createdAt: timestamp('created_at', { mode: 'string' })
    .default('CURRENT_TIMESTAMP')
    .notNull(),
  updatedAt: timestamp('updated_at', { mode: 'string' })
    .default('CURRENT_TIMESTAMP')
    .onUpdateNow()
    .notNull(),
});

export const activeExercise = mysqlTable('active_exercise', {
  id: int('id').autoincrement().notNull(),
  name: translatedString('name').notNull(),
  description: translatedString('description').notNull(),
  activityLevelRate: double('activity_level_rate', {
    precision: 8,
    scale: 2,
  }).notNull(),
  createdAt: timestamp('created_at', { mode: 'string' })
    .default('CURRENT_TIMESTAMP')
    .notNull(),
  updatedAt: timestamp('updated_at', { mode: 'string' })
    .default('CURRENT_TIMESTAMP')
    .onUpdateNow()
    .notNull(),
  active: boolean('active').default(true),
});

export const addresses = mysqlTable('addresses', {
  id: int('id').autoincrement().notNull(),
  userId: bigint('user_id', { mode: 'number' })
    .notNull()
    .references(() => users.id, { onDelete: 'cascade', onUpdate: 'cascade' }),
  areaId: int('area_id')
    .notNull()
    .references(() => areas.id, { onDelete: 'cascade', onUpdate: 'cascade' }),
  addressType: varchar('address_type', { length: 255 }).notNull(),
  addressName: varchar('address_name', { length: 255 }),
  block: varchar('block', { length: 255 }),
  street: varchar('street', { length: 255 }),
  building: varchar('building', { length: 255 }),
  floor: varchar('floor', { length: 255 }),
  apartmentNumber: varchar('apartment_number', { length: 255 }),
  additionalDirections: varchar('additional_directions', { length: 255 }),
  lat: decimal('lat', { precision: 10, scale: 8 }),
  lng: decimal('lng', { precision: 11, scale: 8 }),
  fullAddress: text('full_address'),
  addressDetails: text('address_details'),
  createdAt: timestamp('created_at', { mode: 'string' })
    .default('CURRENT_TIMESTAMP')
    .notNull(),
  updatedAt: timestamp('updated_at', { mode: 'string' })
    .default('CURRENT_TIMESTAMP')
    .onUpdateNow()
    .notNull(),
  deletedAt: timestamp('deleted_at', { mode: 'string' }),
});

export const admins = mysqlTable(
  'admins',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    name: varchar('name', { length: 60 }),
    email: varchar('email', { length: 255 }).notNull(),
    mobile: varchar('mobile', { length: 20 }),
    password: varchar('password', { length: 255 }),
    emailVerifiedAt: datetime('email_verified_at', { mode: 'string' }),
    gender: tinyint('gender'),
    status: boolean('status').default(true),
    ipAddress: varchar('ip_address', { length: 255 }),
    rememberToken: varchar('remember_token', { length: 100 }),
    deletedAt: timestamp('deleted_at', { mode: 'string' }),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      adminsEmailUnique: unique('admins_email_unique').on(table.email),
    };
  },
);

export const allergies = mysqlTable('allergies', {
  id: int('id').autoincrement().notNull(),
  name: translatedString('name').notNull(),
  image: varchar('image', { length: 255 }).notNull(),
  deletedAt: timestamp('deleted_at', { mode: 'string' }),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const allergyMeals = mysqlTable(
  'allergy_meals',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    mealId: bigint('meal_id', { mode: 'number' }).notNull(),
    allergyId: int('allergy_id').notNull(),
    createdAt: timestamp('created_at', { mode: 'string' }).default(
      'CURRENT_TIMESTAMP',
    ),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow(),
  },
  (table) => {
    return {
      mealIdIdx: index('allergy_meals_meal_id_index').on(table.mealId),
      allergyIdIdx: index('allergy_meals_allergy_id_index').on(table.allergyId),
      uniqueMealAllergy: unique('unique_meal_allergy').on(
        table.mealId,
        table.allergyId,
      ),
    };
  },
);

export const appRequests = mysqlTable('app_requests', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  countryId: int('country_id').notNull(),
  cityId: int('city_id').notNull(),
  email: varchar('email', { length: 255 }).notNull(),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const appSettings = mysqlTable('app_settings', {
  id: int('id').autoincrement().notNull(),
  name: translatedString('name'),
  description: translatedString('description'),
  section: varchar('section', { length: 255 }).notNull(),
  key: varchar('key', { length: 255 }).notNull(),
  value: varchar('value', { length: 255 }).notNull(),
  extra: json('extra'),
  deletedAt: timestamp('deleted_at', { mode: 'string' }),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const areas = mysqlTable('areas', {
  id: int('id').autoincrement().notNull(),
  name: translatedString('name').notNull(),
  cityId: bigint('city_id', { mode: 'number' })
    .notNull()
    .references(() => cities.id, { onDelete: 'cascade', onUpdate: 'cascade' }),
  status: tinyint('status').default(1),
  createdAt: timestamp('created_at', { mode: 'string' })
    .default('CURRENT_TIMESTAMP')
    .notNull(),
  updatedAt: timestamp('updated_at', { mode: 'string' })
    .default('CURRENT_TIMESTAMP')
    .onUpdateNow()
    .notNull(),
  deletedAt: timestamp('deleted_at', { mode: 'string' }),
});

export const branches = mysqlTable(
  'branches',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    restaurantId: bigint('restaurant_id', { mode: 'number' })
      .notNull()
      .references(() => restaurants.id, {
        onDelete: 'cascade',
        onUpdate: 'cascade',
      }),
    name: translatedString('name').notNull(),
    countryId: bigint('country_id', { mode: 'number' }),
    cityId: bigint('city_id', { mode: 'number' }),
    commission: double('commission', { precision: 8, scale: 2 }),
    deliveryPickUpId: int('delivery_pick_up_id'),
    slugName: varchar('slug_name', { length: 255 }),
    lat: decimal('lat', { precision: 10, scale: 8 }),
    lng: decimal('lng', { precision: 11, scale: 8 }),
    email: varchar('email', { length: 255 }),
    ccEmails: text('cc_emails'),
    address: varchar('address', { length: 255 }),
    phoneNumber: varchar('phone_number', { length: 255 }),
    status: boolean('status').default(true),
    deliveryType: varchar('delivery_type', { length: 255 }).default('Quiqup'),
    branchType: varchar('branch_type', { length: 255 }).default('Countd'),
    grubtechStoreId: varchar('grubtech_store_id', { length: 255 }),
    grubtechMenuId: varchar('grubtech_menu_id', { length: 255 }),
    pushModifiers: boolean('push_modifiers').default(true),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
    deletedAt: timestamp('deleted_at', { mode: 'string' }),
  },
  (table) => {
    return {
      countryIdIdx: index('branches_country_id_index').on(table.countryId),
      cityIdIdx: index('branches_city_id_index').on(table.cityId),
      branchesSlugNameUnique: unique('branches_slug_name_unique').on(
        table.slugName,
      ),
    };
  },
);

export const branchAreaDelivery = mysqlTable('branch_area_delivery', {
  id: int('id').autoincrement().notNull(),
  branchId: bigint('branch_id', { mode: 'number' })
    .notNull()
    .references(() => branches.id, {
      onDelete: 'cascade',
      onUpdate: 'cascade',
    }),
  areaId: int('area_id')
    .notNull()
    .references(() => areas.id, { onDelete: 'cascade', onUpdate: 'cascade' }),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const branchDeliverySlots = mysqlTable('branch_delivery_slots', {
  id: int('id').autoincrement().notNull(),
  branchId: bigint('branch_id', { mode: 'number' }).notNull(),
  deliverySlotId: int('delivery_slot_id').notNull(),
});

export const canceledSubscriptions = mysqlTable(
  'canceled_subscriptions',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number' }).notNull(),
    orderId: bigint('order_id', { mode: 'number' }).notNull(),
    paymentIntent: varchar('payment_intent', { length: 255 }).notNull(),
    noOfDeliveredMeals: tinyint('no_of_delivered_meals').notNull(),
    noOfRemainingMeals: tinyint('no_of_remaining_meals').notNull(),
    costDeliveredMeals: double('cost_delivered_meals', {
      precision: 8,
      scale: 2,
    }).notNull(),
    costRemainingMeals: double('cost_remaining_meals', {
      precision: 8,
      scale: 2,
    }).notNull(),
    totalPaid: double('total_paid', { precision: 8, scale: 2 }).notNull(),
    totalRefund: double('total_refund', { precision: 8, scale: 2 }).notNull(),
    status: tinyint('status').notNull(),
    statusText: varchar('status_text', { length: 255 }),
    refundId: varchar('refund_id', { length: 255 }),
    failureReason: varchar('failure_reason', { length: 255 }),
    cancellationReason: text('cancellation_reason'),
    refundResponse: json('refund_response'),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      userIdIdx: index('canceled_subscriptions_user_id_index').on(table.userId),
      orderIdIdx: index('canceled_subscriptions_order_id_index').on(
        table.orderId,
      ),
    };
  },
);

export const challengeV2S = mysqlTable(
  'challenge_v2_s',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    name: varchar('name', { length: 255 }).notNull(),
    description: varchar('description', { length: 255 }).notNull(),
    inviteCode: varchar('invite_code', { length: 255 }).notNull(),
    image: varchar('image', { length: 255 }).notNull(),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    startDate: date('start_date', { mode: 'string' }).notNull(),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    endDate: date('end_date', { mode: 'string' }).notNull(),
    rewardDescription: varchar('reward_description', { length: 255 }).notNull(),
    rewardImage: varchar('reward_image', { length: 255 }).notNull(),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
    challengeType: mysqlEnum('challenge_type', ['public', 'private'])
      .default('public')
      .notNull(),
    challengeStatus: mysqlEnum('challenge_status', ['active', 'inactive'])
      .default('active')
      .notNull(),
    maxParticipants: int('max_participants').default(100).notNull(),
    bannerImage: varchar('banner_image', { length: 255 }).notNull(),
  },
  (table) => {
    return {
      challengeV2SInviteCodeUnique: unique(
        'challenge_v2_s_invite_code_unique',
      ).on(table.inviteCode),
    };
  },
);

export const challengeV2UserStats = mysqlTable(
  'challenge_v2_user_stats',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number' })
      .notNull()
      .references(() => users.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    challengeV2Id: bigint('challenge_v2_id', { mode: 'number' })
      .notNull()
      .references(() => challengeV2S.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    points: int('points').notNull(),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
    lastSyncedPoints: int('last_synced_points').notNull(),
  },
  (table) => {
    return {
      challengeV2UserStatsUserIdChallengeV2IdUnique: unique(
        'challenge_v2_user_stats_user_id_challenge_v2_id_unique',
      ).on(table.userId, table.challengeV2Id),
    };
  },
);

export const channelModels = mysqlTable('channel_models', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  name: varchar('name', { length: 255 }).notNull(),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const cities = mysqlTable('cities', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  countryId: bigint('country_id', { mode: 'number' }).notNull(),
  name: translatedString('name').notNull(),
  status: tinyint('status').default(1),
});

export const companies = mysqlTable('companies', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  name: translatedString('name').notNull(),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
  deletedAt: timestamp('deleted_at', { mode: 'string' }),
});

export const countries = mysqlTable('countries', {
  id: int('id').autoincrement().notNull(),
  name: translatedString('name').notNull(),
  status: tinyint('status').default(0),
  image: varchar('image', { length: 255 }),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const coupons = mysqlTable(
  'coupons',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number' }).notNull(),
    typeFrom: varchar('type_from', { length: 255 }).notNull(),
    referredUserId: bigint('referred_user_id', { mode: 'number' }).notNull(),
    code: varchar('code', { length: 255 }).notNull(),
    discount: double('discount', { precision: 8, scale: 2 }).notNull(),
    currency: varchar('currency', { length: 255 }).notNull(),
    status: tinyint('status').notNull(),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    expirationDate: date('expiration_date', { mode: 'string' }).notNull(),
    noOfUsed: boolean('no_of_used').default(false),
    maxUsage: boolean('max_usage').default(true),
    description: text('description').notNull(),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
  },
  (table) => {
    return {
      userIdIdx: index('coupons_user_id_index').on(table.userId),
      referredUserIdIdx: index('coupons_referred_user_id_index').on(
        table.referredUserId,
      ),
      couponsCodeUnique: unique('coupons_code_unique').on(table.code),
    };
  },
);

export const dailySlots = mysqlTable('daily_slots', {
  id: int('id').autoincrement().notNull(),
  name: translatedString('name').notNull(),
  deliveryId: int('delivery_id').notNull(),
  order: int('order'),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
  deletedAt: timestamp('deleted_at', { mode: 'string' }),
});

export const dailySlotDietCalories = mysqlTable(
  'daily_slot_diet_calories',
  {
    id: int('id').autoincrement().notNull(),
    dietId: int('diet_id')
      .notNull()
      .references(() => diets.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    dailySlotId: int('daily_slot_id')
      .notNull()
      .references(() => dailySlots.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    calories: int('calories').default(0).notNull(),
  },
  (table) => {
    return {
      dailySlotId: index('daily_slot_id').on(table.dailySlotId),
      dietId: unique('diet_id').on(table.dietId, table.dailySlotId),
    };
  },
);

export const dailyUserActivityLogs = mysqlTable(
  'daily_user_activity_logs',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number' })
      .notNull()
      .references(() => users.id, {
        onDelete: 'cascade',
        onUpdate: 'restrict',
      }),
    calories: decimal('calories', { precision: 20, scale: 2 })
      .default('0.00')
      .notNull(),
    duration: bigint('duration', { mode: 'number' }).notNull(),
    rawCount: decimal('rawCount', { precision: 20, scale: 2 })
      .default('0.00')
      .notNull(),
    rawUnits: varchar('rawUnits', { length: 255 }).notNull(),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    date: date('date', { mode: 'string' }).notNull(),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
    activityType: mysqlEnum('activity_type', [
      'cycle',
      'yoga',
      'hiit',
      'running',
      'rowing',
      'swimming',
      'hiking',
      'pilates',
      'core_training',
      'steps',
      'other',
      'water_intake',
    ])
      .default('other')
      .notNull(),
    distance: decimal('distance', { precision: 20, scale: 2 })
      .default('0.00')
      .notNull(),
  },
  (table) => {
    return {
      userActivityTypeDateUnique: unique('user_activity_type_date_unique').on(
        table.userId,
        table.activityType,
        table.date,
      ),
    };
  },
);

export const dailyUserActivityLogsRelations = relations(
  dailyUserActivityLogs,
  ({ one }) => ({
    user: one(users, {
      fields: [dailyUserActivityLogs.userId],
      references: [users.id],
    }),
  }),
);

export const deletedUsers = mysqlTable('deleted_users', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  userId: int('user_id').notNull(),
  email: varchar('email', { length: 255 }).notNull(),
  phone: varchar('phone', { length: 255 }).notNull(),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const deliveries = mysqlTable('deliveries', {
  id: int('id').autoincrement().notNull(),
  name: translatedString('name').notNull(),
  status: tinyint('status').default(1),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
  deletedAt: timestamp('deleted_at', { mode: 'string' }),
});

export const deliveriesRelations = relations(deliveries, ({ many }) => ({
  deliveryOrders: many(deliveryOrders),
}));

export const deliveryAddressBranches = mysqlTable(
  'delivery_address_branches',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    userDeliveryAddressId: bigint('user_delivery_address_id', {
      mode: 'number',
    }).notNull(),
    branchId: bigint('branch_id', { mode: 'number' }).notNull(),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      userDeliveryAddressIdIdx: index(
        'delivery_address_branches_user_delivery_address_id_index',
      ).on(table.userDeliveryAddressId),
      branchIdIdx: index('delivery_address_branches_branch_id_index').on(
        table.branchId,
      ),
    };
  },
);

export const deliveryOrders = mysqlTable(
  'delivery_orders',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    userMealGroupId: int('user_meal_group_id').notNull(),
    userId: bigint('user_id', { mode: 'number' })
      .notNull()
      .references(() => users.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    dailySlotId: bigint('daily_slot_id', { mode: 'number' }).notNull(),
    isDefault: tinyint('is_default').notNull(),
    branchId: bigint('branch_id', { mode: 'number' }).notNull(),
    deliveryId: int('delivery_id')
      .notNull()
      .references(() => deliveries.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    deliverySlotId: int('delivery_slot_id').notNull(),
    deliveryAddressId: int('delivery_address_id').notNull(),
    deliveryAddressFormatted: json('delivery_address_formatted'),
    deliveryTimeFrom: datetime('delivery_time_from', {
      mode: 'string',
    }).notNull(),
    deliveryTimeTo: datetime('delivery_time_to', { mode: 'string' }).notNull(),
    status: boolean('status').default(false),
    lastStatusDate: datetime('last_status_date', { mode: 'string' }),
    deliveryProvider: varchar('delivery_provider', { length: 255 }),
    deliveryOrderId: varchar('delivery_order_id', { length: 255 }),
    driverOrderStatusId: int('driver_order_status_id'),
    driverOrderStatus: varchar('driver_order_status', { length: 255 }),
    lastDriverStatusDate: datetime('last_driver_status_date', {
      mode: 'string',
    }),
    grubtechOrderId: varchar('grubtech_order_id', { length: 255 }),
    grubResponse: json('grub_response'),
    orderNotes: text('order_notes'),
    deletedAt: timestamp('deleted_at', { mode: 'string' }),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      userIdIdx: index('delivery_orders_user_id_index').on(table.userId),
      dailySlotIdIdx: index('delivery_orders_id_index').on(table.dailySlotId),
      branchIdIdx: index('delivery_orders_branch_id_index').on(table.branchId),
      deliveryId: index('delivery_id').on(table.deliveryId),
      idIdx: index('PRIMARY').on(table.id),
    };
  },
);

export const deliveryOrderRelations = relations(
  deliveryOrders,
  ({ one, many }) => ({
    user: one(users, {
      fields: [deliveryOrders.userId],
      references: [users.id],
    }),
    dailySlot: one(dailySlots, {
      fields: [deliveryOrders.dailySlotId],
      references: [dailySlots.id],
    }),
    branch: one(branches, {
      fields: [deliveryOrders.branchId],
      references: [branches.id],
    }),
    delivery: one(deliveries, {
      fields: [deliveryOrders.deliveryId],
      references: [deliveries.id],
    }),
    deliveryOrderMeals: many(deliveryOrderMeals),
  }),
);

export const deliveryOrdersStatusLogs = mysqlTable(
  'delivery_orders_status_logs',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    deliveryOrderId: int('delivery_order_id').notNull(),
    statusFrom: varchar('status_from', { length: 255 }).notNull(),
    statusTo: varchar('status_to', { length: 255 }).notNull(),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      deliveryOrderIdIdx: index(
        'delivery_orders_status_logs_delivery_order_id_index',
      ).on(table.deliveryOrderId),
    };
  },
);

export const deliveryOrderMeals = mysqlTable(
  'delivery_order_meals',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    deliveryOrderId: bigint('delivery_order_id', { mode: 'number' })
      .notNull()
      .references(() => deliveryOrders.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    mealId: bigint('meal_id', { mode: 'number' }).notNull(),
    branchCommission: double('branch_commission', { precision: 8, scale: 2 }),
    mealSellingPrice: double('meal_selling_price', { precision: 8, scale: 2 }),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    mealDate: date('meal_date', { mode: 'string' }).notNull(),
    rate: tinyint('rate'),
    reason: varchar('reason', { length: 255 }),
    comment: text('comment'),
    deletedAt: timestamp('deleted_at', { mode: 'string' }),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      deliveryOrderId: index('delivery_order_id').on(table.deliveryOrderId),
    };
  },
);

export const deliveryOrderMealsRelations = relations(
  deliveryOrderMeals,
  ({ one }) => ({
    deliveryOrder: one(deliveryOrders, {
      fields: [deliveryOrderMeals.deliveryOrderId],
      references: [deliveryOrders.id],
    }),
    meal: one(meals, {
      fields: [deliveryOrderMeals.mealId],
      references: [meals.id],
    }),
  }),
);

export const deliverySlots = mysqlTable('delivery_slots', {
  id: int('id').autoincrement().notNull(),
  deliveryId: int('delivery_id')
    .notNull()
    .references(() => deliveries.id, {
      onDelete: 'cascade',
      onUpdate: 'cascade',
    }),
  timeFrom: time('time_from').notNull(),
  timeTo: time('time_to').notNull(),
  forTomorrow: tinyint('for_tomorrow').default(0),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
  deletedAt: timestamp('deleted_at', { mode: 'string' }),
});

export const diets = mysqlTable('diets', {
  id: int('id').autoincrement().notNull(),
  name: translatedString('name').notNull(),
  dailyCalories: int('daily_calories').notNull(),
  isActive: boolean('is_active').default(false),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const dietGoal = mysqlTable('diet_goal', {
  id: int('id').autoincrement().notNull(),
  goalId: int('goal_id')
    .notNull()
    .references(() => goals.id, { onDelete: 'cascade', onUpdate: 'cascade' }),
  dietId: int('diet_id')
    .notNull()
    .references(() => diets.id, { onDelete: 'cascade', onUpdate: 'cascade' }),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const dietPlans = mysqlTable(
  'diet_plans',
  {
    id: int('id').autoincrement().notNull(),
    dietTypeId: int('diet_type_id')
      .notNull()
      .references(() => dietTypes.id, {
        onDelete: 'restrict',
        onUpdate: 'cascade',
      }),
    dietId: int('diet_id')
      .notNull()
      .references(() => diets.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    dayKcalMin: double('day_kcal_min', { precision: 8, scale: 2 }).notNull(),
    dayKcalMax: double('day_kcal_max', { precision: 8, scale: 2 }).notNull(),
    dayCarbMin: double('day_carb_min', { precision: 8, scale: 2 }).notNull(),
    dayCarbMax: double('day_carb_max', { precision: 8, scale: 2 }).notNull(),
    dayFatMin: double('day_fat_min', { precision: 8, scale: 2 }).notNull(),
    dayFatMax: double('day_fat_max', { precision: 8, scale: 2 }).notNull(),
    dayProteinMin: double('day_protein_min', {
      precision: 8,
      scale: 2,
    }).notNull(),
    dayProteinMax: double('day_protein_max', { precision: 8, scale: 2 })
      .default(100)
      .notNull(),
    dietPlanPriceWeekly: decimal('diet_plan_price_weekly', {
      precision: 10,
      scale: 2,
    })
      .default('0.00')
      .notNull(),
    dietPlanPriceMonthly: decimal('diet_plan_price_monthly', {
      precision: 8,
      scale: 2,
    }).notNull(),
    deletedAt: timestamp('deleted_at', { mode: 'string' }),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
    mapResturants: json('map_resturants'),
  },
  (table) => {
    return {
      dietId: index('diet_id').on(table.dietId),
    };
  },
);

export const dietPlanRelations = relations(dietPlans, ({ one, many }) => ({
  dietType: one(dietTypes, {
    fields: [dietPlans.dietTypeId],
    references: [dietTypes.id],
  }),
  diet: one(diets, {
    fields: [dietPlans.dietId],
    references: [diets.id],
  }),
  dietPlanToMeals: many(mealDietPlan),
}));

export const dietPlanDailySlots = mysqlTable(
  'diet_plan_daily_slots',
  {
    id: int('id').autoincrement().notNull(),
    dietPlanId: int('diet_plan_id')
      .notNull()
      .references(() => dietPlans.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    dailySlotId: int('daily_slot_id')
      .notNull()
      .references(() => dailySlots.id),
    mealNote: json('meal_note').notNull(),
    mealKcalMin: double('meal_kcal_min', { precision: 8, scale: 2 }).notNull(),
    mealKcalMax: double('meal_kcal_max', { precision: 8, scale: 2 })
      .default(100)
      .notNull(),
    mealCarbMin: varchar('meal_carb_min', { length: 255 }).notNull(),
    mealCarbMax: double('meal_carb_max', { precision: 8, scale: 2 })
      .default(100)
      .notNull(),
    mealFatMin: double('meal_fat_min', { precision: 8, scale: 2 }).notNull(),
    mealFatMax: double('meal_fat_max', { precision: 8, scale: 2 })
      .default(100)
      .notNull(),
    mealProteinMin: double('meal_protein_min', {
      precision: 8,
      scale: 2,
    }).notNull(),
    mealProteinMax: double('meal_protein_max', { precision: 8, scale: 2 })
      .default(100)
      .notNull(),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      dailySlotId: index('daily_slot_id').on(table.dailySlotId),
      dietPlanId: index('diet_plan_id').on(table.dietPlanId),
    };
  },
);

export const dietPlanDailySlotsRelations = relations(
  dietPlanDailySlots,
  ({ one }) => ({
    dailySlot: one(dailySlots, {
      fields: [dietPlanDailySlots.dailySlotId],
      references: [dailySlots.id],
    }),
    dietPlan: one(dietPlans, {
      fields: [dietPlanDailySlots.dietPlanId],
      references: [dietPlans.id],
    }),
  }),
);

export const dietPlanMenus = mysqlTable(
  'diet_plan_menus',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    mealId: bigint('meal_id', { mode: 'number' })
      .notNull()
      .references(() => meals.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    restaurantId: bigint('restaurant_id', { mode: 'number' }).notNull(),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    day: date('day', { mode: 'string' }).notNull(),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      mealIdIdx: index('diet_plan_menus_meal_id_index').on(table.mealId),
      restaurantIdIdx: index('diet_plan_menus_restaurant_id_index').on(
        table.restaurantId,
      ),
      dayIdx: index('diet_plan_menus_day_index').on(table.day),
    };
  },
);

export const dietPlanMenusRelations = relations(dietPlanMenus, ({ one }) => ({
  meal: one(meals, {
    fields: [dietPlanMenus.mealId],
    references: [meals.id],
  }),
}));

export const dietPlanPackages = mysqlTable(
  'diet_plan_packages',
  {
    id: int('id').autoincrement().notNull(),
    name: translatedString('name').notNull(),
    image: varchar('image', { length: 255 }),
    dietPlanId: int('diet_plan_id')
      .notNull()
      .references(() => dietPlans.id),
    weeklyPrice: decimal('weekly_price', { precision: 10, scale: 2 })
      .default('0.00')
      .notNull(),
    monthlyPrice: decimal('monthly_price', { precision: 10, scale: 2 })
      .default('0.00')
      .notNull(),
    days: mysqlEnum('days', ['5', '6']),
    description: translatedString('description'),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
    status: boolean('status').default(true),
    ramadanPackage: boolean('ramadan_package').default(false),
    color: varchar('color', { length: 255 }),
    sort: int('sort').default(1),
    deletedAt: timestamp('deleted_at', { mode: 'string' }),
    isTrial: tinyint('is_trial').default(0),
    trialDays: tinyint('trial_days'),
    stripeWeeklyPriceId: varchar('stripe_weekly_price_id', { length: 40 }),
    stripeMonthlyPriceId: varchar('stripe_monthly_price_id', { length: 40 }),
    stripeProductId: varchar('stripe_product_id', { length: 40 }),
  },
  (table) => {
    return {
      dietPlanIdIdx: index('diet_plan_packages_diet_plan_id_index').on(
        table.dietPlanId,
      ),
    };
  },
);

export const dietPlanPackageRelations = relations(
  dietPlanPackages,
  ({ one, many }) => ({
    dietPlan: one(dietPlans, {
      fields: [dietPlanPackages.dietPlanId],
      references: [dietPlans.id],
    }),
    dietPackageToDailySlot: many(dietPlanPackageDailySlot),
  }),
);

export const dietPlanPackagesBkp = mysqlTable(
  'diet_plan_packages_bkp',
  {
    id: int('id').autoincrement().notNull(),
    name: translatedString('name').notNull(),
    image: varchar('image', { length: 255 }),
    dietPlanId: int('diet_plan_id').notNull(),
    weeklyPrice: decimal('weekly_price', { precision: 10, scale: 2 })
      .default('0.00')
      .notNull(),
    monthlyPrice: decimal('monthly_price', { precision: 10, scale: 2 })
      .default('0.00')
      .notNull(),
    description: translatedString('description'),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
    status: boolean('status').default(true),
  },
  (table) => {
    return {
      dietPlanPackagesDietPlanIdIdx: index(
        'diet_plan_packages_diet_plan_id_index',
      ).on(table.dietPlanId),
    };
  },
);

export const dietPlanPackageDailySlot = mysqlTable(
  'diet_plan_package_daily_slot',
  {
    id: int('id').autoincrement().notNull(),
    dietPlanPackageId: int('diet_plan_package_id')
      .notNull()
      .references(() => dietPlanPackages.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    dietPlanDailySlotId: int('diet_plan_daily_slot_id')
      .notNull()
      .references(() => dietPlanDailySlots.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
    deletedAt: timestamp('deleted_at', { mode: 'string' }),
  },
  (table) => {
    return {
      dietPlanDailySlotId: index('diet_plan_daily_slot_id').on(
        table.dietPlanDailySlotId,
      ),
      dietPlanPackageId: index('diet_plan_package_id').on(
        table.dietPlanPackageId,
      ),
    };
  },
);

export const dietPlanPackageDailySlotRelations = relations(
  dietPlanPackageDailySlot,
  ({ one }) => ({
    dietPlanPackage: one(dietPlanPackages, {
      fields: [dietPlanPackageDailySlot.dietPlanPackageId],
      references: [dietPlanPackages.id],
    }),
    dietPlanDailySlot: one(dietPlanDailySlots, {
      fields: [dietPlanPackageDailySlot.dietPlanDailySlotId],
      references: [dietPlanDailySlots.id],
    }),
  }),
);

export const dietPlanPackageDailySlotBkp = mysqlTable(
  'diet_plan_package_daily_slot_bkp',
  {
    id: int('id').autoincrement().notNull(),
    dietPlanPackageId: int('diet_plan_package_id').notNull(),
    dietPlanDailySlotId: int('diet_plan_daily_slot_id').notNull(),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
);

export const dietTypes = mysqlTable('diet_types', {
  id: int('id').autoincrement().notNull(),
  name: translatedString('name').notNull(),
  image: varchar('image', { length: 255 }),
  subtitle: json('subtitle'),
  description: translatedString('description'),
  nameTwo: json('name_two'),
  descriptionTwo: json('description_two'),
  isActive: boolean('is_active').default(false),
  sort: int('sort').default(1).notNull(),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
  deletedAt: timestamp('deleted_at', { mode: 'string' }),
});

export const dietTypeMeals = mysqlTable(
  'diet_type_meals',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    mealId: bigint('meal_id', { mode: 'number' }).notNull(),
    dietTypeId: int('diet_type_id').notNull(),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      mealIdIdx: index('diet_type_meals_meal_id_index').on(table.mealId),
      dietTypeIdIdx: index('diet_type_meals_diet_type_id_index').on(
        table.dietTypeId,
      ),
    };
  },
);

export const emailQueue = mysqlTable(
  'email_queue',
  {
    id: int('id').autoincrement().notNull(),
    scheduledAt: datetime('scheduled_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
    payload: json('payload'),
    userId: bigint('user_id', { mode: 'number' })
      .notNull()
      .references(() => users.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    sendgridTemplateId: varchar('sendgrid_template_id', {
      length: 100,
    }).notNull(),
    pending: boolean('pending').default(true),
  },
  (table) => {
    return {
      userId: index('user_id').on(table.userId),
    };
  },
);

export const failedJobs = mysqlTable(
  'failed_jobs',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    uuid: varchar('uuid', { length: 255 }).notNull(),
    connection: text('connection').notNull(),
    queue: text('queue').notNull(),
    payload: longtext('payload').notNull(),
    exception: longtext('exception').notNull(),
    failedAt: timestamp('failed_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
  },
  (table) => {
    return {
      failedJobsUuidUnique: unique('failed_jobs_uuid_unique').on(table.uuid),
    };
  },
);

export const faqs = mysqlTable('faqs', {
  id: int('id').autoincrement().notNull(),
  question: varchar('question', { length: 1000 }).notNull(),
  answer: varchar('answer', { length: 10000 }).notNull(),
});

export const favoriteUserMeals = mysqlTable('favorite_user_meals', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  userId: bigint('user_id', { mode: 'number' }).notNull(),
  mealId: bigint('meal_id', { mode: 'number' }).notNull(),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const foodNotifications = mysqlTable('food_notifications', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  name: translatedString('name').notNull(),
  description: translatedString('description').notNull(),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const goals = mysqlTable('goals', {
  id: int('id').autoincrement().notNull(),
  name: translatedString('name').notNull(),
  parentId: int('parent_id').default(0).notNull(),
  deficit: double('deficit', { precision: 8, scale: 2 }).notNull(),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
  deletedAt: timestamp('deleted_at', { mode: 'string' }),
  deficitPercentage: decimal('deficit_percentage', { precision: 11, scale: 2 })
    .default('0.00')
    .notNull(),
});

export const goalDietPlan = mysqlTable('goal_diet_plan', {
  id: int('id').autoincrement().notNull(),
  goalId: int('goal_id').notNull(),
  dietPlanId: int('diet_plan_id').notNull(),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const jobs = mysqlTable(
  'jobs',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    queue: varchar('queue', { length: 255 }).notNull(),
    payload: longtext('payload').notNull(),
    attempts: tinyint('attempts').notNull(),
    reservedAt: int('reserved_at'),
    availableAt: int('available_at').notNull(),
    createdAt: int('created_at').notNull(),
  },
  (table) => {
    return {
      queueIdx: index('jobs_queue_index').on(table.queue),
    };
  },
);

export const leaderboards = mysqlTable(
  'leaderboards',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number' })
      .notNull()
      .references(() => users.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    challengeId: bigint('challenge_id', { mode: 'number' })
      .notNull()
      .references(() => challengeV2S.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    rank: int('rank'),
    points: int('points'),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
  },
  (table) => {
    return {
      challengeId: index('challenge_id').on(table.challengeId),
    };
  },
);

export const meals = mysqlTable('meals', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  restaurantId: bigint('restaurant_id', { mode: 'number' }).notNull(),
  name: translatedString('name').notNull(),
  image: imagePath('image'),
  restaurantMealName: varchar('restaurant_meal_name', { length: 255 }),
  restaurantMealComment: text('restaurant_meal_comment'),
  showMealComponent: tinyint('show_meal_component').default(0),
  noCutlery: tinyint('no_cutlery').default(0),
  description: translatedString('description'),
  sellingPrice: decimal('selling_price', { precision: 10, scale: 2 }).notNull(),
  kcal: double('kcal'),
  protein: double('protein'),
  carbs: double('carbs'),
  fat: double('fat'),
  status: boolean('status').default(true),
  isDefault: tinyint('is_default'),
  flagColor: boolean('flag_color').default(true),
  testMode: tinyint('test_mode').default(0),
  grubtechExternalId: varchar('grubtech_external_id', { length: 255 }),
  deletedAt: timestamp('deleted_at', { mode: 'string' }),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
  defaultDays: json('default_days'),
  birdsEyeViewImage: varchar('birds_eye_view_image', { length: 255 }),
});

export const mealsRelations = relations(meals, ({ one, many }) => ({
  mealToDailySlots: many(mealDailySlot),
  restaurant: one(restaurants, {
    fields: [meals.restaurantId],
    references: [restaurants.id],
  }),
}));

export const mealsComponentsPivot = mysqlTable('meals_components_pivot', {
  id: int('id').autoincrement().notNull(),
  mealId: bigint('meal_id', { mode: 'number' })
    .notNull()
    .references(() => meals.id, { onDelete: 'cascade' }),
  mealComponentId: bigint('meal_component_id', { mode: 'number' })
    .notNull()
    .references(() => mealComponents.id, {
      onDelete: 'cascade',
      onUpdate: 'cascade',
    }),
  quantity: double('quantity', { precision: 8, scale: 2 }).default(1).notNull(),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const mealsOrdersReportsView = mysqlTable('meals_orders_reports_view', {
  id: bigint('id', { mode: 'number' }).notNull(),
  restaurantId: bigint('restaurant_id', { mode: 'number' }).notNull(),
  mealArName: longtext('meal_ar_name'),
  mealEnName: longtext('meal_en_name'),
  restaurantMealName: varchar('restaurant_meal_name', { length: 255 }),
  restaurantMealComment: text('restaurant_meal_comment'),
  total: bigint('total', { mode: 'number' }).notNull(),
  sellingPrice: decimal('selling_price', { precision: 10, scale: 2 }).notNull(),
  // you can use { mode: 'date' }, if you want to have Date as type for this column
  mealDate: date('meal_date', { mode: 'string' }).notNull(),
});

export const mealBranch = mysqlTable('meal_branch', {
  id: int('id').autoincrement().notNull(),
  mealId: bigint('meal_id', { mode: 'number' })
    .notNull()
    .references(() => meals.id, { onDelete: 'cascade', onUpdate: 'cascade' }),
  branchId: bigint('branch_id', { mode: 'number' })
    .notNull()
    .references(() => branches.id, {
      onDelete: 'cascade',
      onUpdate: 'cascade',
    }),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const mealComponents = mysqlTable('meal_components', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  name: translatedString('name').notNull(),
  weightGram: decimal('weight_gram', { precision: 10, scale: 3 }).notNull(),
  costGram: decimal('cost_gram', { precision: 10, scale: 3 }).notNull(),
  actualCostGram: decimal('actual_cost_gram', {
    precision: 10,
    scale: 3,
  }).notNull(),
  allergyId: int('allergy_id').references(() => allergies.id, {
    onDelete: 'set null',
    onUpdate: 'cascade',
  }),
  restaurantId: bigint('restaurant_id', { mode: 'number' }).notNull(),
  showInRestaurant: tinyint('show_in_restaurant').default(1),
  showInApp: tinyint('show_in_app').default(1),
  kcal: double('kcal', { precision: 8, scale: 2 }).notNull(),
  protein: double('protein', { precision: 8, scale: 2 }).notNull(),
  carbs: double('carbs', { precision: 8, scale: 2 }).notNull(),
  fat: double('fat', { precision: 8, scale: 2 }).notNull(),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const mealDailySlot = mysqlTable(
  'meal_daily_slot',
  {
    id: int('id').autoincrement().notNull(),
    mealId: bigint('meal_id', { mode: 'number' })
      .notNull()
      .references(() => meals.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    dailySlotId: int('daily_slot_id')
      .notNull()
      .references(() => dailySlots.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
  },
  (table) => {
    return {
      mealId: index('meal_id').on(table.mealId),
      dailySlotId: index('daily_slot_id').on(table.dailySlotId),
    };
  },
);

export const mealDailySlotRelations = relations(mealDailySlot, ({ one }) => ({
  meal: one(meals, {
    fields: [mealDailySlot.mealId],
    references: [meals.id],
  }),
  dailySlot: one(dailySlots, {
    fields: [mealDailySlot.dailySlotId],
    references: [dailySlots.id],
  }),
}));

export const mealDietPlan = mysqlTable('meal_diet_plan', {
  id: int('id').autoincrement().notNull(),
  dietPlanId: int('diet_plan_id')
    .notNull()
    .references(() => dietPlans.id, {
      onDelete: 'cascade',
      onUpdate: 'cascade',
    }),
  mealId: bigint('meal_id', { mode: 'number' })
    .notNull()
    .references(() => meals.id, { onDelete: 'cascade', onUpdate: 'cascade' }),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const mealDietPlanRelations = relations(mealDietPlan, ({ one }) => ({
  dietPlan: one(dietPlans, {
    fields: [mealDietPlan.dietPlanId],
    references: [dietPlans.id],
  }),
  meal: one(meals, {
    fields: [mealDietPlan.mealId],
    references: [meals.id],
  }),
}));

export const mealGroupStatus = mysqlTable('meal_group_status', {
  id: int('id').autoincrement().notNull(),
  statusName: json('status_name').notNull(),
});

export const migrations = mysqlTable('migrations', {
  id: int('id').autoincrement().notNull(),
  migration: varchar('migration', { length: 255 }).notNull(),
  batch: int('batch').notNull(),
});

export const orders = mysqlTable(
  'orders',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number' }).notNull(),
    dietPlanId: bigint('diet_plan_id', { mode: 'number' }).notNull(),
    dietPlanPackageId: int('diet_plan_package_id'),
    subscriptionDays: int('subscription_days').notNull(),
    currency: varchar('currency', { length: 10 }).default('AED'),
    amount: double('amount', { precision: 8, scale: 2 }).notNull(),
    discount: int('discount'),
    promoCodeId: bigint('promo_code_id', { mode: 'number' }),
    delivery: double('delivery', { precision: 8, scale: 2 }).notNull(),
    totalAmount: double('total_amount', { precision: 8, scale: 2 }).notNull(),
    paymentMethod: varchar('payment_method', { length: 255 }),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    startingDate: date('starting_date', { mode: 'string' }),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    expirationDate: date('expiration_date', { mode: 'string' }),
    deliveryDays: json('delivery_days'),
    status: tinyint('status').default(0),
    taxPercentage: double('tax_percentage', { precision: 8, scale: 2 }),
    description: text('description'),
    canceledSubscriptionId: bigint('canceled_subscription_id', {
      mode: 'number',
    }),
    invitationCode: varchar('invitation_code', { length: 255 }),
    invitationDiscount: double('invitation_discount', {
      precision: 8,
      scale: 2,
    }),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
    bagDeposit: float('bag_deposit').notNull(),
  },
  (table) => {
    return {
      userIdIdx: index('orders_user_id_index').on(table.userId),
      dietPlanIdIdx: index('orders_diet_plan_id_index').on(table.dietPlanId),
      promoCodeIdIdx: index('orders_promo_code_id_index').on(table.promoCodeId),
      invitationCodeIdx: index('orders_invitation_code_index').on(
        table.invitationCode,
      ),
      canceledSubscriptionIdIdx: index(
        'orders_canceled_subscription_id_index',
      ).on(table.canceledSubscriptionId),
    };
  },
);

export const orderNotifications = mysqlTable(
  'order_notifications',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    name: translatedString('name').notNull(),
    description: translatedString('description').notNull(),
    dailySlotId: int('daily_slot_id').notNull(),
    orderStatus: tinyint('order_status'),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      dailySlotIdIdx: index('order_notifications_daily_slot_id_index').on(
        table.dailySlotId,
      ),
    };
  },
);

export const partners = mysqlTable('partners', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  name: translatedString('name').notNull(),
  image: varchar('image', { length: 255 }).notNull(),
  sort: int('sort').default(1),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const passwordResets = mysqlTable(
  'password_resets',
  {
    email: varchar('email', { length: 255 }).notNull(),
    token: varchar('token', { length: 255 }).notNull(),
    createdAt: timestamp('created_at', { mode: 'string' }),
  },
  (table) => {
    return {
      emailIdx: index('password_resets_email_index').on(table.email),
    };
  },
);

export const paymentTransactions = mysqlTable(
  'payment_transactions',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    cartId: varchar('cart_id', { length: 63 }).notNull(),
    initialCartId: varchar('initial_cart_id', { length: 255 }),
    relatedTranRef: varchar('related_tran_ref', { length: 255 }),
    bagDeposit: float('bag_deposit').notNull(),
    paymentMethod: varchar('payment_method', { length: 255 }),
    orderId: bigint('order_id', { mode: 'number' }).notNull(),
    waterBottleOrder: tinyint('water_bottle_order').default(0),
    userId: bigint('user_id', { mode: 'number' }),
    promoCodeId: bigint('promo_code_id', { mode: 'number' }),
    storeId: int('store_id').notNull(),
    testMode: boolean('test_mode').default(false),
    amount: double('amount').notNull(),
    currency: varchar('currency', { length: 255 }).default('AED').notNull(),
    description: varchar('description', { length: 255 }).notNull(),
    ivpTrantype: varchar('ivp_trantype', { length: 255 }).notNull(),
    tranRef: varchar('tran_ref', { length: 255 }),
    successUrl: varchar('success_url', { length: 255 }).notNull(),
    canceledUrl: varchar('canceled_url', { length: 255 }).notNull(),
    declinedUrl: varchar('declined_url', { length: 255 }).notNull(),
    billingFname: varchar('billing_fname', { length: 255 }),
    billingSname: varchar('billing_sname', { length: 255 }),
    billingAddress1: varchar('billing_address_1', { length: 255 }),
    billingAddress2: varchar('billing_address_2', { length: 255 }),
    billingCity: varchar('billing_city', { length: 255 }),
    billingRegion: varchar('billing_region', { length: 255 }),
    billingZip: varchar('billing_zip', { length: 255 }),
    billingCountry: varchar('billing_country', { length: 255 }),
    billingEmail: varchar('billing_email', { length: 255 }),
    billingPhone: varchar('billing_phone', { length: 255 }),
    langCode: varchar('lang_code', { length: 255 }),
    trxReference: varchar('trx_reference', { length: 255 }),
    approved: tinyint('approved'),
    response: json('response'),
    status: boolean('status').default(false),
    statusText: varchar('status_text', { length: 255 }),
    repeatAmount: decimal('repeat_amount', { precision: 8, scale: 2 }),
    repeatPeriod: mysqlEnum('repeat_period', ['W', 'M']),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    repeatStart: date('repeat_start', { mode: 'string' }),
    repeatInterval: int('repeat_interval').default(1),
    repeatTerm: smallint('repeat_term'),
    repeatFinal: decimal('repeat_final', { precision: 8, scale: 2 }).default(
      '0.00',
    ),
    extra: json('extra'),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
  },
  (table) => {
    return {
      userIdIdx: index('payment_transactions_user_id_index').on(table.userId),
    };
  },
);

export const promoCodes = mysqlTable(
  'promo_codes',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    code: varchar('code', { length: 255 }).notNull(),
    maxUsage: int('max_usage'),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    expirationDate: date('expiration_date', { mode: 'string' }),
    noOfUsed: int('no_of_used').default(0),
    discount: int('discount').notNull(),
    discountType: mysqlEnum('discount_type', ['Fixed', 'Percentage']).notNull(),
    commission: int('commission'),
    commissionType: mysqlEnum('commission_type', ['Fixed', 'Percentage']),
    subscriptionType: tinyint('subscription_type').default(3).notNull(),
    partnerName: varchar('partner_name', { length: 255 }),
    deletedAt: timestamp('deleted_at', { mode: 'string' }),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
  },
  (table) => {
    return {
      uniqueCode: unique('UNIQUE_CODE').on(table.code),
    };
  },
);

export const pushNotificationDevices = mysqlTable('push_notification_devices', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  userId: bigint('user_id', { mode: 'number' })
    .notNull()
    .references(() => users.id, { onDelete: 'cascade', onUpdate: 'cascade' }),
  pnToken: varchar('pn_token', { length: 500 }).notNull(),
  device: varchar('device', { length: 255 }).notNull(),
  pnTestMode: tinyint('pn_test_mode').default(0),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const pushTokens = mysqlTable(
  'push_tokens',
  {
    id: int('id').autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number' })
      .notNull()
      .references(() => users.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    platform: mysqlEnum('platform', ['android', 'ios', 'unknown'])
      .default('unknown')
      .notNull(),
    token: varchar('token', { length: 1000 }).notNull(),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
  },
  (table) => {
    return {
      userId: index('user_id').on(table.userId),
      token: unique('token').on(table.token),
    };
  },
);

export const quiqupDeliveryZones = mysqlTable(
  'quiqup_delivery_zones',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    name: varchar('name', { length: 255 }).notNull(),
    code: varchar('code', { length: 255 }).notNull(),
    variant: varchar('variant', { length: 255 }).notNull(),
    zoneName: varchar('zone_name', { length: 255 }).notNull(),
    zoneCode: varchar('zone_code', { length: 255 }).notNull(),
    geometryCoordinates: json('geometry_coordinates').notNull(),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      codeIdx: index('quiqup_delivery_zones_variant_index').on(table.code),
      variantIdx: index('quiqup_delivery_zones_code_index').on(table.variant),
    };
  },
);

export const reasons = mysqlTable('reasons', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  name: varchar('name', { length: 255 }).notNull(),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const referCompanies = mysqlTable('refer_companies', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  userId: bigint('user_id', { mode: 'number' }).notNull(),
  firstName: varchar('first_name', { length: 255 }).notNull(),
  lastName: varchar('last_name', { length: 255 }).notNull(),
  companyName: varchar('company_name', { length: 255 }).notNull(),
  workEmail: varchar('work_email', { length: 255 }).notNull(),
  createdAt: timestamp('created_at', { mode: 'string' })
    .default('CURRENT_TIMESTAMP')
    .notNull(),
  updatedAt: timestamp('updated_at', { mode: 'string' })
    .default('CURRENT_TIMESTAMP')
    .onUpdateNow()
    .notNull(),
});

export const replacedMeals = mysqlTable(
  'replaced_meals',
  {
    id: int('id').autoincrement().notNull(),
    userMealGroupId: bigint('user_meal_group_id', { mode: 'number' }).notNull(),
    userId: bigint('user_id', { mode: 'number' }).notNull(),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    mealDate: date('meal_date', { mode: 'string' }).notNull(),
    previousMealId: bigint('previous_meal_id', { mode: 'number' }).notNull(),
    dailySlotId: int('daily_slot_id').notNull(),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      userIdMealDateIdx: index('replaced_meals_user_id_meal_date_index').on(
        table.userId,
        table.mealDate,
      ),
    };
  },
);

export const restaurants = mysqlTable('restaurants', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  name: translatedString('name').notNull(),
  status: boolean('status').default(true),
  companyId: bigint('company_id', { mode: 'number' }).references(
    () => companies.id,
    { onDelete: 'set null', onUpdate: 'cascade' },
  ),
  testMode: tinyint('test_mode').default(0),
  image: varchar('image', { length: 255 }),
  deletedAt: timestamp('deleted_at', { mode: 'string' }),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const restaurantMealsReports = mysqlTable('restaurant_meals_reports', {
  id: bigint('id', { mode: 'number' }).notNull(),
  restaurantId: bigint('restaurant_id', { mode: 'number' }).notNull(),
  total: bigint('total', { mode: 'number' }).notNull(),
  sellingPrice: decimal('selling_price', { precision: 10, scale: 2 }).notNull(),
  restaurantArName: longtext('restaurant_ar_name'),
  restaurantEnName: longtext('restaurant_en_name'),
  mealArName: longtext('meal_ar_name'),
  mealEnName: longtext('meal_en_name'),
  restaurantMealName: varchar('restaurant_meal_name', { length: 255 }),
  restaurantMealComment: text('restaurant_meal_comment'),
});

export const restaurantOrdersReports = mysqlTable('restaurant_orders_reports', {
  id: bigint('id', { mode: 'number' }).notNull(),
  restaurantArName: longtext('restaurant_ar_name'),
  restaurantEnName: longtext('restaurant_en_name'),
  totalPending: bigint('total_pending', { mode: 'number' }),
  totalDeliveredDrivers: bigint('total_delivered_drivers', { mode: 'number' }),
  totalDispatched: bigint('total_dispatched', { mode: 'number' }),
  totalOrders: bigint('total_orders', { mode: 'number' }).notNull(),
});

export const rewardsRedemption = mysqlTable('rewards_redemption', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  userId: bigint('user_id', { mode: 'number' }).notNull(),
  rewardsResponsePk: bigint('rewards_response_pk', { mode: 'number' }),
  rewardsRedeemed: int('rewards_redeemed'),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const sampleMeals = mysqlTable('sample_meals', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  dietTypeId: bigint('diet_type_id', { mode: 'number' }).notNull(),
  day1: json('day_1'),
  day2: json('day_2'),
  day3: json('day_3'),
  day4: json('day_4'),
  day5: json('day_5'),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
  dietPlanId: int('diet_plan_id').notNull(),
});

export const trainers = mysqlTable(
  'trainers',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    name: varchar('name', { length: 255 }).notNull(),
    email: varchar('email', { length: 100 }).notNull(),
    mobile: varchar('mobile', { length: 20 }),
    image: varchar('image', { length: 2000 }),
    gender: mysqlEnum('gender', ['male', 'female', 'na'])
      .default('na')
      .notNull(),
    active: tinyint('active').notNull(),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
    firebaseUid: varchar('firebase_uid', { length: 200 }).notNull(),
    lastSignedIn: timestamp('last_signed_in', { mode: 'string' }).notNull(),
    referralLink: varchar('referral_link', { length: 200 }).notNull(),
    invitationCode: varchar('invitation_code', { length: 100 }).notNull(),
  },
  (table) => {
    return {
      firebaseUid: unique('firebase_uid').on(table.firebaseUid),
      invitationCode: unique('invitation_code').on(table.invitationCode),
    };
  },
);

export const trainerRelations = relations(trainers, ({ many }) => ({
  leads: many(trainerLeads),
}));

export const trainerLeads = mysqlTable(
  'trainer_leads',
  {
    id: int('id').autoincrement().notNull(),
    firstName: varchar('first_name', { length: 200 }).notNull(),
    lastName: varchar('last_name', { length: 200 }).notNull(),
    gender: mysqlEnum('gender', ['male', 'female', 'na'])
      .default('na')
      .notNull(),
    mobile: varchar('mobile', { length: 9 }).notNull(),
    status: mysqlEnum('status', [
      'pending',
      'signed_up',
      'subscribed',
      'cancelled',
      'deleted',
    ])
      .default('pending')
      .notNull(),
    totalRevenue: double('total_revenue', {
      precision: 11,
      scale: 2,
    }).notNull(),
    convertedUserId: bigint('converted_user_id', { mode: 'number' }).references(
      () => users.id,
      { onDelete: 'restrict', onUpdate: 'restrict' },
    ),
    trainerId: bigint('trainer_id', { mode: 'number' })
      .notNull()
      .references(() => trainers.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    signUpAt: timestamp('sign_up_at', { mode: 'string' }),
    convertedAt: timestamp('converted_at', { mode: 'string' }),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
    deletedAt: timestamp('deleted_at', { mode: 'string' }),
    dataSharingConsent: boolean('data_sharing_consent')
      .default(false)
      .notNull(),
  },
  (table) => {
    return {
      convertedUserId: index('converted_user_id').on(table.convertedUserId),
      trainerId: index('trainer_id').on(table.trainerId),
      mobile: unique('mobile').on(table.mobile),
    };
  },
);

export const trainerLeadRelations = relations(trainerLeads, ({ one }) => ({
  trainer: one(trainers, {
    fields: [trainerLeads.trainerId],
    references: [trainers.id],
  }),
  convertedUser: one(users, {
    fields: [trainerLeads.convertedUserId],
    references: [users.id],
  }),
}));

export const trainerLeadEarnings = mysqlTable(
  'trainer_lead_earnings',
  {
    id: int('id').autoincrement().notNull(),
    trainerLeadId: int('trainer_lead_id')
      .notNull()
      .references(() => trainerLeads.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    amount: double('amount', { precision: 11, scale: 2 }).notNull(),
    paymentIntentId: varchar('payment_intent_id', { length: 100 }).notNull(),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updateAt: timestamp('update_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
  },
  (table) => {
    return {
      trainerLeadId: unique('trainer_lead_id').on(
        table.trainerLeadId,
        table.paymentIntentId,
      ),
      paymentIntentId: unique('payment_intent_id').on(table.paymentIntentId),
    };
  },
);

export const trainerPayouts = mysqlTable(
  'trainer_payouts',
  {
    id: int('id').autoincrement().notNull(),
    trainerId: bigint('trainer_id', { mode: 'number' }).notNull(),
    // Warning: Can't parse float(10,2) from database
    // float(10,2)Type: float(10,2)("amount").notNull(),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
    payoutMonthYear: varchar('payout_month_year', { length: 5 }).notNull(),
  },
  (table) => {
    return {
      trainerId: unique('trainer_id').on(
        table.trainerId,
        table.payoutMonthYear,
      ),
    };
  },
);

export const updateTransactionLogs = mysqlTable('update_transaction_logs', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  response: json('response').notNull(),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const users = mysqlTable(
  'users',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    firstName: varchar('first_name', { length: 60 }),
    lastName: varchar('last_name', { length: 60 }),
    email: varchar('email', { length: 255 }),
    mobile: varchar('mobile', { length: 20 }).notNull(),
    uuid: varchar('uuid', { length: 255 }),
    gender: tinyint('gender'),
    image: imagePath('image'),
    countryId: int('country_id').references(() => countries.id, {
      onDelete: 'restrict',
      onUpdate: 'restrict',
    }),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    birthday: date('birthday', { mode: 'string' }),
    height: decimal('height', { precision: 8, scale: 2 }),
    heightMeasure: varchar('height_measure', { length: 6 }),
    weight: decimal('weight', { precision: 8, scale: 2 }),
    weightMeasure: varchar('weight_measure', { length: 6 }),
    weightGoal: decimal('weight_goal', { precision: 8, scale: 2 }),
    status: boolean('status').default(true),
    goalId: int('goal_id').references(() => goals.id, {
      onDelete: 'restrict',
      onUpdate: 'restrict',
    }),
    dietPlanId: int('diet_plan_id').references(() => dietPlans.id, {
      onDelete: 'restrict',
      onUpdate: 'restrict',
    }),
    dietPlanPackageId: int('diet_plan_package_id').references(
      () => dietPlanPackages.id,
      { onDelete: 'restrict', onUpdate: 'restrict' },
    ),
    ipAddress: varchar('ip_address', { length: 255 }),
    activeExerciseId: int('active_exercise_id').references(
      () => activeExercise.id,
      { onDelete: 'set null', onUpdate: 'set null' },
    ),
    customTargetTdee: smallint('custom_target_TDEE'),
    customTargetExercise: smallint('custom_target_exercise'),
    subscriptionDays: int('subscription_days'),
    deliveryDays: json('delivery_days'),
    deviceType: varchar('device_type', { length: 255 }),
    invitationCode: varchar('invitation_code', { length: 255 }),
    invitationLink: varchar('invitation_link', { length: 255 }),
    invitedByCode: varchar('invited_by_code', { length: 255 }),
    points: int('points').default(0),
    deletedAt: timestamp('deleted_at', { mode: 'string' }),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
    stripeId: varchar('stripe_id', { length: 255 }),
    cardBrand: varchar('card_brand', { length: 255 }),
    cardLastFour: varchar('card_last_four', { length: 4 }),
    challengeV2Id: bigint('challenge_v2_id', { mode: 'number' }).references(
      () => challengeV2S.id,
      { onDelete: 'restrict', onUpdate: 'restrict' },
    ),
    hubspotId: bigint('hubspot_id', { mode: 'number' }),
    firebaseUid: varchar('firebase_uid', { length: 50 }),
  },
  (table) => {
    return {
      stripeIdIdx: index('users_stripe_id_index').on(table.stripeId),
      invitedByCodeIdx: index('users_invited_by_code_index').on(
        table.invitedByCode,
      ),
      usersMobileUnique: unique('users_mobile_unique').on(table.mobile),
      usersInvitationCodeUnique: unique('users_invitation_code_unique').on(
        table.invitationCode,
      ),
    };
  },
);

export const usersRelations = relations(users, ({ many, one }) => ({
  subscription: one(userSubscription),
  addresses: many(addresses),
  userDeliveryAddresses: many(userDeliveryAddress),
  dietPlan: one(dietPlans, {
    fields: [users.dietPlanId],
    references: [dietPlans.id],
  }),
  dietPlanPackage: one(dietPlanPackages, {
    fields: [users.dietPlanPackageId],
    references: [dietPlanPackages.id],
  }),
  goal: one(goals, {
    fields: [users.goalId],
    references: [goals.id],
  }),
  country: one(countries, {
    fields: [users.countryId],
    references: [countries.id],
  }),
  activeExercise: one(activeExercise, {
    fields: [users.activeExerciseId],
    references: [activeExercise.id],
  }),
  userAllergies: many(userAllergy),
  activityLogs: many(dailyUserActivityLogs),
  mealGroups: many(userMealGroups),
}));

export const usersPromoCodes = mysqlTable('users_promo_codes', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  userId: bigint('user_id', { mode: 'number' }).notNull(),
  promoCodeId: bigint('promo_code_id', { mode: 'number' }).notNull(),
  orderId: bigint('order_id', { mode: 'number' }).notNull(),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const userAchievements = mysqlTable(
  'user_achievements',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number' })
      .notNull()
      .references(() => users.id, {
        onDelete: 'cascade',
        onUpdate: 'restrict',
      }),
    achievementId: bigint('achievement_id', { mode: 'number' })
      .notNull()
      .references(() => achievements.id, {
        onDelete: 'cascade',
        onUpdate: 'restrict',
      }),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    date: date('date', { mode: 'string' }).default('2023-05-25').notNull(),
    isClaimed: boolean('is_claimed').default(false),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
  },
  (table) => {
    return {
      userAchievementDateUnique: unique('user_achievement_date_unique').on(
        table.userId,
        table.achievementId,
        table.date,
      ),
    };
  },
);

export const userActivityLogs = mysqlTable('user_activity_logs', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  userId: bigint('user_id', { mode: 'number' }).notNull(),
  actionById: bigint('action_by_id', { mode: 'number' }),
  actionBy: varchar('action_by', { length: 255 }).notNull(),
  action: text('action').notNull(),
  payload: json('payload'),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const userAllergy = mysqlTable('user_allergy', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  userId: bigint('user_id', { mode: 'number' })
    .notNull()
    .references(() => users.id, { onDelete: 'cascade', onUpdate: 'cascade' }),
  allergyId: int('allergy_id')
    .notNull()
    .references(() => allergies.id, {
      onDelete: 'cascade',
      onUpdate: 'cascade',
    }),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const userComments = mysqlTable(
  'user_comments',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number' }).notNull(),
    createdBy: bigint('created_by', { mode: 'number' }).notNull(),
    reasonId: bigint('reason_id', { mode: 'number' }).notNull(),
    channelId: bigint('channel_id', { mode: 'number' }),
    comment: longtext('comment').notNull(),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      userIdIdx: index('user_comments_user_id_index').on(table.userId),
      createdByIdx: index('user_comments_created_by_index').on(table.createdBy),
      reasonIdIdx: index('user_comments_reason_id_index').on(table.reasonId),
      channelIdIdx: index('user_comments_channel_id_index').on(table.channelId),
    };
  },
);

export const userDeliveryAddress = mysqlTable('user_delivery_address', {
  id: int('id').autoincrement().notNull(),
  addressId: int('address_id').notNull(),
  userId: bigint('user_id', { mode: 'number' }).notNull(),
  deliveryId: int('delivery_id')
    .notNull()
    .references(() => deliveries.id, {
      onDelete: 'cascade',
      onUpdate: 'cascade',
    }),
  deliverySlotId: int('delivery_slot_id')
    .notNull()
    .references(() => deliverySlots.id, {
      onDelete: 'cascade',
      onUpdate: 'cascade',
    }),
  createdAt: timestamp('created_at', { mode: 'string' })
    .default('CURRENT_TIMESTAMP')
    .notNull(),
  updatedAt: timestamp('updated_at', { mode: 'string' })
    .default('CURRENT_TIMESTAMP')
    .onUpdateNow()
    .notNull(),
});

export const userDeliveryAddressRelations = relations(
  userDeliveryAddress,
  ({ one }) => ({
    user: one(users, {
      fields: [userDeliveryAddress.userId],
      references: [users.id],
    }),
    address: one(addresses, {
      fields: [userDeliveryAddress.addressId],
      references: [addresses.id],
    }),
    deliverySlot: one(deliverySlots, {
      fields: [userDeliveryAddress.deliverySlotId],
      references: [deliverySlots.id],
    }),
  }),
);

export const userDietPlanLog = mysqlTable('user_diet_plan_log', {
  id: int('id').autoincrement().notNull(),
  userId: bigint('user_id', { mode: 'number' })
    .notNull()
    .references(() => users.id, { onDelete: 'cascade', onUpdate: 'cascade' }),
  fromDietPlanId: int('from_diet_plan_id').references(() => dietPlans.id),
  toDietPlanId: int('to_diet_plan_id').references(() => dietPlans.id),
  fromSubscriptionDays: int('from_subscription_days'),
  toSubscriptionDays: int('to_subscription_days'),
  fromDietPlanPackageId: int('from_diet_plan_package_id'),
  toDietPlanPackageId: int('to_diet_plan_package_id'),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const userGoogleTokens = mysqlTable(
  'user_google_tokens',
  {
    id: int('id').autoincrement().notNull(),
    accessToken: varchar('access_token', { length: 1000 }).notNull(),
    refreshToken: varchar('refresh_token', { length: 1000 }).notNull(),
    userId: bigint('user_id', { mode: 'number' })
      .notNull()
      .references(() => users.id, { onDelete: 'cascade', onUpdate: 'cascade' }),
    expiresAt: bigint('expires_at', { mode: 'number' }),
    tokenType: varchar('token_type', { length: 200 }),
    idToken: varchar('id_token', { length: 200 }),
    scope: varchar('scope', { length: 1000 }).notNull(),
  },
  (table) => {
    return {
      userId: unique('user_id').on(table.userId),
    };
  },
);

export const userInvitations = mysqlTable(
  'user_invitations',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number' }).notNull(),
    invitedBy: bigint('invited_by', { mode: 'number' }).notNull(),
    discount: double('discount', { precision: 8, scale: 2 }).notNull(),
    currency: varchar('currency', { length: 255 }).notNull(),
    invitationCode: varchar('invitation_code', { length: 255 }).notNull(),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      userIdIdx: index('user_invitations_user_id_index').on(table.userId),
      invitedByIdx: index('user_invitations_invited_by_index').on(
        table.invitedBy,
      ),
    };
  },
);

export const userLeads = mysqlTable('user_leads', {
  id: int('id').autoincrement().notNull(),
  firstName: varchar('first_name', { length: 200 }).notNull(),
  lastName: varchar('last_name', { length: 200 }).notNull(),
  mobile: varchar('mobile', { length: 13 }).notNull(),
  address: varchar('address', { length: 400 }),
  email: varchar('email', { length: 200 }).notNull(),
  city: varchar('city', { length: 25 }),
});

export const userMealGroups = mysqlTable(
  'user_meal_groups',
  {
    id: int('id').autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number' })
      .notNull()
      .references(() => users.id, { onDelete: 'cascade', onUpdate: 'cascade' }),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    mealDate: date('meal_date', { mode: 'string' }).notNull(),
    mealId: bigint('meal_id', { mode: 'number' }).references(() => meals.id, {
      onDelete: 'cascade',
      onUpdate: 'cascade',
    }),
    dailySlotId: int('daily_slot_id')
      .notNull()
      .references(() => dailySlots.id, {
        onDelete: 'cascade',
        onUpdate: 'cascade',
      }),
    isDefault: boolean('is_default').default(false),
    deliveryId: int('delivery_id')
      .notNull()
      .references(() => deliveries.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    deliverySlotId: int('delivery_slot_id')
      .notNull()
      .references(() => deliverySlots.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    deliveryAddressId: int('delivery_address_id')
      .notNull()
      .references(() => addresses.id, {
        onDelete: 'restrict',
        onUpdate: 'cascade',
      }),
    deliveryAddressFormatted: json('delivery_address_formatted'),
    deliveryTimeFrom: datetime('delivery_time_from', {
      mode: 'string',
    }).notNull(),
    deliveryTimeTo: datetime('delivery_time_to', { mode: 'string' }).notNull(),
    status: tinyint('status').default(2).notNull(),
    skipMealAdded: boolean('skip_meal_added').default(false),
    dailyMealRemoved: boolean('daily_meal_removed').default(false),
    lastStatusDate: datetime('last_status_date', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    orderNotes: text('order_notes'),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
    deletedAt: timestamp('deleted_at', { mode: 'string' }),
    deletedByUserAt: datetime('deleted_by_user_at', { mode: 'string' }),
  },
  (table) => {
    return {
      userIdMealDateIdx: index('user_meal_groups_user_id_meal_date_index').on(
        table.userId,
        table.mealDate,
      ),
      mealIdForeign: index('user_meal_groups_meal_id_foreign').on(table.mealId),
      dailySlotIdForeign: index('user_meal_groups_daily_slot_id_foreign').on(
        table.dailySlotId,
      ),
      deliveryId: index('delivery_id').on(table.deliveryId),
      deliverySlotId: index('delivery_slot_id').on(table.deliverySlotId),
      uniqueMealGroupIdentifier: unique('unique_meal_group_identifier').on(
        table.userId,
        table.mealDate,
        table.dailySlotId,
      ),
    };
  },
);

export const userMealGroupsRelations = relations(userMealGroups, ({ one }) => ({
  user: one(users, {
    fields: [userMealGroups.userId],
    references: [users.id],
  }),
  meal: one(meals, {
    fields: [userMealGroups.mealId],
    references: [meals.id],
  }),
  dailySlot: one(dailySlots, {
    fields: [userMealGroups.dailySlotId],
    references: [dailySlots.id],
  }),
  delivery: one(deliveries, {
    fields: [userMealGroups.deliveryId],
    references: [deliveries.id],
  }),
  deliverySlot: one(deliverySlots, {
    fields: [userMealGroups.deliverySlotId],
    references: [deliverySlots.id],
  }),
}));

export const userMealGroupsHistory = mysqlTable(
  'user_meal_groups_history',
  {
    id: int('id').autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number' }).notNull(),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    mealDate: date('meal_date', { mode: 'string' }).notNull(),
    mealId: bigint('meal_id', { mode: 'number' }),
    dailySlotId: int('daily_slot_id')
      .notNull()
      .references(() => dailySlots.id, {
        onDelete: 'restrict',
        onUpdate: 'cascade',
      }),
    deliveryId: int('delivery_id').notNull(),
    deliverySlotId: int('delivery_slot_id').notNull(),
    isDefault: boolean('is_default').default(true),
    deliveryAddressId: int('delivery_address_id')
      .notNull()
      .references(() => addresses.id, {
        onDelete: 'restrict',
        onUpdate: 'cascade',
      }),
    deliveryAddressFormatted: json('delivery_address_formatted'),
    deliveryTimeFrom: datetime('delivery_time_from', {
      mode: 'string',
    }).notNull(),
    deliveryTimeTo: datetime('delivery_time_to', { mode: 'string' }).notNull(),
    status: tinyint('status').notNull(),
    lastStatusDate: datetime('last_status_date', { mode: 'string' }),
    orderNotes: text('order_notes'),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      userIdMealDateIdx: index(
        'user_meal_groups_history_user_id_meal_date_index',
      ).on(table.userId, table.mealDate),
      mealIdForeign: index('user_meal_groups_history_meal_id_foreign').on(
        table.mealId,
      ),
    };
  },
);

export const userOrderCoupons = mysqlTable(
  'user_order_coupons',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number' }).notNull(),
    orderId: bigint('order_id', { mode: 'number' }).notNull(),
    couponId: bigint('coupon_id', { mode: 'number' }).notNull(),
    status: tinyint('status').notNull(),
    waterBottleOrder: tinyint('water_bottle_order').default(0),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      userIdIdx: index('user_order_coupons_user_id_index').on(table.userId),
      orderIdIdx: index('user_order_coupons_order_id_index').on(table.orderId),
      couponIdIdx: index('user_order_coupons_coupon_id_index').on(
        table.couponId,
      ),
    };
  },
);

export const userSubscription = mysqlTable(
  'user_subscription',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number' })
      .notNull()
      .references(() => users.id, {
        onDelete: 'restrict',
        onUpdate: 'restrict',
      }),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    startingDate: date('starting_date', { mode: 'string' }).notNull(),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    planStartDate: date('plan_start_date', { mode: 'string' }).notNull(),
    // you can use { mode: 'date' }, if you want to have Date as type for this column
    expirationDate: date('expiration_date', { mode: 'string' }).notNull(),
    dietPlanPrice: double('diet_plan_price', {
      precision: 8,
      scale: 2,
    }).notNull(),
    deliveryPrice: double('delivery_price', {
      precision: 8,
      scale: 2,
    }).notNull(),
    taxPercentage: double('tax_percentage', { precision: 8, scale: 2 }),
    totalAmount: double('total_amount', { precision: 8, scale: 2 }).notNull(),
    subscriptionDays: int('subscription_days').notNull(),
    deliveryDays: json('delivery_days'),
    dietPlanId: int('diet_plan_id').references(() => dietPlans.id, {
      onDelete: 'restrict',
      onUpdate: 'restrict',
    }),
    dietPlanPackageId: int('diet_plan_package_id').references(
      () => dietPlanPackages.id,
      { onDelete: 'restrict', onUpdate: 'restrict' },
    ),
    currency: varchar('currency', { length: 10 }).default('AED').notNull(),
    paymentMethod: varchar('payment_method', { length: 255 }),
    paymentToken: varchar('payment_token', { length: 255 }),
    initialTransactionRef: varchar('initial_transaction_ref', { length: 255 }),
    cartId: varchar('cart_id', { length: 255 }),
    lastSuccessPayment: datetime('last_success_payment', { mode: 'string' }),
    lastSuccessTransactionRef: varchar('last_success_transaction_ref', {
      length: 255,
    }),
    status: int('status').default(0).notNull(),
    autoRenew: boolean('auto_renew').default(false),
    createdAt: timestamp('created_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .notNull(),
    updatedAt: timestamp('updated_at', { mode: 'string' })
      .default('CURRENT_TIMESTAMP')
      .onUpdateNow()
      .notNull(),
    bagDeposit: double('bag_deposit'),
  },
  (table) => {
    return {
      userIdIdx: index('user_subscription_user_id_index').on(table.userId),
      dietPlanPackageId: index('diet_plan_package_id').on(
        table.dietPlanPackageId,
      ),
      dietPlanId: index('diet_plan_id').on(table.dietPlanId),
      userId: unique('user_id').on(table.userId),
    };
  },
);

export const userSubscriptionRelations = relations(
  userSubscription,
  ({ one }) => ({
    user: one(users, {
      fields: [userSubscription.userId],
      references: [users.id],
    }),
    dietPackage: one(dietPlanPackages, {
      fields: [userSubscription.dietPlanPackageId],
      references: [dietPlanPackages.id],
    }),
    dietPlan: one(dietPlans, {
      fields: [userSubscription.dietPlanId],
      references: [dietPlans.id],
    }),
  }),
);

export const userWeightLogs = mysqlTable(
  'user_weight_logs',
  {
    id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
    userId: bigint('user_id', { mode: 'number' }).notNull(),
    weight: decimal('weight', { precision: 8, scale: 2 }).notNull(),
    createdAt: timestamp('created_at', { mode: 'string' }),
    updatedAt: timestamp('updated_at', { mode: 'string' }),
  },
  (table) => {
    return {
      userIdIdx: index('user_weight_logs_user_id_index').on(table.userId),
    };
  },
);

export const verificationRequests = mysqlTable('verification_requests', {
  id: int('id').autoincrement().notNull(),
  mobile: varchar('mobile', { length: 255 }).notNull(),
  uuid: varchar('uuid', { length: 255 }).notNull(),
  activationCode: varchar('activation_code', { length: 255 }),
  activated: boolean('activated').default(false),
  ipAddress: varchar('ip_address', { length: 255 }),
  disabled: boolean('disabled').default(false),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const waterBottleOrders = mysqlTable('water_bottle_orders', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  userId: bigint('user_id', { mode: 'number' }).notNull(),
  quantity: int('quantity').notNull(),
  deliveryStatus: mysqlEnum('delivery_status', [
    'Pending',
    'Delivered',
  ]).notNull(),
  paymentStatus: mysqlEnum('payment_status', [
    'Pending',
    'Success',
    'Fail',
  ]).notNull(),
  currency: varchar('currency', { length: 255 }),
  amount: double('amount', { precision: 8, scale: 2 }),
  discount: int('discount'),
  promoCodeId: int('promo_code_id'),
  delivery: double('delivery', { precision: 8, scale: 2 }),
  totalAmount: double('total_amount', { precision: 8, scale: 2 }),
  paymentMethod: varchar('payment_method', { length: 255 }),
  description: varchar('description', { length: 255 }),
  taxPercentage: double('tax_percentage', { precision: 8, scale: 2 }),
  invitationCode: varchar('invitation_code', { length: 255 }),
  invitationDiscount: double('invitation_discount', { precision: 8, scale: 2 }),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});

export const waterNotifications = mysqlTable('water_notifications', {
  id: bigint('id', { mode: 'number' }).autoincrement().notNull(),
  name: translatedString('name').notNull(),
  description: translatedString('description').notNull(),
  waterCount: tinyint('water_count').notNull(),
  reminderHour: tinyint('reminder_hour').notNull(),
  days: json('days'),
  createdAt: timestamp('created_at', { mode: 'string' }),
  updatedAt: timestamp('updated_at', { mode: 'string' }),
});
