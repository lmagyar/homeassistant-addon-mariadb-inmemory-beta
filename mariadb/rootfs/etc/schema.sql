
CREATE TABLE `events` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin_idx` smallint(6) DEFAULT NULL,
  `time_fired` datetime(6) DEFAULT NULL,
  `context_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `context_user_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `context_parent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `ix_events_event_type_time_fired` (`event_type`,`time_fired`),
  KEY `ix_events_time_fired` (`time_fired`),
  KEY `ix_events_data_id` (`data_id`),
  KEY `ix_events_context_id` (`context_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PAGE_CHECKSUM=0 TRANSACTIONAL=0 ROW_FORMAT=DYNAMIC;

CREATE TABLE `event_data` (
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` bigint(20) DEFAULT NULL,
  `shared_data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`data_id`),
  KEY `ix_event_data_hash` (`hash`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PAGE_CHECKSUM=0 TRANSACTIONAL=0 ROW_FORMAT=DYNAMIC;

CREATE TABLE `recorder_runs` (
  `run_id` int(11) NOT NULL AUTO_INCREMENT,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `closed_incorrect` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`run_id`),
  KEY `ix_recorder_runs_start_end` (`start`,`end`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PAGE_CHECKSUM=0 TRANSACTIONAL=0 ROW_FORMAT=DYNAMIC;

CREATE TABLE `schema_changes` (
  `change_id` int(11) NOT NULL AUTO_INCREMENT,
  `schema_version` int(11) DEFAULT NULL,
  `changed` datetime DEFAULT NULL,
  PRIMARY KEY (`change_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PAGE_CHECKSUM=0 TRANSACTIONAL=0 ROW_FORMAT=DYNAMIC;

CREATE TABLE `states` (
  `state_id` int(11) NOT NULL AUTO_INCREMENT,
  `entity_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attributes` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `last_changed` datetime(6) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `old_state_id` int(11) DEFAULT NULL,
  `attributes_id` int(11) DEFAULT NULL,
  `context_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `context_user_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `context_parent_id` varchar(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `origin_idx` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`state_id`),
  KEY `ix_states_context_id` (`context_id`),
  KEY `ix_states_event_id` (`event_id`),
  KEY `ix_states_entity_id_last_updated` (`entity_id`,`last_updated`),
  KEY `ix_states_old_state_id` (`old_state_id`),
  KEY `ix_states_last_updated` (`last_updated`),
  KEY `ix_states_attributes_id` (`attributes_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PAGE_CHECKSUM=0 TRANSACTIONAL=0 ROW_FORMAT=DYNAMIC;

CREATE TABLE `state_attributes` (
  `attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` bigint(20) DEFAULT NULL,
  `shared_attrs` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`attributes_id`),
  KEY `ix_state_attributes_hash` (`hash`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PAGE_CHECKSUM=0 TRANSACTIONAL=0 ROW_FORMAT=DYNAMIC;

CREATE TABLE `statistics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) DEFAULT NULL,
  `start` datetime(6) DEFAULT NULL,
  `mean` double DEFAULT NULL,
  `min` double DEFAULT NULL,
  `max` double DEFAULT NULL,
  `last_reset` datetime(6) DEFAULT NULL,
  `state` double DEFAULT NULL,
  `sum` double DEFAULT NULL,
  `metadata_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_statistics_statistic_id_start` (`metadata_id`,`start`),
  KEY `ix_statistics_metadata_id` (`metadata_id`),
  KEY `ix_statistics_start` (`start`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PAGE_CHECKSUM=0 TRANSACTIONAL=0 ROW_FORMAT=DYNAMIC;

CREATE TABLE `statistics_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `statistic_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_of_measurement` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_mean` tinyint(1) DEFAULT NULL,
  `has_sum` tinyint(1) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_statistics_meta_statistic_id` (`statistic_id`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PAGE_CHECKSUM=0 TRANSACTIONAL=0 ROW_FORMAT=DYNAMIC;

CREATE TABLE `statistics_runs` (
  `run_id` int(11) NOT NULL AUTO_INCREMENT,
  `start` datetime DEFAULT NULL,
  PRIMARY KEY (`run_id`),
  KEY `ix_statistics_runs_start` (`start`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PAGE_CHECKSUM=0 TRANSACTIONAL=0 ROW_FORMAT=DYNAMIC;

CREATE TABLE `statistics_short_term` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) DEFAULT NULL,
  `start` datetime(6) DEFAULT NULL,
  `mean` double DEFAULT NULL,
  `min` double DEFAULT NULL,
  `max` double DEFAULT NULL,
  `last_reset` datetime(6) DEFAULT NULL,
  `state` double DEFAULT NULL,
  `sum` double DEFAULT NULL,
  `metadata_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_statistics_short_term_statistic_id_start` (`metadata_id`,`start`),
  KEY `ix_statistics_short_term_metadata_id` (`metadata_id`),
  KEY `ix_statistics_short_term_start` (`start`)
) DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci PAGE_CHECKSUM=0 TRANSACTIONAL=0 ROW_FORMAT=DYNAMIC;

-- schema_version 29 (core 2022.6.0)
INSERT IGNORE INTO `schema_changes` (`change_id`, `schema_version`, `changed`) VALUES
  (1, 29, '2022-06-01 13:25:00');
