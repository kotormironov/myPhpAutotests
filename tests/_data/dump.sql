SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', 'public', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
DROP INDEX IF EXISTS public.idx_172848_workshops_work_date_id_index;
DROP INDEX IF EXISTS public.idx_172827_work_date_unit_id_index;
DROP INDEX IF EXISTS public.idx_172827_work_date_fired_at_index;
DROP INDEX IF EXISTS public.idx_172827_work_date_factory_id_unit_id_index;
DROP INDEX IF EXISTS public.idx_172827_work_date_applied_at_index;
DROP INDEX IF EXISTS public.idx_172827_is_current;
DROP INDEX IF EXISTS public.idx_172816_whats_app_queue_send_at_index;
DROP INDEX IF EXISTS public.idx_172805_whats_app_chat_object_id_object_type_index;
DROP INDEX IF EXISTS public.idx_172805_whats_app_chat_from_me_index;
DROP INDEX IF EXISTS public.idx_172758_user_event;
DROP INDEX IF EXISTS public.idx_172741_user_id;
DROP INDEX IF EXISTS public.idx_172736_user_factory_relation_user_id_index;
DROP INDEX IF EXISTS public.idx_172736_user_factory_relation_factory_id_index;
DROP INDEX IF EXISTS public.idx_172733_user_client_curator_relations_client_curator_id_uind;
DROP INDEX IF EXISTS public.idx_172648_units_contracts_unit_id_index;
DROP INDEX IF EXISTS public.idx_172648_units_contracts_to_index;
DROP INDEX IF EXISTS public.idx_172648_units_contracts_from_index;
DROP INDEX IF EXISTS public.idx_172628_unit_id;
DROP INDEX IF EXISTS public."idx_172628_pro-class";
DROP INDEX IF EXISTS public.idx_172575_timetable_checks_factory_id_date_index;
DROP INDEX IF EXISTS public.idx_172541_timesheet_state_index;
DROP INDEX IF EXISTS public.idx_172541_timesheet_factory_id_index;
DROP INDEX IF EXISTS public.idx_172541_date;
DROP INDEX IF EXISTS public.idx_172492_spp_cache_extension_unit_id_index;
DROP INDEX IF EXISTS public.idx_172492_spp_cache_extension_profession_id_index;
DROP INDEX IF EXISTS public.idx_172492_spp_cache_extension_factory_id_index;
DROP INDEX IF EXISTS public.idx_172486_spp_cache_unit_id_index;
DROP INDEX IF EXISTS public.idx_172478_whats_app_queue_send_at_index;
DROP INDEX IF EXISTS public.idx_172478_sms_send_id_index;
DROP INDEX IF EXISTS public.idx_172454_settings_key_uindex;
DROP INDEX IF EXISTS public.idx_172442_unit_id;
DROP INDEX IF EXISTS public.idx_172442_content;
DROP INDEX IF EXISTS public.idx_172422_salary_unit_id_factory_id_date_index;
DROP INDEX IF EXISTS public.idx_172348_unit_user_ids;
DROP INDEX IF EXISTS public.idx_172348_unit_id;
DROP INDEX IF EXISTS public.idx_172324_queue_status_time_index;
DROP INDEX IF EXISTS public.idx_172254_unit_user_ids;
DROP INDEX IF EXISTS public.idx_172254_unit_id;
DROP INDEX IF EXISTS public.idx_172231_request;
DROP INDEX IF EXISTS public.idx_172198_phone;
DROP INDEX IF EXISTS public.idx_172193_phone_id;
DROP INDEX IF EXISTS public.idx_172193_object_type;
DROP INDEX IF EXISTS public.idx_172193_object_id;
DROP INDEX IF EXISTS public.idx_172111_unit_id;
DROP INDEX IF EXISTS public.idx_172105_online_stat_created_at_index;
DROP INDEX IF EXISTS public.idx_172085_user_read;
DROP INDEX IF EXISTS public.idx_172085_notification_user_id_important_read_at_index;
DROP INDEX IF EXISTS public.idx_172085_notification_user_id_factory_id_index;
DROP INDEX IF EXISTS public.idx_172085_notification_read_at_user_id_global_important_index;
DROP INDEX IF EXISTS public.idx_172085_notification_global_index;
DROP INDEX IF EXISTS public.idx_172002_lead_service_relations_external_id_index;
DROP INDEX IF EXISTS public.idx_171925_group_factory_relations_group_id_index;
DROP INDEX IF EXISTS public.idx_171925_group_factory_relations_factory_id_index;
DROP INDEX IF EXISTS public.idx_171911_files_relations_unit_id_index;
DROP INDEX IF EXISTS public.idx_171911_files_relations_type_id_index;
DROP INDEX IF EXISTS public.idx_171911_files_relations_file_id_index;
DROP INDEX IF EXISTS public.idx_171899_files_type_id_index;
DROP INDEX IF EXISTS public.idx_171899_files_deleted_index;
DROP INDEX IF EXISTS public.idx_171859_key;
DROP INDEX IF EXISTS public.idx_171848_factory_id;
DROP INDEX IF EXISTS public.idx_171837_name;
DROP INDEX IF EXISTS public.idx_171815_login;
DROP INDEX IF EXISTS public.idx_171815_ev_users_role_id_index;
DROP INDEX IF EXISTS public.idx_171807_ev_units_meta_key_index;
DROP INDEX IF EXISTS public.idx_171786_fio;
DROP INDEX IF EXISTS public.idx_171786_ev_units_release_days_index;
DROP INDEX IF EXISTS public.idx_171786_ev_units_rate_index;
DROP INDEX IF EXISTS public.idx_171786_dnd;
DROP INDEX IF EXISTS public.idx_171786_ddwcs;
DROP INDEX IF EXISTS public.idx_171786_dds;
DROP INDEX IF EXISTS public.idx_171786_call_date;
DROP INDEX IF EXISTS public.idx_171775_ev_logs_unit_id_index;
DROP INDEX IF EXISTS public.idx_171767_group_name;
DROP INDEX IF EXISTS public.idx_171759_unit_user_ids;
DROP INDEX IF EXISTS public.idx_171759_unit_id;
DROP INDEX IF EXISTS public.idx_171662_year;
DROP INDEX IF EXISTS public.idx_171587_call_statistic_to_id_index;
DROP INDEX IF EXISTS public.idx_171587_call_statistic_from_id_index;
ALTER TABLE IF EXISTS ONLY public.whats_app_settings
    DROP CONSTRAINT IF EXISTS whats_app_settings_pkey;
ALTER TABLE IF EXISTS ONLY public.users_sips
    DROP CONSTRAINT IF EXISTS users_sips_pkey;
ALTER TABLE IF EXISTS ONLY public.user_events
    DROP CONSTRAINT IF EXISTS user_events_pkey;
ALTER TABLE IF EXISTS ONLY public.user_event_unit_relations
    DROP CONSTRAINT IF EXISTS user_event_unit_relations_pkey;
ALTER TABLE IF EXISTS ONLY public.user_calendar_settings
    DROP CONSTRAINT IF EXISTS user_calendar_settings_pkey;
ALTER TABLE IF EXISTS ONLY public.units_segments
    DROP CONSTRAINT IF EXISTS units_segments_pkey;
ALTER TABLE IF EXISTS ONLY public.timetable_cache
    DROP CONSTRAINT IF EXISTS timetable_cache_pkey;
ALTER TABLE IF EXISTS ONLY public.telphin_instances
    DROP CONSTRAINT IF EXISTS telphin_instances_pkey;
ALTER TABLE IF EXISTS ONLY public.requests_periods
    DROP CONSTRAINT IF EXISTS requests_periods_pkey;
ALTER TABLE IF EXISTS ONLY public.referral_relations_requests_row
    DROP CONSTRAINT IF EXISTS referral_relations_requests_row_pkey;
ALTER TABLE IF EXISTS ONLY public.referral_relations_requests
    DROP CONSTRAINT IF EXISTS referral_relations_requests_pkey;
ALTER TABLE IF EXISTS ONLY public.referral_relations_requests_logs
    DROP CONSTRAINT IF EXISTS referral_relations_requests_logs_pkey;
ALTER TABLE IF EXISTS ONLY public.referral_relations_requests_comments
    DROP CONSTRAINT IF EXISTS referral_relations_requests_comments_pkey;
ALTER TABLE IF EXISTS ONLY public.referral_relations
    DROP CONSTRAINT IF EXISTS referral_relations_pkey;
ALTER TABLE IF EXISTS ONLY public.proxy_relations
    DROP CONSTRAINT IF EXISTS proxy_relations_pkey;
ALTER TABLE IF EXISTS ONLY public.proxies
    DROP CONSTRAINT IF EXISTS proxies_pkey;
ALTER TABLE IF EXISTS ONLY public.lead_processing_statistic
    DROP CONSTRAINT IF EXISTS lead_processing_statistic_pkey;
ALTER TABLE IF EXISTS ONLY public.workshops
    DROP CONSTRAINT IF EXISTS idx_172848_primary;
ALTER TABLE IF EXISTS ONLY public.work_flow
    DROP CONSTRAINT IF EXISTS idx_172842_primary;
ALTER TABLE IF EXISTS ONLY public.work_date
    DROP CONSTRAINT IF EXISTS idx_172827_primary;
ALTER TABLE IF EXISTS ONLY public.whats_app_queue
    DROP CONSTRAINT IF EXISTS idx_172816_primary;
ALTER TABLE IF EXISTS ONLY public.whats_app_chat
    DROP CONSTRAINT IF EXISTS idx_172805_primary;
ALTER TABLE IF EXISTS ONLY public.warehouse
    DROP CONSTRAINT IF EXISTS idx_172798_primary;
ALTER TABLE IF EXISTS ONLY public.viber_queue
    DROP CONSTRAINT IF EXISTS idx_172788_primary;
ALTER TABLE IF EXISTS ONLY public.vacancies_cities_relations
    DROP CONSTRAINT IF EXISTS idx_172779_primary;
ALTER TABLE IF EXISTS ONLY public.vacancies
    DROP CONSTRAINT IF EXISTS idx_172763_primary;
ALTER TABLE IF EXISTS ONLY public.user_hang_request
    DROP CONSTRAINT IF EXISTS idx_172741_primary;
ALTER TABLE IF EXISTS ONLY public.updates_read
    DROP CONSTRAINT IF EXISTS idx_172729_primary;
ALTER TABLE IF EXISTS ONLY public.updates
    DROP CONSTRAINT IF EXISTS idx_172720_primary;
ALTER TABLE IF EXISTS ONLY public.units_stat
    DROP CONSTRAINT IF EXISTS idx_172711_primary;
ALTER TABLE IF EXISTS ONLY public.units_rating
    DROP CONSTRAINT IF EXISTS idx_172704_primary;
ALTER TABLE IF EXISTS ONLY public.units_phone_delete_requests
    DROP CONSTRAINT IF EXISTS idx_172695_primary;
ALTER TABLE IF EXISTS ONLY public.units_document_delete_requests
    DROP CONSTRAINT IF EXISTS idx_172670_primary;
ALTER TABLE IF EXISTS ONLY public.units_delete_requests
    DROP CONSTRAINT IF EXISTS idx_172661_primary;
ALTER TABLE IF EXISTS ONLY public.units_contracts
    DROP CONSTRAINT IF EXISTS idx_172648_primary;
ALTER TABLE IF EXISTS ONLY public.unit_payment_cards
    DROP CONSTRAINT IF EXISTS idx_172639_primary;
ALTER TABLE IF EXISTS ONLY public.unit_experience
    DROP CONSTRAINT IF EXISTS idx_172628_primary;
ALTER TABLE IF EXISTS ONLY public.unit_events
    DROP CONSTRAINT IF EXISTS idx_172619_primary;
ALTER TABLE IF EXISTS ONLY public.unit_contract_contractors
    DROP CONSTRAINT IF EXISTS idx_172604_primary;
ALTER TABLE IF EXISTS ONLY public.timetable_signatures
    DROP CONSTRAINT IF EXISTS idx_172596_primary;
ALTER TABLE IF EXISTS ONLY public.timetable_comments
    DROP CONSTRAINT IF EXISTS idx_172586_primary;
ALTER TABLE IF EXISTS ONLY public.timetable_checks
    DROP CONSTRAINT IF EXISTS idx_172575_primary;
ALTER TABLE IF EXISTS ONLY public.timesheet_totals_master
    DROP CONSTRAINT IF EXISTS idx_172568_primary;
ALTER TABLE IF EXISTS ONLY public.timesheet_totals
    DROP CONSTRAINT IF EXISTS idx_172559_primary;
ALTER TABLE IF EXISTS ONLY public.timesheet_logs
    DROP CONSTRAINT IF EXISTS idx_172548_primary;
ALTER TABLE IF EXISTS ONLY public.timesheet
    DROP CONSTRAINT IF EXISTS idx_172541_primary;
ALTER TABLE IF EXISTS ONLY public.tests
    DROP CONSTRAINT IF EXISTS idx_172530_primary;
ALTER TABLE IF EXISTS ONLY public.surcharges
    DROP CONSTRAINT IF EXISTS idx_172519_primary;
ALTER TABLE IF EXISTS ONLY public.summary
    DROP CONSTRAINT IF EXISTS idx_172508_primary;
ALTER TABLE IF EXISTS ONLY public.dic_subways
    DROP CONSTRAINT IF EXISTS idx_172500_primary;
ALTER TABLE IF EXISTS ONLY public.spp_cache
    DROP CONSTRAINT IF EXISTS idx_172486_primary;
ALTER TABLE IF EXISTS ONLY public.sms
    DROP CONSTRAINT IF EXISTS idx_172478_primary;
ALTER TABLE IF EXISTS ONLY public.slow_log
    DROP CONSTRAINT IF EXISTS idx_172469_primary;
ALTER TABLE IF EXISTS ONLY public.shift_time
    DROP CONSTRAINT IF EXISTS idx_172463_primary;
ALTER TABLE IF EXISTS ONLY public.settings
    DROP CONSTRAINT IF EXISTS idx_172454_primary;
ALTER TABLE IF EXISTS ONLY public.self_employed
    DROP CONSTRAINT IF EXISTS idx_172448_primary;
ALTER TABLE IF EXISTS ONLY public.scripts
    DROP CONSTRAINT IF EXISTS idx_172438_primary;
ALTER TABLE IF EXISTS ONLY public.script_phrases
    DROP CONSTRAINT IF EXISTS idx_172428_primary;
ALTER TABLE IF EXISTS ONLY public.salary
    DROP CONSTRAINT IF EXISTS idx_172422_primary;
ALTER TABLE IF EXISTS ONLY public.retentions
    DROP CONSTRAINT IF EXISTS idx_172416_primary;
ALTER TABLE IF EXISTS ONLY public.requests
    DROP CONSTRAINT IF EXISTS idx_172390_primary;
ALTER TABLE IF EXISTS ONLY public.request_recruit
    DROP CONSTRAINT IF EXISTS idx_172381_primary;
ALTER TABLE IF EXISTS ONLY public.request_oriented
    DROP CONSTRAINT IF EXISTS idx_172375_primary;
ALTER TABLE IF EXISTS ONLY public.request_logs
    DROP CONSTRAINT IF EXISTS idx_172364_primary;
ALTER TABLE IF EXISTS ONLY public.request_completed
    DROP CONSTRAINT IF EXISTS idx_172358_primary;
ALTER TABLE IF EXISTS ONLY public.request_comments
    DROP CONSTRAINT IF EXISTS idx_172348_primary;
ALTER TABLE IF EXISTS ONLY public.recruits_groups
    DROP CONSTRAINT IF EXISTS idx_172333_primary;
ALTER TABLE IF EXISTS ONLY public.protocols
    DROP CONSTRAINT IF EXISTS idx_172308_primary;
ALTER TABLE IF EXISTS ONLY public.protocol_items
    DROP CONSTRAINT IF EXISTS idx_172302_primary;
ALTER TABLE IF EXISTS ONLY public.professions
    DROP CONSTRAINT IF EXISTS idx_172290_primary;
ALTER TABLE IF EXISTS ONLY public.prepayments_signatures
    DROP CONSTRAINT IF EXISTS idx_172282_primary;
ALTER TABLE IF EXISTS ONLY public.prepayments_rows
    DROP CONSTRAINT IF EXISTS idx_172276_primary;
ALTER TABLE IF EXISTS ONLY public.prepayments_logs
    DROP CONSTRAINT IF EXISTS idx_172265_primary;
ALTER TABLE IF EXISTS ONLY public.prepayments_comments
    DROP CONSTRAINT IF EXISTS idx_172254_primary;
ALTER TABLE IF EXISTS ONLY public.prepayments_change_requests
    DROP CONSTRAINT IF EXISTS idx_172244_primary;
ALTER TABLE IF EXISTS ONLY public.prepayments
    DROP CONSTRAINT IF EXISTS idx_172237_primary;
ALTER TABLE IF EXISTS ONLY public.plan_statistic
    DROP CONSTRAINT IF EXISTS idx_172231_primary;
ALTER TABLE IF EXISTS ONLY public.plan_recruit
    DROP CONSTRAINT IF EXISTS idx_172225_primary;
ALTER TABLE IF EXISTS ONLY public.plan_orientation
    DROP CONSTRAINT IF EXISTS idx_172219_primary;
ALTER TABLE IF EXISTS ONLY public.plan_completion
    DROP CONSTRAINT IF EXISTS idx_172213_primary;
ALTER TABLE IF EXISTS ONLY public.plan
    DROP CONSTRAINT IF EXISTS idx_172205_primary;
ALTER TABLE IF EXISTS ONLY public.phones
    DROP CONSTRAINT IF EXISTS idx_172198_primary;
ALTER TABLE IF EXISTS ONLY public.personal_documents
    DROP CONSTRAINT IF EXISTS idx_172186_primary;
ALTER TABLE IF EXISTS ONLY public.overalls_requests_rows
    DROP CONSTRAINT IF EXISTS idx_172177_primary;
ALTER TABLE IF EXISTS ONLY public.overalls_requests_logs
    DROP CONSTRAINT IF EXISTS idx_172166_primary;
ALTER TABLE IF EXISTS ONLY public.overalls_requests
    DROP CONSTRAINT IF EXISTS idx_172156_primary;
ALTER TABLE IF EXISTS ONLY public.overalls_list
    DROP CONSTRAINT IF EXISTS idx_172147_primary;
ALTER TABLE IF EXISTS ONLY public.overalls
    DROP CONSTRAINT IF EXISTS idx_172135_primary;
ALTER TABLE IF EXISTS ONLY public.overall_without_deduction
    DROP CONSTRAINT IF EXISTS idx_172129_primary;
ALTER TABLE IF EXISTS ONLY public.outgoing_1s_queue
    DROP CONSTRAINT IF EXISTS idx_172119_primary;
ALTER TABLE IF EXISTS ONLY public.oriented_stat
    DROP CONSTRAINT IF EXISTS idx_172111_primary;
ALTER TABLE IF EXISTS ONLY public.officials
    DROP CONSTRAINT IF EXISTS idx_172096_primary;
ALTER TABLE IF EXISTS ONLY public.notification
    DROP CONSTRAINT IF EXISTS idx_172085_primary;
ALTER TABLE IF EXISTS ONLY public.no_request_completion
    DROP CONSTRAINT IF EXISTS idx_172079_primary;
ALTER TABLE IF EXISTS ONLY public.migrations
    DROP CONSTRAINT IF EXISTS idx_172070_primary;
ALTER TABLE IF EXISTS ONLY public.master_units_delay
    DROP CONSTRAINT IF EXISTS idx_172064_primary;
ALTER TABLE IF EXISTS ONLY public.mailings
    DROP CONSTRAINT IF EXISTS idx_172049_primary;
ALTER TABLE IF EXISTS ONLY public.mailing_templates
    DROP CONSTRAINT IF EXISTS idx_172038_primary;
ALTER TABLE IF EXISTS ONLY public.logs_auth
    DROP CONSTRAINT IF EXISTS idx_172023_primary;
ALTER TABLE IF EXISTS ONLY public.leads
    DROP CONSTRAINT IF EXISTS idx_172007_primary;
ALTER TABLE IF EXISTS ONLY public.lead_service_relations
    DROP CONSTRAINT IF EXISTS idx_172002_primary;
ALTER TABLE IF EXISTS ONLY public.languages
    DROP CONSTRAINT IF EXISTS idx_171998_primary;
ALTER TABLE IF EXISTS ONLY public.knowledge_section_relation
    DROP CONSTRAINT IF EXISTS idx_171992_primary;
ALTER TABLE IF EXISTS ONLY public.knowledge_section_availability
    DROP CONSTRAINT IF EXISTS idx_171986_primary;
ALTER TABLE IF EXISTS ONLY public.knowledge_section
    DROP CONSTRAINT IF EXISTS idx_171977_primary;
ALTER TABLE IF EXISTS ONLY public.knowledge_article_relation
    DROP CONSTRAINT IF EXISTS idx_171970_primary;
ALTER TABLE IF EXISTS ONLY public.knowledge_article
    DROP CONSTRAINT IF EXISTS idx_171961_primary;
ALTER TABLE IF EXISTS ONLY public.keeper_value_changes
    DROP CONSTRAINT IF EXISTS idx_171951_primary;
ALTER TABLE IF EXISTS ONLY public.insurance
    DROP CONSTRAINT IF EXISTS idx_171943_primary;
ALTER TABLE IF EXISTS ONLY public.fines
    DROP CONSTRAINT IF EXISTS idx_171917_primary;
ALTER TABLE IF EXISTS ONLY public.files
    DROP CONSTRAINT IF EXISTS idx_171899_primary;
ALTER TABLE IF EXISTS ONLY public.feedback_comment
    DROP CONSTRAINT IF EXISTS idx_171886_primary;
ALTER TABLE IF EXISTS ONLY public.feedback
    DROP CONSTRAINT IF EXISTS idx_171877_primary;
ALTER TABLE IF EXISTS ONLY public.factory_today_state
    DROP CONSTRAINT IF EXISTS idx_171864_primary;
ALTER TABLE IF EXISTS ONLY public.factories
    DROP CONSTRAINT IF EXISTS idx_171837_primary;
ALTER TABLE IF EXISTS ONLY public.ev_users
    DROP CONSTRAINT IF EXISTS idx_171815_primary;
ALTER TABLE IF EXISTS ONLY public.ev_units
    DROP CONSTRAINT IF EXISTS idx_171786_primary;
ALTER TABLE IF EXISTS ONLY public.ev_comments
    DROP CONSTRAINT IF EXISTS idx_171759_primary;
ALTER TABLE IF EXISTS ONLY public.errors_1s
    DROP CONSTRAINT IF EXISTS idx_171749_primary;
ALTER TABLE IF EXISTS ONLY public.error_logs
    DROP CONSTRAINT IF EXISTS idx_171740_primary;
ALTER TABLE IF EXISTS ONLY public.email
    DROP CONSTRAINT IF EXISTS idx_171727_primary;
ALTER TABLE IF EXISTS ONLY public.documents_types
    DROP CONSTRAINT IF EXISTS idx_171718_primary;
ALTER TABLE IF EXISTS ONLY public.documents_logs
    DROP CONSTRAINT IF EXISTS idx_171707_primary;
ALTER TABLE IF EXISTS ONLY public.documents
    DROP CONSTRAINT IF EXISTS idx_171698_primary;
ALTER TABLE IF EXISTS ONLY public.dic_languages
    DROP CONSTRAINT IF EXISTS idx_171683_primary;
ALTER TABLE IF EXISTS ONLY public.dic_insurance_companies
    DROP CONSTRAINT IF EXISTS idx_171674_primary;
ALTER TABLE IF EXISTS ONLY public.curator_check_lists
    DROP CONSTRAINT IF EXISTS idx_171668_primary;
ALTER TABLE IF EXISTS ONLY public.conversions
    DROP CONSTRAINT IF EXISTS idx_171662_primary;
ALTER TABLE IF EXISTS ONLY public.contracts
    DROP CONSTRAINT IF EXISTS idx_171653_primary;
ALTER TABLE IF EXISTS ONLY public.citizenship
    DROP CONSTRAINT IF EXISTS idx_171646_primary;
ALTER TABLE IF EXISTS ONLY public.cities
    DROP CONSTRAINT IF EXISTS idx_171636_primary;
ALTER TABLE IF EXISTS ONLY public.chat_events
    DROP CONSTRAINT IF EXISTS idx_171627_primary;
ALTER TABLE IF EXISTS ONLY public.calls_queue
    DROP CONSTRAINT IF EXISTS idx_171621_primary;
ALTER TABLE IF EXISTS ONLY public.calls_count_statistic
    DROP CONSTRAINT IF EXISTS idx_171615_primary;
ALTER TABLE IF EXISTS ONLY public.call_task_lists
    DROP CONSTRAINT IF EXISTS idx_171608_primary;
ALTER TABLE IF EXISTS ONLY public.call_task
    DROP CONSTRAINT IF EXISTS idx_171596_primary;
ALTER TABLE IF EXISTS ONLY public.auth
    DROP CONSTRAINT IF EXISTS idx_171577_primary;
ALTER TABLE IF EXISTS ONLY public.api_auth
    DROP CONSTRAINT IF EXISTS idx_171571_primary;
ALTER TABLE IF EXISTS ONLY public.advance_account
    DROP CONSTRAINT IF EXISTS idx_171559_primary;
ALTER TABLE IF EXISTS ONLY public.adv_outcome
    DROP CONSTRAINT IF EXISTS idx_171550_primary;
ALTER TABLE IF EXISTS ONLY public.accounts
    DROP CONSTRAINT IF EXISTS idx_171533_primary;
ALTER TABLE IF EXISTS ONLY public.account_transactions
    DROP CONSTRAINT IF EXISTS idx_171522_primary;
ALTER TABLE IF EXISTS ONLY public.accommodation_places_month_prices
    DROP CONSTRAINT IF EXISTS idx_171515_primary;
ALTER TABLE IF EXISTS ONLY public.accommodation_places
    DROP CONSTRAINT IF EXISTS idx_171503_primary;
ALTER TABLE IF EXISTS ONLY public.accommodation_periods
    DROP CONSTRAINT IF EXISTS idx_171490_primary;
ALTER TABLE IF EXISTS ONLY public.fias_location_cache
    DROP CONSTRAINT IF EXISTS fias_location_cache_pkey;
ALTER TABLE IF EXISTS ONLY public.dic_lead_status_reasons
    DROP CONSTRAINT IF EXISTS dic_lead_status_reasons_pkey;
ALTER TABLE IF EXISTS public.workshops
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.work_flow
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.work_date
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.whats_app_queue
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.whats_app_chat
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.warehouse
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.viber_queue
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.vacancies_cities_relations
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.vacancies
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.user_logs
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.user_hang_request
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.updates_read
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.updates
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.units_stat
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.units_rating
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.units_phone_delete_requests
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.units_document_delete_requests
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.units_delete_requests
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.units_contracts
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.unit_payment_cards
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.unit_experience
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.unit_events
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.unit_contract_contractors
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.timetable_signatures
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.timetable_comments
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.timetable_checks
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.timesheet_totals_master
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.timesheet_totals
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.timesheet_logs
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.timesheet
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.tests
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.surcharges
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.summary
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.sms
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.slow_log
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.shift_time
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.settings
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.scripts
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.script_phrases
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.salary
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.retentions
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.requests
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.request_recruit
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.request_oriented
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.request_logs
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.request_completed
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.request_comments
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.recruits_groups
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.queue_status
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.protocols
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.protocol_items
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.professions
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.prepayments_signatures
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.prepayments_rows
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.prepayments_logs
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.prepayments_comments
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.prepayments_change_requests
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.prepayments
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.plan_statistic
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.plan_recruit
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.plan_orientation
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.plan_completion
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.plan
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.phones
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.personal_documents
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.overalls_requests_rows
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.overalls_requests_logs
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.overalls_requests
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.overalls_list
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.overalls
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.overall_without_deduction
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.outgoing_1s_queue
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.oriented_stat
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.online_stat
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.old_unit_experience
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.notification
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.no_request_completion
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.migrations
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.master_units_delay
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.mailings
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.mailing_templates
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.logs_auth
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.leads
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.languages
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.knowledge_section_relation
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.knowledge_section_availability
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.knowledge_section
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.knowledge_article_relation
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.knowledge_article
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.keeper_value_changes
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.insurance
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.fines
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.files
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.feedback_comment
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.feedback
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.factory_today_state
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.factories
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.ev_users
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.ev_units
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.ev_logs
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.ev_comments
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.errors_1s
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.error_logs
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.email
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.documents_types
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.documents_logs
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.documents
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.dic_subways
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.dic_languages
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.dic_insurance_companies
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.curator_check_lists
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.conversions
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.citizenship
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.cities
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.chat_events
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.calls_queue
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.calls_count_statistic
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.call_task_lists
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.call_task
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.call_statistic
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.auth
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.api_auth
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.advance_account
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.adv_outcome
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.accounts
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.account_transactions
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.accommodation_places_month_prices
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.accommodation_places
    ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.accommodation_periods
    ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.workshops_id_seq;
DROP TABLE IF EXISTS public.workshops;
DROP SEQUENCE IF EXISTS public.work_flow_id_seq;
DROP TABLE IF EXISTS public.work_flow;
DROP SEQUENCE IF EXISTS public.work_date_id_seq;
DROP TABLE IF EXISTS public.work_date;
DROP TABLE IF EXISTS public.whats_app_settings;
DROP SEQUENCE IF EXISTS public.whats_app_settings_id_seq;
DROP SEQUENCE IF EXISTS public.whats_app_queue_id_seq;
DROP TABLE IF EXISTS public.whats_app_queue;
DROP TABLE IF EXISTS public.whats_app_instance_phone_relations;
DROP SEQUENCE IF EXISTS public.whats_app_chat_id_seq;
DROP TABLE IF EXISTS public.whats_app_chat;
DROP SEQUENCE IF EXISTS public.warehouse_id_seq;
DROP TABLE IF EXISTS public.warehouse;
DROP SEQUENCE IF EXISTS public.viber_queue_id_seq;
DROP TABLE IF EXISTS public.viber_queue;
DROP TABLE IF EXISTS public.vacation_applications_work_date_relations;
DROP SEQUENCE IF EXISTS public.vacancies_id_seq;
DROP SEQUENCE IF EXISTS public.vacancies_cities_relations_id_seq;
DROP TABLE IF EXISTS public.vacancies_cities_relations;
DROP TABLE IF EXISTS public.vacancies;
DROP TABLE IF EXISTS public.users_sips;
DROP SEQUENCE IF EXISTS public.users_sips_seq;
DROP TABLE IF EXISTS public.user_unit_events_relations;
DROP TABLE IF EXISTS public.user_recruit_relation;
DROP SEQUENCE IF EXISTS public.user_logs_id_seq;
DROP TABLE IF EXISTS public.user_logs;
DROP SEQUENCE IF EXISTS public.user_hang_request_id_seq;
DROP TABLE IF EXISTS public.user_hang_request;
DROP TABLE IF EXISTS public.user_factory_relation;
DROP TABLE IF EXISTS public.user_external_service_relations;
DROP TABLE IF EXISTS public.user_events;
DROP SEQUENCE IF EXISTS public.user_events_id_seq;
DROP TABLE IF EXISTS public.user_event_unit_relations;
DROP SEQUENCE IF EXISTS public.user_event_unit_relations_id_seq;
DROP TABLE IF EXISTS public.user_client_curator_relations;
DROP TABLE IF EXISTS public.user_calendar_settings;
DROP SEQUENCE IF EXISTS public.user_calendar_settings_id_seq;
DROP SEQUENCE IF EXISTS public.updates_read_id_seq;
DROP TABLE IF EXISTS public.updates_read;
DROP SEQUENCE IF EXISTS public.updates_id_seq;
DROP TABLE IF EXISTS public.updates;
DROP TABLE IF EXISTS public.units_tags;
DROP SEQUENCE IF EXISTS public.units_stat_id_seq;
DROP TABLE IF EXISTS public.units_stat;
DROP TABLE IF EXISTS public.units_segments;
DROP SEQUENCE IF EXISTS public.units_segments_id_seq;
DROP SEQUENCE IF EXISTS public.units_rating_id_seq;
DROP TABLE IF EXISTS public.units_rating;
DROP SEQUENCE IF EXISTS public.units_phone_delete_requests_id_seq;
DROP TABLE IF EXISTS public.units_phone_delete_requests;
DROP TABLE IF EXISTS public.units_patents_checks;
DROP TABLE IF EXISTS public.units_filter_params;
DROP SEQUENCE IF EXISTS public.units_document_delete_requests_id_seq;
DROP TABLE IF EXISTS public.units_document_delete_requests;
DROP SEQUENCE IF EXISTS public.units_delete_requests_id_seq;
DROP TABLE IF EXISTS public.units_delete_requests;
DROP SEQUENCE IF EXISTS public.units_contracts_id_seq;
DROP TABLE IF EXISTS public.units_contracts;
DROP TABLE IF EXISTS public.units_additional_data;
DROP SEQUENCE IF EXISTS public.unit_payment_cards_id_seq;
DROP TABLE IF EXISTS public.unit_payment_cards;
DROP TABLE IF EXISTS public.unit_external_chat_relations;
DROP SEQUENCE IF EXISTS public.unit_experience_id_seq;
DROP TABLE IF EXISTS public.unit_experience;
DROP SEQUENCE IF EXISTS public.unit_events_id_seq;
DROP TABLE IF EXISTS public.unit_events;
DROP TABLE IF EXISTS public.unit_contract_work_date_relations;
DROP SEQUENCE IF EXISTS public.unit_contract_contractors_id_seq;
DROP TABLE IF EXISTS public.unit_contract_contractors;
DROP SEQUENCE IF EXISTS public.timetable_signatures_id_seq;
DROP TABLE IF EXISTS public.timetable_signatures;
DROP SEQUENCE IF EXISTS public.timetable_comments_id_seq;
DROP TABLE IF EXISTS public.timetable_comments;
DROP SEQUENCE IF EXISTS public.timetable_checks_id_seq;
DROP TABLE IF EXISTS public.timetable_checks;
DROP TABLE IF EXISTS public.timetable_cache;
DROP SEQUENCE IF EXISTS public.timetable_cache_id_seq;
DROP SEQUENCE IF EXISTS public.timesheet_totals_master_id_seq;
DROP TABLE IF EXISTS public.timesheet_totals_master;
DROP SEQUENCE IF EXISTS public.timesheet_totals_id_seq;
DROP TABLE IF EXISTS public.timesheet_totals;
DROP SEQUENCE IF EXISTS public.timesheet_logs_id_seq;
DROP TABLE IF EXISTS public.timesheet_logs;
DROP SEQUENCE IF EXISTS public.timesheet_id_seq;
DROP TABLE IF EXISTS public.timesheet;
DROP SEQUENCE IF EXISTS public.tests_id_seq;
DROP TABLE IF EXISTS public.tests;
DROP TABLE IF EXISTS public.telphin_instances;
DROP SEQUENCE IF EXISTS public.telphin_instances_id_seq;
DROP SEQUENCE IF EXISTS public.surcharges_id_seq;
DROP TABLE IF EXISTS public.surcharges;
DROP SEQUENCE IF EXISTS public.summary_id_seq;
DROP TABLE IF EXISTS public.summary;
DROP SEQUENCE IF EXISTS public.subways_id_seq;
DROP TABLE IF EXISTS public.spp_cache_extension;
DROP TABLE IF EXISTS public.spp_cache;
DROP SEQUENCE IF EXISTS public.sms_id_seq;
DROP TABLE IF EXISTS public.sms;
DROP SEQUENCE IF EXISTS public.slow_log_id_seq;
DROP TABLE IF EXISTS public.slow_log;
DROP SEQUENCE IF EXISTS public.shift_time_id_seq;
DROP TABLE IF EXISTS public.shift_time;
DROP SEQUENCE IF EXISTS public.settings_id_seq;
DROP TABLE IF EXISTS public.settings;
DROP TABLE IF EXISTS public.self_employed;
DROP TABLE IF EXISTS public.segment_unit_relations;
DROP TABLE IF EXISTS public.search_index;
DROP SEQUENCE IF EXISTS public.scripts_id_seq;
DROP TABLE IF EXISTS public.scripts;
DROP SEQUENCE IF EXISTS public.script_phrases_id_seq;
DROP TABLE IF EXISTS public.script_phrases;
DROP SEQUENCE IF EXISTS public.salary_id_seq;
DROP TABLE IF EXISTS public.salary;
DROP SEQUENCE IF EXISTS public.retentions_id_seq;
DROP TABLE IF EXISTS public.retentions;
DROP TABLE IF EXISTS public.requisites;
DROP TABLE IF EXISTS public.requests_periods;
DROP SEQUENCE IF EXISTS public.requests_periods_seq;
DROP SEQUENCE IF EXISTS public.requests_id_seq;
DROP TABLE IF EXISTS public.requests;
DROP SEQUENCE IF EXISTS public.request_recruit_id_seq;
DROP TABLE IF EXISTS public.request_recruit;
DROP SEQUENCE IF EXISTS public.request_oriented_id_seq;
DROP TABLE IF EXISTS public.request_oriented;
DROP SEQUENCE IF EXISTS public.request_logs_id_seq;
DROP TABLE IF EXISTS public.request_logs;
DROP SEQUENCE IF EXISTS public.request_completed_id_seq;
DROP TABLE IF EXISTS public.request_completed;
DROP SEQUENCE IF EXISTS public.request_comments_id_seq;
DROP TABLE IF EXISTS public.request_comments;
DROP TABLE IF EXISTS public.report_statistic;
DROP TABLE IF EXISTS public.referral_relations_requests_row;
DROP SEQUENCE IF EXISTS public.referral_relations_requests_row_id_seq;
DROP TABLE IF EXISTS public.referral_relations_requests_logs;
DROP SEQUENCE IF EXISTS public.referral_relations_requests_logs_id_seq;
DROP TABLE IF EXISTS public.referral_relations_requests_comments;
DROP SEQUENCE IF EXISTS public.referral_relations_requests_comments_id_seq;
DROP TABLE IF EXISTS public.referral_relations_requests;
DROP SEQUENCE IF EXISTS public.referral_relations_requests_id_seq;
DROP TABLE IF EXISTS public.referral_relations;
DROP SEQUENCE IF EXISTS public.referral_relations_id_seq;
DROP SEQUENCE IF EXISTS public.recruits_groups_id_seq;
DROP TABLE IF EXISTS public.recruits_groups;
DROP TABLE IF EXISTS public.recruit_activity_stat;
DROP SEQUENCE IF EXISTS public.queue_status_id_seq;
DROP TABLE IF EXISTS public.queue_status;
DROP TABLE IF EXISTS public.queue_external_chat_relations;
DROP TABLE IF EXISTS public.proxy_relations;
DROP SEQUENCE IF EXISTS public.proxy_relations_id_seq;
DROP TABLE IF EXISTS public.proxies;
DROP SEQUENCE IF EXISTS public.proxies_id_seq;
DROP SEQUENCE IF EXISTS public.protocols_id_seq;
DROP TABLE IF EXISTS public.protocols;
DROP SEQUENCE IF EXISTS public.protocol_items_id_seq;
DROP TABLE IF EXISTS public.protocol_items;
DROP TABLE IF EXISTS public.protocol_factory_relations;
DROP SEQUENCE IF EXISTS public.professions_id_seq;
DROP TABLE IF EXISTS public.professions;
DROP SEQUENCE IF EXISTS public.prepayments_signatures_id_seq;
DROP TABLE IF EXISTS public.prepayments_signatures;
DROP SEQUENCE IF EXISTS public.prepayments_rows_id_seq;
DROP TABLE IF EXISTS public.prepayments_rows;
DROP SEQUENCE IF EXISTS public.prepayments_logs_id_seq;
DROP TABLE IF EXISTS public.prepayments_logs;
DROP SEQUENCE IF EXISTS public.prepayments_id_seq;
DROP SEQUENCE IF EXISTS public.prepayments_comments_id_seq;
DROP TABLE IF EXISTS public.prepayments_comments;
DROP SEQUENCE IF EXISTS public.prepayments_change_requests_id_seq;
DROP TABLE IF EXISTS public.prepayments_change_requests;
DROP TABLE IF EXISTS public.prepayments;
DROP SEQUENCE IF EXISTS public.plan_statistic_id_seq;
DROP TABLE IF EXISTS public.plan_statistic;
DROP SEQUENCE IF EXISTS public.plan_recruit_id_seq;
DROP TABLE IF EXISTS public.plan_recruit;
DROP SEQUENCE IF EXISTS public.plan_orientation_id_seq;
DROP TABLE IF EXISTS public.plan_orientation;
DROP SEQUENCE IF EXISTS public.plan_id_seq;
DROP SEQUENCE IF EXISTS public.plan_completion_id_seq;
DROP TABLE IF EXISTS public.plan_completion;
DROP TABLE IF EXISTS public.plan;
DROP SEQUENCE IF EXISTS public.phones_id_seq;
DROP TABLE IF EXISTS public.phones;
DROP TABLE IF EXISTS public.phone_relations;
DROP SEQUENCE IF EXISTS public.personal_documents_id_seq;
DROP TABLE IF EXISTS public.personal_documents;
DROP SEQUENCE IF EXISTS public.overalls_requests_rows_id_seq;
DROP TABLE IF EXISTS public.overalls_requests_rows;
DROP SEQUENCE IF EXISTS public.overalls_requests_logs_id_seq;
DROP TABLE IF EXISTS public.overalls_requests_logs;
DROP SEQUENCE IF EXISTS public.overalls_requests_id_seq;
DROP TABLE IF EXISTS public.overalls_requests_factories_relations;
DROP TABLE IF EXISTS public.overalls_requests;
DROP SEQUENCE IF EXISTS public.overalls_list_id_seq;
DROP TABLE IF EXISTS public.overalls_list;
DROP SEQUENCE IF EXISTS public.overalls_id_seq;
DROP TABLE IF EXISTS public.overalls;
DROP SEQUENCE IF EXISTS public.overall_without_deduction_id_seq;
DROP TABLE IF EXISTS public.overall_without_deduction;
DROP SEQUENCE IF EXISTS public.outgoing_1s_queue_id_seq;
DROP TABLE IF EXISTS public.outgoing_1s_queue;
DROP SEQUENCE IF EXISTS public.oriented_stat_id_seq;
DROP TABLE IF EXISTS public.oriented_stat;
DROP SEQUENCE IF EXISTS public.online_stat_id_seq;
DROP TABLE IF EXISTS public.online_stat;
DROP SEQUENCE IF EXISTS public.old_unit_experience_id_seq;
DROP TABLE IF EXISTS public.old_unit_experience;
DROP TABLE IF EXISTS public.officials;
DROP SEQUENCE IF EXISTS public.notification_id_seq;
DROP TABLE IF EXISTS public.notification;
DROP SEQUENCE IF EXISTS public.no_request_completion_id_seq;
DROP TABLE IF EXISTS public.no_request_completion;
DROP TABLE IF EXISTS public.mts_user_relations;
DROP SEQUENCE IF EXISTS public.migrations_id_seq;
DROP TABLE IF EXISTS public.migrations;
DROP SEQUENCE IF EXISTS public.master_units_delay_id_seq;
DROP TABLE IF EXISTS public.master_units_delay;
DROP SEQUENCE IF EXISTS public.mailings_id_seq;
DROP TABLE IF EXISTS public.mailings;
DROP SEQUENCE IF EXISTS public.mailing_templates_id_seq;
DROP TABLE IF EXISTS public.mailing_templates;
DROP TABLE IF EXISTS public.logs_export;
DROP SEQUENCE IF EXISTS public.logs_auth_id_seq;
DROP TABLE IF EXISTS public.logs_auth;
DROP SEQUENCE IF EXISTS public.leads_id_seq;
DROP TABLE IF EXISTS public.leads_extension;
DROP TABLE IF EXISTS public.leads;
DROP TABLE IF EXISTS public.lead_service_relations;
DROP TABLE IF EXISTS public.lead_processing_statistic;
DROP SEQUENCE IF EXISTS public.lead_processing_statistic_seq;
DROP SEQUENCE IF EXISTS public.languages_id_seq;
DROP TABLE IF EXISTS public.languages;
DROP SEQUENCE IF EXISTS public.knowledge_section_relation_id_seq;
DROP TABLE IF EXISTS public.knowledge_section_relation;
DROP SEQUENCE IF EXISTS public.knowledge_section_id_seq;
DROP SEQUENCE IF EXISTS public.knowledge_section_availability_id_seq;
DROP TABLE IF EXISTS public.knowledge_section_availability;
DROP TABLE IF EXISTS public.knowledge_section;
DROP SEQUENCE IF EXISTS public.knowledge_article_relation_id_seq;
DROP TABLE IF EXISTS public.knowledge_article_relation;
DROP SEQUENCE IF EXISTS public.knowledge_article_id_seq;
DROP TABLE IF EXISTS public.knowledge_article;
DROP SEQUENCE IF EXISTS public.keeper_value_changes_id_seq;
DROP TABLE IF EXISTS public.keeper_value_changes;
DROP SEQUENCE IF EXISTS public.insurance_id_seq;
DROP TABLE IF EXISTS public.insurance;
DROP TABLE IF EXISTS public.group_user_relations;
DROP TABLE IF EXISTS public.group_factory_relations;
DROP TABLE IF EXISTS public.freelancer_unit_relations;
DROP SEQUENCE IF EXISTS public.fines_id_seq;
DROP TABLE IF EXISTS public.fines;
DROP TABLE IF EXISTS public.files_relations;
DROP SEQUENCE IF EXISTS public.files_id_seq;
DROP TABLE IF EXISTS public.files;
DROP TABLE IF EXISTS public.fias_location_cache;
DROP SEQUENCE IF EXISTS public.feedback_id_seq;
DROP SEQUENCE IF EXISTS public.feedback_comment_id_seq;
DROP TABLE IF EXISTS public.feedback_comment;
DROP TABLE IF EXISTS public.feedback;
DROP SEQUENCE IF EXISTS public.factory_today_state_id_seq;
DROP TABLE IF EXISTS public.factory_today_state;
DROP TABLE IF EXISTS public.factory_meta;
DROP TABLE IF EXISTS public.factory_files_relations;
DROP TABLE IF EXISTS public.factory_contactor_relations;
DROP TABLE IF EXISTS public.factories_tags;
DROP TABLE IF EXISTS public.factories_rates_relations;
DROP SEQUENCE IF EXISTS public.factories_id_seq;
DROP TABLE IF EXISTS public.factories_accommodation_places_relations;
DROP TABLE IF EXISTS public.factories;
DROP SEQUENCE IF EXISTS public.ev_users_id_seq;
DROP TABLE IF EXISTS public.ev_users;
DROP TABLE IF EXISTS public.ev_units_meta;
DROP SEQUENCE IF EXISTS public.ev_units_id_seq;
DROP TABLE IF EXISTS public.ev_units;
DROP SEQUENCE IF EXISTS public.ev_logs_id_seq;
DROP TABLE IF EXISTS public.ev_logs;
DROP TABLE IF EXISTS public.ev_feedback_groups;
DROP SEQUENCE IF EXISTS public.ev_comments_id_seq;
DROP TABLE IF EXISTS public.ev_comments;
DROP SEQUENCE IF EXISTS public.errors_1s_id_seq;
DROP TABLE IF EXISTS public.errors_1s;
DROP SEQUENCE IF EXISTS public.error_logs_id_seq;
DROP TABLE IF EXISTS public.error_logs;
DROP TABLE IF EXISTS public.error_log_telegram_relations;
DROP SEQUENCE IF EXISTS public.email_id_seq;
DROP TABLE IF EXISTS public.email;
DROP SEQUENCE IF EXISTS public.documents_types_id_seq;
DROP TABLE IF EXISTS public.documents_types;
DROP SEQUENCE IF EXISTS public.documents_logs_id_seq;
DROP TABLE IF EXISTS public.documents_logs;
DROP SEQUENCE IF EXISTS public.documents_id_seq;
DROP TABLE IF EXISTS public.documents;
DROP TABLE IF EXISTS public.dictionary_translations;
DROP TABLE IF EXISTS public.dic_subways;
DROP TABLE IF EXISTS public.dic_lead_status_reasons;
DROP SEQUENCE IF EXISTS public.dic_lead_status_reasons_id_seq;
DROP SEQUENCE IF EXISTS public.dic_languages_id_seq;
DROP TABLE IF EXISTS public.dic_languages;
DROP SEQUENCE IF EXISTS public.dic_insurance_companies_id_seq;
DROP TABLE IF EXISTS public.dic_insurance_companies;
DROP SEQUENCE IF EXISTS public.curator_check_lists_id_seq;
DROP TABLE IF EXISTS public.curator_check_lists;
DROP SEQUENCE IF EXISTS public.conversions_id_seq;
DROP TABLE IF EXISTS public.conversions;
DROP TABLE IF EXISTS public.contracts;
DROP SEQUENCE IF EXISTS public.citizenship_id_seq;
DROP TABLE IF EXISTS public.citizenship;
DROP SEQUENCE IF EXISTS public.cities_id_seq;
DROP TABLE IF EXISTS public.cities;
DROP SEQUENCE IF EXISTS public.chat_events_id_seq;
DROP TABLE IF EXISTS public.chat_events;
DROP SEQUENCE IF EXISTS public.calls_queue_id_seq;
DROP TABLE IF EXISTS public.calls_queue;
DROP SEQUENCE IF EXISTS public.calls_count_statistic_id_seq;
DROP TABLE IF EXISTS public.calls_count_statistic;
DROP SEQUENCE IF EXISTS public.call_task_lists_id_seq;
DROP TABLE IF EXISTS public.call_task_lists;
DROP SEQUENCE IF EXISTS public.call_task_id_seq;
DROP TABLE IF EXISTS public.call_task;
DROP SEQUENCE IF EXISTS public.call_statistic_id_seq;
DROP TABLE IF EXISTS public.call_statistic;
DROP TABLE IF EXISTS public.calendar;
DROP SEQUENCE IF EXISTS public.auth_id_seq;
DROP TABLE IF EXISTS public.auth;
DROP SEQUENCE IF EXISTS public.api_auth_id_seq;
DROP TABLE IF EXISTS public.api_auth;
DROP SEQUENCE IF EXISTS public.advance_account_id_seq;
DROP TABLE IF EXISTS public.advance_account;
DROP SEQUENCE IF EXISTS public.adv_outcome_id_seq;
DROP TABLE IF EXISTS public.adv_outcome;
DROP TABLE IF EXISTS public.activities;
DROP TABLE IF EXISTS public.acl;
DROP SEQUENCE IF EXISTS public.accounts_id_seq;
DROP TABLE IF EXISTS public.accounts;
DROP SEQUENCE IF EXISTS public.account_transactions_id_seq;
DROP TABLE IF EXISTS public.account_transactions;
DROP SEQUENCE IF EXISTS public.accommodation_places_month_prices_id_seq;
DROP TABLE IF EXISTS public.accommodation_places_month_prices;
DROP SEQUENCE IF EXISTS public.accommodation_places_id_seq;
DROP TABLE IF EXISTS public.accommodation_places;
DROP TABLE IF EXISTS public.accommodation_periods_relations;
DROP SEQUENCE IF EXISTS public.accommodation_periods_id_seq;
DROP TABLE IF EXISTS public.accommodation_periods;
DROP SCHEMA IF EXISTS public;
CREATE SCHEMA public;
ALTER SCHEMA public OWNER TO postgres;
COMMENT ON SCHEMA public IS 'standard public schema';
SET default_tablespace = '';
SET default_table_access_method = heap;
CREATE TABLE public.accommodation_periods
(
    id              integer           NOT NULL,
    place_id        integer,
    started_at      date,
    finished_at     date,
    additional      text,
    unit_id         integer,
    contract_number character varying(50),
    contract_date   timestamp with time zone,
    deleted         integer DEFAULT 0 NOT NULL
);
ALTER TABLE public.accommodation_periods
    OWNER TO bp;
CREATE SEQUENCE public.accommodation_periods_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.accommodation_periods_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.accommodation_periods_id_seq OWNED BY public.accommodation_periods.id;
CREATE TABLE public.accommodation_periods_relations
(
    accommodation_period_id integer,
    work_date_id            integer
);
ALTER TABLE public.accommodation_periods_relations
    OWNER TO bp;
CREATE TABLE public.accommodation_places
(
    id            integer                              NOT NULL,
    name          character varying(255)               NOT NULL,
    deleted       smallint       DEFAULT '0'::smallint NOT NULL,
    active        smallint       DEFAULT '1'::smallint NOT NULL,
    seats         integer        DEFAULT 0,
    lat           character varying(50),
    lng           character varying(50),
    subway        integer,
    default_price numeric(10, 2) DEFAULT 0.00          NOT NULL,
    is_contract   integer        DEFAULT 0             NOT NULL,
    protected     integer        DEFAULT 0             NOT NULL
);
ALTER TABLE public.accommodation_places
    OWNER TO bp;
CREATE SEQUENCE public.accommodation_places_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.accommodation_places_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.accommodation_places_id_seq OWNED BY public.accommodation_places.id;
CREATE TABLE public.accommodation_places_month_prices
(
    id       integer                     NOT NULL,
    place_id integer                     NOT NULL,
    date     date,
    price    numeric(10, 2) DEFAULT 0.00 NOT NULL
);
ALTER TABLE public.accommodation_places_month_prices
    OWNER TO bp;
CREATE SEQUENCE public.accommodation_places_month_prices_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.accommodation_places_month_prices_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.accommodation_places_month_prices_id_seq OWNED BY public.accommodation_places_month_prices.id;
CREATE TABLE public.account_transactions
(
    id           integer                                            NOT NULL,
    account_from integer                                            NOT NULL,
    account_to   integer                                            NOT NULL,
    amount       numeric(10, 2)           DEFAULT 0.00,
    comment      text,
    created_at   timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.account_transactions
    OWNER TO bp;
CREATE SEQUENCE public.account_transactions_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.account_transactions_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.account_transactions_id_seq OWNED BY public.account_transactions.id;
CREATE TABLE public.accounts
(
    id     integer NOT NULL,
    amount numeric(10, 2) DEFAULT 0.00
);
ALTER TABLE public.accounts
    OWNER TO bp;
CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.accounts_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;
CREATE TABLE public.acl
(
    user_id   bigint                 NOT NULL,
    presenter character varying(20)  NOT NULL,
    action    character varying(20)  NOT NULL,
    data      character varying(255) NOT NULL
);
ALTER TABLE public.acl
    OWNER TO bp;
CREATE TABLE public.activities
(
    presenter     character varying(255),
    action        character varying(255),
    role_id       integer DEFAULT 0,
    request_count integer
);
ALTER TABLE public.activities
    OWNER TO bp;
COMMENT ON COLUMN public.activities.presenter IS 'Контроллер';
COMMENT ON COLUMN public.activities.action IS 'Вью';
COMMENT ON COLUMN public.activities.role_id IS 'ID роли';
COMMENT ON COLUMN public.activities.request_count IS 'Количество обращений';
CREATE TABLE public.adv_outcome
(
    id          integer NOT NULL,
    title       character varying(255),
    description text,
    feedback_id integer,
    amount      numeric(13, 5),
    date        date
);
ALTER TABLE public.adv_outcome
    OWNER TO bp;
CREATE SEQUENCE public.adv_outcome_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.adv_outcome_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.adv_outcome_id_seq OWNED BY public.adv_outcome.id;
CREATE TABLE public.advance_account
(
    id         integer NOT NULL,
    date       date,
    factory_id integer,
    status     integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    data       text
);
ALTER TABLE public.advance_account
    OWNER TO bp;
CREATE SEQUENCE public.advance_account_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.advance_account_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.advance_account_id_seq OWNED BY public.advance_account.id;
CREATE TABLE public.api_auth
(
    id         integer                  NOT NULL,
    user_id    integer                  NOT NULL,
    token      character varying(255)   NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);
ALTER TABLE public.api_auth
    OWNER TO bp;
CREATE SEQUENCE public.api_auth_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.api_auth_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.api_auth_id_seq OWNED BY public.api_auth.id;
CREATE TABLE public.auth
(
    id         integer                  NOT NULL,
    user_id    integer                  NOT NULL,
    token      character varying(255),
    pin        character varying(6)     NOT NULL,
    created_at timestamp with time zone NOT NULL
);
ALTER TABLE public.auth
    OWNER TO bp;
CREATE SEQUENCE public.auth_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.auth_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.auth_id_seq OWNED BY public.auth.id;
CREATE TABLE public.calendar
(
    date date NOT NULL,
    type smallint DEFAULT '1'::smallint
);
ALTER TABLE public.calendar
    OWNER TO bp;
COMMENT ON COLUMN public.calendar.type IS 'Тип дня (выходной или рабочий)';
CREATE TABLE public.call_statistic
(
    id                   integer                NOT NULL,
    from_id              integer,
    to_id                integer,
    from_account         character varying(255) NOT NULL,
    to_account           character varying(255) NOT NULL,
    type                 integer                NOT NULL,
    date_time            timestamp with time zone,
    duration             integer                NOT NULL,
    record_duration      integer,
    external_tracking_id character varying(255),
    file_id              integer,
    service              character varying(255),
    from_type            character varying(255),
    to_type              character varying(255),
    from_pr_type         character varying(255),
    from_object_id       integer,
    to_pr_type           character varying(255),
    to_object_id         integer,
    telphin_instance_id  integer
);
ALTER TABLE public.call_statistic
    OWNER TO bp;
CREATE SEQUENCE public.call_statistic_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.call_statistic_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.call_statistic_id_seq OWNED BY public.call_statistic.id;
CREATE TABLE public.call_task
(
    id          bigint                                             NOT NULL,
    user_id     bigint                                             NOT NULL,
    unit_id     integer                                            NOT NULL,
    to_call_at  date,
    status      integer                  DEFAULT 0                 NOT NULL,
    description character varying(255)                             NOT NULL,
    deleted     smallint                 DEFAULT '0'::smallint     NOT NULL,
    created_at  timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    closed_at   timestamp with time zone,
    list_id     bigint,
    comment     character varying(255),
    "time"      time without time zone
);
ALTER TABLE public.call_task
    OWNER TO bp;
CREATE SEQUENCE public.call_task_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.call_task_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.call_task_id_seq OWNED BY public.call_task.id;
CREATE TABLE public.call_task_lists
(
    id         bigint                                             NOT NULL,
    title      character varying(255)                             NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.call_task_lists
    OWNER TO bp;
CREATE SEQUENCE public.call_task_lists_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.call_task_lists_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.call_task_lists_id_seq OWNED BY public.call_task_lists.id;
CREATE TABLE public.calls_count_statistic
(
    id             integer NOT NULL,
    user_id        integer NOT NULL,
    count          integer,
    outgoing_count integer,
    type           smallint,
    date           date    NOT NULL
);
ALTER TABLE public.calls_count_statistic
    OWNER TO bp;
CREATE SEQUENCE public.calls_count_statistic_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.calls_count_statistic_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.calls_count_statistic_id_seq OWNED BY public.calls_count_statistic.id;
CREATE TABLE public.calls_queue
(
    id         integer                  NOT NULL,
    user_id    integer                  NOT NULL,
    phone      character varying(255)   NOT NULL,
    status     integer                  NOT NULL,
    created_at timestamp with time zone NOT NULL,
    send_at    timestamp with time zone
);
ALTER TABLE public.calls_queue
    OWNER TO bp;
CREATE SEQUENCE public.calls_queue_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.calls_queue_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.calls_queue_id_seq OWNED BY public.calls_queue.id;
CREATE TABLE public.chat_events
(
    id            integer                  NOT NULL,
    object_id     integer                  NOT NULL,
    object_type   character varying(255)   NOT NULL,
    service       smallint                 NOT NULL,
    event_type    character varying(255)   NOT NULL,
    question_id   integer                  NOT NULL,
    answer_id     integer,
    unit_event_id integer,
    status        smallint                 NOT NULL,
    created_at    timestamp with time zone NOT NULL,
    answered_at   timestamp with time zone
);
ALTER TABLE public.chat_events
    OWNER TO bp;
CREATE SEQUENCE public.chat_events_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.chat_events_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.chat_events_id_seq OWNED BY public.chat_events.id;
CREATE TABLE public.cities
(
    id        integer                                              NOT NULL,
    name      character varying(255) DEFAULT ''::character varying NOT NULL,
    deleted   smallint               DEFAULT '0'::smallint,
    active    smallint               DEFAULT '1'::smallint         NOT NULL,
    protected integer                DEFAULT 0                     NOT NULL
);
ALTER TABLE public.cities
    OWNER TO bp;
CREATE SEQUENCE public.cities_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.cities_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.cities_id_seq OWNED BY public.cities.id;
CREATE TABLE public.citizenship
(
    id        bigint                         NOT NULL,
    name      character varying(255)         NOT NULL,
    deleted   smallint DEFAULT '0'::smallint NOT NULL,
    active    smallint DEFAULT '1'::smallint NOT NULL,
    protected integer  DEFAULT 0             NOT NULL
);
ALTER TABLE public.citizenship
    OWNER TO bp;
CREATE SEQUENCE public.citizenship_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.citizenship_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.citizenship_id_seq OWNED BY public.citizenship.id;
CREATE TABLE public.contracts
(
    user_id    integer                                            NOT NULL,
    number     character varying(255),
    scan       integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.contracts
    OWNER TO bp;
CREATE TABLE public.conversions
(
    id          integer NOT NULL,
    year        integer,
    month       integer,
    feedback_id integer,
    count       integer
);
ALTER TABLE public.conversions
    OWNER TO bp;
CREATE SEQUENCE public.conversions_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.conversions_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.conversions_id_seq OWNED BY public.conversions.id;
CREATE TABLE public.curator_check_lists
(
    id          integer NOT NULL,
    factory_id  integer NOT NULL,
    month       date    NOT NULL,
    timetable   integer,
    upd_send    integer,
    upd_receive integer
);
ALTER TABLE public.curator_check_lists
    OWNER TO bp;
COMMENT ON COLUMN public.curator_check_lists.factory_id IS 'ID предприятия';
COMMENT ON COLUMN public.curator_check_lists.month IS 'Месяц чек-листа';
CREATE SEQUENCE public.curator_check_lists_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.curator_check_lists_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.curator_check_lists_id_seq OWNED BY public.curator_check_lists.id;
CREATE TABLE public.dic_insurance_companies
(
    id        integer                        NOT NULL,
    name      character varying(255)         NOT NULL,
    deleted   smallint DEFAULT '0'::smallint NOT NULL,
    active    smallint DEFAULT '1'::smallint NOT NULL,
    protected integer  DEFAULT 0             NOT NULL
);
ALTER TABLE public.dic_insurance_companies
    OWNER TO bp;
CREATE SEQUENCE public.dic_insurance_companies_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.dic_insurance_companies_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.dic_insurance_companies_id_seq OWNED BY public.dic_insurance_companies.id;
CREATE TABLE public.dic_languages
(
    id        integer                        NOT NULL,
    name      character varying(255)         NOT NULL,
    deleted   smallint DEFAULT '0'::smallint NOT NULL,
    active    smallint DEFAULT '1'::smallint NOT NULL,
    protected integer  DEFAULT 0             NOT NULL
);
ALTER TABLE public.dic_languages
    OWNER TO bp;
CREATE SEQUENCE public.dic_languages_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.dic_languages_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.dic_languages_id_seq OWNED BY public.dic_languages.id;
CREATE SEQUENCE public.dic_lead_status_reasons_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.dic_lead_status_reasons_id_seq
    OWNER TO bp;
CREATE TABLE public.dic_lead_status_reasons
(
    id        integer DEFAULT nextval('public.dic_lead_status_reasons_id_seq'::regclass) NOT NULL,
    name      character varying(255)                                                     NOT NULL,
    deleted   boolean DEFAULT false                                                      NOT NULL,
    active    boolean DEFAULT true                                                       NOT NULL,
    protected boolean DEFAULT false                                                      NOT NULL
);
ALTER TABLE public.dic_lead_status_reasons
    OWNER TO bp;
CREATE TABLE public.dic_subways
(
    id           integer                NOT NULL,
    name         character varying(255) NOT NULL,
    deleted      boolean DEFAULT false  NOT NULL,
    active       boolean DEFAULT false  NOT NULL,
    lat          real,
    lng          real,
    protected    boolean DEFAULT false,
    fias_city_id character varying(255)
);
ALTER TABLE public.dic_subways
    OWNER TO bp;
CREATE TABLE public.dictionary_translations
(
    dic_table   character varying(255) NOT NULL,
    dic_id      integer                NOT NULL,
    language_id integer                NOT NULL,
    name        character varying(255) NOT NULL
);
ALTER TABLE public.dictionary_translations
    OWNER TO bp;
CREATE TABLE public.documents
(
    id                       integer                                            NOT NULL,
    type                     integer                                            NOT NULL,
    timetable_check_id       integer                                            NOT NULL,
    number                   character varying(255)                             NOT NULL,
    amount                   numeric(10, 2),
    date_send_to_client_sign timestamp with time zone,
    payed                    smallint                 DEFAULT '0'::smallint     NOT NULL,
    status                   smallint                 DEFAULT '0'::smallint     NOT NULL,
    created_at               timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.documents
    OWNER TO bp;
CREATE SEQUENCE public.documents_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.documents_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.documents_id_seq OWNED BY public.documents.id;
CREATE TABLE public.documents_logs
(
    id          bigint                                             NOT NULL,
    user_id     integer                                            NOT NULL,
    document_id integer                                            NOT NULL,
    value       text,
    param       character varying(255)                             NOT NULL,
    log         text                                               NOT NULL,
    visible     smallint                 DEFAULT '1'::smallint     NOT NULL,
    created_at  timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.documents_logs
    OWNER TO bp;
CREATE SEQUENCE public.documents_logs_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.documents_logs_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.documents_logs_id_seq OWNED BY public.documents_logs.id;
CREATE TABLE public.documents_types
(
    id        integer                        NOT NULL,
    name      character varying(255)         NOT NULL,
    deleted   smallint DEFAULT '0'::smallint NOT NULL,
    active    smallint DEFAULT '1'::smallint NOT NULL,
    protected integer  DEFAULT 0             NOT NULL
);
ALTER TABLE public.documents_types
    OWNER TO bp;
CREATE SEQUENCE public.documents_types_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.documents_types_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.documents_types_id_seq OWNED BY public.documents_types.id;
CREATE TABLE public.email
(
    id         integer                                            NOT NULL,
    user_id    integer,
    email      text,
    subject    character varying(255)                             NOT NULL,
    message    text                                               NOT NULL,
    status     integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    send_at    timestamp with time zone
);
ALTER TABLE public.email
    OWNER TO bp;
CREATE SEQUENCE public.email_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.email_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.email_id_seq OWNED BY public.email.id;
CREATE TABLE public.error_log_telegram_relations
(
    error_id   integer NOT NULL,
    chat_id    integer NOT NULL,
    message_id integer NOT NULL
);
ALTER TABLE public.error_log_telegram_relations
    OWNER TO bp;
CREATE TABLE public.error_logs
(
    id           integer                  NOT NULL,
    user_id      integer,
    exception    character varying(255),
    title        text,
    text         text,
    type         integer,
    file         character varying(255),
    line         integer,
    url          text,
    created_at   timestamp with time zone NOT NULL,
    status       integer DEFAULT 0,
    fake_user_id integer
);
ALTER TABLE public.error_logs
    OWNER TO bp;
CREATE SEQUENCE public.error_logs_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.error_logs_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.error_logs_id_seq OWNED BY public.error_logs.id;
CREATE TABLE public.errors_1s
(
    id         integer                        NOT NULL,
    factory_id integer,
    text       character varying(255)         NOT NULL,
    status     smallint DEFAULT '0'::smallint NOT NULL,
    queue_id   integer                        NOT NULL,
    event_key  character varying(255)
);
ALTER TABLE public.errors_1s
    OWNER TO bp;
COMMENT ON COLUMN public.errors_1s.factory_id IS 'ID предприятия на котором происходит событие';
COMMENT ON COLUMN public.errors_1s.text IS 'Текст ошибки';
COMMENT ON COLUMN public.errors_1s.status IS 'Статус обработки ошибки';
COMMENT ON COLUMN public.errors_1s.queue_id IS 'ID очереди в которой произошли ошибка';
COMMENT ON COLUMN public.errors_1s.event_key IS 'Ключ для создания нового элемента очереди';
CREATE SEQUENCE public.errors_1s_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.errors_1s_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.errors_1s_id_seq OWNED BY public.errors_1s.id;
CREATE TABLE public.ev_comments
(
    id         bigint                                             NOT NULL,
    user_id    integer                                            NOT NULL,
    unit_id    integer                                            NOT NULL,
    comment    text                                               NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.ev_comments
    OWNER TO bp;
CREATE SEQUENCE public.ev_comments_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.ev_comments_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.ev_comments_id_seq OWNED BY public.ev_comments.id;
CREATE TABLE public.ev_feedback_groups
(
    group_name character varying(255) NOT NULL,
    feedback   character varying(255)
);
ALTER TABLE public.ev_feedback_groups
    OWNER TO bp;
CREATE TABLE public.ev_logs
(
    id         bigint                                             NOT NULL,
    user_id    integer                                            NOT NULL,
    unit_id    integer                                            NOT NULL,
    value      text,
    param      character varying(255)                             NOT NULL,
    log        text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    action     integer                  DEFAULT 0
);
ALTER TABLE public.ev_logs
    OWNER TO bp;
CREATE SEQUENCE public.ev_logs_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.ev_logs_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.ev_logs_id_seq OWNED BY public.ev_logs.id;
CREATE TABLE public.ev_units
(
    id                     bigint                                               NOT NULL,
    self_employed          boolean                DEFAULT false                 NOT NULL,
    fio                    character varying(100),
    cdate                  timestamp with time zone,
    feedback               integer,
    profession             character varying(50),
    level                  character varying(5),
    status                 integer                DEFAULT 0                     NOT NULL,
    master_status          smallint               DEFAULT '0'::smallint         NOT NULL,
    call_date              timestamp with time zone,
    location               character varying(255) DEFAULT ''::character varying NOT NULL,
    workplace              bigint,
    bdate                  date,
    deleted                boolean                DEFAULT false                 NOT NULL,
    draft                  boolean                DEFAULT false                 NOT NULL,
    ghost                  boolean                DEFAULT false                 NOT NULL,
    created_by             bigint                 DEFAULT '0'::bigint           NOT NULL,
    oriented_at            bigint,
    work_by                bigint                 DEFAULT '0'::bigint           NOT NULL,
    master_id              bigint                 DEFAULT '0'::bigint           NOT NULL,
    modified_at            timestamp with time zone,
    last_sms_at            timestamp with time zone,
    release_days           integer,
    citizenship_id         bigint                 DEFAULT '0'::bigint           NOT NULL,
    rate                   character varying(15),
    fullness               integer                DEFAULT 0,
    blocked                boolean                DEFAULT false                 NOT NULL,
    in_black_list          boolean                DEFAULT false                 NOT NULL,
    account_id             integer,
    master_denied_at       timestamp with time zone,
    recruit_updated_at     date,
    email                  character varying(255),
    google_id              character varying(255),
    data_hash              character varying(255),
    unit_rating            double precision,
    snils                  character varying(50),
    inn                    character varying(50),
    external_id            character varying(36),
    smena_id               character varying(255),
    sub_status             integer                DEFAULT 0,
    subway_id              integer,
    enable_mailing         boolean,
    image                  integer,
    oriented_profession_id integer,
    oriented_factory_id    integer,
    oriented_class         integer
);
ALTER TABLE public.ev_units
    OWNER TO bp;
CREATE SEQUENCE public.ev_units_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.ev_units_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.ev_units_id_seq OWNED BY public.ev_units.id;
CREATE TABLE public.ev_units_meta
(
    uid   bigint NOT NULL,
    key   character varying(255),
    value text   NOT NULL
);
ALTER TABLE public.ev_units_meta
    OWNER TO bp;
COMMENT ON COLUMN public.ev_units_meta.uid IS 'unit id';
CREATE TABLE public.ev_users
(
    id                        bigint                                                 NOT NULL,
    login                     character varying(128)                                 NOT NULL,
    username                  character varying(255)   DEFAULT ''::character varying NOT NULL,
    password                  character varying(255)   DEFAULT ''::character varying NOT NULL,
    email                     character varying(256)   DEFAULT ''::character varying NOT NULL,
    birthday                  date,
    image                     integer,
    about                     text,
    login_time                timestamp with time zone DEFAULT CURRENT_TIMESTAMP     NOT NULL,
    register_time             timestamp with time zone,
    role_id                   integer                  DEFAULT 0                     NOT NULL,
    is_superuser              smallint                 DEFAULT '0'::smallint         NOT NULL,
    post                      character varying(255),
    description               text,
    draft                     integer                  DEFAULT 0                     NOT NULL,
    last_action_at            timestamp with time zone,
    is_active                 integer                  DEFAULT 1,
    is_lodging_officer        smallint                 DEFAULT '0'::smallint         NOT NULL,
    is_salary_project_manager smallint                 DEFAULT '0'::smallint         NOT NULL,
    account_id                integer,
    lang                      character varying(2),
    notification_service      smallint,
    viber_id                  character varying(255),
    viber_is_valid            smallint,
    whats_app_phone           character varying(15),
    google_id                 character varying(255),
    data_hash                 character varying(255),
    is_leads_manager          boolean                  DEFAULT false,
    is_king                   integer                  DEFAULT 0                     NOT NULL,
    is_freelancer             boolean                  DEFAULT false
);
ALTER TABLE public.ev_users
    OWNER TO bp;
CREATE SEQUENCE public.ev_users_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.ev_users_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.ev_users_id_seq OWNED BY public.ev_users.id;
CREATE TABLE public.factories
(
    id              bigint                         NOT NULL,
    name            character varying(255)         NOT NULL,
    deleted         smallint DEFAULT '0'::smallint NOT NULL,
    active          smallint DEFAULT '1'::smallint NOT NULL,
    pid             bigint   DEFAULT '0'::bigint   NOT NULL,
    contractor      smallint,
    salary          numeric(10, 2),
    rate            numeric(10, 2),
    external_id     character varying(36),
    protected       integer  DEFAULT 0             NOT NULL,
    can_future_edit boolean  DEFAULT false
);
ALTER TABLE public.factories
    OWNER TO bp;
COMMENT ON COLUMN public.factories.contractor IS 'Контрактор на предприятии';
COMMENT ON COLUMN public.factories.salary IS 'Оклад';
COMMENT ON COLUMN public.factories.rate IS 'Ставка';
CREATE TABLE public.factories_accommodation_places_relations
(
    factory_id integer NOT NULL,
    place_id   integer NOT NULL
);
ALTER TABLE public.factories_accommodation_places_relations
    OWNER TO bp;
CREATE SEQUENCE public.factories_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.factories_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.factories_id_seq OWNED BY public.factories.id;
CREATE TABLE public.factories_rates_relations
(
    factory_id    integer                                               NOT NULL,
    profession_id integer                                               NOT NULL,
    class         character varying(8) DEFAULT '1;9'::character varying NOT NULL,
    rate          numeric(10, 2)                                        NOT NULL,
    client_rate   numeric(10, 2)
);
ALTER TABLE public.factories_rates_relations
    OWNER TO bp;
CREATE TABLE public.factories_tags
(
    factory_id integer,
    tag        character varying(255)
);
ALTER TABLE public.factories_tags
    OWNER TO bp;
CREATE TABLE public.factory_contactor_relations
(
    factory_id                  integer NOT NULL,
    unit_contract_contractor_id integer NOT NULL,
    external_id                 character varying(255)
);
ALTER TABLE public.factory_contactor_relations
    OWNER TO bp;
CREATE TABLE public.factory_files_relations
(
    factory_id integer                                            NOT NULL,
    user_id    integer                                            NOT NULL,
    file_id    integer                                            NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.factory_files_relations
    OWNER TO bp;
CREATE TABLE public.factory_meta
(
    key        character varying(50),
    value      character varying(255),
    factory_id integer
);
ALTER TABLE public.factory_meta
    OWNER TO bp;
CREATE TABLE public.factory_today_state
(
    id                       integer NOT NULL,
    last_month_state         integer,
    factory_id               integer,
    is_last_month_closed     integer,
    is_timesheet_filled      integer,
    total                    integer,
    work                     integer,
    work_day                 integer DEFAULT 0,
    work_night               integer DEFAULT 0,
    absent                   integer,
    ill                      integer,
    fired                    integer,
    hired                    integer,
    vacation                 integer,
    weekend                  integer,
    unknown                  integer DEFAULT 0,
    empty                    integer DEFAULT 0,
    has_childs               integer,
    count_childs             integer,
    requests                 text,
    requests_total_count     integer,
    updated_at               timestamp with time zone,
    more_two_days_not_filled boolean,
    last_month_total         integer
);
ALTER TABLE public.factory_today_state
    OWNER TO bp;
CREATE SEQUENCE public.factory_today_state_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.factory_today_state_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.factory_today_state_id_seq OWNED BY public.factory_today_state.id;
CREATE TABLE public.feedback
(
    id        bigint                         NOT NULL,
    name      character varying(255)         NOT NULL,
    deleted   smallint DEFAULT '0'::smallint NOT NULL,
    active    smallint DEFAULT '1'::smallint NOT NULL,
    protected integer  DEFAULT 0             NOT NULL
);
ALTER TABLE public.feedback
    OWNER TO bp;
CREATE TABLE public.feedback_comment
(
    id                 integer NOT NULL,
    user_id            integer,
    work_date_id       integer,
    positive           text,
    negative           text,
    master             text,
    positive_highlight integer DEFAULT 0,
    negative_highlight integer DEFAULT 0,
    master_highlight   integer DEFAULT 0,
    mark               integer DEFAULT 0,
    neutral            text,
    comment            text
);
ALTER TABLE public.feedback_comment
    OWNER TO bp;
CREATE SEQUENCE public.feedback_comment_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.feedback_comment_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.feedback_comment_id_seq OWNED BY public.feedback_comment.id;
CREATE SEQUENCE public.feedback_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.feedback_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.feedback_id_seq OWNED BY public.feedback.id;
CREATE TABLE public.fias_location_cache
(
    guid character varying(255) NOT NULL,
    name character varying(255)
);
ALTER TABLE public.fias_location_cache
    OWNER TO bp;
CREATE TABLE public.files
(
    id         integer                                              NOT NULL,
    name       character varying(255) DEFAULT ''::character varying NOT NULL,
    extension  character varying(5)   DEFAULT ''::character varying NOT NULL,
    type_id    integer,
    size       integer                DEFAULT 0                     NOT NULL,
    path       character varying(255) DEFAULT ''::character varying NOT NULL,
    deleted    integer                DEFAULT 0                     NOT NULL,
    created_at timestamp with time zone
);
ALTER TABLE public.files
    OWNER TO bp;
CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.files_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;
CREATE TABLE public.files_relations
(
    unit_id    integer,
    type_id    integer DEFAULT 0 NOT NULL,
    user_id    integer,
    file_id    integer           NOT NULL,
    created_at timestamp with time zone
);
ALTER TABLE public.files_relations
    OWNER TO bp;
CREATE TABLE public.fines
(
    id          integer NOT NULL,
    unit_id     integer,
    user_id     integer,
    date        date,
    description text,
    amount      numeric(10, 2) DEFAULT 0.00
);
ALTER TABLE public.fines
    OWNER TO bp;
CREATE SEQUENCE public.fines_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.fines_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.fines_id_seq OWNED BY public.fines.id;
CREATE TABLE public.freelancer_unit_relations
(
    freelancer_id integer,
    unit_id       integer
);
ALTER TABLE public.freelancer_unit_relations
    OWNER TO bp;
CREATE TABLE public.group_factory_relations
(
    group_id   integer NOT NULL,
    factory_id integer NOT NULL
);
ALTER TABLE public.group_factory_relations
    OWNER TO bp;
CREATE TABLE public.group_user_relations
(
    group_id integer NOT NULL,
    user_id  integer NOT NULL
);
ALTER TABLE public.group_user_relations
    OWNER TO bp;
CREATE TABLE public.insurance
(
    id         integer           NOT NULL,
    unit_id    integer           NOT NULL,
    type       integer,
    start_date date,
    end_date   date,
    series     character varying(50),
    number     character varying(50),
    with_whom  integer,
    is_current integer DEFAULT 0 NOT NULL,
    deleted    integer DEFAULT 0 NOT NULL
);
ALTER TABLE public.insurance
    OWNER TO bp;
CREATE SEQUENCE public.insurance_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.insurance_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.insurance_id_seq OWNED BY public.insurance.id;
CREATE TABLE public.keeper_value_changes
(
    id         integer                                            NOT NULL,
    user_id    integer                                            NOT NULL,
    unit_id    integer                                            NOT NULL,
    factory_id integer                                            NOT NULL,
    message    text                                               NOT NULL,
    key        text                                               NOT NULL,
    "from"     text                                               NOT NULL,
    "to"       text                                               NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    date       date
);
ALTER TABLE public.keeper_value_changes
    OWNER TO bp;
CREATE SEQUENCE public.keeper_value_changes_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.keeper_value_changes_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.keeper_value_changes_id_seq OWNED BY public.keeper_value_changes.id;
CREATE TABLE public.knowledge_article
(
    id         integer NOT NULL,
    title      character varying(255),
    type       integer,
    content    text,
    duration   integer,
    section_id integer
);
ALTER TABLE public.knowledge_article
    OWNER TO bp;
CREATE SEQUENCE public.knowledge_article_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.knowledge_article_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.knowledge_article_id_seq OWNED BY public.knowledge_article.id;
CREATE TABLE public.knowledge_article_relation
(
    id         integer NOT NULL,
    user_id    integer,
    article_id integer,
    viewed     integer DEFAULT 0,
    viewed_at  timestamp with time zone
);
ALTER TABLE public.knowledge_article_relation
    OWNER TO bp;
CREATE SEQUENCE public.knowledge_article_relation_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.knowledge_article_relation_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.knowledge_article_relation_id_seq OWNED BY public.knowledge_article_relation.id;
CREATE TABLE public.knowledge_section
(
    id          integer NOT NULL,
    title       character varying(255),
    description text
);
ALTER TABLE public.knowledge_section
    OWNER TO bp;
CREATE TABLE public.knowledge_section_availability
(
    id                   integer NOT NULL,
    knowledge_section_id integer,
    role_id              integer
);
ALTER TABLE public.knowledge_section_availability
    OWNER TO bp;
CREATE SEQUENCE public.knowledge_section_availability_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.knowledge_section_availability_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.knowledge_section_availability_id_seq OWNED BY public.knowledge_section_availability.id;
CREATE SEQUENCE public.knowledge_section_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.knowledge_section_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.knowledge_section_id_seq OWNED BY public.knowledge_section.id;
CREATE TABLE public.knowledge_section_relation
(
    id         integer NOT NULL,
    user_id    integer,
    section_id integer,
    completion integer
);
ALTER TABLE public.knowledge_section_relation
    OWNER TO bp;
CREATE SEQUENCE public.knowledge_section_relation_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.knowledge_section_relation_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.knowledge_section_relation_id_seq OWNED BY public.knowledge_section_relation.id;
CREATE TABLE public.languages
(
    id    integer               NOT NULL,
    short character varying(2)  NOT NULL,
    name  character varying(32) NOT NULL
);
ALTER TABLE public.languages
    OWNER TO bp;
CREATE SEQUENCE public.languages_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.languages_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;
CREATE SEQUENCE public.lead_processing_statistic_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.lead_processing_statistic_seq
    OWNER TO bp;
CREATE TABLE public.lead_processing_statistic
(
    id       integer DEFAULT nextval('public.lead_processing_statistic_seq'::regclass) NOT NULL,
    date     date                                                                      NOT NULL,
    group_id integer,
    "time"   bigint                                                                    NOT NULL,
    count    integer                                                                   NOT NULL
);
ALTER TABLE public.lead_processing_statistic
    OWNER TO bp;
CREATE TABLE public.lead_service_relations
(
    lead_id     integer  NOT NULL,
    external_id character varying(255),
    service     smallint NOT NULL
);
ALTER TABLE public.lead_service_relations
    OWNER TO bp;
COMMENT ON COLUMN public.lead_service_relations.lead_id IS 'ID лида';
COMMENT ON COLUMN public.lead_service_relations.external_id IS 'Внешний ID внутри сервиса';
COMMENT ON COLUMN public.lead_service_relations.service IS 'Сервис из которого получен лид';
CREATE TABLE public.leads
(
    id             integer                NOT NULL,
    unit_id        integer,
    fio            character varying(255),
    email          character varying(255),
    phone          character varying(255) NOT NULL,
    profession     character varying(255),
    comment        character varying(255),
    created_at     timestamp with time zone,
    processed_at   timestamp with time zone,
    process_result character varying(255),
    status         integer DEFAULT 0      NOT NULL,
    languages      character varying(255),
    resume         integer,
    other_lang     character varying(255),
    feedback       integer,
    group_id       integer,
    additional     text,
    processed_time integer,
    city_id        character varying(255),
    citizenship_id integer,
    profession_id  integer,
    processed_by   integer
);
ALTER TABLE public.leads
    OWNER TO bp;
COMMENT ON COLUMN public.leads.additional IS 'Дополнительные данные для лида (factory_id, profession_id, request_id и любые другие)';
CREATE TABLE public.leads_extension
(
    lead_id             integer NOT NULL,
    previous_experience integer,
    years_of_experience character varying(255),
    confident           character varying(255),
    worked_in_finland   integer,
    companies           text,
    occupational_card   integer,
    drivers_licence     integer,
    eu_citizen_passport integer,
    when_start          character varying(255),
    client_id           character varying(255),
    url                 character varying(255),
    first_url           text,
    utm_source          character varying(255),
    utm_campaign        character varying(255),
    utm_medium          character varying(255),
    utm_content         character varying(255),
    utm_term            character varying(255),
    openstat            character varying(255),
    gclid               character varying(255),
    yclid               character varying(255),
    _ga                 character varying(255),
    roistat             character varying(255),
    fb                  character varying(255),
    mytarget            character varying(255),
    referrer            text,
    useragent           character varying(255),
    os                  character varying(255),
    browser             character varying(255),
    ip                  character varying(255),
    tranid              character varying(255),
    formid              character varying(255),
    formname            character varying(255)
);
ALTER TABLE public.leads_extension
    OWNER TO bp;
CREATE SEQUENCE public.leads_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.leads_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.leads_id_seq OWNED BY public.leads.id;
CREATE TABLE public.logs_auth
(
    user_id    integer,
    created_at timestamp with time zone,
    ip         character varying(15),
    location   character varying(255),
    user_agent character varying(255),
    agent      character varying(255),
    cookie     character varying(32),
    id         integer NOT NULL
);
ALTER TABLE public.logs_auth
    OWNER TO bp;
CREATE SEQUENCE public.logs_auth_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.logs_auth_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.logs_auth_id_seq OWNED BY public.logs_auth.id;
CREATE TABLE public.logs_export
(
    user_id     integer,
    created_at  timestamp with time zone,
    export      character varying(255),
    description character varying(255),
    params      text
);
ALTER TABLE public.logs_export
    OWNER TO bp;
CREATE TABLE public.mailing_templates
(
    id         bigint                                             NOT NULL,
    title      character varying(255)                             NOT NULL,
    body       text                                               NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted    integer                  DEFAULT 0                 NOT NULL,
    user_id    integer
);
ALTER TABLE public.mailing_templates
    OWNER TO bp;
CREATE SEQUENCE public.mailing_templates_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.mailing_templates_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.mailing_templates_id_seq OWNED BY public.mailing_templates.id;
CREATE TABLE public.mailings
(
    id           integer                                                   NOT NULL,
    service      character varying(255)   DEFAULT 'sms'::character varying NOT NULL,
    title        character varying(255),
    send_type    integer,
    param        text,
    status       integer,
    created_at   timestamp with time zone DEFAULT CURRENT_TIMESTAMP        NOT NULL,
    send_at      timestamp with time zone,
    content      text,
    "limit"      integer                  DEFAULT 0                        NOT NULL,
    total_limit  integer                  DEFAULT 0                        NOT NULL,
    days_limit   integer                  DEFAULT 0                        NOT NULL,
    is_generated integer                  DEFAULT 0                        NOT NULL,
    "offset"     integer                  DEFAULT 0
);
ALTER TABLE public.mailings
    OWNER TO bp;
CREATE SEQUENCE public.mailings_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.mailings_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.mailings_id_seq OWNED BY public.mailings.id;
CREATE TABLE public.master_units_delay
(
    id          integer NOT NULL,
    master_id   integer,
    units_count integer,
    date        date
);
ALTER TABLE public.master_units_delay
    OWNER TO bp;
CREATE SEQUENCE public.master_units_delay_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.master_units_delay_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.master_units_delay_id_seq OWNED BY public.master_units_delay.id;
CREATE TABLE public.migrations
(
    id   integer                NOT NULL,
    name character varying(255) NOT NULL
);
ALTER TABLE public.migrations
    OWNER TO bp;
CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.migrations_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
CREATE TABLE public.mts_user_relations
(
    user_id     integer                NOT NULL,
    mts_user_id character varying(255) NOT NULL
);
ALTER TABLE public.mts_user_relations
    OWNER TO bp;
CREATE TABLE public.no_request_completion
(
    id         integer NOT NULL,
    unit_id    integer,
    factory_id integer,
    created_at date
);
ALTER TABLE public.no_request_completion
    OWNER TO bp;
CREATE SEQUENCE public.no_request_completion_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.no_request_completion_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.no_request_completion_id_seq OWNED BY public.no_request_completion.id;
CREATE TABLE public.notification
(
    id         integer                                              NOT NULL,
    user_id    integer,
    author_id  bigint                                               NOT NULL,
    factory_id integer                DEFAULT 0,
    message    character varying(512) DEFAULT ''::character varying NOT NULL,
    created_at timestamp with time zone,
    read_at    timestamp with time zone,
    important  smallint               DEFAULT '0'::smallint,
    global     smallint               DEFAULT '0'::smallint         NOT NULL
);
ALTER TABLE public.notification
    OWNER TO bp;
CREATE SEQUENCE public.notification_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.notification_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.notification_id_seq OWNED BY public.notification.id;
CREATE TABLE public.officials
(
    factory_id integer                                            NOT NULL,
    user_id    integer                                            NOT NULL,
    name       character varying(255),
    phone      character varying(255),
    email      character varying(255),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.officials
    OWNER TO bp;
CREATE TABLE public.old_unit_experience
(
    id            bigint                         NOT NULL,
    unit_id       bigint                         NOT NULL,
    profession_id bigint                         NOT NULL,
    factory       character varying(255)         NOT NULL,
    start_date    date,
    end_date      date,
    education     smallint DEFAULT '0'::smallint NOT NULL,
    description   character varying(255),
    class         character varying(255)         NOT NULL,
    no_experience smallint DEFAULT '0'::smallint NOT NULL
);
ALTER TABLE public.old_unit_experience
    OWNER TO bp;
CREATE SEQUENCE public.old_unit_experience_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.old_unit_experience_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.old_unit_experience_id_seq OWNED BY public.old_unit_experience.id;
CREATE TABLE public.online_stat
(
    id         integer NOT NULL,
    created_at timestamp with time zone,
    count      integer
);
ALTER TABLE public.online_stat
    OWNER TO bp;
CREATE SEQUENCE public.online_stat_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.online_stat_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.online_stat_id_seq OWNED BY public.online_stat.id;
CREATE TABLE public.oriented_stat
(
    id             bigint                         NOT NULL,
    user_id        bigint                         NOT NULL,
    unit_id        bigint                         NOT NULL,
    profession_id  bigint                         NOT NULL,
    class          character varying(3),
    factory_id     bigint                         NOT NULL,
    master_id      bigint   DEFAULT '0'::bigint   NOT NULL,
    deleted        smallint DEFAULT '0'::smallint NOT NULL,
    created_at     timestamp with time zone,
    request_id     integer,
    master_status  integer,
    master_comment character varying(255),
    processed_at   timestamp with time zone
);
ALTER TABLE public.oriented_stat
    OWNER TO bp;
CREATE SEQUENCE public.oriented_stat_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.oriented_stat_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.oriented_stat_id_seq OWNED BY public.oriented_stat.id;
CREATE TABLE public.outgoing_1s_queue
(
    id         integer                  NOT NULL,
    event      character varying(255)   NOT NULL,
    data       text,
    status     integer DEFAULT 0        NOT NULL,
    comment    text,
    event_key  character varying(255),
    created_at timestamp with time zone NOT NULL,
    send_at    timestamp with time zone
);
ALTER TABLE public.outgoing_1s_queue
    OWNER TO bp;
COMMENT ON COLUMN public.outgoing_1s_queue.data IS 'Данные';
COMMENT ON COLUMN public.outgoing_1s_queue.event_key IS 'Ключ для создания нового элемента очереди';
CREATE SEQUENCE public.outgoing_1s_queue_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.outgoing_1s_queue_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.outgoing_1s_queue_id_seq OWNED BY public.outgoing_1s_queue.id;
CREATE TABLE public.overall_without_deduction
(
    id         integer NOT NULL,
    unit_id    integer NOT NULL,
    factory_id integer NOT NULL,
    overall_id integer NOT NULL
);
ALTER TABLE public.overall_without_deduction
    OWNER TO bp;
CREATE SEQUENCE public.overall_without_deduction_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.overall_without_deduction_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.overall_without_deduction_id_seq OWNED BY public.overall_without_deduction.id;
CREATE TABLE public.overalls
(
    id                     integer NOT NULL,
    unit_id                integer,
    date                   date,
    factory_id             integer,
    description            text,
    overall_id             integer,
    deduction              boolean        DEFAULT false,
    returned               integer        DEFAULT 0,
    deduction_amount       numeric(10, 2) DEFAULT 0.00,
    bill                   character varying(255),
    surcharges_id          integer,
    retention_id           integer,
    overall_request_row_id integer,
    deducted               integer
);
ALTER TABLE public.overalls
    OWNER TO bp;
CREATE SEQUENCE public.overalls_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.overalls_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.overalls_id_seq OWNED BY public.overalls.id;
CREATE TABLE public.overalls_list
(
    id        bigint                         NOT NULL,
    name      character varying(255)         NOT NULL,
    deleted   smallint DEFAULT '0'::smallint NOT NULL,
    active    smallint DEFAULT '1'::smallint NOT NULL,
    protected integer  DEFAULT 0             NOT NULL
);
ALTER TABLE public.overalls_list
    OWNER TO bp;
CREATE SEQUENCE public.overalls_list_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.overalls_list_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.overalls_list_id_seq OWNED BY public.overalls_list.id;
CREATE TABLE public.overalls_requests
(
    id                  integer                                            NOT NULL,
    user_id             integer                                            NOT NULL,
    status              integer,
    created_at          timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at          timestamp with time zone,
    file                integer,
    account_number      character varying(255),
    account_date        date,
    give_out_date_start date
);
ALTER TABLE public.overalls_requests
    OWNER TO bp;
CREATE TABLE public.overalls_requests_factories_relations
(
    overalls_request_id integer NOT NULL,
    factory_id          integer NOT NULL
);
ALTER TABLE public.overalls_requests_factories_relations
    OWNER TO bp;
CREATE SEQUENCE public.overalls_requests_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.overalls_requests_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.overalls_requests_id_seq OWNED BY public.overalls_requests.id;
CREATE TABLE public.overalls_requests_logs
(
    id                 bigint                                             NOT NULL,
    user_id            integer                                            NOT NULL,
    overall_request_id integer                                            NOT NULL,
    value              text,
    param              character varying(255)                             NOT NULL,
    log                text                                               NOT NULL,
    visible            smallint                 DEFAULT '1'::smallint     NOT NULL,
    created_at         timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.overalls_requests_logs
    OWNER TO bp;
CREATE SEQUENCE public.overalls_requests_logs_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.overalls_requests_logs_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.overalls_requests_logs_id_seq OWNED BY public.overalls_requests_logs.id;
CREATE TABLE public.overalls_requests_rows
(
    id                 integer NOT NULL,
    overall_request_id integer NOT NULL,
    unit_id            integer NOT NULL,
    overall_id         integer,
    overall            character varying(255),
    status             integer NOT NULL,
    price_per_unit     numeric(10, 2),
    give_out_date      date,
    comment            character varying(255)
);
ALTER TABLE public.overalls_requests_rows
    OWNER TO bp;
CREATE SEQUENCE public.overalls_requests_rows_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.overalls_requests_rows_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.overalls_requests_rows_id_seq OWNED BY public.overalls_requests_rows.id;
CREATE TABLE public.personal_documents
(
    id          integer  NOT NULL,
    unit_id     integer  NOT NULL,
    type        smallint NOT NULL,
    series      character varying(50),
    number      character varying(50),
    code        character varying(255),
    when_issued date,
    issued_by   text,
    date_end    date,
    translated  integer,
    file_id     integer
);
ALTER TABLE public.personal_documents
    OWNER TO bp;
CREATE SEQUENCE public.personal_documents_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.personal_documents_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.personal_documents_id_seq OWNED BY public.personal_documents.id;
CREATE TABLE public.phone_relations
(
    phone_id    bigint                NOT NULL,
    object_id   bigint                NOT NULL,
    object_type character varying(10) NOT NULL,
    is_main     smallint
);
ALTER TABLE public.phone_relations
    OWNER TO bp;
CREATE TABLE public.phones
(
    id       bigint                NOT NULL,
    phone    character varying(15) NOT NULL,
    is_valid boolean
);
ALTER TABLE public.phones
    OWNER TO bp;
CREATE SEQUENCE public.phones_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.phones_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.phones_id_seq OWNED BY public.phones.id;
CREATE TABLE public.plan
(
    id                integer NOT NULL,
    request_id        bigint,
    factory_id        integer NOT NULL,
    profession_id     integer NOT NULL,
    created_at        timestamp with time zone,
    count             integer,
    completion        integer,
    master_id         integer,
    priority          integer,
    category          integer,
    class             character varying(8),
    head_id           integer,
    paused            integer DEFAULT 0,
    completion_paused integer DEFAULT 0
);
ALTER TABLE public.plan
    OWNER TO bp;
CREATE TABLE public.plan_completion
(
    id         integer NOT NULL,
    plan_id    bigint  NOT NULL,
    user_id    integer NOT NULL,
    unit_id    integer NOT NULL,
    created_at timestamp with time zone
);
ALTER TABLE public.plan_completion
    OWNER TO bp;
CREATE SEQUENCE public.plan_completion_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.plan_completion_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.plan_completion_id_seq OWNED BY public.plan_completion.id;
CREATE SEQUENCE public.plan_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.plan_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.plan_id_seq OWNED BY public.plan.id;
CREATE TABLE public.plan_orientation
(
    id         integer NOT NULL,
    plan_id    bigint  NOT NULL,
    user_id    integer NOT NULL,
    unit_id    integer NOT NULL,
    created_at timestamp with time zone
);
ALTER TABLE public.plan_orientation
    OWNER TO bp;
CREATE SEQUENCE public.plan_orientation_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.plan_orientation_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.plan_orientation_id_seq OWNED BY public.plan_orientation.id;
CREATE TABLE public.plan_recruit
(
    id      integer              NOT NULL,
    plan_id bigint               NOT NULL,
    user_id integer              NOT NULL,
    value   character varying(7) NOT NULL,
    date    date
);
ALTER TABLE public.plan_recruit
    OWNER TO bp;
CREATE SEQUENCE public.plan_recruit_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.plan_recruit_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.plan_recruit_id_seq OWNED BY public.plan_recruit.id;
CREATE TABLE public.plan_statistic
(
    id            integer NOT NULL,
    date          date,
    factory_id    integer,
    profession_id integer,
    class         character varying(11),
    count         integer,
    completion    integer
);
ALTER TABLE public.plan_statistic
    OWNER TO bp;
CREATE SEQUENCE public.plan_statistic_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.plan_statistic_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.plan_statistic_id_seq OWNED BY public.plan_statistic.id;
CREATE TABLE public.prepayments
(
    id         integer           NOT NULL,
    factory_id integer,
    created_at timestamp with time zone,
    user_id    integer,
    status     integer,
    type       integer DEFAULT 0 NOT NULL
);
ALTER TABLE public.prepayments
    OWNER TO bp;
CREATE TABLE public.prepayments_change_requests
(
    id                integer                                            NOT NULL,
    prepayment_row_id integer                                            NOT NULL,
    user_id           integer                                            NOT NULL,
    status            integer                                            NOT NULL,
    comment           text,
    created_at        timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.prepayments_change_requests
    OWNER TO bp;
CREATE SEQUENCE public.prepayments_change_requests_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.prepayments_change_requests_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.prepayments_change_requests_id_seq OWNED BY public.prepayments_change_requests.id;
CREATE TABLE public.prepayments_comments
(
    id            bigint                                             NOT NULL,
    user_id       integer                                            NOT NULL,
    prepayment_id integer                                            NOT NULL,
    comment       text                                               NOT NULL,
    created_at    timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    type          smallint                 DEFAULT '0'::smallint     NOT NULL
);
ALTER TABLE public.prepayments_comments
    OWNER TO bp;
CREATE SEQUENCE public.prepayments_comments_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.prepayments_comments_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.prepayments_comments_id_seq OWNED BY public.prepayments_comments.id;
CREATE SEQUENCE public.prepayments_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.prepayments_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.prepayments_id_seq OWNED BY public.prepayments.id;
CREATE TABLE public.prepayments_logs
(
    id            bigint                                             NOT NULL,
    user_id       integer                                            NOT NULL,
    prepayment_id integer                                            NOT NULL,
    value         text,
    param         character varying(255)                             NOT NULL,
    log           text                                               NOT NULL,
    visible       smallint                 DEFAULT '1'::smallint     NOT NULL,
    created_at    timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.prepayments_logs
    OWNER TO bp;
CREATE SEQUENCE public.prepayments_logs_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.prepayments_logs_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.prepayments_logs_id_seq OWNED BY public.prepayments_logs.id;
CREATE TABLE public.prepayments_rows
(
    id            integer NOT NULL,
    prepayment_id integer,
    unit_id       integer,
    amount        integer,
    status        integer,
    payed_at      timestamp with time zone,
    payed         integer,
    comment       character varying(255)
);
ALTER TABLE public.prepayments_rows
    OWNER TO bp;
CREATE SEQUENCE public.prepayments_rows_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.prepayments_rows_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.prepayments_rows_id_seq OWNED BY public.prepayments_rows.id;
CREATE TABLE public.prepayments_signatures
(
    id            integer                                            NOT NULL,
    prepayment_id integer                                            NOT NULL,
    user_id       integer                                            NOT NULL,
    type          integer                                            NOT NULL,
    deleted       smallint                 DEFAULT '0'::smallint     NOT NULL,
    created_at    timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.prepayments_signatures
    OWNER TO bp;
CREATE SEQUENCE public.prepayments_signatures_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.prepayments_signatures_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.prepayments_signatures_id_seq OWNED BY public.prepayments_signatures.id;
CREATE TABLE public.professions
(
    id          bigint                         NOT NULL,
    name        character varying(255)         NOT NULL,
    deleted     smallint DEFAULT '0'::smallint NOT NULL,
    active      smallint DEFAULT '1'::smallint NOT NULL,
    external_id character varying(36),
    protected   integer  DEFAULT 0             NOT NULL
);
ALTER TABLE public.professions
    OWNER TO bp;
CREATE SEQUENCE public.professions_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.professions_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.professions_id_seq OWNED BY public.professions.id;
CREATE TABLE public.protocol_factory_relations
(
    protocol_id integer NOT NULL,
    factory_id  integer NOT NULL
);
ALTER TABLE public.protocol_factory_relations
    OWNER TO bp;
CREATE TABLE public.protocol_items
(
    id            integer NOT NULL,
    protocol_id   integer,
    profession_id integer,
    class         character varying(8),
    night_shift   numeric(10, 2),
    price         numeric(10, 2)
);
ALTER TABLE public.protocol_items
    OWNER TO bp;
CREATE SEQUENCE public.protocol_items_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.protocol_items_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.protocol_items_id_seq OWNED BY public.protocol_items.id;
CREATE TABLE public.protocols
(
    id              integer                        NOT NULL,
    file            integer,
    signing_date    timestamp with time zone,
    number          character varying(255),
    contract_number character varying(255),
    contractor      smallint,
    deleted         smallint DEFAULT '0'::smallint NOT NULL
);
ALTER TABLE public.protocols
    OWNER TO bp;
CREATE SEQUENCE public.protocols_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.protocols_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.protocols_id_seq OWNED BY public.protocols.id;
CREATE SEQUENCE public.proxies_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.proxies_id_seq
    OWNER TO bp;
CREATE TABLE public.proxies
(
    id         integer DEFAULT nextval('public.proxies_id_seq'::regclass) NOT NULL,
    url        character varying(255)                                     NOT NULL,
    tries      integer DEFAULT 0,
    last_error character varying(255),
    active     boolean DEFAULT true
);
ALTER TABLE public.proxies
    OWNER TO bp;
CREATE SEQUENCE public.proxy_relations_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.proxy_relations_id_seq
    OWNER TO bp;
CREATE TABLE public.proxy_relations
(
    id         integer DEFAULT nextval('public.proxy_relations_id_seq'::regclass) NOT NULL,
    proxy_id   integer                                                            NOT NULL,
    proxy_url  character varying(255)                                             NOT NULL,
    url        character varying(255)                                             NOT NULL,
    tries      integer DEFAULT 0,
    last_error character varying(255),
    active     boolean DEFAULT true                                               NOT NULL
);
ALTER TABLE public.proxy_relations
    OWNER TO bp;
CREATE TABLE public.queue_external_chat_relations
(
    chat_id       character varying(255),
    chat_service  character varying(255),
    queue_id      integer,
    queue_service character varying(255)
);
ALTER TABLE public.queue_external_chat_relations
    OWNER TO bp;
CREATE TABLE public.queue_status
(
    id     integer                  NOT NULL,
    queue  character varying(255)   NOT NULL,
    count  text                     NOT NULL,
    "time" timestamp with time zone NOT NULL
);
ALTER TABLE public.queue_status
    OWNER TO bp;
CREATE SEQUENCE public.queue_status_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.queue_status_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.queue_status_id_seq OWNED BY public.queue_status.id;
CREATE TABLE public.recruit_activity_stat
(
    user_id           integer NOT NULL,
    date              date    NOT NULL,
    resume_count      integer,
    outgoing          integer,
    avg_duration      integer,
    plan              integer,
    overdue           integer        DEFAULT 0,
    calls_to_oriented numeric(10, 2) DEFAULT 0
);
ALTER TABLE public.recruit_activity_stat
    OWNER TO bp;
CREATE TABLE public.recruits_groups
(
    id        integer                        NOT NULL,
    name      character varying(255)         NOT NULL,
    deleted   smallint DEFAULT '0'::smallint NOT NULL,
    active    smallint DEFAULT '1'::smallint NOT NULL,
    protected integer  DEFAULT 0             NOT NULL
);
ALTER TABLE public.recruits_groups
    OWNER TO bp;
CREATE SEQUENCE public.recruits_groups_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.recruits_groups_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.recruits_groups_id_seq OWNED BY public.recruits_groups.id;
CREATE SEQUENCE public.referral_relations_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.referral_relations_id_seq
    OWNER TO bp;
CREATE TABLE public.referral_relations
(
    id           integer DEFAULT nextval('public.referral_relations_id_seq'::regclass) NOT NULL,
    referee_id   integer                                                               NOT NULL,
    referee_type character varying(255)                                                NOT NULL,
    referral_id  integer                                                               NOT NULL,
    create_date  date                                                                  NOT NULL
);
ALTER TABLE public.referral_relations
    OWNER TO bp;
CREATE SEQUENCE public.referral_relations_requests_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.referral_relations_requests_id_seq
    OWNER TO bp;
CREATE TABLE public.referral_relations_requests
(
    id                   integer DEFAULT nextval('public.referral_relations_requests_id_seq'::regclass) NOT NULL,
    user_id              integer                                                                        NOT NULL,
    operating_officer_id integer                                                                        NOT NULL,
    status               integer                                                                        NOT NULL,
    comment              text                                                                           NOT NULL,
    created_at           timestamp without time zone                                                    NOT NULL
);
ALTER TABLE public.referral_relations_requests
    OWNER TO bp;
CREATE SEQUENCE public.referral_relations_requests_comments_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.referral_relations_requests_comments_id_seq
    OWNER TO bp;
CREATE TABLE public.referral_relations_requests_comments
(
    id         integer DEFAULT nextval('public.referral_relations_requests_comments_id_seq'::regclass) NOT NULL,
    request_id integer                                                                                 NOT NULL,
    user_id    integer                                                                                 NOT NULL,
    comment    character varying(255)                                                                  NOT NULL,
    created_at timestamp without time zone                                                             NOT NULL,
    type       integer                                                                                 NOT NULL
);
ALTER TABLE public.referral_relations_requests_comments
    OWNER TO bp;
CREATE SEQUENCE public.referral_relations_requests_logs_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.referral_relations_requests_logs_id_seq
    OWNER TO bp;
CREATE TABLE public.referral_relations_requests_logs
(
    id         integer DEFAULT nextval('public.referral_relations_requests_logs_id_seq'::regclass) NOT NULL,
    user_id    integer                                                                             NOT NULL,
    request_id integer                                                                             NOT NULL,
    value      integer                                                                             NOT NULL,
    param      character varying(255)                                                              NOT NULL,
    log        character varying(255)                                                              NOT NULL,
    visible    integer                                                                             NOT NULL,
    created_at timestamp without time zone                                                         NOT NULL
);
ALTER TABLE public.referral_relations_requests_logs
    OWNER TO bp;
CREATE SEQUENCE public.referral_relations_requests_row_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.referral_relations_requests_row_id_seq
    OWNER TO bp;
CREATE TABLE public.referral_relations_requests_row
(
    id                   integer DEFAULT nextval('public.referral_relations_requests_row_id_seq'::regclass) NOT NULL,
    referral_request_id  integer                                                                            NOT NULL,
    referral_relation_id integer                                                                            NOT NULL,
    factory_id           integer                                                                            NOT NULL,
    amount               numeric(10, 2)                                                                     NOT NULL
);
ALTER TABLE public.referral_relations_requests_row
    OWNER TO bp;
CREATE TABLE public.report_statistic
(
    date          date              NOT NULL,
    factory_id    integer           NOT NULL,
    profession_id integer           NOT NULL,
    count         integer           NOT NULL,
    plan          integer DEFAULT 0 NOT NULL,
    total         integer DEFAULT 0 NOT NULL,
    approved      integer DEFAULT 0 NOT NULL
);
ALTER TABLE public.report_statistic
    OWNER TO bp;
CREATE TABLE public.request_comments
(
    id         bigint                                             NOT NULL,
    user_id    integer                                            NOT NULL,
    request_id integer                                            NOT NULL,
    comment    text                                               NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.request_comments
    OWNER TO bp;
CREATE SEQUENCE public.request_comments_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.request_comments_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.request_comments_id_seq OWNED BY public.request_comments.id;
CREATE TABLE public.request_completed
(
    id         integer NOT NULL,
    request_id integer NOT NULL,
    user_id    integer NOT NULL,
    unit_id    integer NOT NULL,
    created_at timestamp with time zone
);
ALTER TABLE public.request_completed
    OWNER TO bp;
CREATE SEQUENCE public.request_completed_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.request_completed_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.request_completed_id_seq OWNED BY public.request_completed.id;
CREATE TABLE public.request_logs
(
    id         bigint                                             NOT NULL,
    user_id    integer                                            NOT NULL,
    request_id integer                                            NOT NULL,
    value      text,
    param      character varying(255)                             NOT NULL,
    log        text                                               NOT NULL,
    visible    smallint                 DEFAULT '1'::smallint     NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.request_logs
    OWNER TO bp;
CREATE SEQUENCE public.request_logs_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.request_logs_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.request_logs_id_seq OWNED BY public.request_logs.id;
CREATE TABLE public.request_oriented
(
    id         integer NOT NULL,
    request_id integer NOT NULL,
    user_id    integer NOT NULL,
    unit_id    integer NOT NULL,
    created_at timestamp with time zone
);
ALTER TABLE public.request_oriented
    OWNER TO bp;
CREATE SEQUENCE public.request_oriented_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.request_oriented_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.request_oriented_id_seq OWNED BY public.request_oriented.id;
CREATE TABLE public.request_recruit
(
    id         integer NOT NULL,
    request_id integer NOT NULL,
    user_id    integer NOT NULL,
    value      integer NOT NULL,
    date       date
);
ALTER TABLE public.request_recruit
    OWNER TO bp;
CREATE SEQUENCE public.request_recruit_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.request_recruit_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.request_recruit_id_seq OWNED BY public.request_recruit.id;
CREATE TABLE public.requests
(
    id            bigint                         NOT NULL,
    profession_id bigint                         NOT NULL,
    factory_id    bigint                         NOT NULL,
    count         integer                        NOT NULL,
    comment       text                           NOT NULL,
    status        integer  DEFAULT 0             NOT NULL,
    created_at    timestamp with time zone,
    class         character varying(8),
    rate          numeric(10, 2)                 NOT NULL,
    conditions    text                           NOT NULL,
    requirements  text                           NOT NULL,
    duties        text                           NOT NULL,
    author_id     integer,
    is_hourrate   integer,
    deleted       integer  DEFAULT 0,
    oriented      integer  DEFAULT 0,
    completion    integer  DEFAULT 0,
    plan_id       integer  DEFAULT 0,
    pid           integer  DEFAULT 0,
    type_id       integer  DEFAULT 0,
    planned_date  date,
    deadline_date date,
    category      integer  DEFAULT 0,
    priority      integer  DEFAULT 2,
    public        smallint DEFAULT '0'::smallint NOT NULL
);
ALTER TABLE public.requests
    OWNER TO bp;
CREATE SEQUENCE public.requests_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.requests_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.requests_id_seq OWNED BY public.requests.id;
CREATE SEQUENCE public.requests_periods_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.requests_periods_seq
    OWNER TO bp;
CREATE TABLE public.requests_periods
(
    id         integer DEFAULT nextval('public.requests_periods_seq'::regclass) NOT NULL,
    request_id integer                                                          NOT NULL,
    start_date date                                                             NOT NULL,
    end_date   date
);
ALTER TABLE public.requests_periods
    OWNER TO bp;
CREATE TABLE public.requisites
(
    relation_id                integer                                            NOT NULL,
    full_name                  text,
    short_name                 text,
    legal_address              text,
    mail_address               text,
    actual_address             text,
    inn                        character varying(255),
    kpp                        character varying(255),
    okpo                       character varying(255),
    okogu                      character varying(255),
    okato                      character varying(255),
    okopf                      character varying(255),
    ogrn                       character varying(255),
    okved                      character varying(255),
    tax_system                 character varying(255),
    bank                       character varying(255),
    checking_account           character varying(255),
    correspondent_account      character varying(255),
    bik                        character varying(255),
    head_position              character varying(255),
    head_fio                   character varying(255),
    main_document              character varying(255),
    chief_accountant_fio       character varying(255),
    chief_accountant_phone     character varying(255),
    phone                      character varying(255),
    email                      character varying(255),
    site                       character varying(255),
    date_of_state_registration character varying(255),
    created_at                 timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.requisites
    OWNER TO bp;
CREATE TABLE public.retentions
(
    id          integer                  NOT NULL,
    unit_id     integer                  NOT NULL,
    user_id     integer                  NOT NULL,
    type        integer                  NOT NULL,
    amount      numeric(10, 2),
    description character varying(255),
    date        date                     NOT NULL,
    created_at  timestamp with time zone NOT NULL,
    updated_at  timestamp with time zone NOT NULL
);
ALTER TABLE public.retentions
    OWNER TO bp;
CREATE SEQUENCE public.retentions_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.retentions_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.retentions_id_seq OWNED BY public.retentions.id;
CREATE TABLE public.salary
(
    id         bigint         NOT NULL,
    unit_id    integer        NOT NULL,
    factory_id integer        NOT NULL,
    salary     numeric(10, 2) NOT NULL,
    date       date           NOT NULL
);
ALTER TABLE public.salary
    OWNER TO bp;
CREATE SEQUENCE public.salary_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.salary_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.salary_id_seq OWNED BY public.salary.id;
CREATE TABLE public.script_phrases
(
    id        bigint                 NOT NULL,
    script_id bigint                 NOT NULL,
    title     character varying(255) NOT NULL,
    alias     character varying(255) NOT NULL,
    text      text                   NOT NULL,
    deleted   integer DEFAULT 0      NOT NULL
);
ALTER TABLE public.script_phrases
    OWNER TO bp;
CREATE SEQUENCE public.script_phrases_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.script_phrases_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.script_phrases_id_seq OWNED BY public.script_phrases.id;
CREATE TABLE public.scripts
(
    id      bigint                 NOT NULL,
    title   character varying(255) NOT NULL,
    deleted integer                NOT NULL
);
ALTER TABLE public.scripts
    OWNER TO bp;
CREATE SEQUENCE public.scripts_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.scripts_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.scripts_id_seq OWNED BY public.scripts.id;
CREATE TABLE public.search_index
(
    unit_id    bigint                   NOT NULL,
    content    text,
    updated_at timestamp with time zone NOT NULL
);
ALTER TABLE public.search_index
    OWNER TO bp;
CREATE TABLE public.segment_unit_relations
(
    segment_id integer                     NOT NULL,
    unit_id    integer                     NOT NULL,
    updated_at timestamp without time zone NOT NULL
);
ALTER TABLE public.segment_unit_relations
    OWNER TO bp;
CREATE TABLE public.self_employed
(
    unit_id      integer                                            NOT NULL,
    inn          character varying(255)                             NOT NULL,
    status       smallint                                           NOT NULL,
    request_date date,
    updated_at   timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.self_employed
    OWNER TO bp;
CREATE TABLE public.settings
(
    id    integer                NOT NULL,
    key   character varying(255) NOT NULL,
    value character varying(255) NOT NULL
);
ALTER TABLE public.settings
    OWNER TO bp;
CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.settings_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;
CREATE TABLE public.shift_time
(
    id         integer NOT NULL,
    factory_id integer NOT NULL,
    type       integer NOT NULL,
    hours      integer NOT NULL
);
ALTER TABLE public.shift_time
    OWNER TO bp;
CREATE SEQUENCE public.shift_time_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.shift_time_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.shift_time_id_seq OWNED BY public.shift_time.id;
CREATE TABLE public.slow_log
(
    id         integer NOT NULL,
    sql        text,
    method     text,
    "time"     character varying(255),
    created_at timestamp with time zone
);
ALTER TABLE public.slow_log
    OWNER TO bp;
CREATE SEQUENCE public.slow_log_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.slow_log_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.slow_log_id_seq OWNED BY public.slow_log.id;
CREATE TABLE public.sms
(
    id          integer                                            NOT NULL,
    send_id     integer,
    unit_id     integer,
    phone       text,
    message     text,
    status      integer,
    created_at  timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    send_after  timestamp with time zone,
    send_at     timestamp with time zone,
    external_id character varying(255)
);
ALTER TABLE public.sms
    OWNER TO bp;
CREATE SEQUENCE public.sms_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.sms_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.sms_id_seq OWNED BY public.sms.id;
CREATE TABLE public.spp_cache
(
    unit_id        integer NOT NULL,
    fio            character varying(255),
    document_count integer,
    self_employed  integer,
    is_guest       integer,
    birthday       date,
    phones         text,
    sp_alpha       integer,
    sp_ros_bank    integer,
    sp_other       integer,
    account_number character varying(255),
    city           character varying(255),
    citizenship    character varying(255),
    feedback       character varying(255),
    med_book_end   date,
    accommodation  character varying(255),
    payment_card   text,
    recruit        character varying(255),
    updated_at     timestamp with time zone
);
ALTER TABLE public.spp_cache
    OWNER TO bp;
COMMENT ON COLUMN public.spp_cache.unit_id IS 'ID соискателя';
COMMENT ON COLUMN public.spp_cache.fio IS 'Ф.И.О.';
COMMENT ON COLUMN public.spp_cache.document_count IS 'Количество документов';
COMMENT ON COLUMN public.spp_cache.birthday IS 'Дата рождения';
COMMENT ON COLUMN public.spp_cache.phones IS 'Телефоны';
COMMENT ON COLUMN public.spp_cache.account_number IS 'Номер счёта';
COMMENT ON COLUMN public.spp_cache.city IS 'Город';
COMMENT ON COLUMN public.spp_cache.citizenship IS 'Гражданство';
COMMENT ON COLUMN public.spp_cache.feedback IS 'Источник';
COMMENT ON COLUMN public.spp_cache.med_book_end IS 'Дата окончания мед. книжки';
COMMENT ON COLUMN public.spp_cache.accommodation IS 'Проживание';
COMMENT ON COLUMN public.spp_cache.payment_card IS 'Платёжная карта';
COMMENT ON COLUMN public.spp_cache.recruit IS 'Рекрутёр';
COMMENT ON COLUMN public.spp_cache.updated_at IS 'Дата последнего обновления';
CREATE TABLE public.spp_cache_extension
(
    unit_id       integer NOT NULL,
    factory_id    integer NOT NULL,
    profession_id integer NOT NULL,
    workshop      character varying(255),
    applied_at    date,
    fired_at      date,
    contract      text,
    class         character varying(255)
);
ALTER TABLE public.spp_cache_extension
    OWNER TO bp;
COMMENT ON COLUMN public.spp_cache_extension.unit_id IS 'ID соискателя';
COMMENT ON COLUMN public.spp_cache_extension.factory_id IS 'ID предприятия';
COMMENT ON COLUMN public.spp_cache_extension.profession_id IS 'ID профессии';
COMMENT ON COLUMN public.spp_cache_extension.workshop IS 'Цех';
COMMENT ON COLUMN public.spp_cache_extension.applied_at IS 'Дата первого принятия на работу';
COMMENT ON COLUMN public.spp_cache_extension.fired_at IS 'Дата последнего увольнения';
COMMENT ON COLUMN public.spp_cache_extension.contract IS 'Договор';
COMMENT ON COLUMN public.spp_cache_extension.class IS 'Класс для того чтобы красить строки в СПП';
CREATE SEQUENCE public.subways_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.subways_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.subways_id_seq OWNED BY public.dic_subways.id;
CREATE TABLE public.summary
(
    id         integer NOT NULL,
    date       date    NOT NULL,
    work       integer,
    work_day   integer DEFAULT 0,
    work_night integer DEFAULT 0,
    total      integer,
    vacation   integer,
    weekend    integer DEFAULT 0,
    unknown    integer DEFAULT 0,
    empty      integer DEFAULT 0,
    fired      integer,
    hired      integer,
    absent     integer,
    ill        integer,
    factory_id integer
);
ALTER TABLE public.summary
    OWNER TO bp;
CREATE SEQUENCE public.summary_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.summary_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.summary_id_seq OWNED BY public.summary.id;
CREATE TABLE public.surcharges
(
    id      integer NOT NULL,
    date    date,
    title   character varying(255) DEFAULT ' '::character varying,
    amount  numeric(10, 2),
    type    integer,
    file    character varying(255) DEFAULT ''::character varying,
    user_id integer,
    unit_id integer
);
ALTER TABLE public.surcharges
    OWNER TO bp;
CREATE SEQUENCE public.surcharges_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.surcharges_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.surcharges_id_seq OWNED BY public.surcharges.id;
CREATE SEQUENCE public.telphin_instances_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.telphin_instances_id_seq
    OWNER TO bp;
CREATE TABLE public.telphin_instances
(
    id     integer DEFAULT nextval('public.telphin_instances_id_seq'::regclass) NOT NULL,
    name   character varying(255)                                               NOT NULL,
    url    character varying(255)                                               NOT NULL,
    app_id character varying(255)                                               NOT NULL,
    secret character varying(255)                                               NOT NULL,
    active boolean DEFAULT true
);
ALTER TABLE public.telphin_instances
    OWNER TO bp;
CREATE TABLE public.tests
(
    id         integer                                                NOT NULL,
    name       character varying(255)   DEFAULT ''::character varying NOT NULL,
    log        text,
    errors     integer                                                NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP     NOT NULL
);
ALTER TABLE public.tests
    OWNER TO bp;
CREATE SEQUENCE public.tests_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.tests_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.tests_id_seq OWNED BY public.tests.id;
CREATE TABLE public.timesheet
(
    id            bigint                         NOT NULL,
    unit_id       bigint                         NOT NULL,
    factory_id    integer                        NOT NULL,
    profession_id integer                        NOT NULL,
    master_id     integer                        NOT NULL,
    date          date                           NOT NULL,
    state         smallint DEFAULT '0'::smallint NOT NULL,
    "time"        numeric(10, 2),
    outage        numeric(10, 2),
    comment       character varying(255)
);
ALTER TABLE public.timesheet
    OWNER TO bp;
COMMENT ON COLUMN public.timesheet.outage IS 'Часы простоя';
CREATE SEQUENCE public.timesheet_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.timesheet_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.timesheet_id_seq OWNED BY public.timesheet.id;
CREATE TABLE public.timesheet_logs
(
    id                 bigint                                             NOT NULL,
    user_id            integer                                            NOT NULL,
    timetable_check_id integer                                            NOT NULL,
    value              text,
    param              character varying(255)                             NOT NULL,
    log                text                                               NOT NULL,
    visible            smallint                 DEFAULT '1'::smallint     NOT NULL,
    created_at         timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.timesheet_logs
    OWNER TO bp;
CREATE SEQUENCE public.timesheet_logs_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.timesheet_logs_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.timesheet_logs_id_seq OWNED BY public.timesheet_logs.id;
CREATE TABLE public.timesheet_totals
(
    id                     integer NOT NULL,
    factory_id             integer,
    profession_id          integer,
    rate                   numeric(10, 2),
    unit_id                integer,
    user_id                integer,
    date                   date,
    total                  numeric(10, 3),
    total_night            numeric(10, 3),
    outage                 numeric(10, 3),
    official_salary        numeric(10, 3),
    brigadier              numeric(10, 3),
    medical_tests          numeric(10, 3),
    ndfl                   numeric(10, 3),
    alimony                numeric(10, 3),
    utilities              numeric(10, 3),
    patents                numeric(10, 3),
    watch                  numeric(10, 3),
    idle_time              numeric(10, 3),
    housing_compensation   numeric(10, 3),
    transport_compensation numeric(10, 3),
    med_book_compensation  numeric(10, 3),
    overalls_compensation  numeric(10, 3),
    bounty                 numeric(10, 3),
    fines                  numeric(10, 3),
    overalls               numeric(10, 3),
    prepayments            text,
    work_date_id           integer,
    already_paid           numeric(10, 2) DEFAULT 0
);
ALTER TABLE public.timesheet_totals
    OWNER TO bp;
CREATE SEQUENCE public.timesheet_totals_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.timesheet_totals_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.timesheet_totals_id_seq OWNED BY public.timesheet_totals.id;
CREATE TABLE public.timesheet_totals_master
(
    id            integer NOT NULL,
    factory_id    integer,
    profession_id integer,
    rate          numeric(10, 2),
    unit_id       integer,
    user_id       integer,
    total         numeric(10, 3),
    total_night   numeric(10, 3),
    outage        numeric(10, 3),
    brigadier     integer,
    utilities     numeric(10, 3),
    overalls      integer DEFAULT 0,
    work_date_id  integer,
    date          date
);
ALTER TABLE public.timesheet_totals_master
    OWNER TO bp;
CREATE SEQUENCE public.timesheet_totals_master_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.timesheet_totals_master_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.timesheet_totals_master_id_seq OWNED BY public.timesheet_totals_master.id;
CREATE SEQUENCE public.timetable_cache_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.timetable_cache_id_seq
    OWNER TO bp;
CREATE TABLE public.timetable_cache
(
    id                        integer DEFAULT nextval('public.timetable_cache_id_seq'::regclass) NOT NULL,
    factory_id                integer                                                            NOT NULL,
    date                      date                                                               NOT NULL,
    total_day                 numeric(10, 2),
    total_night               numeric(10, 2),
    outage_shift_count        numeric(10, 2),
    outage                    numeric(10, 2),
    accommodation             numeric(10, 2),
    transfer                  numeric(10, 2),
    medbook                   numeric(10, 2),
    overalls                  numeric(10, 2),
    bounty                    numeric(10, 2),
    salary                    numeric(10, 2),
    total_surcharges          numeric(10, 2),
    retention_official_salary numeric(10, 2),
    retention_ndfl            numeric(10, 2),
    retention_alimony         numeric(10, 2),
    retention_fines           numeric(10, 2),
    retention_lunch           numeric(10, 2),
    retention_overalls        numeric(10, 2),
    retention_work_book       numeric(10, 2),
    retention_loan            numeric(10, 2),
    retention_medical_board   numeric(10, 2),
    retention_patent          numeric(10, 2),
    retention_utilities       numeric(10, 2),
    retention_watch           numeric(10, 2),
    total_retention           numeric(10, 2),
    total_salary              numeric(10, 2),
    prepayment_amount         numeric(10, 2),
    already_paid              numeric(10, 2),
    left_to_pay               numeric(10, 2)
);
ALTER TABLE public.timetable_cache
    OWNER TO bp;
CREATE TABLE public.timetable_checks
(
    id                         integer                        NOT NULL,
    date                       date,
    created_at                 timestamp with time zone,
    factory_id                 integer,
    status                     integer  DEFAULT 0,
    deleted                    smallint DEFAULT '0'::smallint NOT NULL,
    data                       text,
    timesheet_totals_master_id integer,
    master_data                text,
    keeper_data                text
);
ALTER TABLE public.timetable_checks
    OWNER TO bp;
CREATE SEQUENCE public.timetable_checks_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.timetable_checks_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.timetable_checks_id_seq OWNED BY public.timetable_checks.id;
CREATE TABLE public.timetable_comments
(
    id                 integer                                            NOT NULL,
    timetable_check_id integer                                            NOT NULL,
    user_id            integer                                            NOT NULL,
    comment            text                                               NOT NULL,
    created_at         timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.timetable_comments
    OWNER TO bp;
CREATE SEQUENCE public.timetable_comments_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.timetable_comments_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.timetable_comments_id_seq OWNED BY public.timetable_comments.id;
CREATE TABLE public.timetable_signatures
(
    id                 integer                                            NOT NULL,
    timetable_check_id integer                                            NOT NULL,
    user_id            integer                                            NOT NULL,
    type               integer                                            NOT NULL,
    created_at         timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted            smallint                 DEFAULT '0'::smallint     NOT NULL
);
ALTER TABLE public.timetable_signatures
    OWNER TO bp;
CREATE SEQUENCE public.timetable_signatures_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.timetable_signatures_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.timetable_signatures_id_seq OWNED BY public.timetable_signatures.id;
CREATE TABLE public.unit_contract_contractors
(
    id          integer                        NOT NULL,
    name        character varying(255)         NOT NULL,
    deleted     smallint DEFAULT '0'::smallint NOT NULL,
    active      smallint DEFAULT '1'::smallint NOT NULL,
    protected   integer  DEFAULT 0             NOT NULL,
    external_id character varying(255)
);
ALTER TABLE public.unit_contract_contractors
    OWNER TO bp;
CREATE SEQUENCE public.unit_contract_contractors_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.unit_contract_contractors_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.unit_contract_contractors_id_seq OWNED BY public.unit_contract_contractors.id;
CREATE TABLE public.unit_contract_work_date_relations
(
    contract_id  integer NOT NULL,
    work_date_id integer NOT NULL
);
ALTER TABLE public.unit_contract_work_date_relations
    OWNER TO bp;
CREATE TABLE public.unit_events
(
    id         integer NOT NULL,
    unit_id    integer,
    author_id  integer,
    event      character varying(255),
    date_time  timestamp with time zone,
    status     smallint,
    created_at timestamp with time zone,
    comment    character varying(255),
    additional text
);
ALTER TABLE public.unit_events
    OWNER TO bp;
CREATE SEQUENCE public.unit_events_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.unit_events_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.unit_events_id_seq OWNED BY public.unit_events.id;
CREATE TABLE public.unit_experience
(
    id            bigint                 NOT NULL,
    unit_id       bigint                 NOT NULL,
    profession_id bigint                 NOT NULL,
    class         character varying(255) NOT NULL
);
ALTER TABLE public.unit_experience
    OWNER TO bp;
CREATE SEQUENCE public.unit_experience_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.unit_experience_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.unit_experience_id_seq OWNED BY public.unit_experience.id;
CREATE TABLE public.unit_external_chat_relations
(
    unit_id      integer,
    chat_id      character varying(255),
    chat_service character varying(255)
);
ALTER TABLE public.unit_external_chat_relations
    OWNER TO bp;
CREATE TABLE public.unit_payment_cards
(
    id         integer NOT NULL,
    unit_id    integer NOT NULL,
    full_name  character varying(255),
    number     character varying(255),
    valid_thru date,
    file       integer,
    added_at   date,
    removed_at date,
    is_current boolean
);
ALTER TABLE public.unit_payment_cards
    OWNER TO bp;
CREATE SEQUENCE public.unit_payment_cards_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.unit_payment_cards_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.unit_payment_cards_id_seq OWNED BY public.unit_payment_cards.id;
CREATE TABLE public.units_additional_data
(
    unit_id  integer NOT NULL,
    data     text,
    group_id integer
);
ALTER TABLE public.units_additional_data
    OWNER TO bp;
CREATE TABLE public.units_contracts
(
    id         integer                                            NOT NULL,
    number     text,
    "from"     date,
    "to"       date,
    unit_id    integer,
    contractor integer,
    type       integer,
    changed    integer                  DEFAULT 0,
    is_current integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    held_1s    smallint                 DEFAULT '0'::smallint     NOT NULL,
    deleted    integer                  DEFAULT 0                 NOT NULL
);
ALTER TABLE public.units_contracts
    OWNER TO bp;
CREATE SEQUENCE public.units_contracts_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.units_contracts_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.units_contracts_id_seq OWNED BY public.units_contracts.id;
CREATE TABLE public.units_delete_requests
(
    id         integer NOT NULL,
    unit_id    integer,
    user_id    integer,
    created_at timestamp with time zone,
    comment    text,
    status     integer,
    log        character varying(255)
);
ALTER TABLE public.units_delete_requests
    OWNER TO bp;
CREATE SEQUENCE public.units_delete_requests_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.units_delete_requests_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.units_delete_requests_id_seq OWNED BY public.units_delete_requests.id;
CREATE TABLE public.units_document_delete_requests
(
    id         integer NOT NULL,
    unit_id    integer,
    file_id    integer,
    user_id    integer,
    created_at timestamp with time zone,
    comment    text,
    status     integer,
    log        character varying(255)
);
ALTER TABLE public.units_document_delete_requests
    OWNER TO bp;
CREATE SEQUENCE public.units_document_delete_requests_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.units_document_delete_requests_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.units_document_delete_requests_id_seq OWNED BY public.units_document_delete_requests.id;
CREATE TABLE public.units_filter_params
(
    unit_id        integer           NOT NULL,
    eng            integer DEFAULT 0 NOT NULL,
    rus            integer DEFAULT 0 NOT NULL,
    lat            integer DEFAULT 0 NOT NULL,
    est            integer DEFAULT 0 NOT NULL,
    fin            integer DEFAULT 0 NOT NULL,
    safety         integer DEFAULT 0 NOT NULL,
    fire           integer DEFAULT 0 NOT NULL,
    professional   integer DEFAULT 0 NOT NULL,
    electrical     integer DEFAULT 0 NOT NULL,
    residence      integer DEFAULT 0 NOT NULL,
    driver_license boolean,
    has_car        boolean
);
ALTER TABLE public.units_filter_params
    OWNER TO bp;
CREATE TABLE public.units_patents_checks
(
    unit_id        integer NOT NULL,
    days_remaining integer NOT NULL
);
ALTER TABLE public.units_patents_checks
    OWNER TO bp;
CREATE TABLE public.units_phone_delete_requests
(
    id         integer NOT NULL,
    unit_id    integer,
    phone      character varying(50),
    user_id    integer,
    created_at timestamp with time zone,
    comment    text,
    status     integer,
    log        character varying(255)
);
ALTER TABLE public.units_phone_delete_requests
    OWNER TO bp;
CREATE SEQUENCE public.units_phone_delete_requests_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.units_phone_delete_requests_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.units_phone_delete_requests_id_seq OWNED BY public.units_phone_delete_requests.id;
CREATE TABLE public.units_rating
(
    id         integer                                            NOT NULL,
    unit_id    integer                                            NOT NULL,
    user_id    integer                                            NOT NULL,
    rating     smallint                                           NOT NULL,
    type       smallint                                           NOT NULL,
    comment    character varying(255),
    is_current smallint                                           NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
ALTER TABLE public.units_rating
    OWNER TO bp;
CREATE SEQUENCE public.units_rating_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.units_rating_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.units_rating_id_seq OWNED BY public.units_rating.id;
CREATE SEQUENCE public.units_segments_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.units_segments_id_seq
    OWNER TO bp;
CREATE TABLE public.units_segments
(
    id     integer DEFAULT nextval('public.units_segments_id_seq'::regclass) NOT NULL,
    name   character varying(255)                                            NOT NULL,
    count  integer,
    filter text
);
ALTER TABLE public.units_segments
    OWNER TO bp;
CREATE TABLE public.units_stat
(
    id      integer NOT NULL,
    user_id integer NOT NULL,
    count   integer NOT NULL,
    date    date    NOT NULL
);
ALTER TABLE public.units_stat
    OWNER TO bp;
CREATE SEQUENCE public.units_stat_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.units_stat_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.units_stat_id_seq OWNED BY public.units_stat.id;
CREATE TABLE public.units_tags
(
    unit_id integer,
    tag     character varying(255)
);
ALTER TABLE public.units_tags
    OWNER TO bp;
CREATE TABLE public.updates
(
    id         integer NOT NULL,
    title      character varying(255),
    icon       character varying(63),
    color      character varying(63),
    author_id  integer,
    content    text,
    created_at timestamp with time zone
);
ALTER TABLE public.updates
    OWNER TO bp;
CREATE SEQUENCE public.updates_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.updates_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.updates_id_seq OWNED BY public.updates.id;
CREATE TABLE public.updates_read
(
    id        integer NOT NULL,
    user_id   integer NOT NULL,
    update_id integer NOT NULL
);
ALTER TABLE public.updates_read
    OWNER TO bp;
CREATE SEQUENCE public.updates_read_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.updates_read_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.updates_read_id_seq OWNED BY public.updates_read.id;
CREATE SEQUENCE public.user_calendar_settings_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.user_calendar_settings_id_seq
    OWNER TO bp;
CREATE TABLE public.user_calendar_settings
(
    id         integer DEFAULT nextval('public.user_calendar_settings_id_seq'::regclass) NOT NULL,
    user_id    integer                                                                   NOT NULL,
    start_time time without time zone                                                    NOT NULL,
    end_time   time without time zone                                                    NOT NULL,
    days       character varying(255)                                                    NOT NULL,
    count      integer DEFAULT 1                                                         NOT NULL,
    duration   integer DEFAULT 30                                                        NOT NULL
);
ALTER TABLE public.user_calendar_settings
    OWNER TO bp;
CREATE TABLE public.user_client_curator_relations
(
    user_id           integer NOT NULL,
    client_curator_id integer NOT NULL
);
ALTER TABLE public.user_client_curator_relations
    OWNER TO bp;
CREATE SEQUENCE public.user_event_unit_relations_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.user_event_unit_relations_id_seq
    OWNER TO bp;
CREATE TABLE public.user_event_unit_relations
(
    id          integer DEFAULT nextval('public.user_event_unit_relations_id_seq'::regclass) NOT NULL,
    event_id    integer                                                                      NOT NULL,
    unit_id     integer                                                                      NOT NULL,
    status      integer DEFAULT 2                                                            NOT NULL,
    comment     character varying(255),
    description character varying(255)
);
ALTER TABLE public.user_event_unit_relations
    OWNER TO bp;
CREATE SEQUENCE public.user_events_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.user_events_id_seq
    OWNER TO bp;
CREATE TABLE public.user_events
(
    id         integer DEFAULT nextval('public.user_events_id_seq'::regclass) NOT NULL,
    author_id  integer,
    user_id    integer                                                        NOT NULL,
    status     integer,
    date       date                                                           NOT NULL,
    "time"     time without time zone                                         NOT NULL,
    created_at timestamp without time zone                                    NOT NULL,
    updated_at timestamp without time zone                                    NOT NULL,
    filled     integer DEFAULT 0                                              NOT NULL,
    count      integer DEFAULT 1                                              NOT NULL,
    duration   integer DEFAULT 30                                             NOT NULL
);
ALTER TABLE public.user_events
    OWNER TO bp;
CREATE TABLE public.user_external_service_relations
(
    user_id     integer                NOT NULL,
    service     character varying(255) NOT NULL,
    external_id character varying(255) NOT NULL,
    instance_id integer
);
ALTER TABLE public.user_external_service_relations
    OWNER TO bp;
CREATE TABLE public.user_factory_relation
(
    user_id    integer NOT NULL,
    factory_id integer NOT NULL
);
ALTER TABLE public.user_factory_relation
    OWNER TO bp;
CREATE TABLE public.user_hang_request
(
    id         integer NOT NULL,
    user_id    integer,
    request_id integer,
    hanged_at  timestamp with time zone
);
ALTER TABLE public.user_hang_request
    OWNER TO bp;
CREATE SEQUENCE public.user_hang_request_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.user_hang_request_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.user_hang_request_id_seq OWNED BY public.user_hang_request.id;
CREATE TABLE public.user_logs
(
    id         integer                                            NOT NULL,
    user_id    integer,
    entity     text,
    entity_id  text,
    "column"   text,
    value      text,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    action     character varying(255)
);
ALTER TABLE public.user_logs
    OWNER TO bp;
COMMENT ON COLUMN public.user_logs.value IS 'На что поменялось';
CREATE SEQUENCE public.user_logs_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.user_logs_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.user_logs_id_seq OWNED BY public.user_logs.id;
CREATE TABLE public.user_recruit_relation
(
    user_id    integer NOT NULL,
    recruit_id integer NOT NULL
);
ALTER TABLE public.user_recruit_relation
    OWNER TO bp;
CREATE TABLE public.user_unit_events_relations
(
    user_id  integer,
    event_id integer
);
ALTER TABLE public.user_unit_events_relations
    OWNER TO bp;
CREATE SEQUENCE public.users_sips_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.users_sips_seq
    OWNER TO bp;
CREATE TABLE public.users_sips
(
    id       integer DEFAULT nextval('public.users_sips_seq'::regclass) NOT NULL,
    user_id  integer,
    socket   character varying(255),
    login    character varying(255),
    password character varying(255)
);
ALTER TABLE public.users_sips
    OWNER TO bp;
CREATE TABLE public.vacancies
(
    id               bigint                                               NOT NULL,
    title            character varying(255)                               NOT NULL,
    intro            text                                                 NOT NULL,
    description      text                                                 NOT NULL,
    flag             character varying(1)                                 NOT NULL,
    ordering         integer                                              NOT NULL,
    shift            character varying(255) DEFAULT ''::character varying NOT NULL,
    price            character varying(255) DEFAULT ''::character varying NOT NULL,
    legal_employment integer                DEFAULT 0                     NOT NULL,
    salary_frequency character varying(255) DEFAULT ''::character varying NOT NULL,
    published        integer                DEFAULT 1                     NOT NULL,
    text             text,
    video            character varying(50)  DEFAULT ''::character varying,
    image            integer,
    additional_type  integer                DEFAULT 0,
    experience       character varying(255)
);
ALTER TABLE public.vacancies
    OWNER TO bp;
CREATE TABLE public.vacancies_cities_relations
(
    id         integer NOT NULL,
    city_id    integer NOT NULL,
    vacancy_id integer NOT NULL
);
ALTER TABLE public.vacancies_cities_relations
    OWNER TO bp;
CREATE SEQUENCE public.vacancies_cities_relations_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.vacancies_cities_relations_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.vacancies_cities_relations_id_seq OWNED BY public.vacancies_cities_relations.id;
CREATE SEQUENCE public.vacancies_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.vacancies_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.vacancies_id_seq OWNED BY public.vacancies.id;
CREATE TABLE public.vacation_applications_work_date_relations
(
    file_id      integer NOT NULL,
    work_date_id integer NOT NULL
);
ALTER TABLE public.vacation_applications_work_date_relations
    OWNER TO bp;
CREATE TABLE public.viber_queue
(
    id         integer                                            NOT NULL,
    user_id    integer,
    message    text,
    status     integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    send_at    timestamp with time zone
);
ALTER TABLE public.viber_queue
    OWNER TO bp;
CREATE SEQUENCE public.viber_queue_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.viber_queue_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.viber_queue_id_seq OWNED BY public.viber_queue.id;
CREATE TABLE public.warehouse
(
    id                 integer           NOT NULL,
    master_id          integer           NOT NULL,
    overall_request_id integer,
    overalls_list_id   integer,
    overall            character varying(255),
    price_per_unit     numeric(10, 2),
    deleted            integer DEFAULT 0 NOT NULL,
    overall_id         integer
);
ALTER TABLE public.warehouse
    OWNER TO bp;
CREATE SEQUENCE public.warehouse_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.warehouse_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.warehouse_id_seq OWNED BY public.warehouse.id;
CREATE TABLE public.whats_app_chat
(
    id             integer                                                    NOT NULL,
    external_id    character varying(255),
    "time"         timestamp with time zone,
    phone          character varying(255)                                     NOT NULL,
    object_id      integer,
    object_type    character varying(255)   DEFAULT 'unit'::character varying NOT NULL,
    chat_id        character varying(255),
    from_me        smallint,
    body           text,
    caption        text,
    type           character varying(255),
    message_number integer,
    queue_id       integer,
    received_at    timestamp with time zone DEFAULT CURRENT_TIMESTAMP         NOT NULL,
    read_at        timestamp with time zone,
    status         integer
);
ALTER TABLE public.whats_app_chat
    OWNER TO bp;
COMMENT ON COLUMN public.whats_app_chat.caption IS 'Подпись к картинке';
CREATE SEQUENCE public.whats_app_chat_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.whats_app_chat_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.whats_app_chat_id_seq OWNED BY public.whats_app_chat.id;
CREATE TABLE public.whats_app_instance_phone_relations
(
    phone       character varying(255),
    instance_id integer
);
ALTER TABLE public.whats_app_instance_phone_relations
    OWNER TO bp;
CREATE TABLE public.whats_app_queue
(
    id         integer                                            NOT NULL,
    send_id    integer,
    phone      character varying(255),
    message    text,
    status     integer,
    type       smallint                 DEFAULT '1'::smallint     NOT NULL,
    chat_id    integer,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    send_after timestamp with time zone,
    send_at    timestamp with time zone
);
ALTER TABLE public.whats_app_queue
    OWNER TO bp;
COMMENT ON COLUMN public.whats_app_queue.type IS 'Тип сообщения (Текст или Файл)';
CREATE SEQUENCE public.whats_app_queue_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.whats_app_queue_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.whats_app_queue_id_seq OWNED BY public.whats_app_queue.id;
CREATE SEQUENCE public.whats_app_settings_id_seq
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.whats_app_settings_id_seq
    OWNER TO bp;
CREATE TABLE public.whats_app_settings
(
    id       integer DEFAULT nextval('public.whats_app_settings_id_seq'::regclass) NOT NULL,
    instance integer,
    token    character varying(255),
    user_id  integer
);
ALTER TABLE public.whats_app_settings
    OWNER TO bp;
CREATE TABLE public.work_date
(
    id                         integer                                               NOT NULL,
    unit_id                    integer,
    applied_at                 date,
    fired_at                   date,
    profession_id              integer,
    class                      character varying(3) DEFAULT '1;9'::character varying NOT NULL,
    factory_id                 integer,
    is_current                 integer              DEFAULT 0                        NOT NULL,
    need_change                integer              DEFAULT 0                        NOT NULL,
    is_fired                   smallint             DEFAULT 0                        NOT NULL,
    is_vacation                smallint             DEFAULT '0'::smallint            NOT NULL,
    from_vacation              smallint             DEFAULT '0'::smallint            NOT NULL,
    work_by                    integer,
    rate                       numeric(10, 2),
    request_id                 integer,
    transferred_from           integer,
    transferred_to             integer,
    agency_payed_state         integer              DEFAULT 0,
    transferred_to_period_id   integer,
    transferred_from_period_id integer,
    contract_id                integer,
    own_expanse                integer              DEFAULT 0,
    worked_time                numeric(10, 2),
    deleted                    boolean              DEFAULT false                    NOT NULL
);
ALTER TABLE public.work_date
    OWNER TO bp;
COMMENT ON COLUMN public.work_date.class IS 'Разряд';
CREATE SEQUENCE public.work_date_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.work_date_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.work_date_id_seq OWNED BY public.work_date.id;
CREATE TABLE public.work_flow
(
    id         integer NOT NULL,
    factory_id integer,
    date       date,
    applied    integer,
    worked     integer,
    fired      integer
);
ALTER TABLE public.work_flow
    OWNER TO bp;
CREATE SEQUENCE public.work_flow_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.work_flow_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.work_flow_id_seq OWNED BY public.work_flow.id;
CREATE TABLE public.workshops
(
    id           integer                NOT NULL,
    work_date_id integer                NOT NULL,
    name         character varying(255) NOT NULL,
    started_at   date,
    finished_at  date
);
ALTER TABLE public.workshops
    OWNER TO bp;
CREATE SEQUENCE public.workshops_id_seq
    AS integer
    START WITH 1000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.workshops_id_seq
    OWNER TO bp;
ALTER SEQUENCE public.workshops_id_seq OWNED BY public.workshops.id;
ALTER TABLE ONLY public.accommodation_periods
    ALTER COLUMN id SET DEFAULT nextval('public.accommodation_periods_id_seq'::regclass);
ALTER TABLE ONLY public.accommodation_places
    ALTER COLUMN id SET DEFAULT nextval('public.accommodation_places_id_seq'::regclass);
ALTER TABLE ONLY public.accommodation_places_month_prices
    ALTER COLUMN id SET DEFAULT nextval('public.accommodation_places_month_prices_id_seq'::regclass);
ALTER TABLE ONLY public.account_transactions
    ALTER COLUMN id SET DEFAULT nextval('public.account_transactions_id_seq'::regclass);
ALTER TABLE ONLY public.accounts
    ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);
ALTER TABLE ONLY public.adv_outcome
    ALTER COLUMN id SET DEFAULT nextval('public.adv_outcome_id_seq'::regclass);
ALTER TABLE ONLY public.advance_account
    ALTER COLUMN id SET DEFAULT nextval('public.advance_account_id_seq'::regclass);
ALTER TABLE ONLY public.api_auth
    ALTER COLUMN id SET DEFAULT nextval('public.api_auth_id_seq'::regclass);
ALTER TABLE ONLY public.auth
    ALTER COLUMN id SET DEFAULT nextval('public.auth_id_seq'::regclass);
ALTER TABLE ONLY public.call_statistic
    ALTER COLUMN id SET DEFAULT nextval('public.call_statistic_id_seq'::regclass);
ALTER TABLE ONLY public.call_task
    ALTER COLUMN id SET DEFAULT nextval('public.call_task_id_seq'::regclass);
ALTER TABLE ONLY public.call_task_lists
    ALTER COLUMN id SET DEFAULT nextval('public.call_task_lists_id_seq'::regclass);
ALTER TABLE ONLY public.calls_count_statistic
    ALTER COLUMN id SET DEFAULT nextval('public.calls_count_statistic_id_seq'::regclass);
ALTER TABLE ONLY public.calls_queue
    ALTER COLUMN id SET DEFAULT nextval('public.calls_queue_id_seq'::regclass);
ALTER TABLE ONLY public.chat_events
    ALTER COLUMN id SET DEFAULT nextval('public.chat_events_id_seq'::regclass);
ALTER TABLE ONLY public.cities
    ALTER COLUMN id SET DEFAULT nextval('public.cities_id_seq'::regclass);
ALTER TABLE ONLY public.citizenship
    ALTER COLUMN id SET DEFAULT nextval('public.citizenship_id_seq'::regclass);
ALTER TABLE ONLY public.conversions
    ALTER COLUMN id SET DEFAULT nextval('public.conversions_id_seq'::regclass);
ALTER TABLE ONLY public.curator_check_lists
    ALTER COLUMN id SET DEFAULT nextval('public.curator_check_lists_id_seq'::regclass);
ALTER TABLE ONLY public.dic_insurance_companies
    ALTER COLUMN id SET DEFAULT nextval('public.dic_insurance_companies_id_seq'::regclass);
ALTER TABLE ONLY public.dic_languages
    ALTER COLUMN id SET DEFAULT nextval('public.dic_languages_id_seq'::regclass);
ALTER TABLE ONLY public.dic_subways
    ALTER COLUMN id SET DEFAULT nextval('public.subways_id_seq'::regclass);
ALTER TABLE ONLY public.documents
    ALTER COLUMN id SET DEFAULT nextval('public.documents_id_seq'::regclass);
ALTER TABLE ONLY public.documents_logs
    ALTER COLUMN id SET DEFAULT nextval('public.documents_logs_id_seq'::regclass);
ALTER TABLE ONLY public.documents_types
    ALTER COLUMN id SET DEFAULT nextval('public.documents_types_id_seq'::regclass);
ALTER TABLE ONLY public.email
    ALTER COLUMN id SET DEFAULT nextval('public.email_id_seq'::regclass);
ALTER TABLE ONLY public.error_logs
    ALTER COLUMN id SET DEFAULT nextval('public.error_logs_id_seq'::regclass);
ALTER TABLE ONLY public.errors_1s
    ALTER COLUMN id SET DEFAULT nextval('public.errors_1s_id_seq'::regclass);
ALTER TABLE ONLY public.ev_comments
    ALTER COLUMN id SET DEFAULT nextval('public.ev_comments_id_seq'::regclass);
ALTER TABLE ONLY public.ev_logs
    ALTER COLUMN id SET DEFAULT nextval('public.ev_logs_id_seq'::regclass);
ALTER TABLE ONLY public.ev_units
    ALTER COLUMN id SET DEFAULT nextval('public.ev_units_id_seq'::regclass);
ALTER TABLE ONLY public.ev_users
    ALTER COLUMN id SET DEFAULT nextval('public.ev_users_id_seq'::regclass);
ALTER TABLE ONLY public.factories
    ALTER COLUMN id SET DEFAULT nextval('public.factories_id_seq'::regclass);
ALTER TABLE ONLY public.factory_today_state
    ALTER COLUMN id SET DEFAULT nextval('public.factory_today_state_id_seq'::regclass);
ALTER TABLE ONLY public.feedback
    ALTER COLUMN id SET DEFAULT nextval('public.feedback_id_seq'::regclass);
ALTER TABLE ONLY public.feedback_comment
    ALTER COLUMN id SET DEFAULT nextval('public.feedback_comment_id_seq'::regclass);
ALTER TABLE ONLY public.files
    ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);
ALTER TABLE ONLY public.fines
    ALTER COLUMN id SET DEFAULT nextval('public.fines_id_seq'::regclass);
ALTER TABLE ONLY public.insurance
    ALTER COLUMN id SET DEFAULT nextval('public.insurance_id_seq'::regclass);
ALTER TABLE ONLY public.keeper_value_changes
    ALTER COLUMN id SET DEFAULT nextval('public.keeper_value_changes_id_seq'::regclass);
ALTER TABLE ONLY public.knowledge_article
    ALTER COLUMN id SET DEFAULT nextval('public.knowledge_article_id_seq'::regclass);
ALTER TABLE ONLY public.knowledge_article_relation
    ALTER COLUMN id SET DEFAULT nextval('public.knowledge_article_relation_id_seq'::regclass);
ALTER TABLE ONLY public.knowledge_section
    ALTER COLUMN id SET DEFAULT nextval('public.knowledge_section_id_seq'::regclass);
ALTER TABLE ONLY public.knowledge_section_availability
    ALTER COLUMN id SET DEFAULT nextval('public.knowledge_section_availability_id_seq'::regclass);
ALTER TABLE ONLY public.knowledge_section_relation
    ALTER COLUMN id SET DEFAULT nextval('public.knowledge_section_relation_id_seq'::regclass);
ALTER TABLE ONLY public.languages
    ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);
ALTER TABLE ONLY public.leads
    ALTER COLUMN id SET DEFAULT nextval('public.leads_id_seq'::regclass);
ALTER TABLE ONLY public.logs_auth
    ALTER COLUMN id SET DEFAULT nextval('public.logs_auth_id_seq'::regclass);
ALTER TABLE ONLY public.mailing_templates
    ALTER COLUMN id SET DEFAULT nextval('public.mailing_templates_id_seq'::regclass);
ALTER TABLE ONLY public.mailings
    ALTER COLUMN id SET DEFAULT nextval('public.mailings_id_seq'::regclass);
ALTER TABLE ONLY public.master_units_delay
    ALTER COLUMN id SET DEFAULT nextval('public.master_units_delay_id_seq'::regclass);
ALTER TABLE ONLY public.migrations
    ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
ALTER TABLE ONLY public.no_request_completion
    ALTER COLUMN id SET DEFAULT nextval('public.no_request_completion_id_seq'::regclass);
ALTER TABLE ONLY public.notification
    ALTER COLUMN id SET DEFAULT nextval('public.notification_id_seq'::regclass);
ALTER TABLE ONLY public.old_unit_experience
    ALTER COLUMN id SET DEFAULT nextval('public.old_unit_experience_id_seq'::regclass);
ALTER TABLE ONLY public.online_stat
    ALTER COLUMN id SET DEFAULT nextval('public.online_stat_id_seq'::regclass);
ALTER TABLE ONLY public.oriented_stat
    ALTER COLUMN id SET DEFAULT nextval('public.oriented_stat_id_seq'::regclass);
ALTER TABLE ONLY public.outgoing_1s_queue
    ALTER COLUMN id SET DEFAULT nextval('public.outgoing_1s_queue_id_seq'::regclass);
ALTER TABLE ONLY public.overall_without_deduction
    ALTER COLUMN id SET DEFAULT nextval('public.overall_without_deduction_id_seq'::regclass);
ALTER TABLE ONLY public.overalls
    ALTER COLUMN id SET DEFAULT nextval('public.overalls_id_seq'::regclass);
ALTER TABLE ONLY public.overalls_list
    ALTER COLUMN id SET DEFAULT nextval('public.overalls_list_id_seq'::regclass);
ALTER TABLE ONLY public.overalls_requests
    ALTER COLUMN id SET DEFAULT nextval('public.overalls_requests_id_seq'::regclass);
ALTER TABLE ONLY public.overalls_requests_logs
    ALTER COLUMN id SET DEFAULT nextval('public.overalls_requests_logs_id_seq'::regclass);
ALTER TABLE ONLY public.overalls_requests_rows
    ALTER COLUMN id SET DEFAULT nextval('public.overalls_requests_rows_id_seq'::regclass);
ALTER TABLE ONLY public.personal_documents
    ALTER COLUMN id SET DEFAULT nextval('public.personal_documents_id_seq'::regclass);
ALTER TABLE ONLY public.phones
    ALTER COLUMN id SET DEFAULT nextval('public.phones_id_seq'::regclass);
ALTER TABLE ONLY public.plan
    ALTER COLUMN id SET DEFAULT nextval('public.plan_id_seq'::regclass);
ALTER TABLE ONLY public.plan_completion
    ALTER COLUMN id SET DEFAULT nextval('public.plan_completion_id_seq'::regclass);
ALTER TABLE ONLY public.plan_orientation
    ALTER COLUMN id SET DEFAULT nextval('public.plan_orientation_id_seq'::regclass);
ALTER TABLE ONLY public.plan_recruit
    ALTER COLUMN id SET DEFAULT nextval('public.plan_recruit_id_seq'::regclass);
ALTER TABLE ONLY public.plan_statistic
    ALTER COLUMN id SET DEFAULT nextval('public.plan_statistic_id_seq'::regclass);
ALTER TABLE ONLY public.prepayments
    ALTER COLUMN id SET DEFAULT nextval('public.prepayments_id_seq'::regclass);
ALTER TABLE ONLY public.prepayments_change_requests
    ALTER COLUMN id SET DEFAULT nextval('public.prepayments_change_requests_id_seq'::regclass);
ALTER TABLE ONLY public.prepayments_comments
    ALTER COLUMN id SET DEFAULT nextval('public.prepayments_comments_id_seq'::regclass);
ALTER TABLE ONLY public.prepayments_logs
    ALTER COLUMN id SET DEFAULT nextval('public.prepayments_logs_id_seq'::regclass);
ALTER TABLE ONLY public.prepayments_rows
    ALTER COLUMN id SET DEFAULT nextval('public.prepayments_rows_id_seq'::regclass);
ALTER TABLE ONLY public.prepayments_signatures
    ALTER COLUMN id SET DEFAULT nextval('public.prepayments_signatures_id_seq'::regclass);
ALTER TABLE ONLY public.professions
    ALTER COLUMN id SET DEFAULT nextval('public.professions_id_seq'::regclass);
ALTER TABLE ONLY public.protocol_items
    ALTER COLUMN id SET DEFAULT nextval('public.protocol_items_id_seq'::regclass);
ALTER TABLE ONLY public.protocols
    ALTER COLUMN id SET DEFAULT nextval('public.protocols_id_seq'::regclass);
ALTER TABLE ONLY public.queue_status
    ALTER COLUMN id SET DEFAULT nextval('public.queue_status_id_seq'::regclass);
ALTER TABLE ONLY public.recruits_groups
    ALTER COLUMN id SET DEFAULT nextval('public.recruits_groups_id_seq'::regclass);
ALTER TABLE ONLY public.request_comments
    ALTER COLUMN id SET DEFAULT nextval('public.request_comments_id_seq'::regclass);
ALTER TABLE ONLY public.request_completed
    ALTER COLUMN id SET DEFAULT nextval('public.request_completed_id_seq'::regclass);
ALTER TABLE ONLY public.request_logs
    ALTER COLUMN id SET DEFAULT nextval('public.request_logs_id_seq'::regclass);
ALTER TABLE ONLY public.request_oriented
    ALTER COLUMN id SET DEFAULT nextval('public.request_oriented_id_seq'::regclass);
ALTER TABLE ONLY public.request_recruit
    ALTER COLUMN id SET DEFAULT nextval('public.request_recruit_id_seq'::regclass);
ALTER TABLE ONLY public.requests
    ALTER COLUMN id SET DEFAULT nextval('public.requests_id_seq'::regclass);
ALTER TABLE ONLY public.retentions
    ALTER COLUMN id SET DEFAULT nextval('public.retentions_id_seq'::regclass);
ALTER TABLE ONLY public.salary
    ALTER COLUMN id SET DEFAULT nextval('public.salary_id_seq'::regclass);
ALTER TABLE ONLY public.script_phrases
    ALTER COLUMN id SET DEFAULT nextval('public.script_phrases_id_seq'::regclass);
ALTER TABLE ONLY public.scripts
    ALTER COLUMN id SET DEFAULT nextval('public.scripts_id_seq'::regclass);
ALTER TABLE ONLY public.settings
    ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);
ALTER TABLE ONLY public.shift_time
    ALTER COLUMN id SET DEFAULT nextval('public.shift_time_id_seq'::regclass);
ALTER TABLE ONLY public.slow_log
    ALTER COLUMN id SET DEFAULT nextval('public.slow_log_id_seq'::regclass);
ALTER TABLE ONLY public.sms
    ALTER COLUMN id SET DEFAULT nextval('public.sms_id_seq'::regclass);
ALTER TABLE ONLY public.summary
    ALTER COLUMN id SET DEFAULT nextval('public.summary_id_seq'::regclass);
ALTER TABLE ONLY public.surcharges
    ALTER COLUMN id SET DEFAULT nextval('public.surcharges_id_seq'::regclass);
ALTER TABLE ONLY public.tests
    ALTER COLUMN id SET DEFAULT nextval('public.tests_id_seq'::regclass);
ALTER TABLE ONLY public.timesheet
    ALTER COLUMN id SET DEFAULT nextval('public.timesheet_id_seq'::regclass);
ALTER TABLE ONLY public.timesheet_logs
    ALTER COLUMN id SET DEFAULT nextval('public.timesheet_logs_id_seq'::regclass);
ALTER TABLE ONLY public.timesheet_totals
    ALTER COLUMN id SET DEFAULT nextval('public.timesheet_totals_id_seq'::regclass);
ALTER TABLE ONLY public.timesheet_totals_master
    ALTER COLUMN id SET DEFAULT nextval('public.timesheet_totals_master_id_seq'::regclass);
ALTER TABLE ONLY public.timetable_checks
    ALTER COLUMN id SET DEFAULT nextval('public.timetable_checks_id_seq'::regclass);
ALTER TABLE ONLY public.timetable_comments
    ALTER COLUMN id SET DEFAULT nextval('public.timetable_comments_id_seq'::regclass);
ALTER TABLE ONLY public.timetable_signatures
    ALTER COLUMN id SET DEFAULT nextval('public.timetable_signatures_id_seq'::regclass);
ALTER TABLE ONLY public.unit_contract_contractors
    ALTER COLUMN id SET DEFAULT nextval('public.unit_contract_contractors_id_seq'::regclass);
ALTER TABLE ONLY public.unit_events
    ALTER COLUMN id SET DEFAULT nextval('public.unit_events_id_seq'::regclass);
ALTER TABLE ONLY public.unit_experience
    ALTER COLUMN id SET DEFAULT nextval('public.unit_experience_id_seq'::regclass);
ALTER TABLE ONLY public.unit_payment_cards
    ALTER COLUMN id SET DEFAULT nextval('public.unit_payment_cards_id_seq'::regclass);
ALTER TABLE ONLY public.units_contracts
    ALTER COLUMN id SET DEFAULT nextval('public.units_contracts_id_seq'::regclass);
ALTER TABLE ONLY public.units_delete_requests
    ALTER COLUMN id SET DEFAULT nextval('public.units_delete_requests_id_seq'::regclass);
ALTER TABLE ONLY public.units_document_delete_requests
    ALTER COLUMN id SET DEFAULT nextval('public.units_document_delete_requests_id_seq'::regclass);
ALTER TABLE ONLY public.units_phone_delete_requests
    ALTER COLUMN id SET DEFAULT nextval('public.units_phone_delete_requests_id_seq'::regclass);
ALTER TABLE ONLY public.units_rating
    ALTER COLUMN id SET DEFAULT nextval('public.units_rating_id_seq'::regclass);
ALTER TABLE ONLY public.units_stat
    ALTER COLUMN id SET DEFAULT nextval('public.units_stat_id_seq'::regclass);
ALTER TABLE ONLY public.updates
    ALTER COLUMN id SET DEFAULT nextval('public.updates_id_seq'::regclass);
ALTER TABLE ONLY public.updates_read
    ALTER COLUMN id SET DEFAULT nextval('public.updates_read_id_seq'::regclass);
ALTER TABLE ONLY public.user_hang_request
    ALTER COLUMN id SET DEFAULT nextval('public.user_hang_request_id_seq'::regclass);
ALTER TABLE ONLY public.user_logs
    ALTER COLUMN id SET DEFAULT nextval('public.user_logs_id_seq'::regclass);
ALTER TABLE ONLY public.vacancies
    ALTER COLUMN id SET DEFAULT nextval('public.vacancies_id_seq'::regclass);
ALTER TABLE ONLY public.vacancies_cities_relations
    ALTER COLUMN id SET DEFAULT nextval('public.vacancies_cities_relations_id_seq'::regclass);
ALTER TABLE ONLY public.viber_queue
    ALTER COLUMN id SET DEFAULT nextval('public.viber_queue_id_seq'::regclass);
ALTER TABLE ONLY public.warehouse
    ALTER COLUMN id SET DEFAULT nextval('public.warehouse_id_seq'::regclass);
ALTER TABLE ONLY public.whats_app_chat
    ALTER COLUMN id SET DEFAULT nextval('public.whats_app_chat_id_seq'::regclass);
ALTER TABLE ONLY public.whats_app_queue
    ALTER COLUMN id SET DEFAULT nextval('public.whats_app_queue_id_seq'::regclass);
ALTER TABLE ONLY public.work_date
    ALTER COLUMN id SET DEFAULT nextval('public.work_date_id_seq'::regclass);
ALTER TABLE ONLY public.work_flow
    ALTER COLUMN id SET DEFAULT nextval('public.work_flow_id_seq'::regclass);
ALTER TABLE ONLY public.workshops
    ALTER COLUMN id SET DEFAULT nextval('public.workshops_id_seq'::regclass);
ALTER TABLE ONLY public.dic_lead_status_reasons
    ADD CONSTRAINT dic_lead_status_reasons_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.fias_location_cache
    ADD CONSTRAINT fias_location_cache_pkey PRIMARY KEY (guid);
ALTER TABLE ONLY public.accommodation_periods
    ADD CONSTRAINT idx_171490_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.accommodation_places
    ADD CONSTRAINT idx_171503_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.accommodation_places_month_prices
    ADD CONSTRAINT idx_171515_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.account_transactions
    ADD CONSTRAINT idx_171522_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT idx_171533_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.adv_outcome
    ADD CONSTRAINT idx_171550_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.advance_account
    ADD CONSTRAINT idx_171559_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.api_auth
    ADD CONSTRAINT idx_171571_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.auth
    ADD CONSTRAINT idx_171577_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.call_task
    ADD CONSTRAINT idx_171596_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.call_task_lists
    ADD CONSTRAINT idx_171608_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.calls_count_statistic
    ADD CONSTRAINT idx_171615_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.calls_queue
    ADD CONSTRAINT idx_171621_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.chat_events
    ADD CONSTRAINT idx_171627_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.cities
    ADD CONSTRAINT idx_171636_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.citizenship
    ADD CONSTRAINT idx_171646_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.contracts
    ADD CONSTRAINT idx_171653_primary PRIMARY KEY (user_id);
ALTER TABLE ONLY public.conversions
    ADD CONSTRAINT idx_171662_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.curator_check_lists
    ADD CONSTRAINT idx_171668_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.dic_insurance_companies
    ADD CONSTRAINT idx_171674_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.dic_languages
    ADD CONSTRAINT idx_171683_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.documents
    ADD CONSTRAINT idx_171698_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.documents_logs
    ADD CONSTRAINT idx_171707_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.documents_types
    ADD CONSTRAINT idx_171718_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.email
    ADD CONSTRAINT idx_171727_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.error_logs
    ADD CONSTRAINT idx_171740_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.errors_1s
    ADD CONSTRAINT idx_171749_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.ev_comments
    ADD CONSTRAINT idx_171759_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.ev_units
    ADD CONSTRAINT idx_171786_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.ev_users
    ADD CONSTRAINT idx_171815_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.factories
    ADD CONSTRAINT idx_171837_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.factory_today_state
    ADD CONSTRAINT idx_171864_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT idx_171877_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.feedback_comment
    ADD CONSTRAINT idx_171886_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.files
    ADD CONSTRAINT idx_171899_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.fines
    ADD CONSTRAINT idx_171917_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.insurance
    ADD CONSTRAINT idx_171943_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.keeper_value_changes
    ADD CONSTRAINT idx_171951_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.knowledge_article
    ADD CONSTRAINT idx_171961_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.knowledge_article_relation
    ADD CONSTRAINT idx_171970_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.knowledge_section
    ADD CONSTRAINT idx_171977_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.knowledge_section_availability
    ADD CONSTRAINT idx_171986_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.knowledge_section_relation
    ADD CONSTRAINT idx_171992_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.languages
    ADD CONSTRAINT idx_171998_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.lead_service_relations
    ADD CONSTRAINT idx_172002_primary PRIMARY KEY (lead_id);
ALTER TABLE ONLY public.leads
    ADD CONSTRAINT idx_172007_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.logs_auth
    ADD CONSTRAINT idx_172023_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.mailing_templates
    ADD CONSTRAINT idx_172038_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.mailings
    ADD CONSTRAINT idx_172049_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.master_units_delay
    ADD CONSTRAINT idx_172064_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT idx_172070_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.no_request_completion
    ADD CONSTRAINT idx_172079_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.notification
    ADD CONSTRAINT idx_172085_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.officials
    ADD CONSTRAINT idx_172096_primary PRIMARY KEY (factory_id, user_id);
ALTER TABLE ONLY public.oriented_stat
    ADD CONSTRAINT idx_172111_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.outgoing_1s_queue
    ADD CONSTRAINT idx_172119_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.overall_without_deduction
    ADD CONSTRAINT idx_172129_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.overalls
    ADD CONSTRAINT idx_172135_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.overalls_list
    ADD CONSTRAINT idx_172147_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.overalls_requests
    ADD CONSTRAINT idx_172156_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.overalls_requests_logs
    ADD CONSTRAINT idx_172166_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.overalls_requests_rows
    ADD CONSTRAINT idx_172177_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.personal_documents
    ADD CONSTRAINT idx_172186_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.phones
    ADD CONSTRAINT idx_172198_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.plan
    ADD CONSTRAINT idx_172205_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.plan_completion
    ADD CONSTRAINT idx_172213_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.plan_orientation
    ADD CONSTRAINT idx_172219_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.plan_recruit
    ADD CONSTRAINT idx_172225_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.plan_statistic
    ADD CONSTRAINT idx_172231_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.prepayments
    ADD CONSTRAINT idx_172237_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.prepayments_change_requests
    ADD CONSTRAINT idx_172244_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.prepayments_comments
    ADD CONSTRAINT idx_172254_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.prepayments_logs
    ADD CONSTRAINT idx_172265_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.prepayments_rows
    ADD CONSTRAINT idx_172276_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.prepayments_signatures
    ADD CONSTRAINT idx_172282_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.professions
    ADD CONSTRAINT idx_172290_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.protocol_items
    ADD CONSTRAINT idx_172302_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.protocols
    ADD CONSTRAINT idx_172308_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.recruits_groups
    ADD CONSTRAINT idx_172333_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.request_comments
    ADD CONSTRAINT idx_172348_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.request_completed
    ADD CONSTRAINT idx_172358_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.request_logs
    ADD CONSTRAINT idx_172364_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.request_oriented
    ADD CONSTRAINT idx_172375_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.request_recruit
    ADD CONSTRAINT idx_172381_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.requests
    ADD CONSTRAINT idx_172390_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.retentions
    ADD CONSTRAINT idx_172416_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.salary
    ADD CONSTRAINT idx_172422_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.script_phrases
    ADD CONSTRAINT idx_172428_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.scripts
    ADD CONSTRAINT idx_172438_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.self_employed
    ADD CONSTRAINT idx_172448_primary PRIMARY KEY (unit_id);
ALTER TABLE ONLY public.settings
    ADD CONSTRAINT idx_172454_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.shift_time
    ADD CONSTRAINT idx_172463_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.slow_log
    ADD CONSTRAINT idx_172469_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.sms
    ADD CONSTRAINT idx_172478_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.spp_cache
    ADD CONSTRAINT idx_172486_primary PRIMARY KEY (unit_id);
ALTER TABLE ONLY public.dic_subways
    ADD CONSTRAINT idx_172500_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.summary
    ADD CONSTRAINT idx_172508_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.surcharges
    ADD CONSTRAINT idx_172519_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.tests
    ADD CONSTRAINT idx_172530_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.timesheet
    ADD CONSTRAINT idx_172541_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.timesheet_logs
    ADD CONSTRAINT idx_172548_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.timesheet_totals
    ADD CONSTRAINT idx_172559_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.timesheet_totals_master
    ADD CONSTRAINT idx_172568_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.timetable_checks
    ADD CONSTRAINT idx_172575_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.timetable_comments
    ADD CONSTRAINT idx_172586_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.timetable_signatures
    ADD CONSTRAINT idx_172596_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.unit_contract_contractors
    ADD CONSTRAINT idx_172604_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.unit_events
    ADD CONSTRAINT idx_172619_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.unit_experience
    ADD CONSTRAINT idx_172628_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.unit_payment_cards
    ADD CONSTRAINT idx_172639_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.units_contracts
    ADD CONSTRAINT idx_172648_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.units_delete_requests
    ADD CONSTRAINT idx_172661_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.units_document_delete_requests
    ADD CONSTRAINT idx_172670_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.units_phone_delete_requests
    ADD CONSTRAINT idx_172695_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.units_rating
    ADD CONSTRAINT idx_172704_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.units_stat
    ADD CONSTRAINT idx_172711_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.updates
    ADD CONSTRAINT idx_172720_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.updates_read
    ADD CONSTRAINT idx_172729_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.user_hang_request
    ADD CONSTRAINT idx_172741_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT idx_172763_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.vacancies_cities_relations
    ADD CONSTRAINT idx_172779_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.viber_queue
    ADD CONSTRAINT idx_172788_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT idx_172798_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.whats_app_chat
    ADD CONSTRAINT idx_172805_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.whats_app_queue
    ADD CONSTRAINT idx_172816_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.work_date
    ADD CONSTRAINT idx_172827_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.work_flow
    ADD CONSTRAINT idx_172842_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.workshops
    ADD CONSTRAINT idx_172848_primary PRIMARY KEY (id);
ALTER TABLE ONLY public.lead_processing_statistic
    ADD CONSTRAINT lead_processing_statistic_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.proxies
    ADD CONSTRAINT proxies_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.proxy_relations
    ADD CONSTRAINT proxy_relations_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.referral_relations
    ADD CONSTRAINT referral_relations_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.referral_relations_requests_comments
    ADD CONSTRAINT referral_relations_requests_comments_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.referral_relations_requests_logs
    ADD CONSTRAINT referral_relations_requests_logs_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.referral_relations_requests
    ADD CONSTRAINT referral_relations_requests_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.referral_relations_requests_row
    ADD CONSTRAINT referral_relations_requests_row_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.requests_periods
    ADD CONSTRAINT requests_periods_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.telphin_instances
    ADD CONSTRAINT telphin_instances_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.timetable_cache
    ADD CONSTRAINT timetable_cache_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.units_segments
    ADD CONSTRAINT units_segments_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.user_calendar_settings
    ADD CONSTRAINT user_calendar_settings_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.user_event_unit_relations
    ADD CONSTRAINT user_event_unit_relations_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.user_events
    ADD CONSTRAINT user_events_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.users_sips
    ADD CONSTRAINT users_sips_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.whats_app_settings
    ADD CONSTRAINT whats_app_settings_pkey PRIMARY KEY (id);
CREATE INDEX idx_171587_call_statistic_from_id_index ON public.call_statistic USING btree (from_id);
CREATE INDEX idx_171587_call_statistic_to_id_index ON public.call_statistic USING btree (to_id);
CREATE UNIQUE INDEX idx_171662_year ON public.conversions USING btree (year, month, feedback_id);
CREATE INDEX idx_171759_unit_id ON public.ev_comments USING btree (id);
CREATE INDEX idx_171759_unit_user_ids ON public.ev_comments USING btree (unit_id, user_id);
CREATE UNIQUE INDEX idx_171767_group_name ON public.ev_feedback_groups USING btree (group_name, feedback);
CREATE INDEX idx_171775_ev_logs_unit_id_index ON public.ev_logs USING btree (unit_id);
CREATE INDEX idx_171786_call_date ON public.ev_units USING btree (call_date);
CREATE INDEX idx_171786_dds ON public.ev_units USING btree (deleted, draft, status);
CREATE INDEX idx_171786_ddwcs ON public.ev_units USING btree (deleted, draft, work_by);
CREATE INDEX idx_171786_dnd ON public.ev_units USING btree (draft, deleted);
CREATE INDEX idx_171786_ev_units_rate_index ON public.ev_units USING btree (rate);
CREATE INDEX idx_171786_ev_units_release_days_index ON public.ev_units USING btree (release_days);
CREATE INDEX idx_171786_fio ON public.ev_units USING gin (to_tsvector('simple'::regconfig, (fio)::text));
CREATE INDEX idx_171807_ev_units_meta_key_index ON public.ev_units_meta USING btree (key);
CREATE INDEX idx_171815_ev_users_role_id_index ON public.ev_users USING btree (role_id);
CREATE UNIQUE INDEX idx_171815_login ON public.ev_users USING btree (login);
CREATE UNIQUE INDEX idx_171837_name ON public.factories USING btree (name);
CREATE INDEX idx_171848_factory_id ON public.factories_rates_relations USING btree (factory_id, profession_id, class);
CREATE UNIQUE INDEX idx_171859_key ON public.factory_meta USING btree (key, factory_id);
CREATE INDEX idx_171899_files_deleted_index ON public.files USING btree (deleted);
CREATE INDEX idx_171899_files_type_id_index ON public.files USING btree (type_id);
CREATE INDEX idx_171911_files_relations_file_id_index ON public.files_relations USING btree (file_id);
CREATE INDEX idx_171911_files_relations_type_id_index ON public.files_relations USING btree (type_id);
CREATE INDEX idx_171911_files_relations_unit_id_index ON public.files_relations USING btree (unit_id);
CREATE INDEX idx_171925_group_factory_relations_factory_id_index ON public.group_factory_relations USING btree (factory_id);
CREATE INDEX idx_171925_group_factory_relations_group_id_index ON public.group_factory_relations USING btree (group_id);
CREATE INDEX idx_172002_lead_service_relations_external_id_index ON public.lead_service_relations USING btree (external_id);
CREATE INDEX idx_172085_notification_global_index ON public.notification USING btree (global);
CREATE INDEX idx_172085_notification_read_at_user_id_global_important_index ON public.notification USING btree (read_at, user_id, global, important);
CREATE INDEX idx_172085_notification_user_id_factory_id_index ON public.notification USING btree (user_id, factory_id);
CREATE INDEX idx_172085_notification_user_id_important_read_at_index ON public.notification USING btree (user_id, important, read_at);
CREATE INDEX idx_172085_user_read ON public.notification USING btree (user_id, read_at);
CREATE INDEX idx_172105_online_stat_created_at_index ON public.online_stat USING btree (created_at);
CREATE INDEX idx_172111_unit_id ON public.oriented_stat USING btree (unit_id);
CREATE INDEX idx_172193_object_id ON public.phone_relations USING btree (object_id);
CREATE INDEX idx_172193_object_type ON public.phone_relations USING btree (object_type);
CREATE UNIQUE INDEX idx_172193_phone_id ON public.phone_relations USING btree (phone_id, object_type);
CREATE UNIQUE INDEX idx_172198_phone ON public.phones USING btree (phone);
CREATE UNIQUE INDEX idx_172231_request ON public.plan_statistic USING btree (factory_id, profession_id, class, date);
CREATE INDEX idx_172254_unit_id ON public.prepayments_comments USING btree (id);
CREATE INDEX idx_172254_unit_user_ids ON public.prepayments_comments USING btree (prepayment_id, user_id);
CREATE INDEX idx_172324_queue_status_time_index ON public.queue_status USING btree ("time");
CREATE INDEX idx_172348_unit_id ON public.request_comments USING btree (id);
CREATE INDEX idx_172348_unit_user_ids ON public.request_comments USING btree (request_id, user_id);
CREATE INDEX idx_172422_salary_unit_id_factory_id_date_index ON public.salary USING btree (unit_id, factory_id, date);
CREATE INDEX idx_172442_content ON public.search_index USING gin (to_tsvector('simple'::regconfig, content));
CREATE UNIQUE INDEX idx_172442_unit_id ON public.search_index USING btree (unit_id);
CREATE UNIQUE INDEX idx_172454_settings_key_uindex ON public.settings USING btree (key);
CREATE INDEX idx_172478_sms_send_id_index ON public.sms USING btree (send_id);
CREATE INDEX idx_172478_whats_app_queue_send_at_index ON public.sms USING btree (send_at);
CREATE INDEX idx_172486_spp_cache_unit_id_index ON public.spp_cache USING btree (unit_id);
CREATE INDEX idx_172492_spp_cache_extension_factory_id_index ON public.spp_cache_extension USING btree (factory_id);
CREATE INDEX idx_172492_spp_cache_extension_profession_id_index ON public.spp_cache_extension USING btree (profession_id);
CREATE INDEX idx_172492_spp_cache_extension_unit_id_index ON public.spp_cache_extension USING btree (unit_id);
CREATE UNIQUE INDEX idx_172541_date ON public.timesheet USING btree (date, unit_id);
CREATE INDEX idx_172541_timesheet_factory_id_index ON public.timesheet USING btree (factory_id);
CREATE INDEX idx_172541_timesheet_state_index ON public.timesheet USING btree (state);
CREATE INDEX idx_172575_timetable_checks_factory_id_date_index ON public.timetable_checks USING btree (factory_id, date);
CREATE INDEX "idx_172628_pro-class" ON public.unit_experience USING btree (profession_id, class);
CREATE INDEX idx_172628_unit_id ON public.unit_experience USING btree (unit_id);
CREATE INDEX idx_172648_units_contracts_from_index ON public.units_contracts USING btree ("from");
CREATE INDEX idx_172648_units_contracts_to_index ON public.units_contracts USING btree ("to");
CREATE INDEX idx_172648_units_contracts_unit_id_index ON public.units_contracts USING btree (unit_id);
CREATE UNIQUE INDEX idx_172733_user_client_curator_relations_client_curator_id_uind ON public.user_client_curator_relations USING btree (client_curator_id);
CREATE INDEX idx_172736_user_factory_relation_factory_id_index ON public.user_factory_relation USING btree (factory_id);
CREATE INDEX idx_172736_user_factory_relation_user_id_index ON public.user_factory_relation USING btree (user_id);
CREATE UNIQUE INDEX idx_172741_user_id ON public.user_hang_request USING btree (user_id, request_id);
CREATE UNIQUE INDEX idx_172758_user_event ON public.user_unit_events_relations USING btree (user_id, event_id);
CREATE INDEX idx_172805_whats_app_chat_from_me_index ON public.whats_app_chat USING btree (from_me);
CREATE INDEX idx_172805_whats_app_chat_object_id_object_type_index ON public.whats_app_chat USING btree (object_id, object_type);
CREATE INDEX idx_172816_whats_app_queue_send_at_index ON public.whats_app_queue USING btree (send_at);
CREATE INDEX idx_172827_is_current ON public.work_date USING btree (is_current);
CREATE INDEX idx_172827_work_date_applied_at_index ON public.work_date USING btree (applied_at);
CREATE INDEX idx_172827_work_date_factory_id_unit_id_index ON public.work_date USING btree (unit_id, factory_id);
CREATE INDEX idx_172827_work_date_fired_at_index ON public.work_date USING btree (fired_at);
CREATE INDEX idx_172827_work_date_unit_id_index ON public.work_date USING btree (unit_id);
CREATE INDEX idx_172848_workshops_work_date_id_index ON public.workshops USING btree (work_date_id);
