#
# Encoding: Unicode (UTF-8)
#


DROP TABLE IF EXISTS `exp_accessories`;
DROP TABLE IF EXISTS `exp_actions`;
DROP TABLE IF EXISTS `exp_captcha`;
DROP TABLE IF EXISTS `exp_categories`;
DROP TABLE IF EXISTS `exp_category_field_data`;
DROP TABLE IF EXISTS `exp_category_fields`;
DROP TABLE IF EXISTS `exp_category_groups`;
DROP TABLE IF EXISTS `exp_category_posts`;
DROP TABLE IF EXISTS `exp_channel_data`;
DROP TABLE IF EXISTS `exp_channel_entries_autosave`;
DROP TABLE IF EXISTS `exp_channel_fields`;
DROP TABLE IF EXISTS `exp_channel_member_groups`;
DROP TABLE IF EXISTS `exp_channel_titles`;
DROP TABLE IF EXISTS `exp_channels`;
DROP TABLE IF EXISTS `exp_comment_subscriptions`;
DROP TABLE IF EXISTS `exp_comments`;
DROP TABLE IF EXISTS `exp_cp_log`;
DROP TABLE IF EXISTS `exp_cp_search_index`;
DROP TABLE IF EXISTS `exp_email_cache`;
DROP TABLE IF EXISTS `exp_email_cache_mg`;
DROP TABLE IF EXISTS `exp_email_cache_ml`;
DROP TABLE IF EXISTS `exp_email_console_cache`;
DROP TABLE IF EXISTS `exp_email_tracker`;
DROP TABLE IF EXISTS `exp_entry_ping_status`;
DROP TABLE IF EXISTS `exp_entry_versioning`;
DROP TABLE IF EXISTS `exp_extensions`;
DROP TABLE IF EXISTS `exp_field_formatting`;
DROP TABLE IF EXISTS `exp_field_groups`;
DROP TABLE IF EXISTS `exp_fieldtypes`;
DROP TABLE IF EXISTS `exp_global_variables`;
DROP TABLE IF EXISTS `exp_html_buttons`;
DROP TABLE IF EXISTS `exp_layout_publish`;
DROP TABLE IF EXISTS `exp_member_bulletin_board`;
DROP TABLE IF EXISTS `exp_member_data`;
DROP TABLE IF EXISTS `exp_member_fields`;
DROP TABLE IF EXISTS `exp_member_groups`;
DROP TABLE IF EXISTS `exp_member_homepage`;
DROP TABLE IF EXISTS `exp_member_search`;
DROP TABLE IF EXISTS `exp_members`;
DROP TABLE IF EXISTS `exp_message_attachments`;
DROP TABLE IF EXISTS `exp_message_copies`;
DROP TABLE IF EXISTS `exp_message_data`;
DROP TABLE IF EXISTS `exp_message_folders`;
DROP TABLE IF EXISTS `exp_message_listed`;
DROP TABLE IF EXISTS `exp_module_member_groups`;
DROP TABLE IF EXISTS `exp_modules`;
DROP TABLE IF EXISTS `exp_online_users`;
DROP TABLE IF EXISTS `exp_pages_configuration`;
DROP TABLE IF EXISTS `exp_password_lockout`;
DROP TABLE IF EXISTS `exp_ping_servers`;
DROP TABLE IF EXISTS `exp_relationships`;
DROP TABLE IF EXISTS `exp_reset_password`;
DROP TABLE IF EXISTS `exp_revision_tracker`;
DROP TABLE IF EXISTS `exp_search`;
DROP TABLE IF EXISTS `exp_search_log`;
DROP TABLE IF EXISTS `exp_security_hashes`;
DROP TABLE IF EXISTS `exp_sessions`;
DROP TABLE IF EXISTS `exp_sites`;
DROP TABLE IF EXISTS `exp_snippets`;
DROP TABLE IF EXISTS `exp_specialty_templates`;
DROP TABLE IF EXISTS `exp_stats`;
DROP TABLE IF EXISTS `exp_status_groups`;
DROP TABLE IF EXISTS `exp_status_no_access`;
DROP TABLE IF EXISTS `exp_statuses`;
DROP TABLE IF EXISTS `exp_template_groups`;
DROP TABLE IF EXISTS `exp_template_member_groups`;
DROP TABLE IF EXISTS `exp_template_no_access`;
DROP TABLE IF EXISTS `exp_templates`;
DROP TABLE IF EXISTS `exp_throttle`;
DROP TABLE IF EXISTS `exp_upload_no_access`;
DROP TABLE IF EXISTS `exp_upload_prefs`;


CREATE TABLE `exp_accessories` (
  `accessory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(75) NOT NULL DEFAULT '',
  `member_groups` varchar(50) NOT NULL DEFAULT 'all',
  `controllers` text,
  `accessory_version` varchar(12) NOT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `word` varchar(20) NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) NOT NULL,
  `cat_url_title` varchar(75) NOT NULL,
  `cat_description` text,
  `cat_image` varchar(120) DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `field_label` varchar(50) NOT NULL DEFAULT '',
  `field_type` varchar(12) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `sort_order` char(1) NOT NULL DEFAULT 'a',
  `field_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `can_edit_categories` text,
  `can_delete_categories` text,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `field_id_2` text,
  `field_ft_2` tinytext,
  `field_id_3` text,
  `field_ft_3` tinytext,
  `field_id_4` text,
  `field_ft_4` tinytext,
  `field_id_5` text,
  `field_ft_5` tinytext,
  `field_id_6` text,
  `field_ft_6` tinytext,
  `field_id_7` text,
  `field_ft_7` tinytext,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pentry_id` int(10) NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(16) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL DEFAULT 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) NOT NULL,
  `field_label` varchar(50) NOT NULL,
  `field_instructions` text,
  `field_type` varchar(50) NOT NULL DEFAULT 'text',
  `field_list_items` text NOT NULL,
  `field_pre_populate` char(1) NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_related_to` varchar(12) NOT NULL DEFAULT 'channel',
  `field_related_id` int(6) unsigned NOT NULL DEFAULT '0',
  `field_related_orderby` varchar(12) NOT NULL DEFAULT 'date',
  `field_related_sort` varchar(4) NOT NULL DEFAULT 'desc',
  `field_related_max` smallint(4) NOT NULL DEFAULT '0',
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) NOT NULL DEFAULT 'ltr',
  `field_search` char(1) NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) NOT NULL DEFAULT 'any',
  `field_settings` text,
  PRIMARY KEY (`field_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `pentry_id` int(10) NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(16) NOT NULL,
  `title` varchar(100) NOT NULL,
  `url_title` varchar(75) NOT NULL,
  `status` varchar(50) NOT NULL,
  `versioning_enabled` char(1) NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) NOT NULL DEFAULT 'y',
  `sticky` varchar(1) NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `dst_enabled` varchar(1) NOT NULL DEFAULT 'n',
  `year` char(4) NOT NULL,
  `month` char(2) NOT NULL,
  `day` char(3) NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) NOT NULL,
  `channel_title` varchar(100) NOT NULL,
  `channel_url` varchar(100) NOT NULL,
  `channel_description` varchar(225) DEFAULT NULL,
  `channel_lang` varchar(12) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) DEFAULT NULL,
  `status_group` int(4) unsigned DEFAULT NULL,
  `deft_status` varchar(50) NOT NULL DEFAULT 'open',
  `field_group` int(4) unsigned DEFAULT NULL,
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) DEFAULT NULL,
  `deft_comments` char(1) NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) NOT NULL DEFAULT 'all',
  `channel_allow_img_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `channel_notify` char(1) NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) DEFAULT NULL,
  `comment_url` varchar(80) DEFAULT NULL,
  `comment_system_enabled` char(1) NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) NOT NULL DEFAULT 'n',
  `comment_use_captcha` char(1) NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(5) NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) NOT NULL DEFAULT 'y',
  `comment_notify` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) DEFAULT NULL,
  `ping_return_url` varchar(80) DEFAULT NULL,
  `show_button_cluster` char(1) NOT NULL DEFAULT 'y',
  `rss_url` varchar(80) DEFAULT NULL,
  `enable_versioning` char(1) NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) DEFAULT NULL,
  `url_title_prefix` varchar(80) DEFAULT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`),
  KEY `status_group` (`status_group`),
  KEY `field_group` (`field_group`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(50) DEFAULT NULL,
  `subscription_date` varchar(10) DEFAULT NULL,
  `notification_sent` char(1) DEFAULT 'n',
  `hash` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT '0',
  `channel_id` int(4) unsigned DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT '0',
  `status` char(1) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `url` varchar(75) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `ip_address` varchar(16) DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text,
  PRIMARY KEY (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(32) NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_cp_search_index` (
  `search_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(20) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `access` varchar(50) DEFAULT NULL,
  `keywords` text,
  PRIMARY KEY (`search_id`),
  FULLTEXT KEY `keywords` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) NOT NULL,
  `from_email` varchar(70) NOT NULL,
  `recipient` text NOT NULL,
  `cc` text NOT NULL,
  `bcc` text NOT NULL,
  `recipient_array` mediumtext NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  `plaintext_alt` mediumtext NOT NULL,
  `mailinglist` char(1) NOT NULL DEFAULT 'n',
  `mailtype` varchar(6) NOT NULL,
  `text_fmt` varchar(40) NOT NULL,
  `wordwrap` char(1) NOT NULL DEFAULT 'y',
  `priority` char(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `recipient` varchar(70) NOT NULL,
  `recipient_name` varchar(50) NOT NULL,
  `subject` varchar(120) NOT NULL,
  `message` mediumtext NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_email_tracker` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_ip` varchar(16) NOT NULL,
  `sender_email` varchar(75) NOT NULL,
  `sender_username` varchar(50) NOT NULL,
  `number_recipients` int(4) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `exp_entry_ping_status` (
  `entry_id` int(10) unsigned NOT NULL,
  `ping_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`ping_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '',
  `hook` varchar(50) NOT NULL DEFAULT '',
  `settings` text NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) NOT NULL DEFAULT '',
  `enabled` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_field_formatting` (
  `formatting_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned NOT NULL,
  `field_fmt` varchar(40) NOT NULL,
  PRIMARY KEY (`formatting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `version` varchar(12) NOT NULL,
  `settings` text,
  `has_global_settings` char(1) DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) NOT NULL,
  `variable_data` text NOT NULL,
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) NOT NULL,
  `tag_open` varchar(120) NOT NULL,
  `tag_close` varchar(120) NOT NULL,
  `accesskey` varchar(32) NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) NOT NULL DEFAULT '1',
  `classname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_group` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `field_layout` text,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `member_group` (`member_group`),
  KEY `channel_id` (`channel_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) NOT NULL,
  `m_field_label` varchar(50) NOT NULL,
  `m_field_description` text NOT NULL,
  `m_field_type` varchar(12) NOT NULL DEFAULT 'text',
  `m_field_list_items` text NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) NOT NULL,
  `m_field_width` varchar(6) NOT NULL,
  `m_field_search` char(1) NOT NULL DEFAULT 'y',
  `m_field_required` char(1) NOT NULL DEFAULT 'n',
  `m_field_public` char(1) NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) NOT NULL DEFAULT 'none',
  `m_field_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`m_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) NOT NULL,
  `group_description` text NOT NULL,
  `is_locked` char(1) NOT NULL DEFAULT 'y',
  `can_view_offline_system` char(1) NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) NOT NULL DEFAULT 'y',
  `can_access_content` char(1) NOT NULL DEFAULT 'n',
  `can_access_publish` char(1) NOT NULL DEFAULT 'n',
  `can_access_edit` char(1) NOT NULL DEFAULT 'n',
  `can_access_files` char(1) NOT NULL DEFAULT 'n',
  `can_access_design` char(1) NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) NOT NULL DEFAULT 'n',
  `can_access_modules` char(1) NOT NULL DEFAULT 'n',
  `can_access_extensions` char(1) NOT NULL DEFAULT 'n',
  `can_access_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_access_plugins` char(1) NOT NULL DEFAULT 'n',
  `can_access_members` char(1) NOT NULL DEFAULT 'n',
  `can_access_admin` char(1) NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_content_prefs` char(1) NOT NULL DEFAULT 'n',
  `can_access_tools` char(1) NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) NOT NULL DEFAULT 'n',
  `can_access_data` char(1) NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) NOT NULL DEFAULT 'n',
  `can_admin_members` char(1) NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) NOT NULL DEFAULT 'n',
  `can_admin_modules` char(1) NOT NULL DEFAULT 'n',
  `can_admin_templates` char(1) NOT NULL DEFAULT 'n',
  `can_admin_accessories` char(1) NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) NOT NULL DEFAULT 'n',
  `can_send_email` char(1) NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) NOT NULL DEFAULT 'n',
  `can_email_mailinglist` char(1) NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) DEFAULT NULL,
  `can_post_comments` char(1) NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) NOT NULL DEFAULT 'n',
  `can_search` char(1) NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) NOT NULL DEFAULT 'y',
  `include_in_mailinglists` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`group_id`,`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_member_homepage` (
  `member_id` int(10) unsigned NOT NULL,
  `recent_entries` char(1) NOT NULL DEFAULT 'l',
  `recent_entries_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_comments` char(1) NOT NULL DEFAULT 'l',
  `recent_comments_order` int(3) unsigned NOT NULL DEFAULT '0',
  `recent_members` char(1) NOT NULL DEFAULT 'n',
  `recent_members_order` int(3) unsigned NOT NULL DEFAULT '0',
  `site_statistics` char(1) NOT NULL DEFAULT 'r',
  `site_statistics_order` int(3) unsigned NOT NULL DEFAULT '0',
  `member_search_form` char(1) NOT NULL DEFAULT 'n',
  `member_search_form_order` int(3) unsigned NOT NULL DEFAULT '0',
  `notepad` char(1) NOT NULL DEFAULT 'r',
  `notepad_order` int(3) unsigned NOT NULL DEFAULT '0',
  `bulletin_board` char(1) NOT NULL DEFAULT 'r',
  `bulletin_board_order` int(3) unsigned NOT NULL DEFAULT '0',
  `pmachine_news_feed` char(1) NOT NULL DEFAULT 'n',
  `pmachine_news_feed_order` int(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) NOT NULL,
  `fields` varchar(200) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `total_results` int(8) unsigned NOT NULL,
  `query` text NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `unique_id` varchar(40) NOT NULL,
  `crypt_key` varchar(40) DEFAULT NULL,
  `authcode` varchar(10) DEFAULT NULL,
  `email` varchar(72) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `occupation` varchar(80) DEFAULT NULL,
  `interests` varchar(120) DEFAULT NULL,
  `bday_d` int(2) DEFAULT NULL,
  `bday_m` int(2) DEFAULT NULL,
  `bday_y` int(4) DEFAULT NULL,
  `aol_im` varchar(50) DEFAULT NULL,
  `yahoo_im` varchar(50) DEFAULT NULL,
  `msn_im` varchar(50) DEFAULT NULL,
  `icq` varchar(50) DEFAULT NULL,
  `bio` text,
  `signature` text,
  `avatar_filename` varchar(120) DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` smallint(5) unsigned NOT NULL DEFAULT '0',
  `total_comments` smallint(5) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) NOT NULL DEFAULT 'y',
  `display_avatars` char(1) NOT NULL DEFAULT 'y',
  `display_signatures` char(1) NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) NOT NULL DEFAULT 'y',
  `language` varchar(50) NOT NULL,
  `timezone` varchar(8) NOT NULL,
  `daylight_savings` char(1) NOT NULL DEFAULT 'n',
  `localization_is_site_default` char(1) NOT NULL DEFAULT 'n',
  `time_format` char(2) NOT NULL DEFAULT 'us',
  `cp_theme` varchar(32) DEFAULT NULL,
  `profile_theme` varchar(32) DEFAULT NULL,
  `forum_theme` varchar(32) DEFAULT NULL,
  `tracker` text,
  `template_size` varchar(2) NOT NULL DEFAULT '20',
  `notepad` text,
  `notepad_size` varchar(2) NOT NULL DEFAULT '18',
  `quick_links` text,
  `quick_tabs` text,
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) NOT NULL DEFAULT '',
  `attachment_location` varchar(150) NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) NOT NULL DEFAULT 'n',
  `message_read` char(1) NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) NOT NULL DEFAULT '',
  `message_deleted` char(1) NOT NULL DEFAULT 'n',
  `message_status` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) NOT NULL DEFAULT '',
  `message_body` text NOT NULL,
  `message_tracking` char(1) NOT NULL DEFAULT 'y',
  `message_attachments` char(1) NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) NOT NULL DEFAULT '',
  `message_cc` varchar(200) NOT NULL DEFAULT '',
  `message_hide_cc` char(1) NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) NOT NULL DEFAULT '',
  `folder4_name` varchar(50) NOT NULL DEFAULT '',
  `folder5_name` varchar(50) NOT NULL DEFAULT '',
  `folder6_name` varchar(50) NOT NULL DEFAULT '',
  `folder7_name` varchar(50) NOT NULL DEFAULT '',
  `folder8_name` varchar(50) NOT NULL DEFAULT '',
  `folder9_name` varchar(50) NOT NULL DEFAULT '',
  `folder10_name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) NOT NULL DEFAULT '',
  `listed_type` varchar(10) NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) NOT NULL,
  `module_version` varchar(12) NOT NULL,
  `has_cp_backend` char(1) NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) NOT NULL DEFAULT 'n',
  `name` varchar(50) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_pages_configuration` (
  `configuration_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(8) unsigned NOT NULL DEFAULT '1',
  `configuration_name` varchar(60) NOT NULL,
  `configuration_value` varchar(100) NOT NULL,
  PRIMARY KEY (`configuration_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_ping_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `server_name` varchar(32) NOT NULL,
  `server_url` varchar(150) NOT NULL,
  `port` varchar(4) NOT NULL DEFAULT '80',
  `ping_protocol` varchar(12) NOT NULL DEFAULT 'xmlrpc',
  `is_default` char(1) NOT NULL DEFAULT 'y',
  `server_order` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_relationships` (
  `rel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `rel_parent_id` int(10) NOT NULL DEFAULT '0',
  `rel_child_id` int(10) NOT NULL DEFAULT '0',
  `rel_type` varchar(12) NOT NULL,
  `rel_data` mediumtext NOT NULL,
  `reverse_rel_data` mediumtext NOT NULL,
  PRIMARY KEY (`rel_id`),
  KEY `rel_parent_id` (`rel_parent_id`),
  KEY `rel_child_id` (`rel_child_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) NOT NULL,
  `item_field` varchar(20) NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_search` (
  `search_id` varchar(32) NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext,
  `custom_fields` mediumtext,
  `result_page` varchar(70) NOT NULL,
  PRIMARY KEY (`search_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) NOT NULL,
  `search_terms` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `hash` varchar(40) NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM AUTO_INCREMENT=342 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `user_agent` varchar(50) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) NOT NULL DEFAULT '',
  `site_name` varchar(50) NOT NULL DEFAULT '',
  `site_description` text,
  `site_system_preferences` text NOT NULL,
  `site_mailinglist_preferences` text NOT NULL,
  `site_member_preferences` text NOT NULL,
  `site_template_preferences` text NOT NULL,
  `site_channel_preferences` text NOT NULL,
  `site_bootstrap_checksums` text NOT NULL,
  `site_pages` text NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) NOT NULL,
  `snippet_contents` text,
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) NOT NULL DEFAULT 'y',
  `template_name` varchar(50) NOT NULL,
  `data_title` varchar(80) NOT NULL,
  `template_data` text NOT NULL,
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_status_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `status` varchar(50) NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) NOT NULL,
  PRIMARY KEY (`status_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) NOT NULL,
  `save_template_file` char(1) NOT NULL DEFAULT 'n',
  `template_type` varchar(16) NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext,
  `template_notes` text,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) NOT NULL DEFAULT '',
  `enable_http_auth` char(1) NOT NULL DEFAULT 'n',
  `allow_php` char(1) NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(16) NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `upload_loc` varchar(3) NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


CREATE TABLE `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `server_path` varchar(150) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL,
  `allowed_types` varchar(3) NOT NULL DEFAULT 'img',
  `max_size` varchar(16) DEFAULT NULL,
  `max_height` varchar(6) DEFAULT NULL,
  `max_width` varchar(6) DEFAULT NULL,
  `properties` varchar(120) DEFAULT NULL,
  `pre_format` varchar(120) DEFAULT NULL,
  `post_format` varchar(120) DEFAULT NULL,
  `file_properties` varchar(120) DEFAULT NULL,
  `file_pre_format` varchar(120) DEFAULT NULL,
  `file_post_format` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;




SET FOREIGN_KEY_CHECKS = 0;


LOCK TABLES `exp_accessories` WRITE;
INSERT INTO `exp_accessories` (`accessory_id`, `class`, `member_groups`, `controllers`, `accessory_version`) VALUES (1, 'Expressionengine_info_acc', '1|5', 'addons|addons_accessories|addons_extensions|addons_fieldtypes|addons_modules|addons_plugins|admin_content|admin_system|content|content_edit|content_files|content_publish|design|homepage|members|myaccount|tools|tools_communicate|tools_data|tools_logs|tools_utilities', '1.0');
UNLOCK TABLES;


LOCK TABLES `exp_actions` WRITE;
INSERT INTO `exp_actions` (`action_id`, `class`, `method`) VALUES (1, 'Comment', 'insert_new_comment');
INSERT INTO `exp_actions` (`action_id`, `class`, `method`) VALUES (2, 'Comment_mcp', 'delete_comment_notification');
INSERT INTO `exp_actions` (`action_id`, `class`, `method`) VALUES (3, 'Comment', 'comment_subscribe');
INSERT INTO `exp_actions` (`action_id`, `class`, `method`) VALUES (4, 'Comment', 'edit_comment');
INSERT INTO `exp_actions` (`action_id`, `class`, `method`) VALUES (5, 'Email', 'send_email');
INSERT INTO `exp_actions` (`action_id`, `class`, `method`) VALUES (6, 'Search', 'do_search');
INSERT INTO `exp_actions` (`action_id`, `class`, `method`) VALUES (7, 'Channel', 'insert_new_entry');
INSERT INTO `exp_actions` (`action_id`, `class`, `method`) VALUES (8, 'Channel', 'filemanager_endpoint');
INSERT INTO `exp_actions` (`action_id`, `class`, `method`) VALUES (9, 'Channel', 'smiley_pop');
UNLOCK TABLES;


LOCK TABLES `exp_captcha` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_categories` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_category_field_data` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_category_fields` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_category_groups` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_category_posts` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_channel_data` WRITE;
INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`) VALUES (1, 1, 1, '2010', 'none', 'ongoing', 'none', 'http://www.igloo.com.au', 'none', '<p>Working on high quality websites such as <a href="http://www.mazda.com.au" target="_blank">Mazda.com.au</a> and as a lead front end developer on a brand new social networking service launching soon.<br /> <br /><strong>Technologies:</strong> HTML, CSS, XSLT, jQuery, jQuery UI, AJAX, APIs (Google Maps, Twitter, Flickr, Youtube, Facebook), SVN, PHP. <br /><br /> <strong>Softwares:</strong> Mac OSX, Textmate, Versions, Snippets, Photoshop CS 5, Sitecore, Transmit, Sequel Pro, Firebug, Mamp, CSS Edit.</p>', 'none', NULL, 'none', NULL, 'none');
INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`) VALUES (2, 1, 1, '2009', 'none', '2010', 'none', 'http://smokintops.com', 'none', '<p>Social Network allowing its community to create and share Top lists.<br /> Owner, Designer, Developer, Strategist.                             <br />Technologies:  HTML, CSS, PHP 5 (CakePHP), JavaScript (jQuery), AJAX,  MySQL, APIs, Photoshop, Illustrator</p>', 'none', NULL, 'none', NULL, 'none');
INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`) VALUES (3, 1, 1, '2008', 'none', '2010', 'none', '', 'none', '<p>University of Montreal / HEC Montreal (International Business School),  Montreal, Canada 						<br /> Major in Social Media / Web 2.0</p>', 'none', NULL, 'none', NULL, 'none');
INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`) VALUES (4, 1, 1, '2007', 'none', '2007', 'none', '', 'none', '<p>University of Montreal, Montreal, Canada</p>', 'none', NULL, 'none', NULL, 'none');
INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`) VALUES (5, 1, 1, '2004', 'none', '2007', 'none', '', 'none', '<p>Laval University, Quebec City, Canada <br /> Major in Software Engineering</p>', 'none', NULL, 'none', NULL, 'none');
INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`) VALUES (6, 1, 1, '2001', 'none', '2003', 'none', '', 'none', '<p>University of Toulouse, Toulouse, France</p>', 'none', NULL, 'none', NULL, 'none');
INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`) VALUES (7, 1, 1, '2001', 'none', '2003', 'none', '', 'none', '<p>Lyc&eacute;e G&eacute;n&eacute;ral Las Cases, Lavaur, France<br /> Major: Economics and Social Science (Advanced)</p>', 'none', NULL, 'none', NULL, 'none');
INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`) VALUES (8, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '<p><em>MAY 2008 - AUGUST 2008 </em><br /> Backpacking in South-East Asia<br /> Thailand, Vietnam, Laos, Malaysia, Indonesia, Brunei, Singapore.</p>
<p><em>SEPTEMBER 2007 </em> <br /> Montreal International Half Marathon<br /> Montreal, Canada</p>
<p><em>FEBRUARY 2006 </em> <br /> Computer System Security Contest  <br /> CRIM, Montreal, Canada</p>
<p><em>SEPETEMBER 2003 - JUNE 2004 </em> <br /> Language Studies International - Intensive English Courses <br /> Brisbane, QLD</p>', 'none', 'Extra', 'none');
INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`) VALUES (9, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '<p><strong>Internet:</strong> blogs, news, Web 2.0. <br /> <strong>Music:</strong> accoustic guitar player, indie.          <br /> <strong>Sports: </strong> soccer, ice hockey.                           <br /> <strong>Culture:</strong> travels &amp; documentaries.</p>', 'none', 'Interests', 'none');
INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`) VALUES (10, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '<p>La Vie En Rose</p>
<p><em>MAY 2007 - AUGUST 2007</em><br /> Planning and developing an Object-oriented .NET (using C#) application which manages the hardware stock nation-wide. <br />Implementating a SQL database (using Microsoft SQL Server).</p>
<p>GTI Canada Inc.</p>
<p><em>JANUARY 2007 - APRIL 2007</em> <br /> Developing and maintaining several FileMaker Pro applications. <br /> Managing the customer communication with Bell Canada. Attending and contributing to meetings.</p>
<p>French Ministry Of Industry</p>
<p><em>SUMMER INTERNS 2003 - 2006</em> <br /> Developing PHP/ASP applications.<br /> Fixing bugs on existing applications.</p>', 'none', 'Employement', 'none');
INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`) VALUES (11, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '<p><strong>WEB RELATED TECHNOLOGIES</strong><br /> PHP (specifically PHP5) <br />MVC Frameworks  (especially CakePHP) <br />Object Oriented Programming<br /> HTML/CSS/XML  <br />Javascript,  \'AJAX\'  and JQuery framework <br />Database Design and Query Optimization, MySQL <br />Photoshop, Illustrator, Nusphere PhpED</p>
<p><strong>E-BUSINESS RELATED SKILLS</strong><br /> Major Business Models<br /> Online Advertising <br />Social Media Marketing<br /> Search Engine Marketing / SEM<br /> Search Engine Optimisation / SEO  <br />General knowledge of Internet laws</p>
<p><strong>FOREIGN LANGUAGE</strong><br /> French (native)<br /> English (fluent)<br /> Spanish (intermediate)</p>', 'none', 'Skills', 'none');
INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`, `field_id_2`, `field_ft_2`, `field_id_3`, `field_ft_3`, `field_id_4`, `field_ft_4`, `field_id_5`, `field_ft_5`, `field_id_6`, `field_ft_6`, `field_id_7`, `field_ft_7`) VALUES (12, 1, 2, '', NULL, '', NULL, '', NULL, '', NULL, '<p>I am a hard working, quick learner, sociable and passionate person, always looking to grow my knowledge and learn new technologies and skills related to the Web. <br /><br /> I am presently fulfilling a web developer position at Igloo, digital agency where I am in charge of the front-end development of an online social website for of australia&rsquo;s leading magazine. <br /><br /> In addition, as an accomplishment of my e-business masters degree I&lsquo;ve developed my own project from scratch named <a href="http://smokintops.com" target="_blank">Smokin&rsquo; Tops </a> which is a social network allowing its community to create and share Top lists.</p>', 'none', 'About', 'none');
UNLOCK TABLES;


LOCK TABLES `exp_channel_entries_autosave` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_channel_fields` WRITE;
INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_related_to`, `field_related_id`, `field_related_orderby`, `field_related_sort`, `field_related_max`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`) VALUES (6, 1, 2, 'section_content', 'content', 'Enter the Section Content', 'nsm_tiny_mce', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'n', 'n', 'none', 'n', 2, 'any', 'YTo4OntzOjQ6ImNvbmYiO3M6MTE6ImFkdmFuY2VkLmpzIjtzOjY6ImhlaWdodCI7czozOiIzMDAiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ==');
INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_related_to`, `field_related_id`, `field_related_orderby`, `field_related_sort`, `field_related_max`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`) VALUES (2, 1, 1, 'job_start_year', 'Job start year', 'Enter the job start year', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'n', 2, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30=');
INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_related_to`, `field_related_id`, `field_related_orderby`, `field_related_sort`, `field_related_max`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`) VALUES (3, 1, 1, 'job_end_year', 'Job end year', 'Enter the job end year', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'y', 'n', 'none', 'n', 3, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30=');
INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_related_to`, `field_related_id`, `field_related_orderby`, `field_related_sort`, `field_related_max`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`) VALUES (4, 1, 1, 'job_company_website_url', 'Company Website Url', 'Enter the company website url', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'y', 'n', 'none', 'y', 4, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30=');
INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_related_to`, `field_related_id`, `field_related_orderby`, `field_related_sort`, `field_related_max`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`) VALUES (5, 1, 1, 'job_description', 'Job Description', 'Enter a short job description', 'nsm_tiny_mce', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'n', 'ltr', 'y', 'n', 'none', 'n', 5, 'any', 'YTo4OntzOjQ6ImNvbmYiO3M6MTE6ImFkdmFuY2VkLmpzIjtzOjY6ImhlaWdodCI7czozOiIzMDAiO3M6MTg6ImZpZWxkX3Nob3dfc21pbGV5cyI7czoxOiJuIjtzOjE5OiJmaWVsZF9zaG93X2dsb3NzYXJ5IjtzOjE6Im4iO3M6MjE6ImZpZWxkX3Nob3dfc3BlbGxjaGVjayI7czoxOiJuIjtzOjI2OiJmaWVsZF9zaG93X2Zvcm1hdHRpbmdfYnRucyI7czoxOiJuIjtzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoyMDoiZmllbGRfc2hvd193cml0ZW1vZGUiO3M6MToibiI7fQ==');
INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `group_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_related_to`, `field_related_id`, `field_related_orderby`, `field_related_sort`, `field_related_max`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`) VALUES (7, 1, 2, 'section_menu_title', 'Menu title', 'Enter the menu title', 'text', '', '0', 0, 0, 'channel', 1, 'title', 'desc', 0, 6, 128, 'y', 'ltr', 'n', 'n', 'none', 'y', 1, 'any', 'YTo3OntzOjE4OiJmaWVsZF9jb250ZW50X3RleHQiO2I6MDtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoxOToiZmllbGRfc2hvd19nbG9zc2FyeSI7czoxOiJuIjtzOjIxOiJmaWVsZF9zaG93X3NwZWxsY2hlY2siO3M6MToibiI7czoyNjoiZmllbGRfc2hvd19mb3JtYXR0aW5nX2J0bnMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO3M6MjA6ImZpZWxkX3Nob3dfd3JpdGVtb2RlIjtzOjE6Im4iO30=');
UNLOCK TABLES;


LOCK TABLES `exp_channel_member_groups` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_channel_titles` WRITE;
INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES (1, 1, 1, 1, 0, 0, '0.0.0.0', 'Web Developer at Igloo - Website Design & Digital Agency', 'web_developer_at_igloo_website_design_digital_agency', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1291590426, 'n', '2010', '12', '06', 0, 0, 20101206104607, 0, 0);
INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES (2, 1, 1, 1, 0, 0, '0.0.0.0', 'Developing Smokin\' Tops as part of my studies', 'developing_smokin_tops_as_part_of_my_studies', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1291592841, 'n', '2010', '12', '06', 0, 0, 20101206110022, 0, 0);
INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES (3, 1, 1, 1, 0, 0, '0.0.0.0', 'M.Sc Electronic Commerce', 'm.sc_electronic_commerce', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1291593657, 'n', '2010', '12', '06', 0, 0, 20101206110158, 0, 0);
INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES (4, 1, 1, 1, 0, 0, '0.0.0.0', 'Multimedia Technologies Diploma', 'multimedia_technologies_diploma', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1291593877, 'n', '2010', '12', '06', 0, 0, 20101206110538, 0, 0);
INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES (5, 1, 1, 1, 0, 0, '0.0.0.0', 'B.Sc Computer Science', 'b.sc_computer_science', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1291593929, 'n', '2010', '12', '06', 0, 0, 20101206110631, 0, 0);
INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES (6, 1, 1, 1, 0, 0, '0.0.0.0', 'Computer Science Diploma', 'computer_science_diploma', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1291593964, 'n', '2010', '12', '06', 0, 0, 20101206110705, 0, 0);
INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES (7, 1, 1, 1, 0, 0, '0.0.0.0', 'Baccalaureate', 'baccalaureate', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1291594064, 'n', '2010', '12', '06', 0, 0, 20101206110745, 0, 0);
INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES (8, 1, 2, 1, 0, 0, '0.0.0.0', 'Extra Curricular', 'extra_curricular', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1291596548, 'n', '2010', '12', '06', 0, 0, 20101206115009, 0, 0);
INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES (9, 1, 2, 1, 0, 0, '0.0.0.0', 'Interests', 'interests', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1291597315, 'n', '2010', '12', '06', 0, 0, 20101206120156, 0, 0);
INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES (10, 1, 2, 1, 0, 0, '0.0.0.0', 'Employement', 'employement', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1291597368, 'n', '2010', '12', '06', 0, 0, 20101206120249, 0, 0);
INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES (11, 1, 2, 1, 0, 0, '0.0.0.0', 'Skills', 'skills', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1291597423, 'n', '2010', '12', '06', 0, 0, 20101206120844, 0, 0);
INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `pentry_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `dst_enabled`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES (12, 1, 2, 1, 0, 0, '0.0.0.0', 'About', 'about', 'open', 'y', 0, 0, 0, 0, 'y', 'n', 1291597476, 'n', '2010', '12', '06', 0, 0, 20101206120437, 0, 0);
UNLOCK TABLES;


LOCK TABLES `exp_channels` WRITE;
INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `status_group`, `deft_status`, `field_group`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_use_captcha`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `ping_return_url`, `show_button_cluster`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `url_title_prefix`, `live_look_template`) VALUES (1, 1, 'job', 'Job', 'http://localhost/personnalwebsite/index.php', '', 'en', 7, 0, 0, 0, NULL, NULL, 'open', 1, 3, '', 'y', 'y', NULL, 'all', 'y', 'y', 'n', '', '', 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'y', '', 'n', 10, '', '', 0);
INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `status_group`, `deft_status`, `field_group`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_use_captcha`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `ping_return_url`, `show_button_cluster`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `url_title_prefix`, `live_look_template`) VALUES (2, 1, 'section', 'Section', 'http://localhost/personnalwebsite/index.php', NULL, 'en', 5, 0, 0, 0, '', 0, 'open', 2, NULL, NULL, 'y', 'y', NULL, 'all', 'y', 'y', 'n', NULL, NULL, 'y', 'n', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'y', NULL, 'n', 10, '', '', 0);
UNLOCK TABLES;


LOCK TABLES `exp_comment_subscriptions` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_comments` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_cp_log` WRITE;
INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES (1, 1, 1, 'matthieu', '0.0.0.0', 1291547143, 'Logged in');
INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES (2, 1, 1, 'matthieu', '0.0.0.0', 1291588789, 'Logged in');
INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES (3, 1, 1, 'matthieu', '0.0.0.0', 1291588965, 'Field Group Created:&nbsp;job');
INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES (4, 1, 1, 'matthieu', '0.0.0.0', 1291590324, 'Channel Created:&nbsp;&nbsp;job');
INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES (5, 1, 1, 'matthieu', '0.0.0.0', 1291590605, 'Custom Field Deleted:&nbsp;Job Title');
INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES (6, 1, 1, 'matthieu', '0.0.0.0', 1291596266, 'Field Group Created:&nbsp;section');
INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES (7, 1, 1, 'matthieu', '0.0.0.0', 1291596374, 'Channel Created:&nbsp;&nbsp;Section');
UNLOCK TABLES;


LOCK TABLES `exp_cp_search_index` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_email_cache` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_email_cache_mg` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_email_cache_ml` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_email_console_cache` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_email_tracker` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_entry_ping_status` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_entry_versioning` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_extensions` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_field_formatting` WRITE;
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (18, 6, 'xhtml');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (17, 6, 'br');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (16, 6, 'none');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (4, 2, 'none');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (5, 2, 'br');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (6, 2, 'xhtml');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (7, 3, 'none');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (8, 3, 'br');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (9, 3, 'xhtml');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (10, 4, 'none');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (11, 4, 'br');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (12, 4, 'xhtml');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (13, 5, 'none');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (14, 5, 'br');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (15, 5, 'xhtml');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (19, 7, 'none');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (20, 7, 'br');
INSERT INTO `exp_field_formatting` (`formatting_id`, `field_id`, `field_fmt`) VALUES (21, 7, 'xhtml');
UNLOCK TABLES;


LOCK TABLES `exp_field_groups` WRITE;
INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`) VALUES (1, 1, 'job');
INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`) VALUES (2, 1, 'section');
UNLOCK TABLES;


LOCK TABLES `exp_fieldtypes` WRITE;
INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES (1, 'select', '1.0', 'YTowOnt9', 'n');
INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES (2, 'text', '1.0', 'YTowOnt9', 'n');
INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES (3, 'textarea', '1.0', 'YTowOnt9', 'n');
INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES (4, 'date', '1.0', 'YTowOnt9', 'n');
INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES (5, 'file', '1.0', 'YTowOnt9', 'n');
INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES (6, 'multi_select', '1.0', 'YTowOnt9', 'n');
INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES (7, 'checkboxes', '1.0', 'YTowOnt9', 'n');
INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES (8, 'radio', '1.0', 'YTowOnt9', 'n');
INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES (9, 'rel', '1.0', 'YTowOnt9', 'n');
INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES (10, 'nsm_tiny_mce', '1.1.0', 'YTowOnt9', 'n');
UNLOCK TABLES;


LOCK TABLES `exp_global_variables` WRITE;
INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES (1, 1, 'my_email', 'matthieu.aussaguel@gmail.com');
INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES (2, 1, 'my_maps_resume_url', 'http://bit.ly/MapsResume');
INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES (3, 1, 'my_twitter_account_url', 'http://www.twitter.com/matthieu_tweets');
INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES (4, 1, 'my_facebook_profile_url', 'http://www.facebook.com/matthieu.aussaguel');
INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES (5, 1, 'my_github_profile_url', 'http://github.com/matthieua');
INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES (6, 1, 'my_delicious_profile_url', 'http://delicious.com/gingle');
INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES (7, 1, 'my_linkedin_profile_url', 'http://www.linkedin.com/in/matthieuaussaguel');
INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES (8, 1, 'my_pdf_resume_url', 'http://www.mynameismatthieu.com/resources/files/resume_matthieu_aussaguel.pdf');
INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES (9, 1, 'my_current_address', ' Melbourne, VIC, Australia');
INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES (10, 1, 'my_current_phone_number', '0404 389 245');
INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES (11, 1, 'my_first_name', 'Matthieu');
INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES (12, 1, 'my_last_name', 'Aussaguel');
INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES (13, 1, 'my_current_city', 'Melbourne');
INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`) VALUES (14, 1, 'my_current_position', 'Web Developer');
UNLOCK TABLES;


LOCK TABLES `exp_html_buttons` WRITE;
INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES (1, 1, 0, 'b', '<strong>', '</strong>', 'b', 1, '1', 'btn_b');
INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES (2, 1, 0, 'i', '<em>', '</em>', 'i', 2, '1', 'btn_i');
INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES (3, 1, 0, 'blockquote', '<blockquote>', '</blockquote>', 'q', 3, '1', 'btn_blockquote');
INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES (4, 1, 0, 'a', '<a href="[![Link:!:http://]!]"(!( title="[![Title]!]")!)>', '</a>', 'a', 4, '1', 'btn_a');
INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES (5, 1, 0, 'img', '<img src="[![Link:!:http://]!]" alt="[![Alternative text]!]" />', '', '', 5, '1', 'btn_img');
UNLOCK TABLES;


LOCK TABLES `exp_layout_publish` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_member_bulletin_board` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_member_data` WRITE;
INSERT INTO `exp_member_data` (`member_id`) VALUES (1);
UNLOCK TABLES;


LOCK TABLES `exp_member_fields` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_member_groups` WRITE;
INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_content`, `can_access_publish`, `can_access_edit`, `can_access_files`, `can_access_design`, `can_access_addons`, `can_access_modules`, `can_access_extensions`, `can_access_accessories`, `can_access_plugins`, `can_access_members`, `can_access_admin`, `can_access_sys_prefs`, `can_access_content_prefs`, `can_access_tools`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_design`, `can_admin_members`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_modules`, `can_admin_templates`, `can_admin_accessories`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_email`, `can_send_cached_email`, `can_email_member_groups`, `can_email_mailinglist`, `can_email_from_profile`, `can_view_profiles`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `include_in_mailinglists`) VALUES (1, 1, 'Super Admins', '', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', '', 'y', 'y', 'y', 0, 'y', 20, 60, 'y', 'y', 'y', 'y', 'y');
INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_content`, `can_access_publish`, `can_access_edit`, `can_access_files`, `can_access_design`, `can_access_addons`, `can_access_modules`, `can_access_extensions`, `can_access_accessories`, `can_access_plugins`, `can_access_members`, `can_access_admin`, `can_access_sys_prefs`, `can_access_content_prefs`, `can_access_tools`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_design`, `can_admin_members`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_modules`, `can_admin_templates`, `can_admin_accessories`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_email`, `can_send_cached_email`, `can_email_member_groups`, `can_email_mailinglist`, `can_email_from_profile`, `can_view_profiles`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `include_in_mailinglists`) VALUES (2, 1, 'Banned', '', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', '', 'n', 'n', 'n', 60, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n');
INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_content`, `can_access_publish`, `can_access_edit`, `can_access_files`, `can_access_design`, `can_access_addons`, `can_access_modules`, `can_access_extensions`, `can_access_accessories`, `can_access_plugins`, `can_access_members`, `can_access_admin`, `can_access_sys_prefs`, `can_access_content_prefs`, `can_access_tools`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_design`, `can_admin_members`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_modules`, `can_admin_templates`, `can_admin_accessories`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_email`, `can_send_cached_email`, `can_email_member_groups`, `can_email_mailinglist`, `can_email_from_profile`, `can_view_profiles`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `include_in_mailinglists`) VALUES (3, 1, 'Guests', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n');
INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_content`, `can_access_publish`, `can_access_edit`, `can_access_files`, `can_access_design`, `can_access_addons`, `can_access_modules`, `can_access_extensions`, `can_access_accessories`, `can_access_plugins`, `can_access_members`, `can_access_admin`, `can_access_sys_prefs`, `can_access_content_prefs`, `can_access_tools`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_design`, `can_admin_members`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_modules`, `can_admin_templates`, `can_admin_accessories`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_email`, `can_send_cached_email`, `can_email_member_groups`, `can_email_mailinglist`, `can_email_from_profile`, `can_view_profiles`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `include_in_mailinglists`) VALUES (4, 1, 'Pending', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', '', 'y', 'n', 'y', 15, 'n', 20, 60, 'n', 'n', 'n', 'n', 'n');
INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_content`, `can_access_publish`, `can_access_edit`, `can_access_files`, `can_access_design`, `can_access_addons`, `can_access_modules`, `can_access_extensions`, `can_access_accessories`, `can_access_plugins`, `can_access_members`, `can_access_admin`, `can_access_sys_prefs`, `can_access_content_prefs`, `can_access_tools`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_design`, `can_admin_members`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_modules`, `can_admin_templates`, `can_admin_accessories`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_email`, `can_send_cached_email`, `can_email_member_groups`, `can_email_mailinglist`, `can_email_from_profile`, `can_view_profiles`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `include_in_mailinglists`) VALUES (5, 1, 'Members', '', 'y', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'y', 'n', '', 'y', 'n', 'y', 10, 'y', 20, 60, 'y', 'n', 'n', 'y', 'y');
UNLOCK TABLES;


LOCK TABLES `exp_member_homepage` WRITE;
INSERT INTO `exp_member_homepage` (`member_id`, `recent_entries`, `recent_entries_order`, `recent_comments`, `recent_comments_order`, `recent_members`, `recent_members_order`, `site_statistics`, `site_statistics_order`, `member_search_form`, `member_search_form_order`, `notepad`, `notepad_order`, `bulletin_board`, `bulletin_board_order`, `pmachine_news_feed`, `pmachine_news_feed_order`) VALUES (1, 'l', 1, 'l', 2, 'n', 0, 'r', 1, 'n', 0, 'r', 2, 'r', 0, 'l', 0);
UNLOCK TABLES;


LOCK TABLES `exp_member_search` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_members` WRITE;
INSERT INTO `exp_members` (`member_id`, `group_id`, `username`, `screen_name`, `password`, `unique_id`, `crypt_key`, `authcode`, `email`, `url`, `location`, `occupation`, `interests`, `bday_d`, `bday_m`, `bday_y`, `aol_im`, `yahoo_im`, `msn_im`, `icq`, `bio`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_avatars`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `daylight_savings`, `localization_is_site_default`, `time_format`, `cp_theme`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `quick_links`, `quick_tabs`, `pmember_id`) VALUES (1, 1, 'matthieu', 'matthieu', '7107ccf43eabbe4261503755cf3e194b4d98ce0a', '7e3a5968a2ff3742a1d222cb6f65d0e4855068af', 'bc3e3c9612fd80152160c36462859dadadd9bfad', NULL, 'matthieu.aussaguel@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '0.0.0.0', 1291547086, 1291600834, 1291604563, 13, 0, 0, 0, 1291597477, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', 'n', 'n', 'us', NULL, NULL, NULL, NULL, '20', NULL, '18', '', NULL, 0);
UNLOCK TABLES;


LOCK TABLES `exp_message_attachments` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_message_copies` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_message_data` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_message_folders` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_message_listed` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_module_member_groups` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_modules` WRITE;
INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES (1, 'Comment', '2.1', 'y', 'n');
INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES (2, 'Email', '2.0', 'n', 'n');
INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES (3, 'Emoticon', '2.0', 'n', 'n');
INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES (4, 'Jquery', '1.0', 'n', 'n');
INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES (5, 'Pages', '2.0', 'y', 'n');
INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES (6, 'Query', '2.0', 'n', 'n');
INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES (7, 'Rss', '2.0', 'n', 'n');
INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES (8, 'Search', '2.0', 'n', 'n');
INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES (9, 'Channel', '2.0.1', 'n', 'n');
INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES (10, 'Stats', '2.0', 'n', 'n');
UNLOCK TABLES;


LOCK TABLES `exp_online_users` WRITE;
INSERT INTO `exp_online_users` (`online_id`, `site_id`, `member_id`, `in_forum`, `name`, `ip_address`, `date`, `anon`) VALUES (1, 1, 1, 'n', 'matthieu', '0.0.0.0', 1291600909, 'y');
INSERT INTO `exp_online_users` (`online_id`, `site_id`, `member_id`, `in_forum`, `name`, `ip_address`, `date`, `anon`) VALUES (2, 1, 1, 'n', 'matthieu', '0.0.0.0', 1291600909, 'y');
INSERT INTO `exp_online_users` (`online_id`, `site_id`, `member_id`, `in_forum`, `name`, `ip_address`, `date`, `anon`) VALUES (3, 1, 1, 'n', 'matthieu', '0.0.0.0', 1291600909, 'y');
UNLOCK TABLES;


LOCK TABLES `exp_pages_configuration` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_password_lockout` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_ping_servers` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_relationships` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_reset_password` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_revision_tracker` WRITE;
INSERT INTO `exp_revision_tracker` (`tracker_id`, `item_id`, `item_table`, `item_field`, `item_date`, `item_author_id`, `item_data`) VALUES (1, 1, 'exp_templates', 'template_data', 1291590206, 1, '');
INSERT INTO `exp_revision_tracker` (`tracker_id`, `item_id`, `item_table`, `item_field`, `item_date`, `item_author_id`, `item_data`) VALUES (2, 1, 'exp_templates', 'template_data', 1291591374, 1, 'coucou');
INSERT INTO `exp_revision_tracker` (`tracker_id`, `item_id`, `item_table`, `item_field`, `item_date`, `item_author_id`, `item_data`) VALUES (3, 2, 'exp_templates', 'template_data', 1291598104, 1, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
<meta name="description" content="Resume PHP 5 web developer and online strategist using technologies such as CSS, Javascript, PHP, MySQL and frameworks such as CakePHP or jQuery. Skilled in Search Engine Optimization and Online Marketing." />
<meta name="keywords" content="PHP developer resume, PHP web developer, MySQL, MySQL developer, web developer, strategist, consultant, melbourne,HTML,CSS,XML,JavaScript,PHP,CakePHP,Jquery,Smokin\' Tops, 2.0" />
<meta name="author" content="Matthieu Aussaguel" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Matthieu Aussaguel | Resume</title>
	
	<!-- Styles Are set here -->
    <link href="resources/css/reset.css" rel="stylesheet" type="text/css" />    
	<link href="resources/css/960_24.css" rel="stylesheet" type="text/css" />
    <link href="resources/css/styles.css" rel="stylesheet" type="text/css" />
    <!-- print settings -->
    <link href="resources/css/print.css" rel="stylesheet" type="text/css" media="print" />
	
	<!-- ///// JAVASCRIPT AND JQUERY CALLING -->
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script type="text/javascript" src="resources/js/smooth-scroll.js"></script>
	<script type="text/javascript" src="resources/js/custom.js"></script>

	<!-- IE 7 setting -->
	<!--[if lte IE 7]>
		<link rel="stylesheet" type="text/css" href="resources/css/ie.css" media="all" />
		<script type="text/javascript" src="resources/js/ie.js"></script>
	<![endif]-->

</head>

');
INSERT INTO `exp_revision_tracker` (`tracker_id`, `item_id`, `item_table`, `item_field`, `item_date`, `item_author_id`, `item_data`) VALUES (4, 2, 'exp_templates', 'template_data', 1291598159, 1, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
<meta name="description" content="Resume PHP 5 web developer and online strategist using technologies such as CSS, Javascript, PHP, MySQL and frameworks such as CakePHP or jQuery. Skilled in Search Engine Optimization and Online Marketing." />
<meta name="keywords" content="PHP developer resume, PHP web developer, MySQL, MySQL developer, web developer, strategist, consultant, melbourne,HTML,CSS,XML,JavaScript,PHP,CakePHP,Jquery,Smokin\' Tops, 2.0" />
<meta name="author" content="Matthieu Aussaguel" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Matthieu Aussaguel | Resume</title>
	
	<!-- Styles Are set here -->
    <link href="resources/css/reset.css" rel="stylesheet" type="text/css" />    
	<link href="resources/css/960_24.css" rel="stylesheet" type="text/css" />
    <link href="resources/css/styles.css" rel="stylesheet" type="text/css" />
    <!-- print settings -->
    <link href="resources/css/print.css" rel="stylesheet" type="text/css" media="print" />
	
	<!-- ///// JAVASCRIPT AND JQUERY CALLING -->
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script type="text/javascript" src="resources/js/smooth-scroll.js"></script>
	<script type="text/javascript" src="resources/js/custom.js"></script>

	<!-- IE 7 setting -->
	<!--[if lte IE 7]>
		<link rel="stylesheet" type="text/css" href="resources/css/ie.css" media="all" />
		<script type="text/javascript" src="resources/js/ie.js"></script>
	<![endif]-->

</head>
<body>

');
UNLOCK TABLES;


LOCK TABLES `exp_search` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_search_log` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_security_hashes` WRITE;
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (7, 1291588955, '0.0.0.0', 'f9dd8ae39cfadcb73802d4aa8ed15ee233991fbe');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (6, 1291588789, '0.0.0.0', 'f7e781e7d841ae39004e21648c50c1c2fb25c157');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (5, 1291588789, '0.0.0.0', '2016b892251034287cab266164636367ddcad997');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (4, 1291588782, '0.0.0.0', '9c0f12b1c452a77347fb8e559ad5ec606fb8c08d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (8, 1291588959, '0.0.0.0', 'ddc56e951e88a325b053fa6dc913d9fd14b7a2f6');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (9, 1291588965, '0.0.0.0', 'd660671f325d869b2585deea16b058ec6ff7bf49');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (10, 1291588965, '0.0.0.0', '4141f3bdb5be98bbf385d4f3f4c81873e26d3087');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (11, 1291588968, '0.0.0.0', 'e7648c361e59f815745191bb454f125cd467e387');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (12, 1291588971, '0.0.0.0', '8fba212106329141b4f2b3b0dd53cfec3746bc83');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (13, 1291589020, '0.0.0.0', '4b3387fd6eb3779e0f6b54344c9089c7b52b2d9e');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (14, 1291589021, '0.0.0.0', '9814304bda38a7453919ce4372098a55f5fc604c');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (15, 1291589024, '0.0.0.0', 'aeaefc3aaa30a5ad1ef42d22a85c9b5aa72818a8');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (16, 1291589074, '0.0.0.0', 'ddfa13c28612fee792b2f8710b45075076436abd');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (17, 1291589075, '0.0.0.0', 'f5ab5f90e7458768cdb58ab3e979b7b22accbb96');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (18, 1291589077, '0.0.0.0', '318639024fca54486d3ef8606775966fb952b83f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (19, 1291589099, '0.0.0.0', '6cf50949cf4420e0473e686a813b36d61b38078d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (20, 1291589100, '0.0.0.0', 'e41be8a395d4a5b4948a13b6a9105d4039f23faf');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (21, 1291589126, '0.0.0.0', '78ec9161e0e4f71a450d96649f0204915346268f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (22, 1291589187, '0.0.0.0', '35ac7210c039032aab3d2bd93b86cbe8bc27587e');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (23, 1291589187, '0.0.0.0', '25edba38278faa6f608a775474bbf3d857febaa6');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (24, 1291589196, '0.0.0.0', '13e5c3c32c49a777c0f47afaf208794d77909d2d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (25, 1291589461, '0.0.0.0', '73231f150329cc9e2b781c94592c05cbf0e7e0b1');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (26, 1291589465, '0.0.0.0', '80e520db6ea257eee88373ac6fcc1e6ccf10faf4');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (27, 1291589474, '0.0.0.0', '7b1bb03875e75be73e40dbcbb303575955bf15f8');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (28, 1291589586, '0.0.0.0', '373d6e2d1e3e3201e9fc634fda299df2d8dc2f8d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (29, 1291589588, '0.0.0.0', 'f02899d500e1a1c71365ed3928e50a81db2b96f4');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (30, 1291589593, '0.0.0.0', '5112f79bb302b87c70e534fd1932a554a377ccce');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (31, 1291589608, '0.0.0.0', 'e642a7f67293d26b2100399c35bbd2558120b091');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (32, 1291589611, '0.0.0.0', 'e74b89c8f2be8bcf1551a891b5fd03a7b87f8383');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (33, 1291589614, '0.0.0.0', '3aa15488b74a243e22d432be70ab9695777d833f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (34, 1291589615, '0.0.0.0', '47ee0409157e620cf77514f1c247dcdbf5c4c1d1');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (35, 1291589615, '0.0.0.0', 'd58045684d687754098530302bb9f8349a1a4f6d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (36, 1291589620, '0.0.0.0', 'a8fab5c6404b74dd47cee59adc2dc512e7b7caef');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (37, 1291589657, '0.0.0.0', '05973d1be93a4268065670c4c4018266bbf1c169');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (38, 1291589727, '0.0.0.0', 'd882126f024a57e70bc8ab5f90199a000a83525f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (39, 1291589730, '0.0.0.0', '2606eecb178adda372dce95defcb301576d70163');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (40, 1291589730, '0.0.0.0', 'bd23e9d1f4ae3a241ecc77ca685f893e99410948');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (41, 1291589734, '0.0.0.0', '4f9e422126aa7c48dbe788d08a73693362539acd');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (42, 1291589754, '0.0.0.0', 'ffd102dabbd9c87ddb5734d280cb2885d320d279');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (43, 1291589758, '0.0.0.0', '1b79a0cdf0c471a0b664ded42c552174d0b61ead');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (44, 1291589970, '0.0.0.0', '57b97acab205316c79876e58d1bb2e265c207c8d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (45, 1291589972, '0.0.0.0', '63305916712b618a95f6d6c11cc5e2948c8ede54');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (46, 1291589972, '0.0.0.0', '39991b66aa907301079c9ff14bf4ab3db443fa6b');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (47, 1291589976, '0.0.0.0', '55a713383bc40a7ad748e9aaae17d3150cd2e910');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (48, 1291589981, '0.0.0.0', '961352baf7255e390c13348f23ace12c47fd0597');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (49, 1291589984, '0.0.0.0', 'ca9f2bf70f0c80cc0443bdddb14e6620836a8e60');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (50, 1291589984, '0.0.0.0', '60a2a546f941584e4dce3319bed9224fddeec63c');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (51, 1291590047, '0.0.0.0', '4eb20cb27c1373c6c0499a71f806a26f44a337e8');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (52, 1291590052, '0.0.0.0', 'f776069f000346686a81919ffc52d61976af62e3');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (53, 1291590054, '0.0.0.0', '44db52e44640724858c952e2123c7dab1b9f1b77');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (54, 1291590099, '0.0.0.0', 'f93fb7e202d3f4189ba9d323e62e4316d1bfee8a');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (55, 1291590100, '0.0.0.0', '385d75a2c0b5b5b1e2e737fa0685054f801645ef');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (56, 1291590121, '0.0.0.0', '19bba542ec23b7cd51046f010be30647e16eb894');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (57, 1291590126, '0.0.0.0', '4610be58ab751e2c71efd4c148c813c2b0e54dbb');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (58, 1291590132, '0.0.0.0', 'f893a3036309e122edf9dfa4ba37c66de852221b');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (59, 1291590139, '0.0.0.0', '4f570fe6e18712cb9533e554bc62cab2d8632a74');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (60, 1291590139, '0.0.0.0', 'b6a68dffc587626af084d6cb47ab8aa7e1ee837f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (61, 1291590148, '0.0.0.0', 'b5c39b9bca622654b66391c2610b8ac536d4f7b4');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (62, 1291590153, '0.0.0.0', 'ff8adfcaef89f9b8599ff156ac8fee76ca85d01d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (63, 1291590156, '0.0.0.0', '5639015ecb5fe576fd7897eca4552003521c1045');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (64, 1291590183, '0.0.0.0', 'd4db3ae994c9a86bae06d650c4210a9303197f2d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (65, 1291590183, '0.0.0.0', '69018935b78c1d1c35f4e275c09eec2ad9d60c2d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (66, 1291590199, '0.0.0.0', '315290b23ac8a739c3d3f74f3509920371b45839');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (67, 1291590206, '0.0.0.0', 'a45cbfaa1b2df8ae2a0cc60fff92cc18afa1ce09');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (68, 1291590206, '0.0.0.0', '94befe503bfa1456f1bdc777e5e88cb89c574765');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (69, 1291590217, '0.0.0.0', 'c8b924e846da005ed9464def58278367f05cdfce');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (70, 1291590234, '0.0.0.0', '27b6c67c02107e08d6aa4b120efbf63a85e44b0b');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (71, 1291590246, '0.0.0.0', '88ca35ecdf3b35d6e95706dd5a4c4a754f57c7fa');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (72, 1291590246, '0.0.0.0', 'a3fa9f090a1611ada49bfc1a3cc7a7d0a808de71');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (73, 1291590257, '0.0.0.0', 'c2fd77f533dcdaf86fafa73f718ce778fa74b756');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (74, 1291590263, '0.0.0.0', '5c2536622d5711cf09e960e7e6d8819810acd92d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (75, 1291590286, '0.0.0.0', '42a9a5bc564b2f43b794058fbbd17a59258c2be6');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (76, 1291590289, '0.0.0.0', 'd3807cbaf16ebe1a2dce128477eaff0a8cac0579');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (77, 1291590324, '0.0.0.0', '329dedfa7fdb7bc821f32f5f204aea216d18e9ab');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (78, 1291590324, '0.0.0.0', '6766b0599d111e23460a0ca0239f187aa1ce7856');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (79, 1291590333, '0.0.0.0', '91e67262ea4fc4bb34e188f5d5e285c630e0bc19');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (80, 1291590375, '0.0.0.0', '200a5b74f554d5cfa3766332419bc86aa9efd5a4');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (81, 1291590388, '0.0.0.0', 'e073cc9efb07710e4ab2f10dde76b6b21b7030a7');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (82, 1291590394, '0.0.0.0', '8c0b6ad004229095dce401bb71f0ca259b5fbb0f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (83, 1291590404, '0.0.0.0', 'f2f50c1414167dd16c8f53b035ea1439ff8070cc');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (84, 1291590413, '0.0.0.0', '2291fdcfdfee7eeb81c14f1b2aa6142b79b83337');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (85, 1291590417, '0.0.0.0', '8e5953fb26f4a4220b847695bdac9d1ebd7b328d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (86, 1291590424, '0.0.0.0', '031c3b7b2afdd8ba275a2f4519daf7b0c387962d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (87, 1291590424, '0.0.0.0', '6b4b01bbbde211eb6135339c3833d3b7ac7421c2');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (88, 1291590432, '0.0.0.0', '81156be8d72342eab03446174306b0cc43bf8251');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (89, 1291590455, '0.0.0.0', '34659431ec5cc25ca9c70babf7119a6bf5393965');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (90, 1291590456, '0.0.0.0', 'f46271f6ebe8ef7bfda928fd638085eeadfc6333');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (91, 1291590590, '0.0.0.0', 'b3a8c1ac29fa79afd7492063ccf675e46ad8fbb8');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (92, 1291590590, '0.0.0.0', 'b8c8319b1914c6aefc6019d375bd17c3fbe28890');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (93, 1291590598, '0.0.0.0', '5e7e441e416e2dbe5372958dcd3a06285d2bb4d8');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (94, 1291590600, '0.0.0.0', 'cae9519ac10c8e79e4748f2c7b5d51d48e64f543');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (95, 1291590603, '0.0.0.0', '26a33b1e8ec4cf00157c2b92bcdc595f4dedf2f2');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (96, 1291590605, '0.0.0.0', '64f0b9ad10c0ce710f83aab5b9a03e151fe7a9a4');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (97, 1291590605, '0.0.0.0', '1298303b22039856e13f0be17a576c383571c621');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (98, 1291590609, '0.0.0.0', '9be432d41fcc6c6ace96af7a1a0ca10c844c3840');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (99, 1291590614, '0.0.0.0', 'c5d76905dc58ce59e5dba134a2ae8cb9950e1277');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (100, 1291590614, '0.0.0.0', '499203acb0c64fdcb32ebbbeacfe4766ffde6fb3');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (101, 1291590624, '0.0.0.0', '033b2ce86beab6eb76cc57729913933def1295d4');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (102, 1291590639, '0.0.0.0', '16e23ac27b8b8d0e27993abbb938a67c3248d983');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (103, 1291590639, '0.0.0.0', 'e546418aeeee15ad8f78e4b7c742626da73b5438');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (104, 1291590643, '0.0.0.0', '2204030710fc675db0044afaff872c2adf9ae39e');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (105, 1291590644, '0.0.0.0', 'b2eae3e64c8e192e1c9f1ce7b9b6bf006943ecdb');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (106, 1291590659, '0.0.0.0', 'be7b3090fb9f26bbac8dbd188735688972aa6de7');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (107, 1291590659, '0.0.0.0', '0efa214c1f41b56ddd6ee31c9991d464e5fea3c7');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (108, 1291591304, '0.0.0.0', 'd96b72853a99bb98a478b35588f702acbabd4e6f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (109, 1291591368, '0.0.0.0', 'd0fbb49164ce20ac5f6e2043e91310a2c097283a');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (110, 1291591374, '0.0.0.0', '9268156b0c6634599b73861c308ee78eb50c1728');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (111, 1291591374, '0.0.0.0', '5f5ff64cdfa26547f8a025292ee7ed0aad7abca8');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (112, 1291591910, '0.0.0.0', '9fcd0241629a98ecab6c33eaabd1470ea1c3e1b4');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (113, 1291591912, '0.0.0.0', '46e746b2a9a6b714b302cdf92bf4c195f465fa29');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (114, 1291592009, '0.0.0.0', '53b8fe9fc5081658bcd71b6878ec96d7239d2608');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (115, 1291592034, '0.0.0.0', '8d795c0a7f4e60dc7a607cf83e8cd2d00da5c7b4');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (116, 1291592041, '0.0.0.0', '1ab013c142d47fe0d34f14660b3b0143a639ae82');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (117, 1291592059, '0.0.0.0', 'ed0fca31b12fc319c06a6058b20af8dc2c68c71a');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (118, 1291592060, '0.0.0.0', '082d2c2a9f025916c2536a48e35e08ef08580cfc');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (119, 1291592251, '0.0.0.0', 'c4fa17f21d08ef44e1e6880369d1ff6300856405');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (120, 1291592253, '0.0.0.0', 'd8e31c9c13c626e5cf65827b2d31ea1a2c1847c7');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (121, 1291592277, '0.0.0.0', 'a5446852388aec63d6fb5c67b9d4487e3426660d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (122, 1291592281, '0.0.0.0', 'f1a72488e3a694d515d6c63f0a0d4c95b075e2fc');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (123, 1291592287, '0.0.0.0', 'afaa95ee3da0fb74c7e2734b9405192d63164ca2');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (124, 1291592308, '0.0.0.0', 'd6ec78467c2838e38f32a9889639bd43644158c3');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (125, 1291592308, '0.0.0.0', '69cef5657bdf3a5364c1876ccb7987812335461e');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (126, 1291592313, '0.0.0.0', '97836b6f9a36aecc7f1adfc6ca889bb5e69e8552');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (127, 1291592325, '0.0.0.0', '67d58555c107c7062a65db2b601de61a7c67eeba');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (128, 1291592325, '0.0.0.0', '3378d79cefdb3b08a5f844036947a8cf69855230');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (129, 1291592354, '0.0.0.0', 'f849576ef5ac4762bb7cc7f8d0a6d061092558fe');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (130, 1291592366, '0.0.0.0', 'bee64c111398737d2d0ac23c8ab8199b1582b469');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (131, 1291592366, '0.0.0.0', '1e8d21e9a2c114dee68d86fa4616f4181d3524c9');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (132, 1291592381, '0.0.0.0', 'bb1f0e89782f0306203aa05751131032fff94014');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (133, 1291592601, '0.0.0.0', '575f90776cf130e634530396712f66a51d07440d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (134, 1291592602, '0.0.0.0', 'b47602b258c1a50d7edc9cd368d16c8be534d81c');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (135, 1291592605, '0.0.0.0', '75b59c63bcb6b2510aa0d4089eb34a1751c2fdc3');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (136, 1291592607, '0.0.0.0', '459a2ab482593bd7e1a1b3326fcf4ecd10242260');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (137, 1291592618, '0.0.0.0', '22666237f3e0470d2e64b57728ac7911311acff3');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (138, 1291592618, '0.0.0.0', '90f39b94bb7e5f7438c66968ee1c3035bbcf9b3d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (139, 1291592657, '0.0.0.0', '0eb71e9ea3e5bdc390f6cc07f85b0b520cfd5d09');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (140, 1291592657, '0.0.0.0', 'd31405c59fa6565dd57abbb2c65f9c8e1dc78a1c');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (141, 1291592707, '0.0.0.0', 'e333931052d33eeb4b7f8cefd1e0297493cc3896');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (142, 1291592721, '0.0.0.0', '6482e58752985c23d4696cb0b7654463e71c9c9c');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (143, 1291592722, '0.0.0.0', 'f01eb1d3d22bbdc83871e91bc89d814c021bc8a7');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (144, 1291592723, '0.0.0.0', 'a3dd3026d89a77026e488929bffe48ec7516d9ce');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (145, 1291592729, '0.0.0.0', '93e6b22a55a3575988416bf5d7b7f3a41609207c');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (146, 1291592729, '0.0.0.0', '9dab0f5bab66c8c39af470272bf2e02075da0fe1');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (147, 1291592759, '0.0.0.0', '0d642b8d67d6526abcd11872e68061fc73c0b086');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (148, 1291592760, '0.0.0.0', 'f53c1ca1ce7648d0a6410dbe458a1d5727a51a89');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (149, 1291592767, '0.0.0.0', 'c6c3b1e97472685a203a8de2a8e5173661675d6e');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (150, 1291592767, '0.0.0.0', 'ea0b9872ff645c8b49f34a3f6555ebc22ddaa861');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (151, 1291592834, '0.0.0.0', 'efad1f8dbcad3bfeded61bd10d2c1c63ba18e8ca');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (152, 1291592835, '0.0.0.0', 'e0505ffdfbdedee2ba26f2d03693c55eecf2cbef');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (153, 1291592911, '0.0.0.0', 'f7e9280dd7eaa113f7182d9ee71f058cebb4a47f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (154, 1291592911, '0.0.0.0', '27a44b1619a587ea1f856f0ee74abab9ac231959');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (155, 1291592932, '0.0.0.0', 'cd9399915cc93ce64568463a3af57d3b016880ba');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (156, 1291592933, '0.0.0.0', '4b448186c71665132738ce2077706f78f539dbc9');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (157, 1291592968, '0.0.0.0', '75c6796a450283e946cd1081f07d2014ad92dc27');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (158, 1291592968, '0.0.0.0', 'eb2cb7608d26d8ffc4ed5f0d908b2b5c305304d4');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (159, 1291593155, '0.0.0.0', '0bbad0a311983cf547f2b1c65ba68e169bf07a53');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (160, 1291593156, '0.0.0.0', '96ecf9e9aef017b4dd6a4ed063ef5fedb15e318a');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (161, 1291593276, '0.0.0.0', 'bb1fcda26abb7660df57635ac5dd833d4edc1509');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (162, 1291593278, '0.0.0.0', '30ba40d2ec3f0a049c3227cb70810c95c03a2dfa');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (163, 1291593455, '0.0.0.0', '701546cd72f1bbd856251aa41fa6d252c766eb01');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (164, 1291593455, '0.0.0.0', '3d454b6e14855665b2f83340e15b54088dee3eb8');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (165, 1291593501, '0.0.0.0', 'e60be0fa6937044b27665244661828ca2ec99d1d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (166, 1291593502, '0.0.0.0', '91e83267f02bae4ce3eeed15d1fc094c418e1b5d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (167, 1291593517, '0.0.0.0', '1273acb7dda7ca4d49caf7314a48cadd9acb968d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (168, 1291593520, '0.0.0.0', '29ea4cfde6539df5d67ba7a391a7cba6d4286fa8');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (169, 1291593521, '0.0.0.0', 'c2fa5289a8a770ce78a9f89923f3d15463ba66c6');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (170, 1291593565, '0.0.0.0', 'bb50feac2916f665a034420bd8e3b8236abfe889');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (171, 1291593566, '0.0.0.0', 'fcdfd95b43337071b4e0733905c17ea4d4a74892');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (172, 1291593568, '0.0.0.0', '962a4f069642f55021e7cacaf44fd2c6b2a29e64');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (173, 1291593570, '0.0.0.0', '3d391bb6faf1e364e4ed8d176d7f0591a04671cc');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (174, 1291593580, '0.0.0.0', '2cc5cd772b870e5973aedf1ec9bbc58ffc8784e5');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (175, 1291593580, '0.0.0.0', 'fa942989fa74d1d93bcf53e52e05ffda54eefb0a');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (176, 1291593596, '0.0.0.0', 'fd387b1b82f8e42c6307f6a56669a996da0b185e');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (177, 1291593598, '0.0.0.0', '5242a53324d212b661e0561e11d3994c7b08da80');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (178, 1291593622, '0.0.0.0', '1679c494c20e4909576d6f666391c3469376aaf8');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (179, 1291593622, '0.0.0.0', '91877790078fa7221377ef355c924724f92adb87');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (180, 1291593647, '0.0.0.0', 'ff2b12c9fdfb99680c5f45c93793aad7bbe8920e');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (181, 1291593648, '0.0.0.0', 'face8a2b265fb43cbeb6ada2a97862809f621f44');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (182, 1291593718, '0.0.0.0', 'b8f501fb3420fd3bf6fa14cf7d2be279afa5ec52');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (183, 1291593718, '0.0.0.0', 'c11c6bce1e58654f92d44a5670b15b9151a120fe');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (184, 1291593898, '0.0.0.0', 'd410470269850eab8176448e790fecb216f7c9b0');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (185, 1291593900, '0.0.0.0', '126bb01d5d16538af74fcf402ab1f286bc96fb4e');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (186, 1291593938, '0.0.0.0', '4e8a56c42b1f5abafffee1191f8cc8a045855b1f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (187, 1291593938, '0.0.0.0', 'eae1d1b8f7bcb6fa5a738ab8ac783bc376bf2622');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (188, 1291593952, '0.0.0.0', 'e08d59b0f6af54fc40c39c7758a7067712401887');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (189, 1291593953, '0.0.0.0', 'd04e35555e9c87ad0f2138680b331a47f5cc307e');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (190, 1291593990, '0.0.0.0', '9c951c8ada503a37c6fca3e2b63592cf2044ff33');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (191, 1291593991, '0.0.0.0', '2121280e1dd4bcc1ecd17631b04e4954a8b3c171');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (192, 1291593999, '0.0.0.0', '75a706ed8536f3f11faa4645436d4f44033b5384');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (193, 1291594000, '0.0.0.0', 'a6f7e4fa2ee46a8c9d3532422c3c2699f5e6a704');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (194, 1291594025, '0.0.0.0', 'a0b0eef149248bdbc9788f2c51b86133912818bb');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (195, 1291594025, '0.0.0.0', '7ab178079908f34878776d8a8e58e645d87d062c');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (196, 1291594033, '0.0.0.0', '28e94e4ab483f10a102f5642dd3b0da9e81e55a6');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (197, 1291594034, '0.0.0.0', '5f91574fa6713d08f145b8b9bcf75deef4975d58');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (198, 1291594065, '0.0.0.0', '941792aeda1b305311a6a98060f124efa2d871db');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (199, 1291594065, '0.0.0.0', 'c00288cebe89f99c577d3171951d041fb067d82c');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (200, 1291594307, '0.0.0.0', '2fa5b063cb312dac1d2d994f1d49eab0da84a63f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (201, 1291594310, '0.0.0.0', '7fd5eb6f1f9d082476ad2bba3f2c4cacbaab17c6');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (202, 1291594333, '0.0.0.0', '44fa8ef77b75ca8a091422838eb0aea87d9c2f7f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (203, 1291594339, '0.0.0.0', '9782c896c02e013f231ca1c734ce019141c4361d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (204, 1291594373, '0.0.0.0', 'e7a7ac9622804d6da6ff756eff74ea92de442811');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (205, 1291594382, '0.0.0.0', '162cb416f51d5e79b498c2eebb8eb6b04a9d5b71');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (206, 1291594397, '0.0.0.0', '35ea6627a3ef961e967d69426cd0003009a7d2c7');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (207, 1291594406, '0.0.0.0', '8557c9d222a9543c2e4da7e4cf0b090351f35e3a');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (208, 1291594423, '0.0.0.0', '95e4f3054c4667bfc057b1f682d081234898802c');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (209, 1291594434, '0.0.0.0', '1a7b9c1e81ba0e9efb9407e42621d7393701c179');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (210, 1291594445, '0.0.0.0', 'e8a07b13a150061d1fc2e01e6906ff43e1f0a71e');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (211, 1291594453, '0.0.0.0', 'd8d107056c83533acbb816992f77fd87bd352202');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (212, 1291594467, '0.0.0.0', 'a24bad77657658213f4cb57fa7a2971f28bd3816');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (213, 1291594475, '0.0.0.0', '42c9a8518c8d86f769d1acc4a1d890ffc9465457');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (214, 1291594508, '0.0.0.0', 'd1cd4d948ebdd6e4a9489e5bd438cc11560c9905');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (215, 1291594536, '0.0.0.0', '368aa3a8b8f943d6353d5f05f96b5eaa1bdb971d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (216, 1291594556, '0.0.0.0', 'e3a9a23f827b78817acbf7d6b8596b42b977f7a2');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (217, 1291594562, '0.0.0.0', 'a85822d474d601039cfa303367f2aeae8a113ad3');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (218, 1291594578, '0.0.0.0', '42d9a263c5f5f7fd711927701510e0d2b2fb570c');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (219, 1291594588, '0.0.0.0', '9e16f2ae4d75e833ec555e3ab69539e817ff6b0d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (220, 1291594588, '0.0.0.0', '29bc3d95463da2f6b8725d6a0682bddca17bd206');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (221, 1291594604, '0.0.0.0', '86cebf03298d76f9390fee51b8c15a3fa42d9802');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (222, 1291594622, '0.0.0.0', '246274f7280b2110e3914105a945d6085346ec85');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (223, 1291594633, '0.0.0.0', 'd8c770a43580728d587ade5b0451f1ff787aa82a');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (224, 1291594635, '0.0.0.0', '1ec4dd060dfceb4ac594c3928e50d240166952e7');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (225, 1291594644, '0.0.0.0', '2ebeb40a1bafb95380a1480226141ca435fbf370');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (226, 1291594661, '0.0.0.0', '9bcbd61d79e701596ea6868e92b7372db0bc6154');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (227, 1291594672, '0.0.0.0', '638601f39e34ac298520c7919f340ce972cdb440');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (228, 1291594672, '0.0.0.0', '01dbf030bbed1fe34e818caa86324c0669c9efcc');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (229, 1291594675, '0.0.0.0', 'f4ac806d0bc16b33334fde0478135f09cb6b7306');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (230, 1291594685, '0.0.0.0', 'b2a3b3fbbacde3565b6ee77e7552bab393c7683f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (231, 1291594690, '0.0.0.0', '727abd8191c2f8afa7e1a3f7f5102cd51bc76a74');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (232, 1291594710, '0.0.0.0', '9e9d499febd43799d4d29c99a75a52446e78c339');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (233, 1291595371, '0.0.0.0', 'dc189ae7212aad3f933c2883a4a5448b59f49308');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (234, 1291596256, '0.0.0.0', '1b95337b5537b4db1bb03ef06a88c9fb640dc5ea');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (235, 1291596260, '0.0.0.0', 'ed6a0f0bb9fe777d723acec1c2b5543cd70db727');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (236, 1291596266, '0.0.0.0', 'e9ab8e56b8f988545ddeacd72ac4ec489e2d7fb3');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (237, 1291596266, '0.0.0.0', '83bc9cf8ca142537f679d150ec86a0ba8acf982f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (238, 1291596269, '0.0.0.0', '4a7ad98155eee2d3db4af44823697cf4b8b34d0b');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (239, 1291596282, '0.0.0.0', '6f08bd6fac195f9a14b093d2d39a6b7eed7c9c33');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (240, 1291596329, '0.0.0.0', '8d1605014759076ad26ae0a6793096be1fee5829');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (241, 1291596329, '0.0.0.0', 'd357479bc97e6faef2e6e5f70fbe82889ed489cf');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (242, 1291596335, '0.0.0.0', '8595e287d2248cbe14b5f2f9cf0bc8e7cf5f2e55');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (243, 1291596342, '0.0.0.0', 'a821217e200b9c04007fc1df3f4805631de8a8af');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (244, 1291596374, '0.0.0.0', 'aba33bee478a668511b6b2a413b4d7c5b7608cb4');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (245, 1291596374, '0.0.0.0', '8f457be901c7e1bd24d3703e85b191c30feaba69');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (246, 1291596389, '0.0.0.0', '1c66a0504547afcdd463c57de939dcd9a4c8f18f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (247, 1291596398, '0.0.0.0', '06ad2fa35a8726e045af1d8c0eee62371584c34c');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (248, 1291596398, '0.0.0.0', '1a05520af24380a39ba19f87ef20af3e876a8e92');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (249, 1291596412, '0.0.0.0', 'ee1140814800259f34053ea0bcb4dd6c9fa3da3a');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (250, 1291596414, '0.0.0.0', '9943c0c6e570450cb49d46b8fdc31dea5235da1c');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (251, 1291596451, '0.0.0.0', 'f040c7dcb965ee9be33429166786dd47df55b325');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (252, 1291596455, '0.0.0.0', '7e4adb1a9dc0b7f3a1c65e6e67170c7a7ce59068');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (253, 1291596460, '0.0.0.0', '2a546085605c0a52b483d660e6726ea4af813fb6');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (254, 1291596505, '0.0.0.0', '7a35e1420fa2c4404287159e01837383a05bef93');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (255, 1291596505, '0.0.0.0', '40d34c111567a726fd65eb547ccb0b6980b2516d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (256, 1291596512, '0.0.0.0', '03bfd4df80e2d2ee45e5f76b4fd314bb57aef427');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (257, 1291596517, '0.0.0.0', '0a6b016877d8beed89189cceefc663afa334561d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (258, 1291596525, '0.0.0.0', 'caf539af8038c7ab7adf8a7a123d7ce094ee25ca');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (259, 1291596525, '0.0.0.0', '40ced35019c251c04e8a4bf3afbcb1505c2ef5f0');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (260, 1291596560, '0.0.0.0', '991b0d78f90589d951a11da0a9cde125cea80fa8');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (261, 1291596561, '0.0.0.0', 'f83c76cc0e554b1eb8517359ebdbf16e3294ab3c');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (262, 1291596609, '0.0.0.0', '15d27690d415854025b2e32b8ac63b398cde7f60');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (263, 1291596609, '0.0.0.0', '8a62ec0dfecd71532a05eb637cbd91b2c1a678f9');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (264, 1291597275, '0.0.0.0', '4e362da819740a272ff7e937292903a4db83835f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (265, 1291597277, '0.0.0.0', '862d13a9e744e1ead69b3b22c91f226f76e8bf67');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (266, 1291597316, '0.0.0.0', 'e5195581f5ff04ed9a59858b2346d748dcdac6d7');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (267, 1291597317, '0.0.0.0', '3c0128c222ff86309f7b56ebdd4ebcc3f11534c4');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (268, 1291597331, '0.0.0.0', '35f393b0e60c7180d4757f5379cafd2d1d233cf7');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (269, 1291597333, '0.0.0.0', '04448b90bfe1c9aa21c86d1f900dc55287dda1f7');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (270, 1291597369, '0.0.0.0', '87e6ecc2cce19943bcae393d6cb351a4d45df8c6');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (271, 1291597372, '0.0.0.0', '37c5126d9583a19e54a922fa6bf5db38c01f0e6d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (272, 1291597382, '0.0.0.0', 'e3cc10976f673ac120e5d4c8d2a5fd8dbfbe7795');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (273, 1291597384, '0.0.0.0', '4fba562c4adac66f1e50d671e7411ac695b25aa7');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (274, 1291597429, '0.0.0.0', '590dcc3758c518b2835c80a16934db6d1d72a335');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (275, 1291597429, '0.0.0.0', 'ac52c92df9cce2edb09cb39958975e997984d3eb');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (276, 1291597440, '0.0.0.0', '0354a428310c568f6194bb666f66b346d1d03024');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (277, 1291597442, '0.0.0.0', 'ff4c68c022afc69f8565e21c865fec31be754596');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (278, 1291597477, '0.0.0.0', '7e1d8a1b9835cc1836b1821d13cc1059a594b507');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (279, 1291597477, '0.0.0.0', '478eff5ffb51d10a356c641734de66b7ef03335b');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (280, 1291597507, '0.0.0.0', '3b50fd02705331d5215baa4404fb7c4fcb781ad0');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (281, 1291597508, '0.0.0.0', '484a52953c4b33b7367af2acd20ff82b1534c1d4');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (282, 1291597513, '0.0.0.0', 'a0fecf76d1723c0db41dc165e0960f4cb5511f5c');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (283, 1291597515, '0.0.0.0', '603bac9752ec5016432228601a16db2130bfb441');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (284, 1291597523, '0.0.0.0', '6a26464e2f7510333b7a6be7ecbe4c4ab07524ab');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (285, 1291597523, '0.0.0.0', '771b7fbc5b98c95d8682b774ae65d56aa3b5b640');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (286, 1291597552, '0.0.0.0', '9bbce59f388381a877cc45e5b0651157a7ac7d30');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (287, 1291597553, '0.0.0.0', '06ebded041400af2cd468ae83b218e32885ac3a3');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (288, 1291597558, '0.0.0.0', '7a66b6b73fd76d5b3081b44e37d9a3fa179d04e0');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (289, 1291597562, '0.0.0.0', 'cdd90c63a2d0991dbfcde97a89276ab0771b2508');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (290, 1291597575, '0.0.0.0', 'f9c0fc1f64e7d4095897d458c25b18a6054c4709');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (291, 1291597577, '0.0.0.0', 'e8441f658d0af96a45546f545cdf2f4332c8c02e');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (292, 1291597585, '0.0.0.0', '01b80446f73f67c6003c0a2cd50246287d2c456b');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (293, 1291597587, '0.0.0.0', '211918a627b7034120ab1491d8d0e70c367e4710');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (294, 1291597684, '0.0.0.0', 'a1606c67ec426cd6e8ffec1eb77dbdd7e64219c1');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (295, 1291597685, '0.0.0.0', 'e7af2def5601e96dba21c7ee0927ece361205510');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (296, 1291597724, '0.0.0.0', 'df17a6ac9bbcfd38b9a598f7a0718fbeefcf1afb');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (297, 1291597725, '0.0.0.0', '1aa65041e490fe0835df7c00ff0ded2f8fe63b26');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (298, 1291597754, '0.0.0.0', '6c749f51665ab67e722c4dd7a77ebbcf22e4237e');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (299, 1291597755, '0.0.0.0', '8a71fce3dc80f20d0f2730c5da2850b8340c6f33');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (300, 1291597780, '0.0.0.0', 'ce7f9f1ac9e62bbfe002d5c603764a676191920d');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (301, 1291597879, '0.0.0.0', '31bc918694d53faf1333ce679087168052b89bed');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (302, 1291597880, '0.0.0.0', 'f0e8b3b7d5f21b4973e8d07f114a8db68db006c9');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (303, 1291597895, '0.0.0.0', '203e1dda939d6df4406b8b021bc8bd83edf62f16');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (304, 1291597901, '0.0.0.0', '5584254b8cb1ddff6a3cfaedda28082ac55d62ec');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (305, 1291597968, '0.0.0.0', 'b0ec6b8fb87f160c257315137a93dae91611207f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (306, 1291597985, '0.0.0.0', '29ec149383b3ab0b26c73443d3b71e5514959479');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (307, 1291597986, '0.0.0.0', 'd7416a332bdccc71a038c39f64bfaa1eaf87af8f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (308, 1291598078, '0.0.0.0', '8bc37ce4a3f67d14d0a0c3d038bb45a15ee96177');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (309, 1291598085, '0.0.0.0', '11d09c8b157c07fc9a57ac1aed82a1fe084fd9b0');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (310, 1291598104, '0.0.0.0', '02add3a905667813127eb5df8e1fec0317d873a6');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (311, 1291598104, '0.0.0.0', 'fc98b5e9257f0005429a079e5b00947351282b6b');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (312, 1291598159, '0.0.0.0', 'f1655f8ca42b156fc44c221744655ff13e1790a6');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (313, 1291598159, '0.0.0.0', 'e2ead3c050cd00ffc932240e0f6a0589585e12da');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (314, 1291598169, '0.0.0.0', 'dba9fd46a06f907ea2dc36ff9a6c36b76ae00aee');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (315, 1291598181, '0.0.0.0', '65ea96989384d79077c22126b1b463f80f0a36ef');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (316, 1291598187, '0.0.0.0', 'e03ce05406eec7d4b720c79e22b17481c550a3c8');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (317, 1291598195, '0.0.0.0', '115da7a3164214735961ad154ffafb4f21028cab');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (318, 1291598195, '0.0.0.0', '493b9eb0b0fdb58697ac0565942976dd44fbd719');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (319, 1291598382, '0.0.0.0', 'be2e2d70747fdc0705248927506a4cac0ed8d8d2');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (320, 1291598390, '0.0.0.0', 'bbcf3cb12e9fa428e1477999146cac532acf1484');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (321, 1291598391, '0.0.0.0', '9862127daba8f8a97f5b0ff16481a8f5995ca316');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (322, 1291599238, '0.0.0.0', 'cb5a7f79039c38e782de3e9e85b7bd76b438ce24');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (323, 1291599324, '0.0.0.0', '8c5839478d87dbdffca4c3ad2a362a52db0c63cb');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (324, 1291599324, '0.0.0.0', '2670e97d642144ed13767fa133561d9caa302b8a');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (325, 1291599390, '0.0.0.0', '4e41e85380943447c26cff87d9052aad4cdbf0ac');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (326, 1291599420, '0.0.0.0', '50b82f7dc439fb3eafef225caeeec70391f3820a');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (327, 1291599420, '0.0.0.0', '5e33f50896f613083e6a49878acaf409ef6c7eda');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (328, 1291600389, '0.0.0.0', 'c2e9586eebb1f362e33d6619097a16388dbaf6fc');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (329, 1291600834, '0.0.0.0', 'ca82720e894f51ac3fd0e2169bf27c35c2874feb');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (330, 1291600839, '0.0.0.0', '571ebd134f510de8d50ec72aa16ff39c792150ee');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (331, 1291600845, '0.0.0.0', 'd9706640e5f56d031fe15499e59a31025ad1f676');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (332, 1291600845, '0.0.0.0', '525cd49a4b692de64108ff4188c67db3f60b61e1');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (333, 1291600921, '0.0.0.0', '2114fcf09de5002adb60d2bf5478d9494bc7675f');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (334, 1291600936, '0.0.0.0', '4f7f5eb10be3a97c4fd5ace0713c6c89b6756e38');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (335, 1291600937, '0.0.0.0', 'e90f3d84a9964565d2e6509effd377ff23bc38c1');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (336, 1291600946, '0.0.0.0', '4768b923b4f5a44c8cc2e21f4f2ef7a3eb2909a8');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (337, 1291600960, '0.0.0.0', 'ab3cb716c20e48d750acb04776ae5dca1ba7ec3a');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (338, 1291600961, '0.0.0.0', 'b49f739cc2c31e9e827af2073e7754c94244a66c');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (339, 1291600971, '0.0.0.0', '24ab877119373682974b501557cc519625807825');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (340, 1291601015, '0.0.0.0', '352331730864f1d12e01bb92b961256a488151b3');
INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `ip_address`, `hash`) VALUES (341, 1291604563, '0.0.0.0', 'ee11b07f4fb4492789931efc40fe3da57847e44b');
UNLOCK TABLES;


LOCK TABLES `exp_sessions` WRITE;
INSERT INTO `exp_sessions` (`session_id`, `site_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `last_activity`) VALUES ('5bc4a58e80989e0ac8e47379a42d5c126193e499', 1, 1, 1, '0.0.0.0', 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en', 1291604563);
UNLOCK TABLES;


LOCK TABLES `exp_sites` WRITE;
INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_system_preferences`, `site_mailinglist_preferences`, `site_member_preferences`, `site_template_preferences`, `site_channel_preferences`, `site_bootstrap_checksums`, `site_pages`) VALUES (1, 'My Name Is Matthieu', 'default_site', NULL, 'YTo5MTp7czoxMDoic2l0ZV9pbmRleCI7czo5OiJpbmRleC5waHAiO3M6ODoic2l0ZV91cmwiO3M6MzQ6Imh0dHA6Ly9sb2NhbGhvc3QvcGVyc29ubmFsd2Vic2l0ZS8iO3M6MTY6InRoZW1lX2ZvbGRlcl91cmwiO3M6NDE6Imh0dHA6Ly9sb2NhbGhvc3QvcGVyc29ubmFsd2Vic2l0ZS90aGVtZXMvIjtzOjE1OiJ3ZWJtYXN0ZXJfZW1haWwiO3M6MDoiIjtzOjE0OiJ3ZWJtYXN0ZXJfbmFtZSI7czowOiIiO3M6MjA6ImNoYW5uZWxfbm9tZW5jbGF0dXJlIjtzOjc6ImNoYW5uZWwiO3M6MTA6Im1heF9jYWNoZXMiO3M6MzoiMTUwIjtzOjExOiJjYXB0Y2hhX3VybCI7czo1MDoiaHR0cDovL2xvY2FsaG9zdC9wZXJzb25uYWx3ZWJzaXRlL2ltYWdlcy9jYXB0Y2hhcy8iO3M6MTI6ImNhcHRjaGFfcGF0aCI7czo1NToiL1VzZXJzL01hdHRoaWV1L1NpdGVzL3BlcnNvbm5hbHdlYnNpdGUvaW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9mb250IjtzOjE6InkiO3M6MTI6ImNhcHRjaGFfcmFuZCI7czoxOiJ5IjtzOjIzOiJjYXB0Y2hhX3JlcXVpcmVfbWVtYmVycyI7czoxOiJuIjtzOjE3OiJlbmFibGVfZGJfY2FjaGluZyI7czoxOiJuIjtzOjE4OiJlbmFibGVfc3FsX2NhY2hpbmciO3M6MToibiI7czoxODoiZm9yY2VfcXVlcnlfc3RyaW5nIjtzOjE6Im4iO3M6MTM6InNob3dfcHJvZmlsZXIiO3M6MToibiI7czoxODoidGVtcGxhdGVfZGVidWdnaW5nIjtzOjE6Im4iO3M6MTU6ImluY2x1ZGVfc2Vjb25kcyI7czoxOiJuIjtzOjEzOiJjb29raWVfZG9tYWluIjtzOjA6IiI7czoxMToiY29va2llX3BhdGgiO3M6MDoiIjtzOjE3OiJ1c2VyX3Nlc3Npb25fdHlwZSI7czoxOiJjIjtzOjE4OiJhZG1pbl9zZXNzaW9uX3R5cGUiO3M6MjoiY3MiO3M6MjE6ImFsbG93X3VzZXJuYW1lX2NoYW5nZSI7czoxOiJ5IjtzOjE4OiJhbGxvd19tdWx0aV9sb2dpbnMiO3M6MToieSI7czoxNjoicGFzc3dvcmRfbG9ja291dCI7czoxOiJ5IjtzOjI1OiJwYXNzd29yZF9sb2Nrb3V0X2ludGVydmFsIjtzOjE6IjEiO3M6MjA6InJlcXVpcmVfaXBfZm9yX2xvZ2luIjtzOjE6InkiO3M6MjI6InJlcXVpcmVfaXBfZm9yX3Bvc3RpbmciO3M6MToieSI7czoxODoiYWxsb3dfbXVsdGlfZW1haWxzIjtzOjE6Im4iO3M6MjQ6InJlcXVpcmVfc2VjdXJlX3Bhc3N3b3JkcyI7czoxOiJuIjtzOjE5OiJhbGxvd19kaWN0aW9uYXJ5X3B3IjtzOjE6InkiO3M6MjM6Im5hbWVfb2ZfZGljdGlvbmFyeV9maWxlIjtzOjA6IiI7czoxNzoieHNzX2NsZWFuX3VwbG9hZHMiO3M6MToieSI7czoxNToicmVkaXJlY3RfbWV0aG9kIjtzOjg6InJlZGlyZWN0IjtzOjk6ImRlZnRfbGFuZyI7czo3OiJlbmdsaXNoIjtzOjg6InhtbF9sYW5nIjtzOjI6ImVuIjtzOjEyOiJzZW5kX2hlYWRlcnMiO3M6MToieSI7czoxMToiZ3ppcF9vdXRwdXQiO3M6MToibiI7czoxMzoibG9nX3JlZmVycmVycyI7czoxOiJuIjtzOjEzOiJtYXhfcmVmZXJyZXJzIjtzOjM6IjUwMCI7czoxMToidGltZV9mb3JtYXQiO3M6MjoidXMiO3M6MTU6InNlcnZlcl90aW1lem9uZSI7czozOiJVVEMiO3M6MTM6InNlcnZlcl9vZmZzZXQiO3M6MDoiIjtzOjE2OiJkYXlsaWdodF9zYXZpbmdzIjtzOjE6Im4iO3M6MjE6ImRlZmF1bHRfc2l0ZV90aW1lem9uZSI7czozOiJVVEMiO3M6MTY6ImRlZmF1bHRfc2l0ZV9kc3QiO3M6MToibiI7czoxNToiaG9ub3JfZW50cnlfZHN0IjtzOjE6InkiO3M6MTM6Im1haWxfcHJvdG9jb2wiO3M6NDoibWFpbCI7czoxMToic210cF9zZXJ2ZXIiO3M6MDoiIjtzOjEzOiJzbXRwX3VzZXJuYW1lIjtzOjA6IiI7czoxMzoic210cF9wYXNzd29yZCI7czowOiIiO3M6MTE6ImVtYWlsX2RlYnVnIjtzOjE6Im4iO3M6MTM6ImVtYWlsX2NoYXJzZXQiO3M6NToidXRmLTgiO3M6MTU6ImVtYWlsX2JhdGNobW9kZSI7czoxOiJuIjtzOjE2OiJlbWFpbF9iYXRjaF9zaXplIjtzOjA6IiI7czoxMToibWFpbF9mb3JtYXQiO3M6NToicGxhaW4iO3M6OToid29yZF93cmFwIjtzOjE6InkiO3M6MjI6ImVtYWlsX2NvbnNvbGVfdGltZWxvY2siO3M6MToiNSI7czoyMjoibG9nX2VtYWlsX2NvbnNvbGVfbXNncyI7czoxOiJ5IjtzOjg6ImNwX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MjE6ImVtYWlsX21vZHVsZV9jYXB0Y2hhcyI7czoxOiJuIjtzOjE2OiJsb2dfc2VhcmNoX3Rlcm1zIjtzOjE6InkiO3M6MTI6InNlY3VyZV9mb3JtcyI7czoxOiJ5IjtzOjE5OiJkZW55X2R1cGxpY2F0ZV9kYXRhIjtzOjE6InkiO3M6MjQ6InJlZGlyZWN0X3N1Ym1pdHRlZF9saW5rcyI7czoxOiJuIjtzOjE2OiJlbmFibGVfY2Vuc29yaW5nIjtzOjE6Im4iO3M6MTQ6ImNlbnNvcmVkX3dvcmRzIjtzOjA6IiI7czoxODoiY2Vuc29yX3JlcGxhY2VtZW50IjtzOjA6IiI7czoxMDoiYmFubmVkX2lwcyI7czowOiIiO3M6MTM6ImJhbm5lZF9lbWFpbHMiO3M6MDoiIjtzOjE2OiJiYW5uZWRfdXNlcm5hbWVzIjtzOjA6IiI7czoxOToiYmFubmVkX3NjcmVlbl9uYW1lcyI7czowOiIiO3M6MTA6ImJhbl9hY3Rpb24iO3M6ODoicmVzdHJpY3QiO3M6MTE6ImJhbl9tZXNzYWdlIjtzOjM0OiJUaGlzIHNpdGUgaXMgY3VycmVudGx5IHVuYXZhaWxhYmxlIjtzOjE1OiJiYW5fZGVzdGluYXRpb24iO3M6MjE6Imh0dHA6Ly93d3cueWFob28uY29tLyI7czoxNjoiZW5hYmxlX2Vtb3RpY29ucyI7czoxOiJ5IjtzOjEzOiJlbW90aWNvbl9wYXRoIjtzOjQ5OiJodHRwOi8vbG9jYWxob3N0L3BlcnNvbm5hbHdlYnNpdGUvaW1hZ2VzL3NtaWxleXMvIjtzOjE5OiJyZWNvdW50X2JhdGNoX3RvdGFsIjtzOjQ6IjEwMDAiO3M6MTc6Im5ld192ZXJzaW9uX2NoZWNrIjtzOjE6InkiO3M6MTc6ImVuYWJsZV90aHJvdHRsaW5nIjtzOjE6Im4iO3M6MTc6ImJhbmlzaF9tYXNrZWRfaXBzIjtzOjE6InkiO3M6MTQ6Im1heF9wYWdlX2xvYWRzIjtzOjI6IjEwIjtzOjEzOiJ0aW1lX2ludGVydmFsIjtzOjE6IjgiO3M6MTI6ImxvY2tvdXRfdGltZSI7czoyOiIzMCI7czoxNToiYmFuaXNobWVudF90eXBlIjtzOjc6Im1lc3NhZ2UiO3M6MTQ6ImJhbmlzaG1lbnRfdXJsIjtzOjA6IiI7czoxODoiYmFuaXNobWVudF9tZXNzYWdlIjtzOjUwOiJZb3UgaGF2ZSBleGNlZWRlZCB0aGUgYWxsb3dlZCBwYWdlIGxvYWQgZnJlcXVlbmN5LiI7czoxNzoiZW5hYmxlX3NlYXJjaF9sb2ciO3M6MToieSI7czoxOToibWF4X2xvZ2dlZF9zZWFyY2hlcyI7czozOiI1MDAiO3M6MTc6InRoZW1lX2ZvbGRlcl9wYXRoIjtzOjQ2OiIvVXNlcnMvTWF0dGhpZXUvU2l0ZXMvcGVyc29ubmFsd2Vic2l0ZS90aGVtZXMvIjtzOjEwOiJpc19zaXRlX29uIjtzOjE6InkiO30=', 'YTozOntzOjE5OiJtYWlsaW5nbGlzdF9lbmFibGVkIjtzOjE6InkiO3M6MTg6Im1haWxpbmdsaXN0X25vdGlmeSI7czoxOiJuIjtzOjI1OiJtYWlsaW5nbGlzdF9ub3RpZnlfZW1haWxzIjtzOjA6IiI7fQ==', 'YTo0NDp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToieSI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjI6InVzZV9tZW1iZXJzaGlwX2NhcHRjaGEiO3M6MToibiI7czoyMDoiZGVmYXVsdF9tZW1iZXJfZ3JvdXAiO3M6MToiNSI7czoxNToicHJvZmlsZV90cmlnZ2VyIjtzOjY6Im1lbWJlciI7czoxMjoibWVtYmVyX3RoZW1lIjtzOjc6ImRlZmF1bHQiO3M6MTQ6ImVuYWJsZV9hdmF0YXJzIjtzOjE6InkiO3M6MjA6ImFsbG93X2F2YXRhcl91cGxvYWRzIjtzOjE6Im4iO3M6MTA6ImF2YXRhcl91cmwiO3M6NDk6Imh0dHA6Ly9sb2NhbGhvc3QvcGVyc29ubmFsd2Vic2l0ZS9pbWFnZXMvYXZhdGFycy8iO3M6MTE6ImF2YXRhcl9wYXRoIjtzOjU0OiIvVXNlcnMvTWF0dGhpZXUvU2l0ZXMvcGVyc29ubmFsd2Vic2l0ZS9pbWFnZXMvYXZhdGFycy8iO3M6MTY6ImF2YXRhcl9tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE3OiJhdmF0YXJfbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTM6ImF2YXRhcl9tYXhfa2IiO3M6MjoiNTAiO3M6MTM6ImVuYWJsZV9waG90b3MiO3M6MToibiI7czo5OiJwaG90b191cmwiO3M6NTU6Imh0dHA6Ly9sb2NhbGhvc3QvcGVyc29ubmFsd2Vic2l0ZS9pbWFnZXMvbWVtYmVyX3Bob3Rvcy8iO3M6MTA6InBob3RvX3BhdGgiO3M6NjA6Ii9Vc2Vycy9NYXR0aGlldS9TaXRlcy9wZXJzb25uYWx3ZWJzaXRlL2ltYWdlcy9tZW1iZXJfcGhvdG9zLyI7czoxNToicGhvdG9fbWF4X3dpZHRoIjtzOjM6IjEwMCI7czoxNjoicGhvdG9fbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTI6InBob3RvX21heF9rYiI7czoyOiI1MCI7czoxNjoiYWxsb3dfc2lnbmF0dXJlcyI7czoxOiJ5IjtzOjEzOiJzaWdfbWF4bGVuZ3RoIjtzOjM6IjUwMCI7czoyMToic2lnX2FsbG93X2ltZ19ob3RsaW5rIjtzOjE6Im4iO3M6MjA6InNpZ19hbGxvd19pbWdfdXBsb2FkIjtzOjE6Im4iO3M6MTE6InNpZ19pbWdfdXJsIjtzOjYzOiJodHRwOi8vbG9jYWxob3N0L3BlcnNvbm5hbHdlYnNpdGUvaW1hZ2VzL3NpZ25hdHVyZV9hdHRhY2htZW50cy8iO3M6MTI6InNpZ19pbWdfcGF0aCI7czo2ODoiL1VzZXJzL01hdHRoaWV1L1NpdGVzL3BlcnNvbm5hbHdlYnNpdGUvaW1hZ2VzL3NpZ25hdHVyZV9hdHRhY2htZW50cy8iO3M6MTc6InNpZ19pbWdfbWF4X3dpZHRoIjtzOjM6IjQ4MCI7czoxODoic2lnX2ltZ19tYXhfaGVpZ2h0IjtzOjI6IjgwIjtzOjE0OiJzaWdfaW1nX21heF9rYiI7czoyOiIzMCI7czoxOToicHJ2X21zZ191cGxvYWRfcGF0aCI7czo2MToiL1VzZXJzL01hdHRoaWV1L1NpdGVzL3BlcnNvbm5hbHdlYnNpdGUvaW1hZ2VzL3BtX2F0dGFjaG1lbnRzLyI7czoyMzoicHJ2X21zZ19tYXhfYXR0YWNobWVudHMiO3M6MToiMyI7czoyMjoicHJ2X21zZ19hdHRhY2hfbWF4c2l6ZSI7czozOiIyNTAiO3M6MjA6InBydl9tc2dfYXR0YWNoX3RvdGFsIjtzOjM6IjEwMCI7czoxOToicHJ2X21zZ19odG1sX2Zvcm1hdCI7czo0OiJzYWZlIjtzOjE4OiJwcnZfbXNnX2F1dG9fbGlua3MiO3M6MToieSI7czoxNzoicHJ2X21zZ19tYXhfY2hhcnMiO3M6NDoiNjAwMCI7czoxOToibWVtYmVybGlzdF9vcmRlcl9ieSI7czoxMToidG90YWxfcG9zdHMiO3M6MjE6Im1lbWJlcmxpc3Rfc29ydF9vcmRlciI7czo0OiJkZXNjIjtzOjIwOiJtZW1iZXJsaXN0X3Jvd19saW1pdCI7czoyOiIyMCI7fQ==', 'YTo2OntzOjExOiJzdHJpY3RfdXJscyI7czoxOiJuIjtzOjg6InNpdGVfNDA0IjtzOjA6IiI7czoxOToic2F2ZV90bXBsX3JldmlzaW9ucyI7czoxOiJ5IjtzOjE4OiJtYXhfdG1wbF9yZXZpc2lvbnMiO3M6MToiNSI7czoxNToic2F2ZV90bXBsX2ZpbGVzIjtzOjE6InkiO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7czo3MjoiL1VzZXJzL01hdHRoaWV1L1NpdGVzL3BlcnNvbm5hbHdlYnNpdGUvYWRtaW4vZXhwcmVzc2lvbmVuZ2luZS90ZW1wbGF0ZXMvIjt9', 'YTo5OntzOjIxOiJpbWFnZV9yZXNpemVfcHJvdG9jb2wiO3M6MzoiZ2QyIjtzOjE4OiJpbWFnZV9saWJyYXJ5X3BhdGgiO3M6MDoiIjtzOjE2OiJ0aHVtYm5haWxfcHJlZml4IjtzOjU6InRodW1iIjtzOjE0OiJ3b3JkX3NlcGFyYXRvciI7czoxMDoidW5kZXJzY29yZSI7czoxNzoidXNlX2NhdGVnb3J5X25hbWUiO3M6MToibiI7czoyMjoicmVzZXJ2ZWRfY2F0ZWdvcnlfd29yZCI7czo4OiJjYXRlZ29yeSI7czoyMzoiYXV0b19jb252ZXJ0X2hpZ2hfYXNjaWkiO3M6MToibiI7czoyMjoibmV3X3Bvc3RzX2NsZWFyX2NhY2hlcyI7czoxOiJ5IjtzOjIzOiJhdXRvX2Fzc2lnbl9jYXRfcGFyZW50cyI7czoxOiJ5Ijt9', 'YToxOntzOjQ4OiIvVXNlcnMvTWF0dGhpZXUvU2l0ZXMvcGVyc29ubmFsd2Vic2l0ZS9pbmRleC5waHAiO3M6MzI6Ijc1ZjVjZGYxNGU1N2YyN2YwY2UxZGFkODZjNzkwYWJhIjt9', '');
UNLOCK TABLES;


LOCK TABLES `exp_snippets` WRITE;
INSERT INTO `exp_snippets` (`snippet_id`, `site_id`, `snippet_name`, `snippet_contents`) VALUES (1, 1, 'footer', '  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.js"></script>
  <script>!window.jQuery && document.write(unescape(\'%3Cscript src="resources/js/libs/jquery-1.4.2.js"%3E%3C/script%3E\'))</script>
  
  
  <!-- scripts concatenated and minified via ant build script-->
  <script src="resources/js/plugins.js"></script>
  <script src="resources/js/script.js"></script>
  <!-- end concatenated and minified scripts-->	

<!-- ///// JAVASCRIPT AND JQUERY CALLING -->
	<script type="text/javascript" src="resources/js/smooth-scroll.js"></script>

	<!-- IE 7 setting -->
	<!--[if lte IE 7]>
		<link rel="stylesheet" type="text/css" href="resources/css/ie.css" media="all" />
		<script type="text/javascript" src="resources/js/ie.js"></script>
	<![endif]-->
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src=\'" + gaJsHost + "google-analytics.com/ga.js\' type=\'text/javascript\'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-4942880-5");
pageTracker._trackPageview();
} catch(err) {}</script>
</body>
</html>');
UNLOCK TABLES;


LOCK TABLES `exp_specialty_templates` WRITE;
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES (1, 1, 'y', 'offline_template', '', '<html>
<head>

<title>System Offline</title>

<style type="text/css">

body { 
background-color:	#ffffff; 
margin:				50px; 
font-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;
font-size:			11px;
color:				#000;
background-color:	#fff;
}

a {
font-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;
font-weight:		bold;
letter-spacing:		.09em;
text-decoration:	none;
color:			  #330099;
background-color:	transparent;
}
  
a:visited {
color:				#330099;
background-color:	transparent;
}

a:hover {
color:				#000;
text-decoration:	underline;
background-color:	transparent;
}

#content  {
border:				#999999 1px solid;
padding:			22px 25px 14px 25px;
}

h1 {
font-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;
font-weight:		bold;
font-size:			14px;
color:				#000;
margin-top: 		0;
margin-bottom:		14px;
}

p {
font-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;
font-size: 			12px;
font-weight: 		normal;
margin-top: 		12px;
margin-bottom: 		14px;
color: 				#000;
}
</style>

</head>

<body>

<div id="content">

<h1>System Offline</h1>

<p>This site is currently offline</p>

</div>

</body>

</html>');
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES (2, 1, 'y', 'message_template', '', '<html>
<head>

<title>{title}</title>

<meta http-equiv=\'content-type\' content=\'text/html; charset={charset}\' />

{meta_refresh}

<style type="text/css">

body { 
background-color:	#ffffff; 
margin:				50px; 
font-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;
font-size:			11px;
color:				#000;
background-color:	#fff;
}

a {
font-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;
letter-spacing:		.09em;
text-decoration:	none;
color:			  #330099;
background-color:	transparent;
}
  
a:visited {
color:				#330099;
background-color:	transparent;
}

a:active {
color:				#ccc;
background-color:	transparent;
}

a:hover {
color:				#000;
text-decoration:	underline;
background-color:	transparent;
}

#content  {
border:				#000 1px solid;
background-color: 	#DEDFE3;
padding:			22px 25px 14px 25px;
}

h1 {
font-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;
font-weight:		bold;
font-size:			14px;
color:				#000;
margin-top: 		0;
margin-bottom:		14px;
}

p {
font-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;
font-size: 			12px;
font-weight: 		normal;
margin-top: 		12px;
margin-bottom: 		14px;
color: 				#000;
}

ul {
margin-bottom: 		16px;
}

li {
list-style:			square;
font-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;
font-size: 			12px;
font-weight: 		normal;
margin-top: 		8px;
margin-bottom: 		8px;
color: 				#000;
}

</style>

</head>

<body>

<div id="content">

<h1>{heading}</h1>

{content}

<p>{link}</p>

</div>

</body>

</html>');
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES (3, 1, 'y', 'admin_notify_reg', 'Notification of new member registration', 'New member registration site: {site_name}

Screen name: {name}
User name: {username}
Email: {email}

Your control panel URL: {control_panel_url}');
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES (4, 1, 'y', 'admin_notify_entry', 'A new channel entry has been posted', 'A new entry has been posted in the following channel:
{channel_name}

The title of the entry is:
{entry_title}

Posted by: {name}
Email: {email}

To read the entry please visit: 
{entry_url}
');
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES (5, 1, 'y', 'admin_notify_mailinglist', 'Someone has subscribed to your mailing list', 'A new mailing list subscription has been accepted.

Email Address: {email}
Mailing List: {mailing_list}');
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES (6, 1, 'y', 'admin_notify_comment', 'You have just received a comment', 'You have just received a comment for the following channel:
{channel_name}

The title of the entry is:
{entry_title}

Located at: 
{comment_url}

Posted by: {name}
Email: {email}
URL: {url}
Location: {location}

{comment}');
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES (7, 1, 'y', 'mbr_activation_instructions', 'Enclosed is your activation code', 'Thank you for your new member registration.

To activate your new account, please visit the following URL:

{unwrap}{activation_url}{/unwrap}

Thank You!

{site_name}

{site_url}');
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES (8, 1, 'y', 'forgot_password_instructions', 'Login information', '{name},

To reset your password, please go to the following page:

{reset_url}

Your password will be automatically reset, and a new password will be emailed to you.

If you do not wish to reset your password, ignore this message. It will expire in 24 hours.

{site_name}
{site_url}');
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES (9, 1, 'y', 'reset_password_notification', 'New Login Information', '{name},

Here is your new login information:

Username: {username}
Password: {password}

{site_name}
{site_url}');
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES (10, 1, 'y', 'validated_member_notify', 'Your membership account has been activated', '{name},

Your membership account has been activated and is ready for use.

Thank You!

{site_name}
{site_url}');
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES (11, 1, 'y', 'decline_member_validation', 'Your membership account has been declined', '{name},

We\'re sorry but our staff has decided not to validate your membership.

{site_name}
{site_url}');
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES (12, 1, 'y', 'mailinglist_activation_instructions', 'Email Confirmation', 'Thank you for joining the "{mailing_list}" mailing list!

Please click the link below to confirm your email.

If you do not want to be added to our list, ignore this email.

{unwrap}{activation_url}{/unwrap}

Thank You!

{site_name}');
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES (13, 1, 'y', 'comment_notification', 'Someone just responded to your comment', '{name_of_commenter} just responded to the entry you subscribed to at:
{channel_name}

The title of the entry is:
{entry_title}

You can see the comment at the following URL:
{comment_url}

{comment}

To stop receiving notifications for this comment, click here:
{notification_removal_url}');
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES (14, 1, 'y', 'comments_opened_notification', 'New comments have been added', 'Responses have been added to the entry you subscribed to at:
{channel_name}

The title of the entry is:
{entry_title}

You can see the comments at the following URL:
{comment_url}

{comments}
{comment} 
{/comments}

To stop receiving notifications for this entry, click here:
{notification_removal_url}');
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES (15, 1, 'y', 'private_message_notification', 'Someone has sent you a Private Message', '
{recipient_name},

{sender_name} has just sent you a Private Message titled ‘{message_subject}’.

You can see the Private Message by logging in and viewing your inbox at:
{site_url}

Content:

{message_content}

To stop receiving notifications of Private Messages, turn the option off in your Email Settings.

{site_name}
{site_url}');
INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_data`) VALUES (16, 1, 'y', 'pm_inbox_full', 'Your private message mailbox is full', '{recipient_name},

{sender_name} has just attempted to send you a Private Message,
but your inbox is full, exceeding the maximum of {pm_storage_limit}.

Please log in and remove unwanted messages from your inbox at:
{site_url}');
UNLOCK TABLES;


LOCK TABLES `exp_stats` WRITE;
INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`) VALUES (1, 1, 1, 1, 'matthieu', 12, 0, 0, 0, 1291597476, 0, 0, 1291600909, 3, 1291599497, 1292196115);
UNLOCK TABLES;


LOCK TABLES `exp_status_groups` WRITE;
INSERT INTO `exp_status_groups` (`group_id`, `site_id`, `group_name`) VALUES (1, 1, 'Statuses');
UNLOCK TABLES;


LOCK TABLES `exp_status_no_access` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_statuses` WRITE;
INSERT INTO `exp_statuses` (`status_id`, `site_id`, `group_id`, `status`, `status_order`, `highlight`) VALUES (1, 1, 1, 'open', 1, '009933');
INSERT INTO `exp_statuses` (`status_id`, `site_id`, `group_id`, `status`, `status_order`, `highlight`) VALUES (2, 1, 1, 'closed', 2, '990000');
UNLOCK TABLES;


LOCK TABLES `exp_template_groups` WRITE;
INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`) VALUES (1, 1, 'site', 1, 'y');
UNLOCK TABLES;


LOCK TABLES `exp_template_member_groups` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_template_no_access` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_templates` WRITE;
INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`) VALUES (1, 1, 1, 'index', 'y', 'webpage', 'coucou', '', 1291591374, 1, 'n', 0, '', 'n', 'y', 'o', 119);
INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `save_template_file`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`) VALUES (2, 1, 1, 'header', 'y', 'webpage', '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
<meta name="description" content="Resume PHP 5 web developer and online strategist using technologies such as CSS, Javascript, PHP, MySQL and frameworks such as CakePHP or jQuery. Skilled in Search Engine Optimization and Online Marketing." />
<meta name="keywords" content="PHP developer resume, PHP web developer, MySQL, MySQL developer, web developer, strategist, consultant, melbourne,HTML,CSS,XML,JavaScript,PHP,CakePHP,Jquery,Smokin\' Tops, 2.0" />
<meta name="author" content="Matthieu Aussaguel" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Matthieu Aussaguel | Resume</title>
	
	<!-- Styles Are set here -->
    <link href="resources/css/reset.css" rel="stylesheet" type="text/css" />    
	<link href="resources/css/960_24.css" rel="stylesheet" type="text/css" />
    <link href="resources/css/styles.css" rel="stylesheet" type="text/css" />
    <!-- print settings -->
    <link href="resources/css/print.css" rel="stylesheet" type="text/css" media="print" />
	
	<!-- ///// JAVASCRIPT AND JQUERY CALLING -->
	<script type="text/javascript" src="resources/js/jquery.js"></script>
	<script type="text/javascript" src="resources/js/smooth-scroll.js"></script>
	<script type="text/javascript" src="resources/js/custom.js"></script>

	<!-- IE 7 setting -->
	<!--[if lte IE 7]>
		<link rel="stylesheet" type="text/css" href="resources/css/ie.css" media="all" />
		<script type="text/javascript" src="resources/js/ie.js"></script>
	<![endif]-->

</head>
<body>

', '', 1291598159, 1, 'n', 0, '', 'n', 'n', 'o', 0);
UNLOCK TABLES;


LOCK TABLES `exp_throttle` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_upload_no_access` WRITE;
UNLOCK TABLES;


LOCK TABLES `exp_upload_prefs` WRITE;
UNLOCK TABLES;




SET FOREIGN_KEY_CHECKS = 1;


