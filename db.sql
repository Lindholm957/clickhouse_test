DROP TABLE IF EXISTS `access_logs_stat`;
CREATE TABLE access_logs_stat (
  id Int64,
  time UInt32,
  server String,
  request_time Float32 DEFAULT 0,
  request_speed Float32 DEFAULT 0,
  count UInt32,
  country String,
  slow_count UInt32,
  provider String DEFAULT '',
  service String DEFAULT '',
  region String DEFAULT '',
  cached UInt32
) ENGINE = MergeTree ORDER BY id;

DROP TABLE IF EXISTS `cdns_statistic`;
CREATE TABLE cdns_statistic (
  id UInt64,
  time UInt32,
  server String,
  cdn String,
  errors Float32,
  avg_speed Float32,
  avg_time_connect Float32,
  is_first Int8
) ENGINE = MergeTree ORDER BY id;

DROP TABLE IF EXISTS `stat`;
CREATE TABLE stat (
  id Int32,
  time UInt32,
  service String,
  server String,
  dc Nullable(String),
  traffic Nullable(UInt64)
) ENGINE = MergeTree ORDER BY id;


DROP TABLE IF EXISTS `roles`;
CREATE TABLE roles (
  id String,
  tabs String,
  api_methods String
) ENGINE = MergeTree ORDER BY id;

DROP TABLE IF EXISTS `users`;
CREATE TABLE users (
  id String,
  password String,
  role Nullable(String),
  created_at UInt32
) ENGINE = MergeTree ORDER BY (id);

INSERT INTO users VALUES ('inventos', '37f0b951e5348cca11e46e32ac372bfc0ad1d8fbf3ed51e602be14ce281b0440103b3f6b9ebd66afea5d4088abd5de254556252ba205d266e954f0753aebcd89', 'Admin', 1475589763)
