-- -------------------------------------------------------------
-- TablePlus 6.3.2(586)
--
-- https://tableplus.com/
--
-- Database: dummy
-- Generation Time: 2025-03-09 14:05:53.6580
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."cache";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."cache" (
    "key" varchar(255) NOT NULL,
    "value" text NOT NULL,
    "expiration" int4 NOT NULL,
    PRIMARY KEY ("key")
);

DROP TABLE IF EXISTS "public"."cache_locks";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."cache_locks" (
    "key" varchar(255) NOT NULL,
    "owner" varchar(255) NOT NULL,
    "expiration" int4 NOT NULL,
    PRIMARY KEY ("key")
);

DROP TABLE IF EXISTS "public"."collections";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS collections_id_seq;

-- Table Definition
CREATE TABLE "public"."collections" (
    "id" int8 NOT NULL DEFAULT nextval('collections_id_seq'::regclass),
    "handle" varchar(255) NOT NULL,
    "title" varchar(255) NOT NULL,
    "settings" jsonb,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."entries";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."entries" (
    "id" uuid NOT NULL,
    "site" varchar(255) NOT NULL,
    "origin_id" uuid,
    "published" bool NOT NULL DEFAULT true,
    "slug" varchar(255),
    "uri" varchar(255),
    "date" varchar(255),
    "order" int4,
    "collection" varchar(255) NOT NULL,
    "blueprint" varchar(30),
    "data" jsonb NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."failed_jobs";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS failed_jobs_id_seq;

-- Table Definition
CREATE TABLE "public"."failed_jobs" (
    "id" int8 NOT NULL DEFAULT nextval('failed_jobs_id_seq'::regclass),
    "uuid" varchar(255) NOT NULL,
    "connection" text NOT NULL,
    "queue" text NOT NULL,
    "payload" text NOT NULL,
    "exception" text NOT NULL,
    "failed_at" timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."form_submissions";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."form_submissions" (
    "id" numeric(14,4) NOT NULL,
    "form" varchar(255),
    "data" jsonb,
    "created_at" timestamp,
    "updated_at" timestamp,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."forms";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS forms_id_seq;

-- Table Definition
CREATE TABLE "public"."forms" (
    "id" int8 NOT NULL DEFAULT nextval('forms_id_seq'::regclass),
    "handle" varchar(255) NOT NULL,
    "title" varchar(255) NOT NULL,
    "settings" jsonb,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."global_set_variables";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS global_set_variables_id_seq;

-- Table Definition
CREATE TABLE "public"."global_set_variables" (
    "id" int8 NOT NULL DEFAULT nextval('global_set_variables_id_seq'::regclass),
    "handle" varchar(255) NOT NULL,
    "locale" varchar(255),
    "origin" varchar(255),
    "data" jsonb NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."global_sets";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS global_sets_id_seq;

-- Table Definition
CREATE TABLE "public"."global_sets" (
    "id" int8 NOT NULL DEFAULT nextval('global_sets_id_seq'::regclass),
    "handle" varchar(255) NOT NULL,
    "title" varchar(255) NOT NULL,
    "settings" jsonb NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."group_user";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS group_user_id_seq;

-- Table Definition
CREATE TABLE "public"."group_user" (
    "id" int8 NOT NULL DEFAULT nextval('group_user_id_seq'::regclass),
    "user_id" int8 NOT NULL,
    "group_id" varchar(255) NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."job_batches";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."job_batches" (
    "id" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "total_jobs" int4 NOT NULL,
    "pending_jobs" int4 NOT NULL,
    "failed_jobs" int4 NOT NULL,
    "failed_job_ids" text NOT NULL,
    "options" text,
    "cancelled_at" int4,
    "created_at" int4 NOT NULL,
    "finished_at" int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."jobs";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS jobs_id_seq;

-- Table Definition
CREATE TABLE "public"."jobs" (
    "id" int8 NOT NULL DEFAULT nextval('jobs_id_seq'::regclass),
    "queue" varchar(255) NOT NULL,
    "payload" text NOT NULL,
    "attempts" int2 NOT NULL,
    "reserved_at" int4,
    "available_at" int4 NOT NULL,
    "created_at" int4 NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."migrations";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS migrations_id_seq;

-- Table Definition
CREATE TABLE "public"."migrations" (
    "id" int4 NOT NULL DEFAULT nextval('migrations_id_seq'::regclass),
    "migration" varchar(255) NOT NULL,
    "batch" int4 NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."navigations";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS navigations_id_seq;

-- Table Definition
CREATE TABLE "public"."navigations" (
    "id" int8 NOT NULL DEFAULT nextval('navigations_id_seq'::regclass),
    "handle" varchar(255) NOT NULL,
    "title" varchar(255) NOT NULL,
    "settings" jsonb,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."password_activation_tokens";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."password_activation_tokens" (
    "email" varchar(255) NOT NULL,
    "token" varchar(255) NOT NULL,
    "created_at" timestamp(0)
);

DROP TABLE IF EXISTS "public"."password_reset_tokens";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."password_reset_tokens" (
    "email" varchar(255) NOT NULL,
    "token" varchar(255) NOT NULL,
    "created_at" timestamp(0),
    PRIMARY KEY ("email")
);

DROP TABLE IF EXISTS "public"."role_user";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS role_user_id_seq;

-- Table Definition
CREATE TABLE "public"."role_user" (
    "id" int8 NOT NULL DEFAULT nextval('role_user_id_seq'::regclass),
    "user_id" int8 NOT NULL,
    "role_id" varchar(255) NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."sessions";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Table Definition
CREATE TABLE "public"."sessions" (
    "id" varchar(255) NOT NULL,
    "user_id" int8,
    "ip_address" varchar(45),
    "user_agent" text,
    "payload" text NOT NULL,
    "last_activity" int4 NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."taxonomies";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS taxonomies_id_seq;

-- Table Definition
CREATE TABLE "public"."taxonomies" (
    "id" int8 NOT NULL DEFAULT nextval('taxonomies_id_seq'::regclass),
    "handle" varchar(255) NOT NULL,
    "title" varchar(255) NOT NULL,
    "sites" jsonb,
    "settings" jsonb,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."taxonomy_terms";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS taxonomy_terms_id_seq;

-- Table Definition
CREATE TABLE "public"."taxonomy_terms" (
    "id" int8 NOT NULL DEFAULT nextval('taxonomy_terms_id_seq'::regclass),
    "site" varchar(255) NOT NULL,
    "slug" varchar(255) NOT NULL,
    "uri" varchar(255),
    "taxonomy" varchar(255) NOT NULL,
    "data" jsonb NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."tokens";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS tokens_id_seq;

-- Table Definition
CREATE TABLE "public"."tokens" (
    "id" int8 NOT NULL DEFAULT nextval('tokens_id_seq'::regclass),
    "token" varchar(255) NOT NULL,
    "handler" varchar(255) NOT NULL,
    "data" jsonb NOT NULL,
    "expire_at" timestamp(0) NOT NULL,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."trees";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS trees_id_seq;

-- Table Definition
CREATE TABLE "public"."trees" (
    "id" int8 NOT NULL DEFAULT nextval('trees_id_seq'::regclass),
    "handle" varchar(255) NOT NULL,
    "type" varchar(255) NOT NULL,
    "locale" varchar(255),
    "tree" jsonb,
    "settings" jsonb,
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."users";
-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "id" int8 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    "name" varchar(255) NOT NULL,
    "email" varchar(255) NOT NULL,
    "email_verified_at" timestamp(0),
    "password" varchar(255),
    "remember_token" varchar(100),
    "created_at" timestamp(0),
    "updated_at" timestamp(0),
    "super" bool NOT NULL DEFAULT false,
    "avatar" varchar(255),
    "preferences" json,
    "last_login" timestamp(0),
    PRIMARY KEY ("id")
);

INSERT INTO "public"."collections" ("id", "handle", "title", "settings", "created_at", "updated_at") VALUES
(1, 'pages', 'Pages', '{"dated": false, "mount": null, "sites": ["default"], "slugs": true, "inject": [], "layout": "layout", "routes": "{parent_uri}/{slug}", "sort_dir": "asc", "template": "default", "propagate": false, "revisions": false, "structure": null, "sort_field": null, "taxonomies": null, "search_index": null, "title_formats": [], "default_status": true, "origin_behavior": "select", "preview_targets": [{"label": "Entry", "format": "{permalink}", "refresh": true}], "past_date_behavior": "public", "future_date_behavior": "public"}', '2025-03-04 09:49:14', '2025-03-04 09:49:14');

INSERT INTO "public"."entries" ("id", "site", "origin_id", "published", "slug", "uri", "date", "order", "collection", "blueprint", "data", "created_at", "updated_at") VALUES
('4a020d65-c423-446a-b3c1-ff486f1e68c3', 'default', NULL, 't', 'baz', '/baz', NULL, NULL, 'pages', 'page', '{"seo": {"browser_title": null, "meta_description": null}, "title": "Excepteur incididunt Lorem dolor", "updated_by": "a134c226-b5ed-442f-bc9d-538cbb00876c"}', '2025-02-07 14:36:58', '2025-02-07 14:36:58'),
('72846eb4-114d-4e90-b48b-609d10188b7e', 'default', NULL, 't', 'foo', '/foo', NULL, NULL, 'pages', 'page', '{"seo": {"browser_title": null, "meta_description": null}, "title": "Exercitation dolore enim id", "updated_by": "a134c226-b5ed-442f-bc9d-538cbb00876c"}', '2025-03-04 09:39:10', '2025-03-04 09:39:10'),
('74d50153-f84a-4921-b6b5-67f3101ac6df', 'default', NULL, 't', 'dolor', '/dolor', NULL, NULL, 'pages', 'page', '{"seo": {"browser_title": null, "meta_description": null}, "title": "Dolor", "content": [{"id": "m7xi06ka", "file": "placeholders/ocean-landscape-2.jpg", "type": "image", "ratio": "1:1", "enabled": true, "force_ratio": true, "has_subline": false, "has_topline": false}], "is_home": false, "favicons": null, "dark_mode": null, "light_mode": null, "updated_by": "a134c226-b5ed-442f-bc9d-538cbb00876c", "browser_title": null, "favicon_16x16": null, "favicon_32x32": null, "favicon_48x48": null, "favicon_96x96": null, "favicon_144x144": null, "favicon_192x192": null, "favicon_256x256": null, "favicon_512x512": null, "favicons_section": null, "meta_description": null, "favicon_dark_16x16": null, "favicon_dark_32x32": null, "favicon_dark_48x48": null, "favicon_dark_96x96": null, "favicon_dark_144x144": null, "favicon_dark_192x192": null, "favicon_dark_256x256": null, "favicon_dark_512x512": null}', '2025-01-31 10:41:57', '2025-03-06 15:26:34'),
('853f849e-a059-402d-bf8c-b81d93a7ecd2', 'default', NULL, 't', 'lorem', '/lorem', NULL, NULL, 'pages', 'page', '{"seo": {"browser_title": null, "meta_description": null}, "title": "Lorem", "content": [{"id": "m6kmm934", "text": [{"type": "paragraph", "attrs": {"textAlign": "left"}, "content": [{"text": "Magna fugiat ", "type": "text"}, {"text": "elit ullamco dolore", "type": "text", "marks": [{"type": "link", "attrs": {"rel": null, "href": "https://kraenk.de", "title": null, "target": null}}]}, {"text": " labore velit dolore ullamco aute nulla id ex sunt cupidatat proident. Voluptate cillum labore irure et nostrud est cupidatat commodo eu magna ullamco elit est. Minim amet reprehenderit eu esse incididunt in incididunt dolore velit non sunt et nostrud cupidatat fugiat. Eu laborum incididunt commodo fugiat duis commodo velit. Officia cillum fugiat pariatur exercitation aliquip culpa veniam culpa. Ut tempor sit quis et consequat nulla ea. Incididunt ullamco esse dolore commodo veniam id exercitation velit incididunt commodo ad nisi nulla velit. Adipisicing labore dolore exercitation occaecat do velit cillum.", "type": "text"}]}, {"type": "paragraph", "attrs": {"textAlign": "left"}, "content": [{"text": "Irure anim officia laboris id occaecat fugiat exercitation. Commodo ullamco occaecat tempor irure sint. In ea laborum dolore adipisicing quis ullamco ad consequat. Exercitation nostrud eu reprehenderit exercitation et amet duis exercitation sint minim. Ipsum officia ex cupidatat. Cillum ea veniam cupidatat nisi proident.", "type": "text"}]}], "type": "text", "enabled": true, "subline": [{"text": "Occaecat esse voluptate elit eiusmod", "type": "text"}], "topline": [{"text": "Ad ex culpa nisi", "type": "text"}], "headline": [{"text": "Laborum commodo pariatur proident", "type": "text"}], "has_subline": true, "has_topline": true}, {"id": "m70r028w", "type": "text", "enabled": false, "headline": [{"text": "asdfadsf", "type": "text"}], "has_subline": false, "has_topline": false}, {"id": "m70r2qli", "file": "placeholders/desert-landscape-2.jpg", "type": "image", "caption": [{"type": "paragraph", "content": [{"text": "Enim consequat ut id irure elit fugiat mollit. ", "type": "text"}]}], "credits": [{"type": "paragraph", "content": [{"text": "© Amet Lorem", "type": "text"}]}], "enabled": true, "headline": [{"text": "Tempor officia occaecat", "type": "text"}], "force_ratio": false, "has_subline": false, "has_topline": false}, {"id": "m7126mzc", "file": "placeholders/desert-portrait-2.jpg", "type": "image", "ratio": "1:1", "caption": [{"type": "paragraph", "content": [{"text": "Adipisicing irure culpa ex mollit non", "type": "text"}]}], "credits": [{"type": "paragraph", "content": [{"text": "© Consequat Reprehenderit", "type": "text"}]}], "enabled": true, "force_ratio": true, "has_subline": false, "has_topline": false}, {"id": "m71y1q2p", "file": "placeholders/ocean-1.mp4", "type": "image", "enabled": true, "topline": [{"text": "Lorem", "type": "text"}], "headline": [{"text": "Adipisicing aute ad ipsum", "type": "text"}], "force_ratio": false, "has_subline": false, "has_topline": true}, {"id": "m71zeb84", "file": "placeholders/svg-1.svg", "type": "image", "enabled": true, "headline": [{"text": "Dolore aute fugiat", "type": "text"}], "force_ratio": false, "has_subline": false, "has_topline": false}, {"id": "m720i03w", "type": "video", "caption": [{"type": "paragraph", "content": [{"text": "Proident nisi", "type": "text"}]}], "enabled": true, "headline": [{"text": "Magna deserunt id anim nisi aliqua laboris consectetur", "type": "text"}], "embed_code": {"code": "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/Mr_uHJPUlO8?si=cLRcR_eYxgh4GRj_\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>", "mode": "htmlmixed"}, "force_ratio": false, "has_subline": false, "has_topline": false}, {"id": "m721ipka", "type": "video", "credits": [{"type": "paragraph", "content": [{"text": "© Eu et anim", "type": "text"}]}], "enabled": true, "embed_code": {"code": "<iframe title=\"vimeo-player\" src=\"https://player.vimeo.com/video/92009539?h=2a6651b07c\" width=\"640\" height=\"360\" frameborder=\"0\"    allowfullscreen></iframe>\n<p>Test</p>", "mode": "htmlmixed"}, "force_ratio": false, "has_subline": false, "has_topline": false}], "updated_by": "a134c226-b5ed-442f-bc9d-538cbb00876c"}', '2025-02-13 19:26:12', '2025-02-13 19:26:12'),
('853f849e-a059-402d-bf8c-b81d93a7ecd3', 'default', NULL, 't', 'home', '/home', NULL, NULL, 'pages', 'pages', '{"title": "Home", "author": "a134c226-b5ed-442f-bc9d-538cbb00876c", "content": [], "is_home": true, "favicons": null, "template": "default", "dark_mode": null, "light_mode": null, "updated_by": "a134c226-b5ed-442f-bc9d-538cbb00876c", "browser_title": null, "favicon_16x16": null, "favicon_32x32": null, "favicon_48x48": null, "favicon_96x96": null, "favicon_144x144": null, "favicon_192x192": null, "favicon_256x256": null, "favicon_512x512": null, "favicons_section": null, "meta_description": null, "favicon_dark_16x16": null, "favicon_dark_32x32": null, "favicon_dark_48x48": null, "favicon_dark_96x96": null, "favicon_dark_144x144": null, "favicon_dark_192x192": null, "favicon_dark_256x256": null, "favicon_dark_512x512": null}', '2025-03-04 09:39:47', '2025-03-06 15:14:37'),
('da385716-8c2c-4b1f-81d9-363707b51974', 'default', NULL, 't', 'bar', '/bar', NULL, NULL, 'pages', 'page', '{"seo": {"browser_title": null, "meta_description": null}, "title": "Anim magna aute", "updated_by": "a134c226-b5ed-442f-bc9d-538cbb00876c"}', '2025-02-07 14:36:49', '2025-02-07 14:36:49');

INSERT INTO "public"."global_set_variables" ("id", "handle", "locale", "origin", "data", "created_at", "updated_at") VALUES
(1, 'settings', 'default', NULL, '{"dark_mode": null, "main_logo": "logos/logo-dummy.png", "light_mode": null, "browser_title": "Sit officia aliquip deserunt", "favicon_16x16": null, "favicon_32x32": null, "favicon_48x48": null, "favicon_96x96": "favicons/icon-96.png", "website_title": "¯\\_(ツ)_/¯", "main_logo_dark": "logos/logo-dummy-dark.png", "favicon_144x144": null, "favicon_192x192": null, "favicon_256x256": null, "favicon_512x512": "favicons/icon-512.png", "favicons_section": null, "meta_description": "Qui nisi consequat consequat tempor reprehenderit incididunt aute consectetur ipsum ut minim in ut.", "favicon_dark_16x16": null, "favicon_dark_32x32": null, "favicon_dark_48x48": null, "favicon_dark_96x96": "favicons/icon-96-dark.png", "favicon_dark_144x144": null, "favicon_dark_192x192": null, "favicon_dark_256x256": null, "favicon_dark_512x512": "favicons/icon-512-dark.png"}', '2025-03-04 09:49:43', '2025-03-09 11:08:43'),
(2, 'settings', 'en', 'default', '{"dark_mode": null, "main_logo": "logos/logo-dummy.png", "light_mode": null, "browser_title": "Sit officia aliquip deserunt", "favicon_16x16": null, "favicon_32x32": null, "favicon_48x48": null, "favicon_96x96": "favicons/icon-96.png", "website_title": "¯\\_(ツ)_/¯", "main_logo_dark": "logos/logo-dummy-dark.png", "favicon_144x144": null, "favicon_192x192": null, "favicon_256x256": null, "favicon_512x512": "favicons/icon-512.png", "favicons_section": null, "meta_description": "Qui nisi consequat consequat tempor reprehenderit incididunt aute consectetur ipsum ut minim in ut.", "favicon_dark_16x16": null, "favicon_dark_32x32": null, "favicon_dark_48x48": null, "favicon_dark_96x96": "favicons/icon-96-dark.png", "favicon_dark_144x144": null, "favicon_dark_192x192": null, "favicon_dark_256x256": null, "favicon_dark_512x512": "favicons/icon-512-dark.png"}', '2025-03-04 09:49:43', '2025-03-09 11:08:43');

INSERT INTO "public"."global_sets" ("id", "handle", "title", "settings", "created_at", "updated_at") VALUES
(1, 'settings', 'Einstellungen', '[]', '2025-02-14 16:30:14', '2025-02-14 16:30:14');

INSERT INTO "public"."migrations" ("id", "migration", "batch") VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_03_07_100000_create_collections_table', 1),
(5, '2024_03_07_100000_create_entries_table_with_string_ids', 1),
(6, '2024_03_07_100000_create_navigation_trees_table', 1),
(7, '2024_03_07_100000_create_forms_table', 2),
(8, '2024_03_07_100000_create_form_submissions_table', 3),
(9, '2024_05_15_100000_modify_form_submissions_id', 3),
(10, '2024_03_07_100000_create_globals_table', 4),
(11, '2024_03_07_100000_create_global_variables_table', 5),
(12, '2024_03_07_100000_create_navigations_table', 6),
(13, '2024_03_07_100000_create_taxonomies_table', 7),
(14, '2024_03_07_100000_create_terms_table', 8),
(15, '2024_03_07_100000_create_tokens_table', 9),
(16, '2025_03_09_125555_statamic_auth_tables', 10);

INSERT INTO "public"."navigations" ("id", "handle", "title", "settings", "created_at", "updated_at") VALUES
(1, 'main_navigation', 'Hauptnavigation', '{"max_depth": 2, "collections": ["pages"], "expects_root": false, "select_across_sites": false}', '2025-01-31 10:42:54', '2025-01-31 10:42:54');

INSERT INTO "public"."trees" ("id", "handle", "type", "locale", "tree", "settings", "created_at", "updated_at") VALUES
(1, 'main_navigation', 'navigation', 'default', '[{"id": "d1164b21-6e7c-4c7d-b4c6-303b555f3fb6", "title": "Ipsum", "children": [{"id": "0477bb90-d16f-43e3-97b0-18087a632229", "entry": "72846eb4-114d-4e90-b48b-609d10188b7e"}, {"id": "ff05df71-8621-4cd1-9054-9aeaacbbe14f", "entry": "da385716-8c2c-4b1f-81d9-363707b51974"}, {"id": "b77002c5-82b8-4802-a88a-bbf70ec79f83", "entry": "4a020d65-c423-446a-b3c1-ff486f1e68c3"}]}, {"id": "b30649bc-fb14-4c9c-a2b4-eb3a405e0b61", "entry": "853f849e-a059-402d-bf8c-b81d93a7ecd2"}, {"id": "a50c933c-07da-4e2e-916a-55f00fc5e280", "entry": "74d50153-f84a-4921-b6b5-67f3101ac6df"}]', '[]', '2025-02-07 15:09:45', '2025-02-07 15:09:45');

INSERT INTO "public"."users" ("id", "name", "email", "email_verified_at", "password", "remember_token", "created_at", "updated_at", "super", "avatar", "preferences", "last_login") VALUES
(2, 'Kraenk', 'cms@kraenk.de', NULL, '$2y$12$Q0PYb124CIrR1YMJhensiOSLJRAeSEq3AIsG.ICHHcIRR80Tv/cQC', NULL, '2025-03-09 13:05:15', '2025-03-09 13:05:15', 't', NULL, NULL, NULL);



-- Indices
CREATE UNIQUE INDEX collections_handle_unique ON public.collections USING btree (handle);


-- Indices
CREATE INDEX entries_site_index ON public.entries USING btree (site);
CREATE INDEX entries_origin_id_index ON public.entries USING btree (origin_id);
CREATE INDEX entries_uri_index ON public.entries USING btree (uri);
CREATE INDEX entries_order_index ON public.entries USING btree ("order");
CREATE INDEX entries_collection_index ON public.entries USING btree (collection);
CREATE INDEX entries_blueprint_index ON public.entries USING btree (blueprint);


-- Indices
CREATE UNIQUE INDEX failed_jobs_uuid_unique ON public.failed_jobs USING btree (uuid);


-- Indices
CREATE UNIQUE INDEX form_submissions_form_created_at_unique ON public.form_submissions USING btree (form, created_at);
CREATE INDEX form_submissions_form_index ON public.form_submissions USING btree (form);
CREATE UNIQUE INDEX form_submissions_id_unique ON public.form_submissions USING btree (id);


-- Indices
CREATE UNIQUE INDEX forms_handle_unique ON public.forms USING btree (handle);


-- Indices
CREATE INDEX global_set_variables_handle_index ON public.global_set_variables USING btree (handle);


-- Indices
CREATE UNIQUE INDEX global_sets_handle_unique ON public.global_sets USING btree (handle);


-- Indices
CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


-- Indices
CREATE UNIQUE INDEX navigations_handle_unique ON public.navigations USING btree (handle);


-- Indices
CREATE INDEX password_activation_tokens_email_index ON public.password_activation_tokens USING btree (email);


-- Indices
CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);
CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


-- Indices
CREATE UNIQUE INDEX taxonomies_handle_unique ON public.taxonomies USING btree (handle);


-- Indices
CREATE UNIQUE INDEX taxonomy_terms_slug_taxonomy_site_unique ON public.taxonomy_terms USING btree (slug, taxonomy, site);
CREATE INDEX taxonomy_terms_site_index ON public.taxonomy_terms USING btree (site);
CREATE INDEX taxonomy_terms_uri_index ON public.taxonomy_terms USING btree (uri);
CREATE INDEX taxonomy_terms_taxonomy_index ON public.taxonomy_terms USING btree (taxonomy);


-- Indices
CREATE UNIQUE INDEX tokens_token_unique ON public.tokens USING btree (token);


-- Indices
CREATE UNIQUE INDEX trees_handle_type_locale_unique ON public.trees USING btree (handle, type, locale);
CREATE INDEX trees_type_index ON public.trees USING btree (type);
CREATE INDEX trees_locale_index ON public.trees USING btree (locale);


-- Indices
CREATE UNIQUE INDEX users_email_unique ON public.users USING btree (email);
