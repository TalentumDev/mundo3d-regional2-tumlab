--
-- PostgreSQL database dump
--

-- Dumped from database version 13.13
-- Dumped by pg_dump version 13.9 (Debian 13.9-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO "keycloak-regional-fase2";

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO "keycloak-regional-fase2";

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO "keycloak-regional-fase2";

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO "keycloak-regional-fase2";

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO "keycloak-regional-fase2";

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO "keycloak-regional-fase2";

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO "keycloak-regional-fase2";

--
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO "keycloak-regional-fase2";

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO "keycloak-regional-fase2";

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO "keycloak-regional-fase2";

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO "keycloak-regional-fase2";

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO "keycloak-regional-fase2";

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO "keycloak-regional-fase2";

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO "keycloak-regional-fase2";

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO "keycloak-regional-fase2";

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO "keycloak-regional-fase2";

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO "keycloak-regional-fase2";

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO "keycloak-regional-fase2";

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO "keycloak-regional-fase2";

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO "keycloak-regional-fase2";

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO "keycloak-regional-fase2";

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO "keycloak-regional-fase2";

--
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO "keycloak-regional-fase2";

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO "keycloak-regional-fase2";

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO "keycloak-regional-fase2";

--
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO "keycloak-regional-fase2";

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO "keycloak-regional-fase2";

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO "keycloak-regional-fase2";

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO "keycloak-regional-fase2";

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO "keycloak-regional-fase2";

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO "keycloak-regional-fase2";

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO "keycloak-regional-fase2";

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO "keycloak-regional-fase2";

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO "keycloak-regional-fase2";

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO "keycloak-regional-fase2";

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO "keycloak-regional-fase2";

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO "keycloak-regional-fase2";

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO "keycloak-regional-fase2";

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO "keycloak-regional-fase2";

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO "keycloak-regional-fase2";

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO "keycloak-regional-fase2";

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO "keycloak-regional-fase2";

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO "keycloak-regional-fase2";

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO "keycloak-regional-fase2";

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO "keycloak-regional-fase2";

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO "keycloak-regional-fase2";

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO "keycloak-regional-fase2";

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO "keycloak-regional-fase2";

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO "keycloak-regional-fase2";

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO "keycloak-regional-fase2";

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO "keycloak-regional-fase2";

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO "keycloak-regional-fase2";

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO "keycloak-regional-fase2";

--
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO "keycloak-regional-fase2";

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO "keycloak-regional-fase2";

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO "keycloak-regional-fase2";

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO "keycloak-regional-fase2";

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO "keycloak-regional-fase2";

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO "keycloak-regional-fase2";

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO "keycloak-regional-fase2";

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO "keycloak-regional-fase2";

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO "keycloak-regional-fase2";

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO "keycloak-regional-fase2";

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO "keycloak-regional-fase2";

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO "keycloak-regional-fase2";

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO "keycloak-regional-fase2";

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO "keycloak-regional-fase2";

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO "keycloak-regional-fase2";

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO "keycloak-regional-fase2";

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO "keycloak-regional-fase2";

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO "keycloak-regional-fase2";

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO "keycloak-regional-fase2";

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO "keycloak-regional-fase2";

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO "keycloak-regional-fase2";

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO "keycloak-regional-fase2";

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO "keycloak-regional-fase2";

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO "keycloak-regional-fase2";

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO "keycloak-regional-fase2";

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO "keycloak-regional-fase2";

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO "keycloak-regional-fase2";

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO "keycloak-regional-fase2";

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO "keycloak-regional-fase2";

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO "keycloak-regional-fase2";

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO "keycloak-regional-fase2";

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO "keycloak-regional-fase2";

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO "keycloak-regional-fase2";

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO "keycloak-regional-fase2";

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO "keycloak-regional-fase2";

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO "keycloak-regional-fase2";

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO "keycloak-regional-fase2";

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO "keycloak-regional-fase2";

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak-regional-fase2
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO "keycloak-regional-fase2";

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
8f6b0c86-8477-48b7-80cf-66051ba15021	\N	auth-cookie	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	7ecfff58-a414-45d9-b10b-746ca070e548	2	10	f	\N	\N
b7ac358f-f372-4782-a90a-9ba0a4082ea5	\N	auth-spnego	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	7ecfff58-a414-45d9-b10b-746ca070e548	3	20	f	\N	\N
6e79aaba-5669-48e6-8446-a3896f364515	\N	identity-provider-redirector	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	7ecfff58-a414-45d9-b10b-746ca070e548	2	25	f	\N	\N
d1c69dae-ec18-4c3e-ae89-2ad5ade0d051	\N	\N	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	7ecfff58-a414-45d9-b10b-746ca070e548	2	30	t	1d7e5e8b-50a5-454f-a90f-71a0460f066f	\N
ceae5dd2-d745-4b0e-963f-29588e060ada	\N	auth-username-password-form	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1d7e5e8b-50a5-454f-a90f-71a0460f066f	0	10	f	\N	\N
67e45abf-d306-4d3d-9479-a0674af7f8e4	\N	\N	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1d7e5e8b-50a5-454f-a90f-71a0460f066f	1	20	t	53d8814f-be27-416a-9fb7-ac4a00836f0b	\N
0c12adf8-db50-44ee-8be0-55f5865d533e	\N	conditional-user-configured	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	53d8814f-be27-416a-9fb7-ac4a00836f0b	0	10	f	\N	\N
576f4c9f-c49c-4dfa-be5e-842e2821c8bc	\N	auth-otp-form	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	53d8814f-be27-416a-9fb7-ac4a00836f0b	0	20	f	\N	\N
dd124219-769c-415c-a09f-1e2f59d7f4dc	\N	direct-grant-validate-username	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	308fa2df-c0d4-429a-9ace-03ff1e1433dd	0	10	f	\N	\N
b26d966b-bbed-4120-a4cc-5919c6732df7	\N	direct-grant-validate-password	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	308fa2df-c0d4-429a-9ace-03ff1e1433dd	0	20	f	\N	\N
e8fd3fbc-e4d3-4a3d-b2c2-4f913e5ff825	\N	\N	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	308fa2df-c0d4-429a-9ace-03ff1e1433dd	1	30	t	0114eadd-70f9-4678-b40a-5d5191f87c97	\N
3779e59d-ffaf-4952-9dc6-87f5c171100f	\N	conditional-user-configured	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	0114eadd-70f9-4678-b40a-5d5191f87c97	0	10	f	\N	\N
dd10638f-b778-4d09-abda-83eb861a1a58	\N	direct-grant-validate-otp	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	0114eadd-70f9-4678-b40a-5d5191f87c97	0	20	f	\N	\N
e34bcc15-1a73-4579-9acd-da8baa260f62	\N	registration-page-form	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	d1fc3a79-6ae7-4ba5-9484-78c861ce0602	0	10	t	9f9d15cc-929f-499a-90f7-7576fe6019cc	\N
b1015d22-1bea-4535-b774-4114aa025b5e	\N	registration-user-creation	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	9f9d15cc-929f-499a-90f7-7576fe6019cc	0	20	f	\N	\N
23b1b841-8be7-4af7-bbd0-92b44ed2c4f7	\N	registration-profile-action	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	9f9d15cc-929f-499a-90f7-7576fe6019cc	0	40	f	\N	\N
14df1686-aeea-4d6e-add7-45971f909872	\N	registration-password-action	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	9f9d15cc-929f-499a-90f7-7576fe6019cc	0	50	f	\N	\N
d36a445e-4155-4548-be09-b700e09cd115	\N	registration-recaptcha-action	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	9f9d15cc-929f-499a-90f7-7576fe6019cc	3	60	f	\N	\N
c56c4479-aac4-4307-b017-8f3cbbe8867a	\N	reset-credentials-choose-user	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ed997573-5c27-43fc-9a28-785286cadfc4	0	10	f	\N	\N
8521cdd9-0f58-4b8a-af0d-4bc45d49576d	\N	reset-credential-email	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ed997573-5c27-43fc-9a28-785286cadfc4	0	20	f	\N	\N
f05010b5-e27c-4e12-a991-5dfc8eb4dcaa	\N	reset-password	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ed997573-5c27-43fc-9a28-785286cadfc4	0	30	f	\N	\N
25489d22-b271-4fd8-a914-729a65711f18	\N	\N	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ed997573-5c27-43fc-9a28-785286cadfc4	1	40	t	df1f491a-cc91-42dd-bf23-baba96249f66	\N
fcf29733-7e61-480e-8bc4-e8154ecd1c10	\N	conditional-user-configured	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	df1f491a-cc91-42dd-bf23-baba96249f66	0	10	f	\N	\N
11858518-6da0-459b-9b4e-6514a833dd59	\N	reset-otp	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	df1f491a-cc91-42dd-bf23-baba96249f66	0	20	f	\N	\N
ffcfabd1-faa3-426c-baec-0c54c11fc484	\N	client-secret	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	c623c6b8-5650-4d82-911b-19bc6ccf1547	2	10	f	\N	\N
e269d17a-ca69-4c8c-94aa-7576108c6514	\N	client-jwt	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	c623c6b8-5650-4d82-911b-19bc6ccf1547	2	20	f	\N	\N
fd5174f9-2c5f-4796-87fd-570b38d484e5	\N	client-secret-jwt	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	c623c6b8-5650-4d82-911b-19bc6ccf1547	2	30	f	\N	\N
bf651150-e891-406c-b5a1-7b68d261e46f	\N	client-x509	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	c623c6b8-5650-4d82-911b-19bc6ccf1547	2	40	f	\N	\N
ab63dc43-984f-4ad3-b516-ca343bf53df7	\N	idp-review-profile	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	2caced54-fd77-421f-8a70-93a44b4e7bc7	0	10	f	\N	66a0152b-ba0d-47b7-be49-163415d4c8f9
e6743a54-e3e2-4116-b78a-69abb808beb5	\N	\N	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	2caced54-fd77-421f-8a70-93a44b4e7bc7	0	20	t	dd363eb8-31f9-42e4-89f3-9664470b7c34	\N
a2202cb0-d21c-43ce-8e9c-91ab5eb575f0	\N	idp-create-user-if-unique	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	dd363eb8-31f9-42e4-89f3-9664470b7c34	2	10	f	\N	aa3485c8-1264-44a7-8e56-753c9f5ab1f3
ab70e49b-1ab7-4629-8a1c-0675f2a932ed	\N	\N	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	dd363eb8-31f9-42e4-89f3-9664470b7c34	2	20	t	14da3c37-1666-4cae-b801-3b6766875c8f	\N
ad9bc659-ebaf-4ad8-8e96-7f7ee737cb88	\N	idp-confirm-link	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	14da3c37-1666-4cae-b801-3b6766875c8f	0	10	f	\N	\N
6478f932-c28f-4946-91ba-d3cb4002fde6	\N	\N	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	14da3c37-1666-4cae-b801-3b6766875c8f	0	20	t	6be84243-87d6-4db0-9d1c-6fb8bbdda29c	\N
5865d363-26b3-4007-a4d7-b7c2c1dc4f65	\N	idp-email-verification	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	6be84243-87d6-4db0-9d1c-6fb8bbdda29c	2	10	f	\N	\N
3fdeefc6-f332-4025-af97-01a5c87657f1	\N	\N	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	6be84243-87d6-4db0-9d1c-6fb8bbdda29c	2	20	t	e0fe0423-b06e-4370-b496-a0d2648e619f	\N
d0858bbb-47b4-4936-91dc-dc1534e7df7b	\N	idp-username-password-form	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	e0fe0423-b06e-4370-b496-a0d2648e619f	0	10	f	\N	\N
65b1044b-ef28-4762-a810-920aeeeb3836	\N	\N	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	e0fe0423-b06e-4370-b496-a0d2648e619f	1	20	t	16673d49-199e-4833-8428-ab2cd3500b0e	\N
b9387e13-eba1-4d44-a4b1-f5ee7bee65f7	\N	conditional-user-configured	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	16673d49-199e-4833-8428-ab2cd3500b0e	0	10	f	\N	\N
07f0ee7c-ba0d-4aac-9efc-d39fc72e45d6	\N	auth-otp-form	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	16673d49-199e-4833-8428-ab2cd3500b0e	0	20	f	\N	\N
22457edf-825f-4ebd-b650-650e98773b49	\N	http-basic-authenticator	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	021d34fc-5203-479a-b219-e73a9e0997f7	0	10	f	\N	\N
ae7b11ce-90d8-4191-b39a-0f59f33310c2	\N	docker-http-basic-authenticator	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	38b782c8-cc7a-4f31-9c34-36041d7839b4	0	10	f	\N	\N
cb0cea8c-9e28-4d77-bd7b-c9a73a36ebb0	\N	no-cookie-redirect	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	928e4bde-16c6-4864-a050-8981a1101d0f	0	10	f	\N	\N
769d3ca6-7765-4918-b3ce-218d16d1eda0	\N	\N	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	928e4bde-16c6-4864-a050-8981a1101d0f	0	20	t	5e41244a-a40e-42d9-b475-061a2f747d72	\N
f3002a9c-9d0c-43ea-aaaf-303a3b6aae4d	\N	basic-auth	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	5e41244a-a40e-42d9-b475-061a2f747d72	0	10	f	\N	\N
96c8c0d1-9591-4505-80a6-7434274cf650	\N	basic-auth-otp	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	5e41244a-a40e-42d9-b475-061a2f747d72	3	20	f	\N	\N
d4d6d819-2582-4ac3-be14-9b648b0f66f9	\N	auth-spnego	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	5e41244a-a40e-42d9-b475-061a2f747d72	3	30	f	\N	\N
78bb29d7-1f5c-493e-88e8-c4791148cc3e	\N	idp-email-verification	7285fde1-76e9-40f3-9950-b53009f25138	ed892b96-d623-4091-9a2f-7af353e8ca0f	2	10	f	\N	\N
b0736b8f-808a-442d-b980-07f9c29533c4	\N	\N	7285fde1-76e9-40f3-9950-b53009f25138	ed892b96-d623-4091-9a2f-7af353e8ca0f	2	20	t	d3e88154-3152-465c-9e20-5f99eccc1ff5	\N
3a116ddd-b5cf-40b6-81c0-a7a4bd6afde3	\N	basic-auth	7285fde1-76e9-40f3-9950-b53009f25138	3f59f3f3-3854-4602-bdeb-37be235c93f4	0	10	f	\N	\N
09eca421-2146-45a4-b4be-db21c305d42c	\N	basic-auth-otp	7285fde1-76e9-40f3-9950-b53009f25138	3f59f3f3-3854-4602-bdeb-37be235c93f4	3	20	f	\N	\N
d92ff936-bc87-4f27-9e73-13d26c78acda	\N	auth-spnego	7285fde1-76e9-40f3-9950-b53009f25138	3f59f3f3-3854-4602-bdeb-37be235c93f4	3	30	f	\N	\N
2aaf0b97-3954-4579-b5a4-7271b14574d8	\N	conditional-user-configured	7285fde1-76e9-40f3-9950-b53009f25138	c32a34f1-521d-4113-b3d9-8ab1c05319aa	0	10	f	\N	\N
9dd5dcda-5450-4405-9313-c1c2ca692009	\N	auth-otp-form	7285fde1-76e9-40f3-9950-b53009f25138	c32a34f1-521d-4113-b3d9-8ab1c05319aa	0	20	f	\N	\N
33968849-d889-46d2-b6d0-bb9055ed84e3	\N	conditional-user-configured	7285fde1-76e9-40f3-9950-b53009f25138	cb1f3d85-3b76-4a11-b1a1-5542e82db660	0	10	f	\N	\N
b9d3d696-c7ea-4f0a-8039-ead75bf0c0d5	\N	direct-grant-validate-otp	7285fde1-76e9-40f3-9950-b53009f25138	cb1f3d85-3b76-4a11-b1a1-5542e82db660	0	20	f	\N	\N
1a9130a6-40eb-4555-abbb-4a8bba113799	\N	conditional-user-configured	7285fde1-76e9-40f3-9950-b53009f25138	b87d8e98-6aed-4e7e-9209-8e6f86dc17c6	0	10	f	\N	\N
9981f77e-fe3c-4451-845a-6c1a892b5d9f	\N	auth-otp-form	7285fde1-76e9-40f3-9950-b53009f25138	b87d8e98-6aed-4e7e-9209-8e6f86dc17c6	0	20	f	\N	\N
dcae1547-01ac-49ae-aa09-1d1db74e206f	\N	idp-confirm-link	7285fde1-76e9-40f3-9950-b53009f25138	bf738ead-9e87-4886-987a-56ee8b36a738	0	10	f	\N	\N
c5ae3210-8cf1-42d0-888d-48814aed24a6	\N	\N	7285fde1-76e9-40f3-9950-b53009f25138	bf738ead-9e87-4886-987a-56ee8b36a738	0	20	t	ed892b96-d623-4091-9a2f-7af353e8ca0f	\N
fea3af67-2c94-4dc0-a2f8-edbb7f7443fc	\N	conditional-user-configured	7285fde1-76e9-40f3-9950-b53009f25138	796d6dcb-d8a2-42f4-98d8-25ff778e7418	0	10	f	\N	\N
6e853a8f-cc75-4161-83c8-29f0ce24b23e	\N	reset-otp	7285fde1-76e9-40f3-9950-b53009f25138	796d6dcb-d8a2-42f4-98d8-25ff778e7418	0	20	f	\N	\N
fb02b3b5-5746-4b2a-bcb1-7f59c8cba3d1	\N	idp-create-user-if-unique	7285fde1-76e9-40f3-9950-b53009f25138	26749d09-1d31-4788-934b-716bf81a9fa9	2	10	f	\N	171f1df7-b386-4cc1-bf33-2b334c36444e
ce77c508-8332-4995-8c46-43cfadd4d3da	\N	\N	7285fde1-76e9-40f3-9950-b53009f25138	26749d09-1d31-4788-934b-716bf81a9fa9	2	20	t	bf738ead-9e87-4886-987a-56ee8b36a738	\N
69ea6a40-d574-4fcd-83c1-790256e38157	\N	idp-username-password-form	7285fde1-76e9-40f3-9950-b53009f25138	d3e88154-3152-465c-9e20-5f99eccc1ff5	0	10	f	\N	\N
9b7c7770-ca34-423d-b20a-95076561d468	\N	\N	7285fde1-76e9-40f3-9950-b53009f25138	d3e88154-3152-465c-9e20-5f99eccc1ff5	1	20	t	b87d8e98-6aed-4e7e-9209-8e6f86dc17c6	\N
8bf8ea5a-1417-41de-bf17-ba8c0ed33e45	\N	auth-cookie	7285fde1-76e9-40f3-9950-b53009f25138	557c53fd-8517-4ff9-b34d-80c060d18dcf	2	10	f	\N	\N
e2096263-b3a3-45db-86ab-0f507c8a944d	\N	auth-spnego	7285fde1-76e9-40f3-9950-b53009f25138	557c53fd-8517-4ff9-b34d-80c060d18dcf	3	20	f	\N	\N
dae6b198-8875-454a-a6af-da930ff7aaf2	\N	identity-provider-redirector	7285fde1-76e9-40f3-9950-b53009f25138	557c53fd-8517-4ff9-b34d-80c060d18dcf	2	25	f	\N	\N
d3e1772c-d409-4127-9041-718541c705da	\N	\N	7285fde1-76e9-40f3-9950-b53009f25138	557c53fd-8517-4ff9-b34d-80c060d18dcf	2	30	t	357276ce-bee9-4c32-b9a2-25655a1bd048	\N
c5f1a11a-5173-441b-a358-af43455612f0	\N	client-secret	7285fde1-76e9-40f3-9950-b53009f25138	b8c0a29c-1d35-4b21-afd7-59f35e79916a	2	10	f	\N	\N
d7b4da9b-8a7b-4a7b-b1a4-593247e40e39	\N	client-jwt	7285fde1-76e9-40f3-9950-b53009f25138	b8c0a29c-1d35-4b21-afd7-59f35e79916a	2	20	f	\N	\N
b9489bad-3bb1-4c87-9f04-bf5f4ad127d3	\N	client-secret-jwt	7285fde1-76e9-40f3-9950-b53009f25138	b8c0a29c-1d35-4b21-afd7-59f35e79916a	2	30	f	\N	\N
31dbf18e-e8c5-4d4a-8fc0-a7e04a8646d6	\N	client-x509	7285fde1-76e9-40f3-9950-b53009f25138	b8c0a29c-1d35-4b21-afd7-59f35e79916a	2	40	f	\N	\N
1f9ecfd4-1844-4505-8304-5bd35ea59a76	\N	direct-grant-validate-username	7285fde1-76e9-40f3-9950-b53009f25138	bce0e814-decf-46b2-8bd7-f97d2c7dd7ad	0	10	f	\N	\N
81804adc-7537-4f47-a1d3-f8753964f934	\N	direct-grant-validate-password	7285fde1-76e9-40f3-9950-b53009f25138	bce0e814-decf-46b2-8bd7-f97d2c7dd7ad	0	20	f	\N	\N
73ab73c4-3a03-4c90-b62d-05b7d219ac4f	\N	\N	7285fde1-76e9-40f3-9950-b53009f25138	bce0e814-decf-46b2-8bd7-f97d2c7dd7ad	1	30	t	cb1f3d85-3b76-4a11-b1a1-5542e82db660	\N
39725257-398e-4a61-917f-a5faecbee459	\N	docker-http-basic-authenticator	7285fde1-76e9-40f3-9950-b53009f25138	49fb7811-1ecb-4a23-967a-a1fb71d8c8ff	0	10	f	\N	\N
906516a4-fd6d-424e-97e5-5a1e0615a515	\N	idp-review-profile	7285fde1-76e9-40f3-9950-b53009f25138	4cd6a022-b2c7-42e6-aa76-c1043305d9ad	0	10	f	\N	7e88e1fb-1586-4c8f-b2ee-f51f8c2e8f16
7da3ef10-743d-4429-8d4a-527609c992d4	\N	\N	7285fde1-76e9-40f3-9950-b53009f25138	4cd6a022-b2c7-42e6-aa76-c1043305d9ad	0	20	t	26749d09-1d31-4788-934b-716bf81a9fa9	\N
8454c3b5-fa84-4366-b5bf-2ae21fbc876f	\N	auth-username-password-form	7285fde1-76e9-40f3-9950-b53009f25138	357276ce-bee9-4c32-b9a2-25655a1bd048	0	10	f	\N	\N
7b3f2dae-698d-4dab-9409-4e085e01d3e1	\N	\N	7285fde1-76e9-40f3-9950-b53009f25138	357276ce-bee9-4c32-b9a2-25655a1bd048	1	20	t	c32a34f1-521d-4113-b3d9-8ab1c05319aa	\N
bacaa3bd-72ae-4fb8-8825-1bbe042d5d6d	\N	no-cookie-redirect	7285fde1-76e9-40f3-9950-b53009f25138	25372007-d99e-4c64-9c26-3b44c4f8cd0d	0	10	f	\N	\N
12ea9b14-48c4-4581-91b9-e1eeec28263e	\N	\N	7285fde1-76e9-40f3-9950-b53009f25138	25372007-d99e-4c64-9c26-3b44c4f8cd0d	0	20	t	3f59f3f3-3854-4602-bdeb-37be235c93f4	\N
ca7afdf1-afdf-4fd3-b47d-4b6f47a1373d	\N	registration-page-form	7285fde1-76e9-40f3-9950-b53009f25138	458cb7e3-abc8-46da-a998-7240945706de	0	10	t	99e3c322-d481-4c10-b5f9-4fdca9f85cc8	\N
cd92b124-2aac-4e6a-88c2-c952fe6416bf	\N	registration-user-creation	7285fde1-76e9-40f3-9950-b53009f25138	99e3c322-d481-4c10-b5f9-4fdca9f85cc8	0	20	f	\N	\N
404b38d1-018f-4722-88fa-f2a483bccd8b	\N	registration-profile-action	7285fde1-76e9-40f3-9950-b53009f25138	99e3c322-d481-4c10-b5f9-4fdca9f85cc8	0	40	f	\N	\N
a564496d-32f9-4998-a4fd-f6fc5024a5e5	\N	registration-password-action	7285fde1-76e9-40f3-9950-b53009f25138	99e3c322-d481-4c10-b5f9-4fdca9f85cc8	0	50	f	\N	\N
76094cb2-887d-4056-a9d4-a483930ea3eb	\N	registration-recaptcha-action	7285fde1-76e9-40f3-9950-b53009f25138	99e3c322-d481-4c10-b5f9-4fdca9f85cc8	3	60	f	\N	\N
5792fcd7-313b-4b26-b0d7-e7c299d26808	\N	reset-credentials-choose-user	7285fde1-76e9-40f3-9950-b53009f25138	3faac329-2df6-4217-b008-d3241e43f8ef	0	10	f	\N	\N
2878d32e-bb1b-4bf1-899f-0d24dcee53dd	\N	reset-credential-email	7285fde1-76e9-40f3-9950-b53009f25138	3faac329-2df6-4217-b008-d3241e43f8ef	0	20	f	\N	\N
636fe78b-422d-4ae5-b91a-0003b11a1e2c	\N	reset-password	7285fde1-76e9-40f3-9950-b53009f25138	3faac329-2df6-4217-b008-d3241e43f8ef	0	30	f	\N	\N
160283ab-2c7d-420f-b66d-0ec47f1c1af6	\N	\N	7285fde1-76e9-40f3-9950-b53009f25138	3faac329-2df6-4217-b008-d3241e43f8ef	1	40	t	796d6dcb-d8a2-42f4-98d8-25ff778e7418	\N
8b5c8991-6636-4325-a082-8655990326c3	\N	http-basic-authenticator	7285fde1-76e9-40f3-9950-b53009f25138	5be96ac7-dd90-415b-87fd-e9466efc3b3f	0	10	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
7ecfff58-a414-45d9-b10b-746ca070e548	browser	browser based authentication	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	t	t
1d7e5e8b-50a5-454f-a90f-71a0460f066f	forms	Username, password, otp and other auth forms.	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	f	t
53d8814f-be27-416a-9fb7-ac4a00836f0b	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	f	t
308fa2df-c0d4-429a-9ace-03ff1e1433dd	direct grant	OpenID Connect Resource Owner Grant	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	t	t
0114eadd-70f9-4678-b40a-5d5191f87c97	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	f	t
d1fc3a79-6ae7-4ba5-9484-78c861ce0602	registration	registration flow	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	t	t
9f9d15cc-929f-499a-90f7-7576fe6019cc	registration form	registration form	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	form-flow	f	t
ed997573-5c27-43fc-9a28-785286cadfc4	reset credentials	Reset credentials for a user if they forgot their password or something	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	t	t
df1f491a-cc91-42dd-bf23-baba96249f66	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	f	t
c623c6b8-5650-4d82-911b-19bc6ccf1547	clients	Base authentication for clients	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	client-flow	t	t
2caced54-fd77-421f-8a70-93a44b4e7bc7	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	t	t
dd363eb8-31f9-42e4-89f3-9664470b7c34	User creation or linking	Flow for the existing/non-existing user alternatives	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	f	t
14da3c37-1666-4cae-b801-3b6766875c8f	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	f	t
6be84243-87d6-4db0-9d1c-6fb8bbdda29c	Account verification options	Method with which to verity the existing account	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	f	t
e0fe0423-b06e-4370-b496-a0d2648e619f	Verify Existing Account by Re-authentication	Reauthentication of existing account	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	f	t
16673d49-199e-4833-8428-ab2cd3500b0e	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	f	t
021d34fc-5203-479a-b219-e73a9e0997f7	saml ecp	SAML ECP Profile Authentication Flow	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	t	t
38b782c8-cc7a-4f31-9c34-36041d7839b4	docker auth	Used by Docker clients to authenticate against the IDP	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	t	t
928e4bde-16c6-4864-a050-8981a1101d0f	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	t	t
5e41244a-a40e-42d9-b475-061a2f747d72	Authentication Options	Authentication options.	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	basic-flow	f	t
ed892b96-d623-4091-9a2f-7af353e8ca0f	Account verification options	Method with which to verity the existing account	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	f	t
3f59f3f3-3854-4602-bdeb-37be235c93f4	Authentication Options	Authentication options.	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	f	t
c32a34f1-521d-4113-b3d9-8ab1c05319aa	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	f	t
cb1f3d85-3b76-4a11-b1a1-5542e82db660	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	f	t
b87d8e98-6aed-4e7e-9209-8e6f86dc17c6	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	f	t
bf738ead-9e87-4886-987a-56ee8b36a738	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	f	t
796d6dcb-d8a2-42f4-98d8-25ff778e7418	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	f	t
26749d09-1d31-4788-934b-716bf81a9fa9	User creation or linking	Flow for the existing/non-existing user alternatives	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	f	t
d3e88154-3152-465c-9e20-5f99eccc1ff5	Verify Existing Account by Re-authentication	Reauthentication of existing account	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	f	t
557c53fd-8517-4ff9-b34d-80c060d18dcf	browser	browser based authentication	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	t	t
b8c0a29c-1d35-4b21-afd7-59f35e79916a	clients	Base authentication for clients	7285fde1-76e9-40f3-9950-b53009f25138	client-flow	t	t
bce0e814-decf-46b2-8bd7-f97d2c7dd7ad	direct grant	OpenID Connect Resource Owner Grant	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	t	t
49fb7811-1ecb-4a23-967a-a1fb71d8c8ff	docker auth	Used by Docker clients to authenticate against the IDP	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	t	t
4cd6a022-b2c7-42e6-aa76-c1043305d9ad	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	t	t
357276ce-bee9-4c32-b9a2-25655a1bd048	forms	Username, password, otp and other auth forms.	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	f	t
25372007-d99e-4c64-9c26-3b44c4f8cd0d	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	t	t
458cb7e3-abc8-46da-a998-7240945706de	registration	registration flow	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	t	t
99e3c322-d481-4c10-b5f9-4fdca9f85cc8	registration form	registration form	7285fde1-76e9-40f3-9950-b53009f25138	form-flow	f	t
3faac329-2df6-4217-b008-d3241e43f8ef	reset credentials	Reset credentials for a user if they forgot their password or something	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	t	t
5be96ac7-dd90-415b-87fd-e9466efc3b3f	saml ecp	SAML ECP Profile Authentication Flow	7285fde1-76e9-40f3-9950-b53009f25138	basic-flow	t	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
66a0152b-ba0d-47b7-be49-163415d4c8f9	review profile config	ed5b49b5-f1d5-42c0-b2c5-8c2730931615
aa3485c8-1264-44a7-8e56-753c9f5ab1f3	create unique user config	ed5b49b5-f1d5-42c0-b2c5-8c2730931615
171f1df7-b386-4cc1-bf33-2b334c36444e	create unique user config	7285fde1-76e9-40f3-9950-b53009f25138
7e88e1fb-1586-4c8f-b2ee-f51f8c2e8f16	review profile config	7285fde1-76e9-40f3-9950-b53009f25138
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
66a0152b-ba0d-47b7-be49-163415d4c8f9	missing	update.profile.on.first.login
aa3485c8-1264-44a7-8e56-753c9f5ab1f3	false	require.password.update.after.registration
171f1df7-b386-4cc1-bf33-2b334c36444e	false	require.password.update.after.registration
7e88e1fb-1586-4c8f-b2ee-f51f8c2e8f16	missing	update.profile.on.first.login
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	f	master-realm	0	f	\N	\N	t	\N	f	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
76162d2b-d704-496a-b208-c1bd42f3f271	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
ae4b02a2-42a8-4052-86cd-c72536846ca7	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
4b280103-076c-4a54-b7ce-baf149ce8818	t	f	broker	0	f	\N	\N	t	\N	f	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
65a8091a-60c9-4746-8531-4451378359ce	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
03baabf5-b1a6-42ae-89ab-3dedfb2dfbc6	t	f	admin-cli	0	t	\N	\N	f	\N	f	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
1770c654-ff91-4ec6-9edd-dd515047759d	t	f	regional-realm-realm	0	f	\N	\N	t	\N	f	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	\N	0	f	f	regional-realm Realm	f	client-secret	\N	\N	\N	t	f	f	f
b7026bfc-8a24-477c-b1ac-32e2b14945a9	t	f	account	0	t	\N	/realms/regional-realm/account/	f	\N	f	7285fde1-76e9-40f3-9950-b53009f25138	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
3b02d631-a61e-4b91-83d5-65121573a9af	t	f	account-console	0	t	\N	/realms/regional-realm/account/	f	\N	f	7285fde1-76e9-40f3-9950-b53009f25138	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
283ac944-e187-43b4-844a-c3698138a522	t	f	admin-cli	0	t	\N	\N	f	\N	f	7285fde1-76e9-40f3-9950-b53009f25138	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
59dd42ad-8aab-4c70-bd48-1cfbc37a0404	t	f	broker	0	f	\N	\N	t	\N	f	7285fde1-76e9-40f3-9950-b53009f25138	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
8a4fc698-798c-467d-b777-9f2882e1b9fc	t	f	realm-management	0	f	\N	\N	t	\N	f	7285fde1-76e9-40f3-9950-b53009f25138	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
35009670-c406-4b2b-aced-8d9fe4140990	t	t	regional-client	0	f	B8yPzlT4txHjz1YKCgAVQNV7E0CrZoFd		f		f	7285fde1-76e9-40f3-9950-b53009f25138	openid-connect	-1	f	f	http://localhost:8080	f	client-secret			\N	t	f	t	f
502d0adf-e637-458d-a6f1-b6d30a0032e5	t	f	security-admin-console	0	t	\N	/admin/regional-realm/console/	f	\N	f	7285fde1-76e9-40f3-9950-b53009f25138	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
76162d2b-d704-496a-b208-c1bd42f3f271	post.logout.redirect.uris	+
ae4b02a2-42a8-4052-86cd-c72536846ca7	post.logout.redirect.uris	+
ae4b02a2-42a8-4052-86cd-c72536846ca7	pkce.code.challenge.method	S256
65a8091a-60c9-4746-8531-4451378359ce	post.logout.redirect.uris	+
65a8091a-60c9-4746-8531-4451378359ce	pkce.code.challenge.method	S256
b7026bfc-8a24-477c-b1ac-32e2b14945a9	post.logout.redirect.uris	+
3b02d631-a61e-4b91-83d5-65121573a9af	post.logout.redirect.uris	+
3b02d631-a61e-4b91-83d5-65121573a9af	pkce.code.challenge.method	S256
283ac944-e187-43b4-844a-c3698138a522	post.logout.redirect.uris	+
59dd42ad-8aab-4c70-bd48-1cfbc37a0404	post.logout.redirect.uris	+
8a4fc698-798c-467d-b777-9f2882e1b9fc	post.logout.redirect.uris	+
35009670-c406-4b2b-aced-8d9fe4140990	client.secret.creation.time	1706719901
35009670-c406-4b2b-aced-8d9fe4140990	oauth2.device.authorization.grant.enabled	false
35009670-c406-4b2b-aced-8d9fe4140990	use.jwks.url	false
35009670-c406-4b2b-aced-8d9fe4140990	backchannel.logout.revoke.offline.tokens	false
35009670-c406-4b2b-aced-8d9fe4140990	use.refresh.tokens	true
35009670-c406-4b2b-aced-8d9fe4140990	tls-client-certificate-bound-access-tokens	false
35009670-c406-4b2b-aced-8d9fe4140990	oidc.ciba.grant.enabled	false
35009670-c406-4b2b-aced-8d9fe4140990	backchannel.logout.session.required	true
35009670-c406-4b2b-aced-8d9fe4140990	client_credentials.use_refresh_token	false
35009670-c406-4b2b-aced-8d9fe4140990	acr.loa.map	{}
35009670-c406-4b2b-aced-8d9fe4140990	require.pushed.authorization.requests	false
35009670-c406-4b2b-aced-8d9fe4140990	display.on.consent.screen	false
35009670-c406-4b2b-aced-8d9fe4140990	token.response.type.bearer.lower-case	false
35009670-c406-4b2b-aced-8d9fe4140990	post.logout.redirect.uris	+
502d0adf-e637-458d-a6f1-b6d30a0032e5	post.logout.redirect.uris	+
502d0adf-e637-458d-a6f1-b6d30a0032e5	pkce.code.challenge.method	S256
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
5718f080-fb4c-4e7b-a74e-170d3ded28c2	offline_access	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	OpenID Connect built-in scope: offline_access	openid-connect
66aacbb0-dec3-4326-9ee0-f4a491f64c89	role_list	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	SAML role list	saml
5b425348-1474-4f36-939d-167d7d6b798a	profile	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	OpenID Connect built-in scope: profile	openid-connect
01e59294-9d8f-462b-96e0-c745879bc2d1	email	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	OpenID Connect built-in scope: email	openid-connect
768bae59-69c9-4be4-a3ef-72edfbe3a48a	address	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	OpenID Connect built-in scope: address	openid-connect
504059c4-00ed-43f5-b60d-abd320a3a53a	phone	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	OpenID Connect built-in scope: phone	openid-connect
5f4c559b-bc64-4fef-a630-bf5cbe3fa57b	roles	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	OpenID Connect scope for add user roles to the access token	openid-connect
ed992b12-98d2-4dc2-b705-58b848f02a93	web-origins	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	OpenID Connect scope for add allowed web origins to the access token	openid-connect
1204290e-1c4b-4fe9-a32d-d54bd11430f5	microprofile-jwt	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	Microprofile - JWT built-in scope	openid-connect
f0b19668-c358-4e64-8586-0ee4fca9a09b	acr	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
4ac7bde8-a428-446b-82c1-9293abbd49f8	phone	7285fde1-76e9-40f3-9950-b53009f25138	OpenID Connect built-in scope: phone	openid-connect
abd67624-07c4-489d-b1a4-d0dfcf9702f6	roles	7285fde1-76e9-40f3-9950-b53009f25138	OpenID Connect scope for add user roles to the access token	openid-connect
15f5fb03-5365-43ca-a33c-0bf3accadd04	web-origins	7285fde1-76e9-40f3-9950-b53009f25138	OpenID Connect scope for add allowed web origins to the access token	openid-connect
a90ec271-2918-4b40-bbfc-5cbd42e261d0	microprofile-jwt	7285fde1-76e9-40f3-9950-b53009f25138	Microprofile - JWT built-in scope	openid-connect
02f1670f-0014-47dd-b3e9-93ba9ebcdd69	address	7285fde1-76e9-40f3-9950-b53009f25138	OpenID Connect built-in scope: address	openid-connect
5fe94c35-8813-437f-bd68-ca4b26ae8b0d	role_list	7285fde1-76e9-40f3-9950-b53009f25138	SAML role list	saml
178a6716-58be-4ea1-8f09-79e970a16b2d	profile	7285fde1-76e9-40f3-9950-b53009f25138	OpenID Connect built-in scope: profile	openid-connect
074a80ec-246e-45b7-9c89-cd1423106c1d	email	7285fde1-76e9-40f3-9950-b53009f25138	OpenID Connect built-in scope: email	openid-connect
1cbd77b9-6b49-4855-861d-60610f63aa8a	offline_access	7285fde1-76e9-40f3-9950-b53009f25138	OpenID Connect built-in scope: offline_access	openid-connect
9d3effe3-10c8-4efd-9f3a-a567bd6bffed	acr	7285fde1-76e9-40f3-9950-b53009f25138	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
5718f080-fb4c-4e7b-a74e-170d3ded28c2	true	display.on.consent.screen
5718f080-fb4c-4e7b-a74e-170d3ded28c2	${offlineAccessScopeConsentText}	consent.screen.text
66aacbb0-dec3-4326-9ee0-f4a491f64c89	true	display.on.consent.screen
66aacbb0-dec3-4326-9ee0-f4a491f64c89	${samlRoleListScopeConsentText}	consent.screen.text
5b425348-1474-4f36-939d-167d7d6b798a	true	display.on.consent.screen
5b425348-1474-4f36-939d-167d7d6b798a	${profileScopeConsentText}	consent.screen.text
5b425348-1474-4f36-939d-167d7d6b798a	true	include.in.token.scope
01e59294-9d8f-462b-96e0-c745879bc2d1	true	display.on.consent.screen
01e59294-9d8f-462b-96e0-c745879bc2d1	${emailScopeConsentText}	consent.screen.text
01e59294-9d8f-462b-96e0-c745879bc2d1	true	include.in.token.scope
768bae59-69c9-4be4-a3ef-72edfbe3a48a	true	display.on.consent.screen
768bae59-69c9-4be4-a3ef-72edfbe3a48a	${addressScopeConsentText}	consent.screen.text
768bae59-69c9-4be4-a3ef-72edfbe3a48a	true	include.in.token.scope
504059c4-00ed-43f5-b60d-abd320a3a53a	true	display.on.consent.screen
504059c4-00ed-43f5-b60d-abd320a3a53a	${phoneScopeConsentText}	consent.screen.text
504059c4-00ed-43f5-b60d-abd320a3a53a	true	include.in.token.scope
5f4c559b-bc64-4fef-a630-bf5cbe3fa57b	true	display.on.consent.screen
5f4c559b-bc64-4fef-a630-bf5cbe3fa57b	${rolesScopeConsentText}	consent.screen.text
5f4c559b-bc64-4fef-a630-bf5cbe3fa57b	false	include.in.token.scope
ed992b12-98d2-4dc2-b705-58b848f02a93	false	display.on.consent.screen
ed992b12-98d2-4dc2-b705-58b848f02a93		consent.screen.text
ed992b12-98d2-4dc2-b705-58b848f02a93	false	include.in.token.scope
1204290e-1c4b-4fe9-a32d-d54bd11430f5	false	display.on.consent.screen
1204290e-1c4b-4fe9-a32d-d54bd11430f5	true	include.in.token.scope
f0b19668-c358-4e64-8586-0ee4fca9a09b	false	display.on.consent.screen
f0b19668-c358-4e64-8586-0ee4fca9a09b	false	include.in.token.scope
4ac7bde8-a428-446b-82c1-9293abbd49f8	true	include.in.token.scope
4ac7bde8-a428-446b-82c1-9293abbd49f8	true	display.on.consent.screen
4ac7bde8-a428-446b-82c1-9293abbd49f8	${phoneScopeConsentText}	consent.screen.text
abd67624-07c4-489d-b1a4-d0dfcf9702f6	false	include.in.token.scope
abd67624-07c4-489d-b1a4-d0dfcf9702f6	true	display.on.consent.screen
abd67624-07c4-489d-b1a4-d0dfcf9702f6	${rolesScopeConsentText}	consent.screen.text
15f5fb03-5365-43ca-a33c-0bf3accadd04	false	include.in.token.scope
15f5fb03-5365-43ca-a33c-0bf3accadd04	false	display.on.consent.screen
15f5fb03-5365-43ca-a33c-0bf3accadd04		consent.screen.text
a90ec271-2918-4b40-bbfc-5cbd42e261d0	true	include.in.token.scope
a90ec271-2918-4b40-bbfc-5cbd42e261d0	false	display.on.consent.screen
02f1670f-0014-47dd-b3e9-93ba9ebcdd69	true	include.in.token.scope
02f1670f-0014-47dd-b3e9-93ba9ebcdd69	true	display.on.consent.screen
02f1670f-0014-47dd-b3e9-93ba9ebcdd69	${addressScopeConsentText}	consent.screen.text
5fe94c35-8813-437f-bd68-ca4b26ae8b0d	${samlRoleListScopeConsentText}	consent.screen.text
5fe94c35-8813-437f-bd68-ca4b26ae8b0d	true	display.on.consent.screen
178a6716-58be-4ea1-8f09-79e970a16b2d	true	include.in.token.scope
178a6716-58be-4ea1-8f09-79e970a16b2d	true	display.on.consent.screen
178a6716-58be-4ea1-8f09-79e970a16b2d	${profileScopeConsentText}	consent.screen.text
074a80ec-246e-45b7-9c89-cd1423106c1d	true	include.in.token.scope
074a80ec-246e-45b7-9c89-cd1423106c1d	true	display.on.consent.screen
074a80ec-246e-45b7-9c89-cd1423106c1d	${emailScopeConsentText}	consent.screen.text
1cbd77b9-6b49-4855-861d-60610f63aa8a	${offlineAccessScopeConsentText}	consent.screen.text
1cbd77b9-6b49-4855-861d-60610f63aa8a	true	display.on.consent.screen
9d3effe3-10c8-4efd-9f3a-a567bd6bffed	false	include.in.token.scope
9d3effe3-10c8-4efd-9f3a-a567bd6bffed	false	display.on.consent.screen
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
76162d2b-d704-496a-b208-c1bd42f3f271	ed992b12-98d2-4dc2-b705-58b848f02a93	t
76162d2b-d704-496a-b208-c1bd42f3f271	01e59294-9d8f-462b-96e0-c745879bc2d1	t
76162d2b-d704-496a-b208-c1bd42f3f271	f0b19668-c358-4e64-8586-0ee4fca9a09b	t
76162d2b-d704-496a-b208-c1bd42f3f271	5f4c559b-bc64-4fef-a630-bf5cbe3fa57b	t
76162d2b-d704-496a-b208-c1bd42f3f271	5b425348-1474-4f36-939d-167d7d6b798a	t
76162d2b-d704-496a-b208-c1bd42f3f271	5718f080-fb4c-4e7b-a74e-170d3ded28c2	f
76162d2b-d704-496a-b208-c1bd42f3f271	504059c4-00ed-43f5-b60d-abd320a3a53a	f
76162d2b-d704-496a-b208-c1bd42f3f271	1204290e-1c4b-4fe9-a32d-d54bd11430f5	f
76162d2b-d704-496a-b208-c1bd42f3f271	768bae59-69c9-4be4-a3ef-72edfbe3a48a	f
ae4b02a2-42a8-4052-86cd-c72536846ca7	ed992b12-98d2-4dc2-b705-58b848f02a93	t
ae4b02a2-42a8-4052-86cd-c72536846ca7	01e59294-9d8f-462b-96e0-c745879bc2d1	t
ae4b02a2-42a8-4052-86cd-c72536846ca7	f0b19668-c358-4e64-8586-0ee4fca9a09b	t
ae4b02a2-42a8-4052-86cd-c72536846ca7	5f4c559b-bc64-4fef-a630-bf5cbe3fa57b	t
ae4b02a2-42a8-4052-86cd-c72536846ca7	5b425348-1474-4f36-939d-167d7d6b798a	t
ae4b02a2-42a8-4052-86cd-c72536846ca7	5718f080-fb4c-4e7b-a74e-170d3ded28c2	f
ae4b02a2-42a8-4052-86cd-c72536846ca7	504059c4-00ed-43f5-b60d-abd320a3a53a	f
ae4b02a2-42a8-4052-86cd-c72536846ca7	1204290e-1c4b-4fe9-a32d-d54bd11430f5	f
ae4b02a2-42a8-4052-86cd-c72536846ca7	768bae59-69c9-4be4-a3ef-72edfbe3a48a	f
03baabf5-b1a6-42ae-89ab-3dedfb2dfbc6	ed992b12-98d2-4dc2-b705-58b848f02a93	t
03baabf5-b1a6-42ae-89ab-3dedfb2dfbc6	01e59294-9d8f-462b-96e0-c745879bc2d1	t
03baabf5-b1a6-42ae-89ab-3dedfb2dfbc6	f0b19668-c358-4e64-8586-0ee4fca9a09b	t
03baabf5-b1a6-42ae-89ab-3dedfb2dfbc6	5f4c559b-bc64-4fef-a630-bf5cbe3fa57b	t
03baabf5-b1a6-42ae-89ab-3dedfb2dfbc6	5b425348-1474-4f36-939d-167d7d6b798a	t
03baabf5-b1a6-42ae-89ab-3dedfb2dfbc6	5718f080-fb4c-4e7b-a74e-170d3ded28c2	f
03baabf5-b1a6-42ae-89ab-3dedfb2dfbc6	504059c4-00ed-43f5-b60d-abd320a3a53a	f
03baabf5-b1a6-42ae-89ab-3dedfb2dfbc6	1204290e-1c4b-4fe9-a32d-d54bd11430f5	f
03baabf5-b1a6-42ae-89ab-3dedfb2dfbc6	768bae59-69c9-4be4-a3ef-72edfbe3a48a	f
4b280103-076c-4a54-b7ce-baf149ce8818	ed992b12-98d2-4dc2-b705-58b848f02a93	t
4b280103-076c-4a54-b7ce-baf149ce8818	01e59294-9d8f-462b-96e0-c745879bc2d1	t
4b280103-076c-4a54-b7ce-baf149ce8818	f0b19668-c358-4e64-8586-0ee4fca9a09b	t
4b280103-076c-4a54-b7ce-baf149ce8818	5f4c559b-bc64-4fef-a630-bf5cbe3fa57b	t
4b280103-076c-4a54-b7ce-baf149ce8818	5b425348-1474-4f36-939d-167d7d6b798a	t
4b280103-076c-4a54-b7ce-baf149ce8818	5718f080-fb4c-4e7b-a74e-170d3ded28c2	f
4b280103-076c-4a54-b7ce-baf149ce8818	504059c4-00ed-43f5-b60d-abd320a3a53a	f
4b280103-076c-4a54-b7ce-baf149ce8818	1204290e-1c4b-4fe9-a32d-d54bd11430f5	f
4b280103-076c-4a54-b7ce-baf149ce8818	768bae59-69c9-4be4-a3ef-72edfbe3a48a	f
ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	ed992b12-98d2-4dc2-b705-58b848f02a93	t
ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	01e59294-9d8f-462b-96e0-c745879bc2d1	t
ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	f0b19668-c358-4e64-8586-0ee4fca9a09b	t
ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	5f4c559b-bc64-4fef-a630-bf5cbe3fa57b	t
ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	5b425348-1474-4f36-939d-167d7d6b798a	t
ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	5718f080-fb4c-4e7b-a74e-170d3ded28c2	f
ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	504059c4-00ed-43f5-b60d-abd320a3a53a	f
ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	1204290e-1c4b-4fe9-a32d-d54bd11430f5	f
ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	768bae59-69c9-4be4-a3ef-72edfbe3a48a	f
65a8091a-60c9-4746-8531-4451378359ce	ed992b12-98d2-4dc2-b705-58b848f02a93	t
65a8091a-60c9-4746-8531-4451378359ce	01e59294-9d8f-462b-96e0-c745879bc2d1	t
65a8091a-60c9-4746-8531-4451378359ce	f0b19668-c358-4e64-8586-0ee4fca9a09b	t
65a8091a-60c9-4746-8531-4451378359ce	5f4c559b-bc64-4fef-a630-bf5cbe3fa57b	t
65a8091a-60c9-4746-8531-4451378359ce	5b425348-1474-4f36-939d-167d7d6b798a	t
65a8091a-60c9-4746-8531-4451378359ce	5718f080-fb4c-4e7b-a74e-170d3ded28c2	f
65a8091a-60c9-4746-8531-4451378359ce	504059c4-00ed-43f5-b60d-abd320a3a53a	f
65a8091a-60c9-4746-8531-4451378359ce	1204290e-1c4b-4fe9-a32d-d54bd11430f5	f
65a8091a-60c9-4746-8531-4451378359ce	768bae59-69c9-4be4-a3ef-72edfbe3a48a	f
b7026bfc-8a24-477c-b1ac-32e2b14945a9	15f5fb03-5365-43ca-a33c-0bf3accadd04	t
b7026bfc-8a24-477c-b1ac-32e2b14945a9	9d3effe3-10c8-4efd-9f3a-a567bd6bffed	t
b7026bfc-8a24-477c-b1ac-32e2b14945a9	abd67624-07c4-489d-b1a4-d0dfcf9702f6	t
b7026bfc-8a24-477c-b1ac-32e2b14945a9	178a6716-58be-4ea1-8f09-79e970a16b2d	t
b7026bfc-8a24-477c-b1ac-32e2b14945a9	074a80ec-246e-45b7-9c89-cd1423106c1d	t
b7026bfc-8a24-477c-b1ac-32e2b14945a9	02f1670f-0014-47dd-b3e9-93ba9ebcdd69	f
b7026bfc-8a24-477c-b1ac-32e2b14945a9	4ac7bde8-a428-446b-82c1-9293abbd49f8	f
b7026bfc-8a24-477c-b1ac-32e2b14945a9	1cbd77b9-6b49-4855-861d-60610f63aa8a	f
b7026bfc-8a24-477c-b1ac-32e2b14945a9	a90ec271-2918-4b40-bbfc-5cbd42e261d0	f
3b02d631-a61e-4b91-83d5-65121573a9af	15f5fb03-5365-43ca-a33c-0bf3accadd04	t
3b02d631-a61e-4b91-83d5-65121573a9af	9d3effe3-10c8-4efd-9f3a-a567bd6bffed	t
3b02d631-a61e-4b91-83d5-65121573a9af	abd67624-07c4-489d-b1a4-d0dfcf9702f6	t
3b02d631-a61e-4b91-83d5-65121573a9af	178a6716-58be-4ea1-8f09-79e970a16b2d	t
3b02d631-a61e-4b91-83d5-65121573a9af	074a80ec-246e-45b7-9c89-cd1423106c1d	t
3b02d631-a61e-4b91-83d5-65121573a9af	02f1670f-0014-47dd-b3e9-93ba9ebcdd69	f
3b02d631-a61e-4b91-83d5-65121573a9af	4ac7bde8-a428-446b-82c1-9293abbd49f8	f
3b02d631-a61e-4b91-83d5-65121573a9af	1cbd77b9-6b49-4855-861d-60610f63aa8a	f
3b02d631-a61e-4b91-83d5-65121573a9af	a90ec271-2918-4b40-bbfc-5cbd42e261d0	f
283ac944-e187-43b4-844a-c3698138a522	15f5fb03-5365-43ca-a33c-0bf3accadd04	t
283ac944-e187-43b4-844a-c3698138a522	9d3effe3-10c8-4efd-9f3a-a567bd6bffed	t
283ac944-e187-43b4-844a-c3698138a522	abd67624-07c4-489d-b1a4-d0dfcf9702f6	t
283ac944-e187-43b4-844a-c3698138a522	178a6716-58be-4ea1-8f09-79e970a16b2d	t
283ac944-e187-43b4-844a-c3698138a522	074a80ec-246e-45b7-9c89-cd1423106c1d	t
283ac944-e187-43b4-844a-c3698138a522	02f1670f-0014-47dd-b3e9-93ba9ebcdd69	f
283ac944-e187-43b4-844a-c3698138a522	4ac7bde8-a428-446b-82c1-9293abbd49f8	f
283ac944-e187-43b4-844a-c3698138a522	1cbd77b9-6b49-4855-861d-60610f63aa8a	f
283ac944-e187-43b4-844a-c3698138a522	a90ec271-2918-4b40-bbfc-5cbd42e261d0	f
59dd42ad-8aab-4c70-bd48-1cfbc37a0404	15f5fb03-5365-43ca-a33c-0bf3accadd04	t
59dd42ad-8aab-4c70-bd48-1cfbc37a0404	9d3effe3-10c8-4efd-9f3a-a567bd6bffed	t
59dd42ad-8aab-4c70-bd48-1cfbc37a0404	abd67624-07c4-489d-b1a4-d0dfcf9702f6	t
59dd42ad-8aab-4c70-bd48-1cfbc37a0404	178a6716-58be-4ea1-8f09-79e970a16b2d	t
59dd42ad-8aab-4c70-bd48-1cfbc37a0404	074a80ec-246e-45b7-9c89-cd1423106c1d	t
59dd42ad-8aab-4c70-bd48-1cfbc37a0404	02f1670f-0014-47dd-b3e9-93ba9ebcdd69	f
59dd42ad-8aab-4c70-bd48-1cfbc37a0404	4ac7bde8-a428-446b-82c1-9293abbd49f8	f
59dd42ad-8aab-4c70-bd48-1cfbc37a0404	1cbd77b9-6b49-4855-861d-60610f63aa8a	f
59dd42ad-8aab-4c70-bd48-1cfbc37a0404	a90ec271-2918-4b40-bbfc-5cbd42e261d0	f
8a4fc698-798c-467d-b777-9f2882e1b9fc	15f5fb03-5365-43ca-a33c-0bf3accadd04	t
8a4fc698-798c-467d-b777-9f2882e1b9fc	9d3effe3-10c8-4efd-9f3a-a567bd6bffed	t
8a4fc698-798c-467d-b777-9f2882e1b9fc	abd67624-07c4-489d-b1a4-d0dfcf9702f6	t
8a4fc698-798c-467d-b777-9f2882e1b9fc	178a6716-58be-4ea1-8f09-79e970a16b2d	t
8a4fc698-798c-467d-b777-9f2882e1b9fc	074a80ec-246e-45b7-9c89-cd1423106c1d	t
8a4fc698-798c-467d-b777-9f2882e1b9fc	02f1670f-0014-47dd-b3e9-93ba9ebcdd69	f
8a4fc698-798c-467d-b777-9f2882e1b9fc	4ac7bde8-a428-446b-82c1-9293abbd49f8	f
8a4fc698-798c-467d-b777-9f2882e1b9fc	1cbd77b9-6b49-4855-861d-60610f63aa8a	f
8a4fc698-798c-467d-b777-9f2882e1b9fc	a90ec271-2918-4b40-bbfc-5cbd42e261d0	f
35009670-c406-4b2b-aced-8d9fe4140990	15f5fb03-5365-43ca-a33c-0bf3accadd04	t
35009670-c406-4b2b-aced-8d9fe4140990	9d3effe3-10c8-4efd-9f3a-a567bd6bffed	t
35009670-c406-4b2b-aced-8d9fe4140990	abd67624-07c4-489d-b1a4-d0dfcf9702f6	t
35009670-c406-4b2b-aced-8d9fe4140990	178a6716-58be-4ea1-8f09-79e970a16b2d	t
35009670-c406-4b2b-aced-8d9fe4140990	074a80ec-246e-45b7-9c89-cd1423106c1d	t
35009670-c406-4b2b-aced-8d9fe4140990	02f1670f-0014-47dd-b3e9-93ba9ebcdd69	f
35009670-c406-4b2b-aced-8d9fe4140990	4ac7bde8-a428-446b-82c1-9293abbd49f8	f
35009670-c406-4b2b-aced-8d9fe4140990	1cbd77b9-6b49-4855-861d-60610f63aa8a	f
35009670-c406-4b2b-aced-8d9fe4140990	a90ec271-2918-4b40-bbfc-5cbd42e261d0	f
502d0adf-e637-458d-a6f1-b6d30a0032e5	15f5fb03-5365-43ca-a33c-0bf3accadd04	t
502d0adf-e637-458d-a6f1-b6d30a0032e5	9d3effe3-10c8-4efd-9f3a-a567bd6bffed	t
502d0adf-e637-458d-a6f1-b6d30a0032e5	abd67624-07c4-489d-b1a4-d0dfcf9702f6	t
502d0adf-e637-458d-a6f1-b6d30a0032e5	178a6716-58be-4ea1-8f09-79e970a16b2d	t
502d0adf-e637-458d-a6f1-b6d30a0032e5	074a80ec-246e-45b7-9c89-cd1423106c1d	t
502d0adf-e637-458d-a6f1-b6d30a0032e5	02f1670f-0014-47dd-b3e9-93ba9ebcdd69	f
502d0adf-e637-458d-a6f1-b6d30a0032e5	4ac7bde8-a428-446b-82c1-9293abbd49f8	f
502d0adf-e637-458d-a6f1-b6d30a0032e5	1cbd77b9-6b49-4855-861d-60610f63aa8a	f
502d0adf-e637-458d-a6f1-b6d30a0032e5	a90ec271-2918-4b40-bbfc-5cbd42e261d0	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
5718f080-fb4c-4e7b-a74e-170d3ded28c2	fdd8ef73-85b4-429b-8b4a-d700de8d3c91
1cbd77b9-6b49-4855-861d-60610f63aa8a	5ba379b4-0cb4-4581-94e3-fbfa615b8fbf
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
da9eaf91-cf3b-40b7-b3a7-a5fef69bfc31	Trusted Hosts	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	anonymous
33328591-14a4-4c01-a0b3-4893c37fdd89	Consent Required	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	anonymous
6de95448-7c61-4ca4-a422-744b723905d0	Full Scope Disabled	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	anonymous
3f8acab1-4c58-4a9a-8fce-3badc5796dab	Max Clients Limit	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	anonymous
faa5f9f8-5b82-4312-94c5-30c6ee911da2	Allowed Protocol Mapper Types	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	anonymous
fee63c05-76bd-4c89-bed4-829180c8dbff	Allowed Client Scopes	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	anonymous
0d733474-72ce-49d7-afb7-a3bb9cf40794	Allowed Protocol Mapper Types	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	authenticated
128c4ce9-62b2-43a4-bc5d-24e72fc691af	Allowed Client Scopes	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	authenticated
c7aa41c5-d7d0-4d0b-9b74-0451677688cb	rsa-generated	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	rsa-generated	org.keycloak.keys.KeyProvider	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	\N
ef5597a0-0e31-41d3-8280-4576f68e12ae	rsa-enc-generated	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	rsa-enc-generated	org.keycloak.keys.KeyProvider	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	\N
8ba43da9-47f0-4b62-8187-31168a4b7155	hmac-generated	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	hmac-generated	org.keycloak.keys.KeyProvider	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	\N
ab66ce1e-f8b0-4c3a-9b75-065c27840884	aes-generated	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	aes-generated	org.keycloak.keys.KeyProvider	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	\N
7d9f4375-d5a3-493e-bbc5-297391fe8c80	Allowed Protocol Mapper Types	7285fde1-76e9-40f3-9950-b53009f25138	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7285fde1-76e9-40f3-9950-b53009f25138	authenticated
154a246a-27c4-4829-8f62-13e01d4a0e21	Allowed Protocol Mapper Types	7285fde1-76e9-40f3-9950-b53009f25138	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7285fde1-76e9-40f3-9950-b53009f25138	anonymous
773ae030-7858-40bf-a54a-41f1199c8ba6	Allowed Client Scopes	7285fde1-76e9-40f3-9950-b53009f25138	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7285fde1-76e9-40f3-9950-b53009f25138	authenticated
1bbf0b33-3395-4642-a076-d73aefed9fb4	Consent Required	7285fde1-76e9-40f3-9950-b53009f25138	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7285fde1-76e9-40f3-9950-b53009f25138	anonymous
3de23518-aa23-413d-9987-1ed7f6a8ed62	Trusted Hosts	7285fde1-76e9-40f3-9950-b53009f25138	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7285fde1-76e9-40f3-9950-b53009f25138	anonymous
32855895-252f-4ed4-bde4-83d7e1831248	Full Scope Disabled	7285fde1-76e9-40f3-9950-b53009f25138	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7285fde1-76e9-40f3-9950-b53009f25138	anonymous
4380cc94-1602-4196-ae98-8488235d0a02	Max Clients Limit	7285fde1-76e9-40f3-9950-b53009f25138	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7285fde1-76e9-40f3-9950-b53009f25138	anonymous
4aa93d80-bea6-4bfe-a5d1-f079944d6490	Allowed Client Scopes	7285fde1-76e9-40f3-9950-b53009f25138	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	7285fde1-76e9-40f3-9950-b53009f25138	anonymous
1dcb2fd6-f944-4e18-80d7-348ebff658ca	\N	7285fde1-76e9-40f3-9950-b53009f25138	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	7285fde1-76e9-40f3-9950-b53009f25138	\N
b65411ab-bde9-4794-90a1-311d9101e0e1	aes-generated	7285fde1-76e9-40f3-9950-b53009f25138	aes-generated	org.keycloak.keys.KeyProvider	7285fde1-76e9-40f3-9950-b53009f25138	\N
d12c1702-aa19-441e-a607-6a3c7ce58b20	rsa-generated	7285fde1-76e9-40f3-9950-b53009f25138	rsa-generated	org.keycloak.keys.KeyProvider	7285fde1-76e9-40f3-9950-b53009f25138	\N
7b399656-3917-4290-a707-940edca3b81c	hmac-generated	7285fde1-76e9-40f3-9950-b53009f25138	hmac-generated	org.keycloak.keys.KeyProvider	7285fde1-76e9-40f3-9950-b53009f25138	\N
f6ba8450-ca02-4681-8960-1799f547df8c	rsa-enc-generated	7285fde1-76e9-40f3-9950-b53009f25138	rsa-enc-generated	org.keycloak.keys.KeyProvider	7285fde1-76e9-40f3-9950-b53009f25138	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
38549a8c-4692-4b84-a3e5-70e8b2799bbe	da9eaf91-cf3b-40b7-b3a7-a5fef69bfc31	client-uris-must-match	true
5e41bd3b-fcfa-492c-ad3c-a9f484791541	da9eaf91-cf3b-40b7-b3a7-a5fef69bfc31	host-sending-registration-request-must-match	true
73e4e5ab-129a-4392-8df2-1e2d3a0bc351	3f8acab1-4c58-4a9a-8fce-3badc5796dab	max-clients	200
fcb6209c-a139-4f5d-ba31-23064311b72c	0d733474-72ce-49d7-afb7-a3bb9cf40794	allowed-protocol-mapper-types	oidc-full-name-mapper
f2205b17-162b-4d0c-aee0-c38d0a785e61	0d733474-72ce-49d7-afb7-a3bb9cf40794	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
adc7c463-8b21-448e-aa5f-fe26ad69adb7	0d733474-72ce-49d7-afb7-a3bb9cf40794	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
61e4aa90-76c6-491c-81e4-677319998cad	0d733474-72ce-49d7-afb7-a3bb9cf40794	allowed-protocol-mapper-types	saml-user-attribute-mapper
1d649ae0-ad63-4d78-8ca0-2026c7bba2d1	0d733474-72ce-49d7-afb7-a3bb9cf40794	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
c1f9632b-4a83-4a77-a10c-4275a34d2bd7	0d733474-72ce-49d7-afb7-a3bb9cf40794	allowed-protocol-mapper-types	saml-role-list-mapper
a1ff3ecd-9074-4186-b9fb-a5261ca4de05	0d733474-72ce-49d7-afb7-a3bb9cf40794	allowed-protocol-mapper-types	saml-user-property-mapper
d93a8b3b-3951-4f17-9c2d-3ae9e8385a9b	0d733474-72ce-49d7-afb7-a3bb9cf40794	allowed-protocol-mapper-types	oidc-address-mapper
1972dfe3-da60-4378-84a9-fde647d7d3bc	128c4ce9-62b2-43a4-bc5d-24e72fc691af	allow-default-scopes	true
2d5a8cb2-92bc-4ffc-80d3-1c2af12aeb03	faa5f9f8-5b82-4312-94c5-30c6ee911da2	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
8e7d6dec-7322-485f-b116-a065b8ebdb3f	faa5f9f8-5b82-4312-94c5-30c6ee911da2	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
5bc4697e-4687-40d2-b628-30b85b760c96	faa5f9f8-5b82-4312-94c5-30c6ee911da2	allowed-protocol-mapper-types	oidc-full-name-mapper
3ffc86ef-b75a-4488-91b4-ba66aa5e5c96	faa5f9f8-5b82-4312-94c5-30c6ee911da2	allowed-protocol-mapper-types	saml-role-list-mapper
35ba2ed8-178b-4515-8d99-aa6b5e3f878a	faa5f9f8-5b82-4312-94c5-30c6ee911da2	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
72af0b0b-a057-48aa-8eae-f4ab11efbdd6	faa5f9f8-5b82-4312-94c5-30c6ee911da2	allowed-protocol-mapper-types	oidc-address-mapper
97ff9424-13ba-481e-a30b-dd77059b3f6d	faa5f9f8-5b82-4312-94c5-30c6ee911da2	allowed-protocol-mapper-types	saml-user-attribute-mapper
f7d3bbe4-2100-4642-98a6-58aade991dd0	faa5f9f8-5b82-4312-94c5-30c6ee911da2	allowed-protocol-mapper-types	saml-user-property-mapper
9c434c6b-f91d-462a-9d42-d78cf69ec976	fee63c05-76bd-4c89-bed4-829180c8dbff	allow-default-scopes	true
0d48be41-b9a5-464d-8e4b-b4cdf1465f08	8ba43da9-47f0-4b62-8187-31168a4b7155	priority	100
2530c9a1-a69a-490b-958d-d1bb089376af	8ba43da9-47f0-4b62-8187-31168a4b7155	algorithm	HS256
8f2b031b-c1a5-405c-bb41-e658a680ccb7	8ba43da9-47f0-4b62-8187-31168a4b7155	kid	b6849f98-dfb0-4bbc-9151-c6f7adc37d1a
5a2aa8e8-bfcf-4b1e-b52f-d1bed86de90d	8ba43da9-47f0-4b62-8187-31168a4b7155	secret	QsAm3dFU91BoEEBmMUxS8kOly4nDQlwAjDveRAafuupEfd1u1zC29VbSbj78CIagXTsmyXzP_M7r1bqr8-Ew1g
fb8465d7-f0ef-42ff-b5f8-ff9d7b70ff2f	c7aa41c5-d7d0-4d0b-9b74-0451677688cb	certificate	MIICmzCCAYMCBgGNoybNUjANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwMjEzMTU0NTQ1WhcNMzQwMjEzMTU0NzI1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQChKMetWNUCzsAbtYRGSws1uqrQgxTvCs4rilq3RX/fu/lB9w+Ugo0TWBNAvkhrUBS7UWB5LlL7a8LJMzs6aLWyLPF2sjx5Jrs/RCJIvkQGh/cGE6XsDXQDqy75EoxNKae/zBdcFLsH/NBggHIt9mZlzOVMOTKvQRw0S8XRELhqy2No8v9Shz+YfD6t7aqmdyssFejy87PFvWfMCSDCDMqgD7L25fBInfA8+7GBmTHXfEohleSOVByiYAKFkwg0u1YHab4vUjbugNEug26533BDq4TUibs1hzYMfcx3uU5H68zwU8Qzf9uwJ1cBrA752hd1uVesWshWhweZUg9FH35rAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIvbG01BVxBT3lPTNpCqjwGrPrTSmo0UdxHigllDSUXjO/84GMKOha9k08B63rrpvKH0PeCHVx2ns08D1VnxEi4P7VuAlkgQfdr2zRnTE9e+k0fduDRi56GSkLb03eOiRWWbv5/yW3abPeFFf4Lz0HzuuXjjVUuagr5qwEENpthWyIgj0vSiS9mLv0uYLA01Aw4mQCNxvDDLEi74v3zKdY2WtYH0XZhoBp+Dk6142KqwTSfn5ucl1chw6K3tgCWkK15QHazYt31NZa3waZbQeRt8u9A8NZA2BxEjjkByxaAQFFPmRfwRAUcumvMnw3UoKaKLkukWzxgLnzU66xJ0cTk=
9137569c-d3aa-4352-8328-f5d55c1ddcf2	c7aa41c5-d7d0-4d0b-9b74-0451677688cb	priority	100
33ff0424-a466-42a4-9d53-9b1c0f4ce39f	c7aa41c5-d7d0-4d0b-9b74-0451677688cb	privateKey	MIIEogIBAAKCAQEAoSjHrVjVAs7AG7WERksLNbqq0IMU7wrOK4pat0V/37v5QfcPlIKNE1gTQL5Ia1AUu1FgeS5S+2vCyTM7Omi1sizxdrI8eSa7P0QiSL5EBof3BhOl7A10A6su+RKMTSmnv8wXXBS7B/zQYIByLfZmZczlTDkyr0EcNEvF0RC4astjaPL/Uoc/mHw+re2qpncrLBXo8vOzxb1nzAkgwgzKoA+y9uXwSJ3wPPuxgZkx13xKIZXkjlQcomAChZMINLtWB2m+L1I27oDRLoNuud9wQ6uE1Im7NYc2DH3Md7lOR+vM8FPEM3/bsCdXAawO+doXdblXrFrIVocHmVIPRR9+awIDAQABAoIBAAVm8raOrT6Vrp6J1ErE64scBut2vBC9Pyb6JstQ7ZXoMlVHPQL16K5he+0Q09L2Zr4sCVIBPwUwL2HY2/SRG6dtgT9A1JfHuBbJUmWM1zE+2oVzdX2MVTtllW1Xn/4FgPAux7OtpY1W01IAzD2v2O6IUpazriLDdHi+TNMSvpPPJZSjylgeEz2dUk0SkM8F8sUKsRJBgVqQLBy44coJj8rp7PGBZHTO5eH8NJ0Zqih+85fNj+Qe2T3YJ5rnLYX8nfuNF2Xv8VrSNFvn0odMtNwlTeyBazuLGpWgW2+kWiF4APV49QkgGzKaMr4gQS+cVgR9n+NK84/kH1Ey2V+KVFECgYEA08+Zf9/M5ncfI+8LszAB+coWU9Cb1mLYlCaDF6sCe8Gjr8gRNMhM7i9GsAMfXyacuWZU6652pw7HvS8/S+kELvXc6bd5GYQr8kN2lwqjpoWzSaq8uiKnKVE0W4cmwSFgIw3n0iohX/BMQ/xd2m23E9AHdDv6RBfOoeQ3i69manECgYEAwsf6KFoIXO8wj3vLqiwyhbHEwod7yFMyqy8DCJMz0CTR/nixMd+s7dRdA1ycSUMlb1q6c/L8tKza+LYLR/B+bMEOoePkJr73Ga0Nw1Xnf3N8qTDoelQ6wSdReXxHiBoyba3qJeIovoRb9OX/acJ6B2CEVryqYCN9Hef4NOF7zJsCgYAYkN5bv2gzXqOE9mej+7Bu+SpHxE0eu04lOKZBq3rZQacrbwfX2Fdb1K3dIi+USJUqx5yXzR9D1uoBniY4NqlejPN3Q+lOtU6nhX2OnRRH7v/RTnUfHX/HwfxRlUZAZg+RYT5+2JYQW31s8Sstd0YhjSIgMAihtyUnD6IFmG1HcQKBgFpIaQpVGPVCpQaMwg0hqVVQ3buxIs3qylyQUN6jpGuA9Zj3BmLwo24ldet9/K70oaBotG3UHg/84w5PCxGQRnlQTuD5CaJv94b+MJfu9Hud4xVlJwy0h/tJpzkhQuKyCdfOue5PUsVkAl+UT/wMeZV7xjuR/YLMUE0RXXndXg2rAoGAWSSC6w/Ip33ArvtInsiqg7jZpHlM9TpW9Ym/oV4PRJNcsl05DreytUFPjt7ofVfB+cji9nxMFNPgJ1y7nfKCW9N5VhTFcP/W7UBCMmmbU+AB5yDpXZJVfIn4lhoANPwsl+9GnUnj6mH7XN9UjT6PH96ZVlrBSdFK85ARQYQm1mI=
7a1e8a6a-1e11-4349-9ef9-344e3d2acea6	c7aa41c5-d7d0-4d0b-9b74-0451677688cb	keyUse	SIG
28e1ab24-d07b-4335-be6d-b66b9b7f1d3e	7d9f4375-d5a3-493e-bbc5-297391fe8c80	allowed-protocol-mapper-types	oidc-address-mapper
edfca38a-19d0-407b-bd59-e84e7484ff5a	7d9f4375-d5a3-493e-bbc5-297391fe8c80	allowed-protocol-mapper-types	saml-user-property-mapper
56a8847d-78b2-4f94-a6d0-de022ae7935f	7d9f4375-d5a3-493e-bbc5-297391fe8c80	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
68448486-6c23-4420-9894-d751fa3e55c4	7d9f4375-d5a3-493e-bbc5-297391fe8c80	allowed-protocol-mapper-types	oidc-full-name-mapper
ec2fb59e-2cf2-4f95-ad63-df25cdc7fa5d	7d9f4375-d5a3-493e-bbc5-297391fe8c80	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
9e331e8f-7efe-4be0-88e0-bbc862643583	7d9f4375-d5a3-493e-bbc5-297391fe8c80	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
604e27be-6f56-4a8d-95f9-6a487dc11b65	154a246a-27c4-4829-8f62-13e01d4a0e21	allowed-protocol-mapper-types	saml-user-property-mapper
c7f840dc-7076-45ca-9dd0-abb5051aca98	154a246a-27c4-4829-8f62-13e01d4a0e21	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
46f2b9fa-3f88-48c5-a015-2e1d0639082e	ef5597a0-0e31-41d3-8280-4576f68e12ae	privateKey	MIIEogIBAAKCAQEAkByhWoQ/HkhOPOZMOYd6fSs40r/NkHo/7ief72M1X/kiS/CwrB0wCUW1OcoGNiQIB5fBDobYDCFFERXtts+sRyaKgOWDTziQapHchoRtTiK7mz5GnhgKQdvpCAGw51f+0NozCl6lB7rI1BxRrURKGIL3kzttkE0bNSq8dla8VYPuNpd6Y+P+b4B+FQu/46xevkon3Um+CczQLZk5N9nziMeu0MadQQxN97bEY1G9XaOA7J3ZmRueU8OlaXqTWsOl+WwYy/y5864zzvfVL1UX2s+pHNKlYyCBkrI0vKOXBXjXHoZLAZneTTsK8V8Vgy5Qj1psrrjVq8hh43VHsPkkewIDAQABAoIBACDhL10wDBiUJamWX7DGfMdfG6VV1ohOpBRpnP9osq5VcKJD5YM3W5TZ/ymSss0admyJDqaKVHOcCZ6G0sghZKyNGg+jjcx+2tA9vENCpo+rtAMM996tHHX/PxExFZQKyxwKlJealWuIjbZ7SZVPHdqu0t6YMfy44urD9+DGFE0sJ3edqP5MDmkfcnc2ZQ5EIaAuVsiefuuruz2mrdqoIwmOMq3FClaa9PCe6JCCN3U0Fu97C3i0W1/HSzI0du4RC3ba+wq5FyAkeW1XSyAO4d/Qx0HK08Bu9K6Lk9327xgpRwcwb5qg3uCEIuDBnaRR1Wk6JwqmOULBMKp1TANpqRkCgYEAxdwXnvBNZkkVnDk2zPfea9Yb86uiwUSK8Rr4LpRe7P5RuvXb/vPTb8FavvVqby+Os0qhEGsQulouXTYMtZ7G7Te61G/2cqg+ApwbNcoLODK6tGp7+4yknEDu9LvJaYFqSu+R2ygTjrX5rZeqt9PzHDsnGQU3LqNbVqdi3UMGJPMCgYEAunVghi6DYZL99SsYaL6InqQkh/v5OhPbT2wJIu1ooDbw6SWGiVFIhjfeYo9NM24UDCyU0fM1pgmutPysgCaq+A3hnj/KOJV3nOaX0qzcvw4V4Q7KM/TCOfTaDnjN+DeHVzqmJYtByNNkZ4N0NQpmf8nEvQk3WXECfCCRYEpThFkCgYB/KyibZQO6PDsBf9xy/NUeJi0s/iHLakyLDrR466/fTs4lBiRxxzEcYP/8QCw6biyfm9XNgaLsw02NZ1Hf4b8ldG5GX/fcVboVX1Q1zDhN1H0fvFkXopuiOjHbZl7byuwQYc4zN5zqWpexNQvqvvVALdzBPhLrjN8F4OuwHoXydQKBgEfjwZd6j4UrW2cPepXIAHzJ5JvZdroBtejlSpCA4HoFNNVvdnOzNzcoi0GM5sMRigE3nxljoCeoTAfT895lCj4he/+7sIgoeLmx3o+HvoSbNaxUO3nUwJ3/3aL+yMsO/cuP/Uc0beS0PF38vO1GWUaj0Irh5slBXSfmlqZ9gb3hAoGAcU2oUbw1SoifXaghOZDbcrhME1CPpptGqhBmQqDIQ9SwLhK02VlzkneagIblQiV+zNPvGy5OPZ22WVBk0QJz0YqSZUxavEmBsjAFfT8oErWQdixPA5RaGTbvL0ORGg/pgSyUDsLLn9Qs856m6KofVG+Rp3zh+5EYue6lj4NcvMI=
727810d8-fbe7-4400-958d-6b70d5c30532	ef5597a0-0e31-41d3-8280-4576f68e12ae	algorithm	RSA-OAEP
1c9e7411-56f1-46a4-bb9a-4d7cc03f676a	ef5597a0-0e31-41d3-8280-4576f68e12ae	certificate	MIICmzCCAYMCBgGNoybQDzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwMjEzMTU0NTQ2WhcNMzQwMjEzMTU0NzI2WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCQHKFahD8eSE485kw5h3p9KzjSv82Qej/uJ5/vYzVf+SJL8LCsHTAJRbU5ygY2JAgHl8EOhtgMIUURFe22z6xHJoqA5YNPOJBqkdyGhG1OIrubPkaeGApB2+kIAbDnV/7Q2jMKXqUHusjUHFGtREoYgveTO22QTRs1Krx2VrxVg+42l3pj4/5vgH4VC7/jrF6+SifdSb4JzNAtmTk32fOIx67Qxp1BDE33tsRjUb1do4DsndmZG55Tw6VpepNaw6X5bBjL/LnzrjPO99UvVRfaz6kc0qVjIIGSsjS8o5cFeNcehksBmd5NOwrxXxWDLlCPWmyuuNWryGHjdUew+SR7AgMBAAEwDQYJKoZIhvcNAQELBQADggEBABS/ZhdtMUCCxy3NtCMux3gN3FCQo1ja9zbN4IDpCLdjMTQzdP5ycJdzPbD308OWzhumo54465PDMTOxCHSOer51abdQb4ThkaxfqpQyzxRpNYQgsYiM37M9QdCLWjCamw8fHj+UUJaRgSUomKdASUrTKwnqdAfdAHYL8pj/09u3NdFK+pW3TAVY0GvaiBfJ2SVMf0PyWPgWh1t0uifTEV5tyVl2WwSL2y9dYAgwPQI9EkgAXLRRpCbh6a08PKJYhdbM/sEwz6F0qOEsE6spcrIQKqSy9yWvdGIZwleGnpBfET27KVEmpHaTmEN3tRQskEYrJGZW+fG1XpavwZZEapM=
fc799e6e-8b32-4f60-ab0c-33d2fb2a6a7e	ef5597a0-0e31-41d3-8280-4576f68e12ae	keyUse	ENC
36a6d49b-3621-4af5-97a3-97515ca92d75	ef5597a0-0e31-41d3-8280-4576f68e12ae	priority	100
686a3f69-2799-4e74-bc02-420b74123938	ab66ce1e-f8b0-4c3a-9b75-065c27840884	secret	M3T7AWJhWCph3esYK8L2UA
9fa67703-850f-4f60-b8fd-12408b782b8f	ab66ce1e-f8b0-4c3a-9b75-065c27840884	priority	100
a725d553-3f3a-4347-a62d-dc52516c3e0e	ab66ce1e-f8b0-4c3a-9b75-065c27840884	kid	5d0d817e-08db-49f1-b014-ad1ba7f2f393
cfa44ac9-a66d-4e9a-9a54-1f160603377f	b65411ab-bde9-4794-90a1-311d9101e0e1	secret	4vjLul1Zo7rMZmyzHjDFZQ
2520f043-3782-4bba-aa78-61ac71829b69	b65411ab-bde9-4794-90a1-311d9101e0e1	priority	100
3fe70792-278c-4056-8959-04ee0e09167e	b65411ab-bde9-4794-90a1-311d9101e0e1	kid	a54f6cac-eb02-4f9d-b113-179cad65b23e
81c71550-4755-4226-85a4-8a660ab627de	d12c1702-aa19-441e-a607-6a3c7ce58b20	privateKey	MIIEpQIBAAKCAQEAs5jo0g2pIkwTeZy+YZISwzEttEuUPqFHLsk+osPjgZU+fHSgZqWsNH1N4aoKD17XBaPOlSFVQjKVJUUyJdZseOe1tu21tSbQBL0yF2Vad30w7Ru40mG1R5x49KGomxJcjo2TEWA1fP202Z23omg5EE6TSRlZVxne5yM0JBxghFlpY3VD2ecc9bOninwxZjceAMw+Bo3/9U6Daee4l9NOfcLsTE9/1lxt6Zk6V/K6/d1hYp/WPzClgUp6tuHRL/PkVKAdlUeAKrzWxppTFYhpi8g+VsbRIyRkUHfNBdhRxWwePrJZg5vFy5CvNHbbMyCgB7YbHa0My09OihfecR61UwIDAQABAoIBABm13C6l8f6M8YTJYZ/KL5Ft6uMSpshIgk46VRMsA9e7K9TZRVUshniFL68MjqAgrZuLFbnXqcLuRtetDj7IcYLleOgVI5wpUEI9a3xZ8BeG/ogTHeRQRIlZ5x7uPZrliAaIUfN82GtqToeQwocncHPbK86dKGMFuxlPutkojtCjVosBs66TC2azPchy55VGYl6eLin9eHHdxBIM97U3H4y4EGhLh4NXRQlYnfnhPPqgGrnNtBlVmXNwODuCR9ttJcYwuIaq2QhO9RsE1LsjKFqHGvxFawLnMGdQzSbtV+G31SUVZ4wJ0aW2MJYtQxoqZlsHxJaeOH9KHlxH+TubPmECgYEA6ZCWiD0l663aQWCQ3OCns+7L02XYFXI4TM4bDurzs2pMqgHTft7+LjVV0aclb52bZA3pieh4pwaY+fxm/Vh00BUqB+VqwR/uxX9Lpm/Fbag/TQhVoar37M039djW06trbI0zyVjJtWcnZH4O7gfMGr3E62MDJCf5hwLwZNm1aSkCgYEAxNk/lJXb0xhoeaeUxvSdxtD9nKqLLIInPd8rFHgGRt/0ujtQn7G2UZZP+qijMg7cSLK6nLIi02SnsFK5Kqy9GGnZxO+suwbgQZNwFGQPLmCFWqYFJrqjPFec7bjAsV7viOcR1lzhhEM8UN6FXFlnK5ZJKviG5bRYTJ6cfeoFbhsCgYEAkptIcfH4CIyTEDB+HbcCbWY6GNK3pRaSElvZDi8ak4bo4lnNGLj+UaD24meJjxsd+9rjucXrXeQ9R8VQHDxW7noqbNRrgxf5N4zkvm8wPNm8Ci1uGtGHV+Ok+bOHfUv/XR7w37TUwAIk7uZVlsHcMvjlT19SDHLvJPkKTjN9tKkCgYEApxzb6jNy5HnjL+xB1MmULFX+CAOMlWOFFvSfqQfgJEk6hOOYJYqEAi1+hoilyvhssFbzL9XW1OmtpnYD9qOhANnT42mplTlYJrOZQeZUMQYGEBfDZcaqj669bd8bzziOWAX60aYWWeeOjATs6KKJgKpcQVutgdKh56H7rrV+mKMCgYEA04it3tMNZYRbWFMjp8V0gD654HOw0VJukbHj1VVReutQqOHvwSmytUVn76Nq49vOKc3Q0E+/EP5sH9gNeDz3CRH3PMK93pksgyMj5FgtRcg4zraxL6LOf4ZY09tbjc926+sxfK8iibJCfYlFvYdC2ho/lJAIqsVod8GKwcAhDeA=
a66f387a-affa-4d26-b659-40082f62916b	d12c1702-aa19-441e-a607-6a3c7ce58b20	certificate	MIICqzCCAZMCBgGNqT29EDANBgkqhkiG9w0BAQsFADAZMRcwFQYDVQQDDA5yZWdpb25hbC1yZWFsbTAeFw0yNDAyMTQyMDA4MzJaFw0zNDAyMTQyMDEwMTJaMBkxFzAVBgNVBAMMDnJlZ2lvbmFsLXJlYWxtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAs5jo0g2pIkwTeZy+YZISwzEttEuUPqFHLsk+osPjgZU+fHSgZqWsNH1N4aoKD17XBaPOlSFVQjKVJUUyJdZseOe1tu21tSbQBL0yF2Vad30w7Ru40mG1R5x49KGomxJcjo2TEWA1fP202Z23omg5EE6TSRlZVxne5yM0JBxghFlpY3VD2ecc9bOninwxZjceAMw+Bo3/9U6Daee4l9NOfcLsTE9/1lxt6Zk6V/K6/d1hYp/WPzClgUp6tuHRL/PkVKAdlUeAKrzWxppTFYhpi8g+VsbRIyRkUHfNBdhRxWwePrJZg5vFy5CvNHbbMyCgB7YbHa0My09OihfecR61UwIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBgdR/1DjLMtdSRBW9emYcU6f2UB1DoCFJdOevaW7zOthiQ7FQcdjtggrbVdS8sfeeALgFgPHncLiK0OzqF/+UG8pX/zRu6wF7AQUL3QemGGox3o/Hq3nu1dxlI73J5248e7EtNA21327u9lDsezbxpai0ShsrhXsxDG0FjfSfcN+mo2XxtvR5cecuU/CAMP2sG8Y+c/7OUzqBEmExf0tzGDwHlNZibw3un68W0GJHwcIGIfOBGyy7lLAvr5zpiRgU8MKDQspAfTWLqTqIo5qbgAG15KzXgmglYpmJUnyzwyocGoBT4WDrN0zyt5kpodmbhxJ4IfYTMCJBhsz6nu5Ub
b67bd01a-0809-4fb2-841b-813578240d60	d12c1702-aa19-441e-a607-6a3c7ce58b20	priority	100
73c01106-2fe4-4ae6-a6fd-13c1599b353b	3de23518-aa23-413d-9987-1ed7f6a8ed62	client-uris-must-match	true
1704d7ba-c756-4c12-a27f-b09870ee3758	3de23518-aa23-413d-9987-1ed7f6a8ed62	host-sending-registration-request-must-match	true
05dbe244-9911-455c-913c-b19db1fe6c6b	7b399656-3917-4290-a707-940edca3b81c	secret	K2yHF7vDJJYDZmcUrYZlu_O7D1_99YvAGiq2joiKBhpP9V-q5oqNmpwNFp8hebvytQlYcEz4C-OOlj-PT9ZSRg
fa5a2fea-d536-4295-bb15-137053816c50	7b399656-3917-4290-a707-940edca3b81c	priority	100
60ef4784-f987-41fd-9617-6f58b7627470	7b399656-3917-4290-a707-940edca3b81c	algorithm	HS256
de78b5b6-b146-42f8-8447-f00c9962ce98	7b399656-3917-4290-a707-940edca3b81c	kid	c713a75d-0f67-46cd-9638-7f6f60f0b3b4
b7229e51-502f-41c3-8b38-e5aced71c636	4380cc94-1602-4196-ae98-8488235d0a02	max-clients	200
e7bcd9e1-7207-48ec-9c1b-a0e71ee6983b	7d9f4375-d5a3-493e-bbc5-297391fe8c80	allowed-protocol-mapper-types	saml-user-attribute-mapper
a7c4a5b2-7d1e-4afa-8073-2a8f8cdf66f1	7d9f4375-d5a3-493e-bbc5-297391fe8c80	allowed-protocol-mapper-types	saml-role-list-mapper
31847f68-1837-442e-b2cb-40de286c812c	154a246a-27c4-4829-8f62-13e01d4a0e21	allowed-protocol-mapper-types	oidc-full-name-mapper
08bd4ebe-1016-4442-8fac-423324da2947	154a246a-27c4-4829-8f62-13e01d4a0e21	allowed-protocol-mapper-types	saml-user-attribute-mapper
01da22db-8c86-4f12-b950-c8f60d5cd55a	154a246a-27c4-4829-8f62-13e01d4a0e21	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
2973c679-e871-4289-a381-8609bde9dad2	154a246a-27c4-4829-8f62-13e01d4a0e21	allowed-protocol-mapper-types	oidc-address-mapper
7e4c4b7d-47c5-4317-a6e7-e87b95c8f65b	154a246a-27c4-4829-8f62-13e01d4a0e21	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
9a3560ab-4843-494f-abc2-131bd37cad42	154a246a-27c4-4829-8f62-13e01d4a0e21	allowed-protocol-mapper-types	saml-role-list-mapper
518959b2-dbb9-409a-91c9-7a909c0e5588	773ae030-7858-40bf-a54a-41f1199c8ba6	allow-default-scopes	true
6b89fb3f-8928-4054-95fe-23169a4201fa	f6ba8450-ca02-4681-8960-1799f547df8c	certificate	MIICqzCCAZMCBgGNqT2+GjANBgkqhkiG9w0BAQsFADAZMRcwFQYDVQQDDA5yZWdpb25hbC1yZWFsbTAeFw0yNDAyMTQyMDA4MzJaFw0zNDAyMTQyMDEwMTJaMBkxFzAVBgNVBAMMDnJlZ2lvbmFsLXJlYWxtMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwHR2/OGhOoq3yaeX6iX/vTtMojlk0Yi2DBktdoQIv+EbG+a96g3crXhDFTkJnuZx9b2nZq1bepZQxLD/1bt/8WoJUAj5uzPg87idNM655gzGsa4eQVjROw2hzytxXENsUseKuA7sRvdpNiZmggd9lyhxNif61H9ETz4hhIVDixR52CHqvWkKgelgp5Fz2bO6O7Gkwndq8UYQLtiqiO3ae2tcHDgGCXdbMJBlDmZ1wGxN6LAjqnCygk89vAfJjniYVuQIhczos/Y8BQdWBXWohw+9JHBe5mhIf+NK3DYdheyehGfnWBofrPrQplItt9IvoHiTA2CC2yDlQjdFSAHK8wIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQCk9IRzrFKHUsVmWWM0bvyvxmN1ZZoOmNTt+z7N26Dtwvz1Y5ATNaPoqPUuxVVBNDRciLiLfcA9fHJdrABHt9KO84Vm9NGvpySe5SQ3hX/yxYP6shUPYauVHLyBW7VLCthABJZy02ZBoy8SPRLpOhr7/3X4wHYtqyYuqOrku1TAsb2Q8zDKuCGgOE+LGcVFuyf0GxpMQZsXCTyGo7Pefkd5pk7PFxOGHjwtqFVPumj1ZAIna0LbZfVABAVf+fZELSn0VlfC8iaVqamWakDrkpbsUWX5ihK/0rGxGISo8s1XhzRK0zOgWZjpUO3s95N6y+DwGbjKcUdNyBseqx/hOw7U
1a6faa60-950f-4139-bdb0-b22183b36b69	f6ba8450-ca02-4681-8960-1799f547df8c	privateKey	MIIEowIBAAKCAQEAwHR2/OGhOoq3yaeX6iX/vTtMojlk0Yi2DBktdoQIv+EbG+a96g3crXhDFTkJnuZx9b2nZq1bepZQxLD/1bt/8WoJUAj5uzPg87idNM655gzGsa4eQVjROw2hzytxXENsUseKuA7sRvdpNiZmggd9lyhxNif61H9ETz4hhIVDixR52CHqvWkKgelgp5Fz2bO6O7Gkwndq8UYQLtiqiO3ae2tcHDgGCXdbMJBlDmZ1wGxN6LAjqnCygk89vAfJjniYVuQIhczos/Y8BQdWBXWohw+9JHBe5mhIf+NK3DYdheyehGfnWBofrPrQplItt9IvoHiTA2CC2yDlQjdFSAHK8wIDAQABAoIBABAvbncjl2ZpY1eBBSFBNnOSclMNgwStyKs8mtQyx0GYpUNnCzKNHX5np//RUi8CfM1vHvSSc8Hb5/ycUVSHD+JPsDgCgtSGYmhc1R74NWFUuO9/qZyGFnwu6bX9Y1IGrl98pJZVVI2k7qMJ/uj3x4CLSCogmdNKxYXpWPKtYNoBwDyNzwEoByc44WCMaCEuyMjwDMIkKzefxN/wtuT0fSe33HdN1gZwQc7lA6yQpPvB91D+S0Xlhh7owraARGfjCpzAN74TIZkp/wlGqxRW7y44AXO0KzbezmKYS/byKals94iMnv5EObiCIVAdOSDHqr7bix99tHJI0CWgRDAw68ECgYEA6zk33L7oC5g3S56WwC+EClieoA7AjrRlwcpm4OKWnokq9H94OrnohS14fBoqVqUBiYRpyoiBRzcFKcuC2EZq7hEIjxdIJCk5EHoSeGLVsFM2Xzrko6M0cvAIAwhgOQKcA3UBobT2sXzbZQB7GCBk4ED/EAX/R8fiFs+6d0woNpECgYEA0XQuNFChfp9gyjAw5wSDFvUmaQ6PR5jL4iChs4mb7yZRhqjPv17MVu8Z8iIN77/HS+GD7NhmUuq7BMHztJ0m+9NkBpARoVuyelU9YbQk7K+MdxArrC8P2BkRZM8JRcGGejdklYEZzp21ZgHMxWLGO4sacaBHdu/shMLXT8Fi00MCgYBLeRx3c7m4nqp/VO9B0v0m5LBg4trd7vwHZg4Eci+pxpFFyfClxyjYMnLKPwr+qgsIOLhJB+uTEhBSDL567n04zbZVUz8OezuYEdMDVZMC9HApthfOeXtGtcWcU3+sSy4L3escG5hb8pfinHjikOJNIg208neqbHQapaRKyuDMQQKBgDK1B8KOiqpW9127kPs8smfKbcQdTD6vFRznfX4zoFajVjVdhP31e07Ij+V4rRsPuLX8IK4kLZGBVklukwt0yE1K/fpAwqPnySuomzWeIRpT3ZOtjIUg15sfZoCbRslmcqH/6w/us0q8D4Bkiyh2IzujD4HWpbZ7my0A5pNeZAh1AoGBAL4qB5Y7LXoZd051jiwwUGPI/v38bSO7JXf4bCBXrUhqyD7d0my3weRcBBH08uvkuZ5LwTiFOZk9Xe3kWU9DrIT/NdRL+Q7aJeUk6j+IH1vV9F52QVshhsT9NffAOgTd98hQ746mtePEDaJUYpBW//4LKTwoi5xSl+DMFmTMVIK2
bb71809e-570d-4c66-8d9d-169f08f5da99	f6ba8450-ca02-4681-8960-1799f547df8c	priority	100
78e433e8-d9e9-4bcf-a19b-fbfced86c046	f6ba8450-ca02-4681-8960-1799f547df8c	algorithm	RSA-OAEP
3cccf6eb-6122-4cc7-ab2e-543cf6a37e1d	4aa93d80-bea6-4bfe-a5d1-f079944d6490	allow-default-scopes	true
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.composite_role (composite, child_role) FROM stdin;
5ba959f0-b88b-4b85-af86-6e72a9921f79	c8d2c2d9-75a3-494c-8cab-232b60ffff07
5ba959f0-b88b-4b85-af86-6e72a9921f79	b665fddc-137e-429e-b631-471d2829d42a
5ba959f0-b88b-4b85-af86-6e72a9921f79	8825490d-b12d-427f-b364-feccbaa30616
5ba959f0-b88b-4b85-af86-6e72a9921f79	db0356f1-1395-416c-974e-3e60e36931e1
5ba959f0-b88b-4b85-af86-6e72a9921f79	03bccb30-89eb-47ff-8011-1a72ab2c5eec
5ba959f0-b88b-4b85-af86-6e72a9921f79	7a6141d4-7d37-4c90-93d8-ce3c338b5642
5ba959f0-b88b-4b85-af86-6e72a9921f79	8835da01-e973-472a-bf60-d8356cf8424a
5ba959f0-b88b-4b85-af86-6e72a9921f79	6a4d1f6b-ebde-47f6-8383-4f02f5629848
5ba959f0-b88b-4b85-af86-6e72a9921f79	7a02dac8-93b5-4135-84d9-57afceb5e5c3
5ba959f0-b88b-4b85-af86-6e72a9921f79	71009642-a7b2-492b-9ad1-35d89f958b04
5ba959f0-b88b-4b85-af86-6e72a9921f79	862cb80c-5ccf-4254-a9dc-6e03431640c8
5ba959f0-b88b-4b85-af86-6e72a9921f79	43a170eb-640d-4afd-9559-c4395f79dacd
5ba959f0-b88b-4b85-af86-6e72a9921f79	b35b86fc-dd4b-4664-9929-571e1eb0ff3b
5ba959f0-b88b-4b85-af86-6e72a9921f79	f82d660f-fd48-46f6-83f4-f8028de8afcd
5ba959f0-b88b-4b85-af86-6e72a9921f79	8e719873-9cf6-4194-bb16-eac58de1431f
5ba959f0-b88b-4b85-af86-6e72a9921f79	568fd5f8-a5a4-43af-964f-dae35029cd4d
5ba959f0-b88b-4b85-af86-6e72a9921f79	7c60b177-3e6c-4d35-b98f-d646e3273a1a
5ba959f0-b88b-4b85-af86-6e72a9921f79	0b2a59e8-842a-4359-a4f7-02ddfb704425
03bccb30-89eb-47ff-8011-1a72ab2c5eec	568fd5f8-a5a4-43af-964f-dae35029cd4d
db0356f1-1395-416c-974e-3e60e36931e1	8e719873-9cf6-4194-bb16-eac58de1431f
db0356f1-1395-416c-974e-3e60e36931e1	0b2a59e8-842a-4359-a4f7-02ddfb704425
fc0a4195-cfc7-4f73-a33d-9d8d34e7e6d3	759349db-c3ff-4df4-90ea-1e9012aab84b
fc0a4195-cfc7-4f73-a33d-9d8d34e7e6d3	ec40b358-90b6-49c9-b190-752e45b4075f
ec40b358-90b6-49c9-b190-752e45b4075f	5a48bc5c-c086-40a0-b092-121ab7d5f41a
0e3bc134-4ee3-4e9f-8ad0-6d5d2a57affa	7e2d9368-0d17-4e03-82dc-16ed2e527de9
5ba959f0-b88b-4b85-af86-6e72a9921f79	f5cddeec-145b-4c01-9ccd-2d85d7677c47
fc0a4195-cfc7-4f73-a33d-9d8d34e7e6d3	fdd8ef73-85b4-429b-8b4a-d700de8d3c91
fc0a4195-cfc7-4f73-a33d-9d8d34e7e6d3	6f68d086-37e1-457d-a883-afb6ef357119
5ba959f0-b88b-4b85-af86-6e72a9921f79	6c71ec00-cfb3-4c1b-b880-b2a8843c62b1
5ba959f0-b88b-4b85-af86-6e72a9921f79	6cf82871-31c7-40b5-a4e8-141e0d41a253
5ba959f0-b88b-4b85-af86-6e72a9921f79	42f65007-da89-47fa-ac03-1e93c4711cf6
5ba959f0-b88b-4b85-af86-6e72a9921f79	c793ce93-7ae0-4f93-86de-2e7009a8493b
5ba959f0-b88b-4b85-af86-6e72a9921f79	efdea5ef-2339-4b7f-9f82-da5449e19942
5ba959f0-b88b-4b85-af86-6e72a9921f79	348636fe-2eae-4a78-a157-bbfba4df0022
5ba959f0-b88b-4b85-af86-6e72a9921f79	fce47445-94d9-4578-8c69-00b82585da33
5ba959f0-b88b-4b85-af86-6e72a9921f79	5c94516a-e86f-4e53-b073-73984c1721f7
5ba959f0-b88b-4b85-af86-6e72a9921f79	50130ba1-8adf-4eee-84c5-91ebdc29ab3a
5ba959f0-b88b-4b85-af86-6e72a9921f79	4ef64ba0-b136-4a03-92ea-19e96237c776
5ba959f0-b88b-4b85-af86-6e72a9921f79	3bcf36d2-3863-4a09-b467-cefa36c6e465
5ba959f0-b88b-4b85-af86-6e72a9921f79	69533a82-6c3d-4367-97d5-c9e560e526b6
5ba959f0-b88b-4b85-af86-6e72a9921f79	6f96e461-c3f4-471b-858d-9134fbe09505
5ba959f0-b88b-4b85-af86-6e72a9921f79	1c448c3c-c58a-4273-8610-9e93eaa0b526
5ba959f0-b88b-4b85-af86-6e72a9921f79	18f62975-84eb-4f1b-8975-6e84bf85a075
5ba959f0-b88b-4b85-af86-6e72a9921f79	cd3fc6bf-54ce-47a3-8f14-47f42212a180
5ba959f0-b88b-4b85-af86-6e72a9921f79	13391692-d6d7-4899-a882-08fd34de383c
42f65007-da89-47fa-ac03-1e93c4711cf6	1c448c3c-c58a-4273-8610-9e93eaa0b526
42f65007-da89-47fa-ac03-1e93c4711cf6	13391692-d6d7-4899-a882-08fd34de383c
c793ce93-7ae0-4f93-86de-2e7009a8493b	18f62975-84eb-4f1b-8975-6e84bf85a075
1034a713-897a-4ad3-a4c9-69d531e69650	81dc0b37-bc3c-4f12-9d1f-9c7d57132fd8
1034a713-897a-4ad3-a4c9-69d531e69650	60a266c9-862f-4b8d-9464-028c07f1dad3
1034a713-897a-4ad3-a4c9-69d531e69650	77190e45-9750-4dc7-8e3a-1f1d48391536
1034a713-897a-4ad3-a4c9-69d531e69650	7ffbf265-ec7d-4b56-86d1-c4a5b04b2d62
1034a713-897a-4ad3-a4c9-69d531e69650	0195ac30-5978-4926-bd96-7ff9ecb6ac24
1034a713-897a-4ad3-a4c9-69d531e69650	ae2dcc18-8d80-49ad-836e-f6ae0edaeb82
1034a713-897a-4ad3-a4c9-69d531e69650	6e725264-8417-48ab-871a-bef2c3cb0de0
1034a713-897a-4ad3-a4c9-69d531e69650	3ff0015f-939b-440c-8371-8ae54e728bd6
1034a713-897a-4ad3-a4c9-69d531e69650	9ce8e2b3-e1c0-4e63-bad7-dddbc13117ee
1034a713-897a-4ad3-a4c9-69d531e69650	bf6ff5b0-e788-4136-979f-278e99c71700
1034a713-897a-4ad3-a4c9-69d531e69650	2f65ce13-04fb-4de0-8256-2c36e4f7ee13
1034a713-897a-4ad3-a4c9-69d531e69650	ecaebba1-94f0-4c44-82d8-e5d612182a98
1034a713-897a-4ad3-a4c9-69d531e69650	68db5d35-0dae-494f-818c-a4c738586e82
1034a713-897a-4ad3-a4c9-69d531e69650	6cb77343-a604-483a-8176-e1eff84447f6
1034a713-897a-4ad3-a4c9-69d531e69650	2945e06f-d38a-431d-a16e-81c504d55af4
1034a713-897a-4ad3-a4c9-69d531e69650	6074774b-9f36-4b69-ba6f-9987fc9db453
1034a713-897a-4ad3-a4c9-69d531e69650	42abe204-e52e-446f-9b38-d21bc80919a1
1034a713-897a-4ad3-a4c9-69d531e69650	02b3a29f-ce4b-4992-a1d6-029c70d22c53
32a740d3-b802-486c-8de0-998692686cdc	ab3b6835-2cab-4a88-b40b-1899a11c16e2
68a277db-07ad-43b6-9c32-3f73f2a9b93e	4e49a989-a779-4107-8fb4-0860153e7e0f
6cb77343-a604-483a-8176-e1eff84447f6	68db5d35-0dae-494f-818c-a4c738586e82
7ffbf265-ec7d-4b56-86d1-c4a5b04b2d62	0195ac30-5978-4926-bd96-7ff9ecb6ac24
7ffbf265-ec7d-4b56-86d1-c4a5b04b2d62	42abe204-e52e-446f-9b38-d21bc80919a1
a9880f20-a124-4ab9-ab64-378823ee0b8c	694fd4f6-9933-4962-9375-84b44345a712
a9880f20-a124-4ab9-ab64-378823ee0b8c	32a740d3-b802-486c-8de0-998692686cdc
a9880f20-a124-4ab9-ab64-378823ee0b8c	f8877a13-e511-4c41-ad15-607fb358499e
a9880f20-a124-4ab9-ab64-378823ee0b8c	5ba379b4-0cb4-4581-94e3-fbfa615b8fbf
d11af074-b52e-40f7-bf30-ed29fd52c085	a08ff438-1164-4acd-a492-5d972c6f2a5b
d210b541-3628-4d20-aafb-9d8af2a88e31	55a9598f-c0c8-4544-b33d-ace82854cca8
5ba959f0-b88b-4b85-af86-6e72a9921f79	ed097230-bf05-4d6d-8127-c4f7bd1faddf
b527d212-f000-4c76-b513-de2b40d1e24b	1d3f7a1a-54a2-4d35-8904-80557f3be18c
38535122-c1a3-4c32-b9cd-6a044511f5fc	4955e15f-0da9-4f83-82ec-358bf6839a22
f6ac7b11-e9ef-42fe-bf7f-aa3805210837	529853be-1fd7-490e-8f96-7688ec85dd18
7ffcdb7c-4ca9-4fb2-a8eb-25cd6fe74583	31360eb0-5b71-4f10-8069-3ef4ed4e00e6
8b391ae3-2d82-4557-820b-17360eaed26d	90753778-1cb0-463e-90a1-6b59fb210fc3
1b60f5e8-e147-43b6-8b0a-a8e2f6075477	07c1b289-148a-407f-a8c8-637eed21db77
e7da107d-c205-4df1-b571-85c5675595a9	ba9db196-c7e1-4d1e-8c4f-37b73b98e96e
a1bb442f-10f7-49d7-acad-8173d177e4b6	08ea9684-b1bb-4845-ae29-5469a1a42c54
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
e086af16-e64e-4c9b-a390-9e60be0837ad	\N	password	6347d9bd-3923-4283-a50c-6ba437309c91	1707839249257	\N	{"value":"j/htxwgdXYAr7lMlfImdM08zs20f21zoJPQQfnlsUO4e/j+yPGj9A2lZUw95lK35jZJP/cFyAu6RST2JzA2Beg==","salt":"SAW3Y7FVF/YEbcnFSZfsYg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
09a6168d-0d2e-45d6-9eaf-717a7499d230	\N	password	e61a43c4-6b8e-46df-b866-7aa74685ce76	1718747335536	\N	{"value":"3hRrpr9kUw84JCSg+Rb1WIldm2Yb3NWID3VqRRi2JyFSC6mduNUtvd44GBwU1J6PD1wh+9qkCWhtuqWD14XRIw==","salt":"jEUCBwUVin2g3AebLqKl2g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
2ad86292-11da-46cd-bc98-68bbe717e0b9	\N	password	733415bf-7a92-48e3-a040-a4fe4aed5f2f	1707941412654	\N	{"value":"Ngkr7LHavD26x9GCs1q91d8bThRgY90Wi3Gq7MXI3yZaybQor7i0JxFrmEtOmQZP6ndQgRkS77fTrODdtQjUMQ==","salt":"4496C52aU0jG8weNarEwqQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
2e50b9c6-29c2-4756-be05-9c41db418de7	\N	password	650c4f87-ef2b-4f50-9ac7-be7aba48a6d3	1710261117157	My password	{"value":"heWYB3xuvwtx9YfbURDELNYH+yO/OcZ6jo8/I3gUiHN1qRvviSFOsQhzmfDYqL/jX/dlRewIsrl35Vzm/+Y6mg==","salt":"RO914Q/aDJrrvOq9nBWNhA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
1ba07531-51dc-4559-828b-bcbfa6bcbb9f	\N	password	474681f4-b61e-4740-ab8e-59ac2ae82a06	1710261146984	My password	{"value":"xn/T09YbCkDZGWgLiA15LrpDUFRNwAc3ofle9g+RW0xK3qtiXQXfGwnKYj4Cyz0+w7n7y0Xo17KYiX4SWXUxVg==","salt":"ekiXJ5bkyLPq0XFuhJo66g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
c15eafb9-39c9-4c66-b681-0dd3feb35842	\N	password	5bfe59e7-e008-4745-b2da-a2bcddbf6a1d	1711553993547	\N	{"value":"hqpjBlwFceWrJGVZsPlqptBWCx+euGt8ilas1g/kt1gkIZo6hJomHaCVrrjjNiNRsvmYqPZ3rGeC62lyEaVSWQ==","salt":"L6M/zUyZ4R4nw2XFLzrtUQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
3f7705bf-ca20-4a07-8213-7986cf06bc6c	\N	password	a05de10d-ffcb-4a25-9036-d753878b6f9f	1711571617417	\N	{"value":"v/CdW3gBEwtzlgY1SMxInzdIsYcVK+Bp9LzS6YPUe77VKBkdb8xUMjWbmAAAkPz7NxyC81tV8IqL8/33ePRSCg==","salt":"d18Gnng+9VJmQWP1nx7v0g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
44460458-69fd-4782-bb0b-6777b0260b89	\N	password	23dc6e35-5123-49dd-855a-6bbc89e7cc8f	1712929875402	\N	{"value":"+GvpeLwp3TCJ5Z8ETEtBNWtvG1buCOB9JI8JPSZq6gt2P8c1KCzBUTKseHoL6dfuKCuGMhfhDXaM+WqrspSwKQ==","salt":"mU2zBWx+OWy9zZrDwkmggA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
f215bc18-cd40-4fd5-a832-33d4efb1015c	\N	password	1e1d0fbb-e9a6-4c49-ab05-7a2e85aa87cf	1712935737835	\N	{"value":"vJXhRZNIZ2dP1Vc40Ag96jVgkD77egeMRD7Dbad1mVhP1EY/VWuqVWQVeFU4ov1E9X4SidSRBv1CxezzItMZcQ==","salt":"mYgn8/tbhhmYW4DufmEnIQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
8148e1e2-2229-4bd6-a7f4-89919bfa5333	\N	password	dfcf8074-02c5-4545-b648-5953717c4d21	1712955882146	My password	{"value":"tFIvApyMjgMclkkxcE7ein0H4JzsKekRltR8dAvsFol/3cH9EKCKL4n8cz8vFO7vK2cRrYtfAeythS3e/+WFbg==","salt":"j5lXOXpmmyCbo3OVZGaN4A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
b8019743-be39-4f0b-bcc2-a9c7fa864767	\N	password	884e45fe-2db9-45b4-966b-cb37517f2ea0	1712956094395	My password	{"value":"4IGVt1BQ7WaWz/yMSm3m9o2aRXlwKp5OKxW/94dpmHr1eBMCs65KrXeWTCvBsxqQ7zH0ENpq2o20DdgJvrWP4g==","salt":"nhqDr6UGzusalYGGy929ww==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
506f1c18-6a05-4558-ae90-e325f008baa2	\N	password	e4cc5a54-5ff1-4a5e-b90c-11466df588df	1712323065897	\N	{"value":"oUuZLaoT/oKc23PPx2VcjEVZUGbzhGQ2et9YnRxYmaBb8zsBY3OGyHwoB5S6oNo+y1BeTeylKWurTdM7wIh0cA==","salt":"CkAgDiGDrCkQFMKrOx4bNg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
68c9aca1-719e-4e47-b20d-2a93520e8be3	\N	password	15718055-3738-4e99-85ec-594f8b307122	1712956538096	My password	{"value":"M5v2/mL/TtkcM6gCxDEytgZoH+1KltPe0h4iowF8bx6NTKpQJtID4KX7+2KMso/nsku/l+jq+7ID9DPBUEoAzw==","salt":"TnBi+HyicHzLejnGQjl6Jw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
b4c8bed6-4ce0-43a7-8481-dd7ad38f9576	\N	password	b803f43f-5fa7-4aea-b076-3ad85bce6585	1713296119257	\N	{"value":"J6DMUTym86m+LFSYu0cY8/ufuzPxcLPzlO3nWOwKMjEg0QOxPKH++HOPgZQ71VvnDPRKbIY3nEubTMRYEPKHEw==","salt":"cxtKghgbtCc7AoJkZicuUw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
49b93065-4f66-42ef-8486-48ffb8e775f3	\N	password	52d5bd1f-dd8b-4ac9-b650-108e8dc1765a	1713208930623	\N	{"value":"X4zqIkNFBjL6zDCV4NzOrUce0gyWDWl1GfgIm0pGHbzqQDnqt8eI/D7jaeRYDqHNPMo7znkQ7l2TT2ZtXfh5AQ==","salt":"IDVgcxnZNbRU4owM8tzKlQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
fc27c7ec-4ac4-463a-9beb-515bbc897df5	\N	password	e82f596a-d606-48b3-b735-f4701b5fa930	1713209113903	\N	{"value":"U4/vberxdBgAIF2R0Yb9uwVD+QuIwoBHV8ApD3TNCo5k8R+lscJHgWCI4FOQG+W2akWA1dB0t3SZpKarmf2apA==","salt":"2/DBsB5gphwoyTAOHoIcjg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
a9cfda62-be19-4918-9160-c997a59256c5	\N	password	0b712472-2dc1-4a11-bfc5-79dae2f1f407	1713233432470	\N	{"value":"bxQyOJDaIxKqk7e5eHo2hzQXPE08bFA1T+hsqeubr4Y8OAT2b7gE5wOg31+H8ZBzFQzyweZmYkM/zHhSu4o4JA==","salt":"qurtiqYwM3dsHPcOiaeZ0w==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
7995133a-d3ad-4d0f-b6d8-2aa59a27e92e	\N	password	5988b29b-dbae-4d50-ab58-20e9a9695f6d	1713267074128	\N	{"value":"eT6Y2cY0WksOlEBUzB18qD41KqqtL5ixJHFKhxtdY5C3fEhMp/ZEq40LpH/Q6dDvFQxysMFDnrDLKMfMcWwTdQ==","salt":"6S+Nfa7SO+2rdPAdf+QEVg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
21678ef6-e2d8-44ec-bf17-9d6d270cb2dc	\N	password	091d1ef6-ac17-400c-a48d-dae43a5f52b5	1713276378037	\N	{"value":"TMG1IoaBMyq7r9G6ZY575uJWfhgBobwVq56KSy6qrk3QkhGBd0KcGA2REjisFtJ5KMbGoDAwhqu8fq5NgL05gA==","salt":"K/jUAlNFqg+IlgMShS9PBw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
cb30c531-6ac5-489f-9721-891d7d02769c	\N	password	66e2a633-fd06-4935-8ed3-0b7c0c1c4254	1717077638689	\N	{"value":"Bv/k3LrpWviKGhCuJ8hWCkEivq3uOU5Tel2QbGR8NKCY0OTiSyHI1iuXKQqJxfoQISZGpcHK6Np7H3plqRBJng==","salt":"w8xhtgx8ahx2A4JEJMol+Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ab7aedbf-4c85-4d79-929c-dde387075021	\N	password	25bfc9e3-60e0-424e-92de-0f6d18c82bfc	1717077654593	\N	{"value":"c2/3vkZ9ijOhU1O7c3cSCm73e9gc1LjKJH2A4LEbuKdMpj1j7LfPQyCzHQFrFCuo+Kvyfx1GB7c79B0vhodH+w==","salt":"w/cbW43XQ88u0cjIhRFUSQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
87749b85-7a22-4439-98c0-9dc24442c94b	\N	password	f699754d-3106-456c-b6fb-82842131ce70	1717082479214	\N	{"value":"hENKBgGDOn3Q07/91b+Snlth6F/o/M29QzvUvze6L6yG+yvJeFScsFjsIN54A0i/VbYouRMD36d35E09kycswQ==","salt":"QsJsel4iX/sdVD/RtvkJOw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
9dab490b-0d74-4dda-9d47-00b0c3fe0775	\N	password	34afd408-2820-484a-9681-9b875d80bcd6	1713280806279	\N	{"value":"ugY0/PuPtdZAwJV6FixsLjImoZj7P4bzC1NkeP2obnpV7xJ4FpmB64Gx+lbNIgHrevlExkp32rH9QNqydw2KYQ==","salt":"wILi/n7TJULhiD2RJRP3TQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
d4832183-1d50-4d10-8230-72f81c8cf50f	\N	password	61059eb2-95f8-4d4c-80b7-5d8d6474fcf3	1713286616984	\N	{"value":"udocbyYAikcTA1dNQEzQC9/021tRlunmlgMV7CS7jN6RCy2U6pVykx9p/frwai3GO85O10MDKlDTPSHeddC3Zw==","salt":"rIwzYuDEIRAqIzYGiTCxLg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
db2bf1ed-e7c5-4e2a-8ab2-98b0628f0dd0	\N	password	efa60f8f-2b72-4dff-bf5c-d3a747d8fa08	1713286950846	\N	{"value":"BaNWsc106yUvyLXKqTItVU21MGIefb8rfMicd2GU1LVh2g9DIdSR5PAFuXjluh8l7kNmzME6dEjajg7R63btvg==","salt":"E1mX5NKOzvis9nmsV2hk7g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
b3a28c57-8d33-4636-8463-52602ef4201e	\N	password	63d44b1c-b79d-4fe6-a420-cb36c24d1bab	1713293172174	\N	{"value":"ZrpNZKrtWvSkdbnDwAWqiUzP0y8viU71MnTgMBYtt61h5nVM4XhbVEz/43Yzsr5st8pRLkWNsThR9wvjzHlJIg==","salt":"f/33LujwFD1dzWmFs9ldJw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
c7d95153-f343-4bdf-9fa3-2b5cc84a07e3	\N	password	c223d845-28d1-40b1-adae-89ad5cd9a3aa	1713293446654	\N	{"value":"nu+jjLX++oEs+T/z/Da8O4nYtbJZyuICCGqSJ/1klURUznbYwzF1W1zlWu2CUYxfI0OTd0PLDNyG05zSqodJzQ==","salt":"RAdqwmiIKG1DYPFm/YyKxA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
daf807a4-2277-4225-803b-094df0e76f5f	\N	password	3a8a0a88-ed37-48bc-a271-1e05bf5ebbbc	1713293519273	\N	{"value":"kKf5zp91BGvkGBMomdUc64GwghrnrNAQRZCLFQBa/k4dHZwlif8zT8RcGXcvsTkhBwjzAhCH0hcbjC0W9LBWfg==","salt":"hMv6wf0+HbC6bxb9KW2wTA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
19a1325a-cbc0-407a-a976-16eb4de1e773	\N	password	165558c1-79ed-48e1-b2d9-bb6b004242f1	1713293781034	\N	{"value":"fhy8F1u0yrNK2R1cGSNsXBT+Bftkd3VBT2DOTnIHqfpUStkq9FSfHlm3MEoAGbiHNIn+GlYSH2f+7D7LT9vDkg==","salt":"bnAWnNazehA572RFYvdBIw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
d3bd928e-1193-4fb0-8970-4498ef50b27e	\N	password	1215bbd5-f7a9-46f5-a075-038b3d860367	1713296136405	\N	{"value":"WJREEkLA6nyBOPT7tDkHEi6nT4MBPFq9UN5M83+jzO+zFcqB9h2SNq8QXT4e7GDkJ2tsUH4ukvAxVHnVNBUYQA==","salt":"S5E0GHgRifjqZ0UsZNP//g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
4a803383-1f42-4e38-b8cc-63fc79156b7b	\N	password	e4e8223b-c613-46d6-bf2a-43e167a0586a	1713299095060	\N	{"value":"O3fhuAfDHzBpjlspyakJKhRVQ0x4WJ0kthJnNVoqjn4PydiFyJRaZ2UkKQPYXAREYv18NfiWo6FEQ/57ZnQiSg==","salt":"V6pETvGmcIdk+JJ5Bc45Xw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
59a06856-0be4-4ac5-a9eb-71301f2175c0	\N	password	4fdd3a5f-9118-460a-94de-580387545e59	1713301123527	\N	{"value":"CY7sAF09P/4FQidxKetreFeSyx21O+9eMugUwejWUlyeyjQwvtQpjQMPNsJv++GFfDcQfMpNPimbLeGKVXauig==","salt":"0GG2B8pVzwZr+5kPgDUJHg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
391f0af1-a7b9-4290-890e-0dd3fae08977	\N	password	5ea24cee-ec94-4bcb-938a-fde68c09b174	1713301202421	\N	{"value":"auHJz6h83iVXgR2IFXyswCKnZf8iGrzGetW6fRRWqa/HriwiqJI1aqOmOODFCe4mhz758f0WsbJTwNP/ZC9sfw==","salt":"1e624+rmAKqkb8Yw0rzGtw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
4b244d42-ae64-4de1-a4d9-5474236858b0	\N	password	23876565-b218-4170-aeb1-602484f62367	1713313540711	\N	{"value":"QJESjRog9vbhriJ4xKCyPvsgkCiobzpwO2FZD+WWQH+/SQEn2aP8f1XNzUivEY9HTfN2qGf4yebWWn1nfCqYuQ==","salt":"UuSFBATKM/cw8oa7kYw+eg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
21cb6bbf-3441-497c-91fb-76f34c10d2f2	\N	password	955dbf89-0e83-488f-9541-b26cc4a41494	1713313600776	\N	{"value":"kX0IhPSmDpQCO6yhnLXuckTbh4aiNhaEmgcMAWsIav/Ys7Yujc625q9+u4U8K8MtKFI3QMKdZ1wpinsh9gMMTQ==","salt":"wQ4I90rSQOR/xffXhNR24Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
8cf5815b-7abb-4e11-be25-f41bed0ae775	\N	password	7b9993cc-2d01-4d63-9093-2177c614d407	1713313669436	\N	{"value":"snACvILcz5I/mmzTMm1JR8JNZteX1+68yUl3gFsJNLQfFGB4yNKHGT0jh7Ob9TYVMMUa3gzJW2WChooZ1KmTbw==","salt":"8fwpooAzJ4DYME97/dfUZg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
17eb90fa-a496-4b1f-b9e4-267399c37ff3	\N	password	4c460c7d-23d9-4f32-80a6-958826a65ac6	1713363829957	\N	{"value":"AnfQovxTjklQyZnyEljo+ck5ituDVLYIj3NRZXkO73wdG27DeV0s9OWnnLnIMhjjd+mLzpnELu1fwbgz0a05ZQ==","salt":"HZLwaH8+gOL9guUkXui9ew==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ccce84c9-d12d-4b5c-b49e-8ffd7b6c4222	\N	password	16fa502c-57cf-4055-9543-a0eacc6291e8	1713368116524	\N	{"value":"iHaCooKpxSg7WfadBoT5Rp9CKpt5cKizYx/FuzZ+bFi5X4KeJUKKqgmqLkaUc52T3GsYnh8DwgyQo1P14zGuQQ==","salt":"M/FwkWuA8rC+gc1lRN9NcA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
01f1e100-c000-4fa2-abcb-0206f2babbff	\N	password	e1566680-d554-4636-ab44-b79fcfbe5d7f	1713371174838	\N	{"value":"MV6boZc8O45KOs/9h4RWcpBR2+9hmwchwmHYdGw5t3/UURDC6YW+P6/xrR+m26WkowgS2Wj6Kw8uVltVi3Uo5Q==","salt":"cfg//rz+jAeUB7+ZaKXd4g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
3f8a0751-009d-464f-adb4-45640fa5ee21	\N	password	72ee82f2-1197-4f7d-8bae-c9eccaf52821	1717591557202	\N	{"value":"j8PNMJPASAxKuBZhlFs9jC0PWZ0KVZiC5wt6aUhR/C2J5g6WuVoAONYLLZjyY23shbb7qHyQdjquUwrQHICiTA==","salt":"ZyfOzbrL/UMcL3++2n5gGw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
7c112935-fb69-4f7c-8f39-bd4b6be8d7fb	\N	password	1efa5c4f-60ec-41d1-b9bb-92210aa2560f	1717010637169	\N	{"value":"6uMdbLL3KQ370p6t+Y6UG3OlzGDE9ErFAkXC38W44Io0EeK1zGdLo9izNbeTBOZG6HuYSwX14PHjeVV38bLQtQ==","salt":"+9BYsfgOyInzx7TFo8BMYQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
fe3c12b0-ce14-4a78-8bbd-067eda25ac27	\N	password	6933834e-59b1-4f18-b82d-9eb9c4728c98	1717080830114	\N	{"value":"46NYsYAzBe4QdRdruuNBLECNI0eP1sfN7qCPXOFzwBP+eJA5jAlgyUMCjgiIIHkmCfDEXOImqHKUalPBDDQvig==","salt":"8eOezejCttIxGhtH7Harcw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ac78613e-837e-418a-8a92-20376dac014d	\N	password	1ed7195c-9659-4831-984a-ff734c85a886	1713371280239	\N	{"value":"fXbyX8fbSHSL0KJkqVgQ99K/uRcc0Dk5bx7df+RgknsytvLOc2KV6f2zSH45ICOnCBnkHLcolbE/tbyz3iKabg==","salt":"U2kr5K/1iDzuIofWVgbXYw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
452140e0-9d7b-402f-b0e2-352055cf41be	\N	password	2e55e737-747c-4051-869d-c077e9217664	1713448056807	\N	{"value":"LTUox+b3riXV5uncaTnNwYDxq/CV9/pLHuFIvHs8D8FNoQ9gKFG/dPZX0iGv8LCqXcsS+tuHKWwdjAXbAX1YwA==","salt":"j0uPlXLbEuKpQtkIgr6nqg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
2ef81dd5-e611-4fdc-ace0-06c23befa717	\N	password	62e188c9-8ad7-4f6b-a927-cf1854cbd68d	1713448874084	\N	{"value":"11rXkOFSEjRD6XpgWV0JX+xl96Avzf4WjbhTOIqY9UnAR4Y19dYUbDU/mZy+YX/kxLGIroF6K+SCkEJsFtXL8Q==","salt":"uggVBJS98Ot8QWFVvPJihw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
1d1c3557-239f-4368-bc80-03224a10f063	\N	password	e4a6d2e1-8228-4eda-b8a6-7ad349be1ecd	1713448972996	\N	{"value":"CR+Jvj+0RxWkNRyU4DD1pzoHxkcC6sHyLV8qzTuAYel7TCUXAK1qFiy0iM5Uwzdp7x5dSOfN8L/j/qsucj4E6w==","salt":"LtWgfA/79ACr3r3d2YnpYA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
b4200e27-798d-44d8-b64c-cb85f382d8c6	\N	password	6d5806d4-7049-4170-a86d-7f5e0e653f2e	1713449083470	\N	{"value":"W33BP/BDzbQikZoLMkqxW2bZQtOdIxoxZcryI21h3uLxZkA+okKBNYBz8ixQ4odawG1ap2plJtCXlvmFGXKUUg==","salt":"TyJ1NwnsFMb+k0AZE0fieg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
e272ff26-a459-4dd9-9ff9-fcef9b5bf104	\N	password	0bcfbeff-daab-4f14-9bfd-4179bc5dacf3	1713449330357	\N	{"value":"RsQQ9CKICr4qvkzssJr5WdtSDLXqbk5wEZ4EFsGwLIt5BPtOaIKcIWyuJXQU70P1EpO96Lh+32eYqoLA8Jjn2w==","salt":"JrL9oIjy9UTpBwkTDL/NUQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
b5d4b7b2-76e4-4af9-8455-46b3ae66bfa9	\N	password	6c3ad97b-ada6-49b0-a57b-ca93c357a4b0	1713449417479	\N	{"value":"3Un//wMGMEttTeroaa0Ras3kXSeWpxcmwdZu5lNqWirwgUIFJnYo+FmSQ9fXFYBF2TLewnz5oQIHpkFX2vv5QA==","salt":"zQgf7H2NggZ9UKZ1EOJBCg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
67c639df-60b9-4eb8-b305-85bdd9019b09	\N	password	55a9ef32-1560-41de-8752-084bc7e58494	1713450249377	\N	{"value":"noTFWEX3nl0ipCroF+UtzaVe4Qhuqw5cFABsRPfxYfO0pw9XNwHba3sAnLqDaB3PsoaQtm2RQTGQ/vTDlZ8CGw==","salt":"9rdRjx758XysfD/4NkhBRA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
9e94daa2-a6e1-44e1-82cc-ad45ad540328	\N	password	25ced1d6-dddb-4758-9716-adc20b739eb5	1713454229079	\N	{"value":"qGqNX9Ai9XBW7nrJHJy0N/4XHUOEgcomKk7Skc+3vyWWnFJpC5wpkpKiC3LX734XgQS8WqUIeaSLDKnOabJqyw==","salt":"r4/Yn6kvYxzP1xsvaV5F5g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
4fb9a51c-41db-44da-bb3c-170470678462	\N	password	0c2f832a-9252-4573-aa75-d43ceac78ca8	1713454297731	\N	{"value":"RrCjhoa9++9H8iRBbC/O4kQIhffIrZDIoT9ThY5Ts7/zNyg50NTC6FyZcE8I2kua2dd/HdmEYMNbItpZ+YsFzQ==","salt":"iTr0+7nLTDdoFcDRUR7qsA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
b75c1a11-d67f-465b-927d-c89329a8ca1d	\N	password	fa06e958-cde8-4fc2-baed-da2062e20a4f	1713454560983	\N	{"value":"dOc0mmvAxujAiHFkfuFESOBNHOa0NjPbbhXLHMPyTKxrnRZCYxK+n9VjD3fm4a9PX/KdU7EeoxyNEpovhzlkRA==","salt":"VcUog9O8kvIlxHYct1d2mg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ae95848f-5474-4ff1-a35a-1e9b9ec585d3	\N	password	f5b7c025-5680-43be-a093-28d99b475386	1713454710276	\N	{"value":"BhFOhgBvA+fUYBIjMERtVJVxffvf07wVv1IrXlCkOhJBIAibWRjqxOaIYXwNX9SUn9Nm5XRmEOH4alV6idd3sw==","salt":"rukVB3AmUXqxqOKdPTmSgQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
cb8663cb-d28f-4a64-afae-853e6c84eec3	\N	password	1d56cc28-3106-47c6-ae22-5eefa83015a8	1713454792388	\N	{"value":"7L+0PjmROhxfeEI+LRU48upND0zTU59mrheaG05Zp3W4MqhIg+8Nz89tFHqgOw4ufuYo0OjS5iZp3wC9xPQDdg==","salt":"WBA/D/l9tv4tfA2tpollDQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
2b4b9aaf-d17e-4fb7-910c-85369e11d756	\N	password	1c0e10c9-5865-4287-b7aa-2f3f95cb6ad2	1713454923642	\N	{"value":"b1qHjzOs2SWAFN9nI1tbAnJN2IiSfHEPajx2CSoGv47vheDv545mOVT+0m09rTsaV1MzA5zabJg89San7IAFhg==","salt":"vIvtgLJ0Wqb2553LGTPXuw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
c1d8d61e-8fa7-4f86-b5ca-d9f87821b562	\N	password	14a27dff-9d31-4008-924b-20ce531aaead	1713456382866	\N	{"value":"JBYplWaUM2oU1up3DjoUWfLlZM8j2m0eCQp4zTJdUyI3xQypMu9ME/UzbSVA0XqAs6J9KmI7lbXQOw7y3sd8dw==","salt":"uRZHnu4x09EdHzZFX/lhGw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
bf1f82b9-c9cc-42df-8391-aef3112aea35	\N	password	5ed10d1e-01ec-4d28-9af3-ca35d791bf8e	1713458704166	\N	{"value":"ZM7ztMqPUzGyOdcM63oDs4hEtL56DLYw3U7CUl+wXoj45wtwb1yBfL22ha5rvqdq+9JdcUkfG/wLg8I2nJGQLQ==","salt":"zQKs0rsXnqCX3ZRTavg3LQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
6695d00e-0563-48a3-83ea-c7809308f056	\N	password	24454791-6aa2-4067-b158-8b13a4808ca9	1713463638317	\N	{"value":"YiURy2yDLlc7VRPiSIdx9gTF+3AHAZFKo76xAh/gxkAXvlooLVW/FWwTZOxodPkt0ar8VQYypCginxq2aSc3DA==","salt":"j6aQIc2wqb0zH5EXl7Jf9A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
8ba67ddb-1702-4b14-961a-0d823186e8fc	\N	password	348847b5-391a-4ace-b46f-4611dee37aa9	1713463731045	\N	{"value":"elz04ySNVVcnKx8aNzhFFlLl2bjmMe/094c7lsLEX0+tfVxl4/DIwvkk+4CrDNenR+RI3YbCN2Lsm6Z4PCjdDQ==","salt":"HR3jm5zBPPJG2gUguZsWGA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
7aab4ebb-93c8-4aa9-a911-bb94931c273d	\N	password	c0ec4e2b-9e77-4567-9bb0-80a5cd82bbde	1713463908851	\N	{"value":"/gYuIL8vmIzqaG6clmToS+h9JhZ/6LiqPRWPe6dmJCnGrCw8nDFfLSSz1Otwev0yjJWgoDE3FOXXPB07av3x9w==","salt":"QfeItnEKzZc+JQYWIza+Yg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ab6696cc-1797-4b68-a0b0-42c87d27e3f4	\N	password	c85c3e28-058e-4172-ad3b-31a0f9b877ad	1713467004773	\N	{"value":"CQMvIfI4vqP87WHailmuZCGcYg5lMYt8Ncu7qMloYNOxz/nKosu4dLs+CM2HREY4knoyy8XB8zAYjDjtVwOHXw==","salt":"mA5ItZavQIfLz+TIbueJ7w==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
f41d21d9-fa06-424f-a8e1-84feaa17cb88	\N	password	bdd8865d-d55e-41bc-818a-0793d42d4804	1713467096343	\N	{"value":"cbGkqGbjqmi2qsGnu1fVIv5GyF6igrRACCthyEG1vay3KdLYxZ25eIVVElEXTFwdMPxv7BR6Bl4/lBYdsdCbyQ==","salt":"M3eogZR7vjyjqzjK0xvtIA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
42eb2bc8-4361-420d-a814-5db6e69afaf8	\N	password	d4120265-1938-49dd-8f23-72d4ee67fdfd	1713472744207	\N	{"value":"nkDGLMBCOt6sNmchQ+E4z2eCkH+ZRNYGGggAzFZtvFjgHIZ+vy765t/5BP5teGBDE0067hUvVZ3Rgu2SHM4epw==","salt":"1DsLtd0P7mZ0qGt0E0iYbQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
4865786f-354a-4cfd-8d7f-d506a8acbf11	\N	password	013ff66c-bf50-4505-b2ef-fad3f99d7c6e	1713472912970	\N	{"value":"h5zlz4OOw9iiLqoCh7Nx5mmv0jt9XK4wkt9rRatQsuZxAu0K9J/jdBjMYxtZiU83Eq80ZPLd99eqPCQhmcNcXw==","salt":"SvbgrowTUjEpZ6coNve3NQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ece5c389-0888-4bc0-a245-f0a3f682f424	\N	password	ce1ad31a-f6d2-49d1-ad7b-35503ae4874f	1713881488742	\N	{"value":"bkxyVJ+FLdbda+qDKcVZPzpuZoloH7YV90ZIPu4oOehOrC282m4+EuttEpE7C1mtoa/WQkIY/APhoDPodlRtog==","salt":"ZpMBSA7iRDbS8YTLNZuN8g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
5276e78b-11d3-4b87-95ea-912655cfcf71	\N	password	70007130-64a0-4d8b-b7ed-ea913dfac04b	1714660329287	\N	{"value":"RLDvFHw8V+yy0MtV7L3vtzgqWpYiiq9vnz1lPjopjoxfGrZUBeWM5CR4gDcCshxUy1E/umDzUivKpsy7w0Qelw==","salt":"aDCV5WQgie0r08faBRrC/A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ff468c06-46b1-4dea-b484-b04ba7cf854f	\N	password	19487b26-a45c-49d5-af8d-66f0203c2595	1714663427428	\N	{"value":"2YMU0fFb8cgzOBHWUiQlqy5FuOluN+N+uON38bVd28cavL4KT+ngMufG9HDZs57NONCsDoHJUN8XzhBuhOfjqg==","salt":"OvmBVQTwQQW7/rSI3JLqww==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
f6f49b24-a2ce-4e09-a980-72a329b0422b	\N	password	3aec32aa-9c41-45a1-a9d8-ee2eaaa0acf7	1714663540190	\N	{"value":"YisHVe+1DuSy5TkOQe1w7W4dull7VsERgIMvvDhpELT+byFdBUAhXADt/VeA5zb/6Ep6+K4/P7J0tFXyKu3Y+w==","salt":"Noq94G480CtJQEcNZ8ZdCQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
b558f731-bc10-4ffc-a859-644a034eaefb	\N	password	1f942eec-5cb1-4698-af00-586a0d6a263e	1714664185821	\N	{"value":"52RRi6c4U0L3XkdaWYMOK4mOnzsW1CairVkCc6sJj8sSRQld60penTToshxOviFi862G8gQhP70NJhHhD0/ofw==","salt":"Fz8HVU1FnKbjSWrPCLUXYA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
f2b86113-d022-47b6-8318-9669294e17d0	\N	password	cd8fe726-c7dd-4014-8a85-5b156e3db936	1714664377527	\N	{"value":"TDoKq9sNrqQtTCR1HMr9C6FFTrudrlw3brmrkq/V97f9uMb/VVKUiQ9lixZ/3bzfVXpAsyLTzreh91YiWTfKPw==","salt":"/WNdG2h2K6BPFTlIGrpE0A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
a8597fab-8b17-498b-ab29-26c604278658	\N	password	f6bd8c8c-5e71-41cd-8d73-6d6eb50d8b09	1714669849585	\N	{"value":"OIbyG+bJNuIrIUyVE8ev0E1VRasGZ7SKtYvXv+L/KC5KO5Sapz/JqY/6c3a13nHFB6R1qPJFbDJi9I6daqfI7g==","salt":"RQbJQJNCQ+fDK4IbxGazbw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
d800852d-bd20-4bbd-9f70-360b221f906b	\N	password	af141ff5-d16d-47a2-9643-1444059f8476	1714669893335	\N	{"value":"blj84ZEYR87rhJMDoWc2tsXKCnFfVamaBjSdM10TAdKhTrksEFfW/j2XrkFSbVKyB6u5OXWvRwA7V0RsX/wg5w==","salt":"sGVPB2UiRCvIrbadk8IP8A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
d078f062-5bf2-4ffd-ace8-1ab80d5f37eb	\N	password	07198925-a1a9-43c3-b3b5-d324d0ee38b8	1714670124656	\N	{"value":"tcuriaLbi+AZOCXuTO0EObp1n9M27jniLy0ZqftvKKO4ZFnFHCABBDwndi3l1GmSgdB5wZJkvu8UpU9/gdqAYQ==","salt":"DkFnbNU97nSgj16mZ0XIJA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
4c2dc32d-772b-4831-aece-e6e51f8c3592	\N	password	337939ac-8e1f-4497-929d-e1096588d702	1714682310052	\N	{"value":"XWJdDkefASAZZxXige3/Qhs+E0nxJ6/GVgMVSx0iUPyQWD82LizFue45KtaSP+qpZVKM7KqerK/aIpWTydvMfg==","salt":"Qbgx3UmWTd7WRRhM6IgLzg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ab1413f2-6189-41b7-9a26-c000cee60006	\N	password	3f5a88d3-0d6a-4da4-bfc2-9de3835c8cb1	1715025349481	\N	{"value":"y29/DZLF8DsxLlQstzIBOB5oShW5zCdRbni65UAZG2PjAL1hC5/4uXKo6IQVaRactJIc5Ssj8xQTpwLLxpnFxw==","salt":"FM08U2Rwfy+3HniMgH636Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
54981f27-f9b3-4d3d-877f-f95c93388c64	\N	password	eedd37c5-15b0-48d9-a80d-4306241da853	1715028083099	\N	{"value":"JDZL1+YR3qURU8MJB/U/XAawqSpe8fdnvYwnsFSZoftgHwj+/jxpZzsu5+upxpmQV89EuXTtwU5rSt/IqCiK5Q==","salt":"KI0+6S/t0i+1YhEYC+RtYA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
3c0e0d82-b2b7-470b-ba7b-750f63c4a696	\N	password	41ec1bd9-f26a-47d6-bca4-d9d71be87d0a	1715031771390	\N	{"value":"jnOI+RKicA7w74KwdnYe8CcYo4ptYEsF1o63Lx80sRmpRkjHZ+59wUFBdY4N379xZ41pz8MGBhj9262S/JR0+w==","salt":"QXS64el0XVKWNqhyYscEKg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
1ac4f2b6-da78-4e50-a2d5-575c7ae75c8b	\N	password	706bc342-07f0-442a-8a17-f0cbf568c179	1715182597695	\N	{"value":"+SAMiyS4vwivQvZ9Jmj2a4mfwQTlvHC/6eXheJ6krYiqgHyJzpe/fD0qZb1eB2erz1qlG4GAWaxX9R3+rkrfwQ==","salt":"G20HfhaiEubBoQrejOAwHQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
7111bf91-15b9-4b5f-87d0-a7def0475877	\N	password	70936cfc-cfc3-4b73-9ebb-fca04511a122	1715183814296	\N	{"value":"o+HDEbnSjzo5w874BN0BUTA8/RuJWCq2g2os8zcYDLSXvW49zaV9FqXE4RTX7ZMXc3Lv9mv7CzBqJYzdmbKZIg==","salt":"f7QJmxHDyUY85+sZJr/k2A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
db7cc713-924e-49d1-9b86-38c1a0d60086	\N	password	ca86dd04-d3a1-44f9-96bd-6af27acbfb04	1715183916107	\N	{"value":"t8Isl0wwAO3vrTp909td4jUv3lgQLneoUb9uDVlP3YwdgS4M/gdH1cQfkXf7nPngNDrlyKSUzMCd0AKJCMVflQ==","salt":"dlmupNTM9CL7ijtGFJap4w==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
db96803c-2b7b-49f2-8446-92cca20bdc11	\N	password	d47df20d-1474-4fda-b325-267527e61750	1715184556999	\N	{"value":"0DcVkfZta/22EJWpiJL+nleUjK+5kBrWVV4ZHoMh0nEQwFJLwkGJ/9DW8hQ1kZDpx8zK+zmyhDNbDKvbVF9VUQ==","salt":"c/Nq6SFUgvlRdEMoSl7pbg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
65c6b378-02ed-4590-87c2-2f5410edfd09	\N	password	bb0a481e-668d-4487-8a0f-ce138ba4c59f	1717796904399	\N	{"value":"LGDfwv7MsCkJkbJkd3BJWIjY1yTP0WWN6uQYV/LdV+6kY/WArkzjsyVmZbNZvtfRc7Py3atcqWssvTvt1rFtzw==","salt":"X40GKrIv6ysMlQFhUCGh2A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
f3e9b989-de5c-42e8-abd0-0efa9737c4ee	\N	password	6ac01bc6-e22b-41e6-8115-ce9628c895d5	1715192513770	\N	{"value":"QcL4VqVq+OTstHvwkSlARlb77BnzvegeBfN7+c1CFJ0uMgQLXd2RmWs3ezExuMtYlRz6RIgtGUNVGh9STcvaPA==","salt":"YAarS7pJr54EqazYAWq9wQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
e6f38ba4-c29b-4c58-8ace-55dc7f4b7f94	\N	password	81189a1a-105e-4e2b-8769-b414e8c535fc	1715192620012	\N	{"value":"8CH4NBJzbp3n5sVAeDp/PhgpFqKAbt1Nu2r5fIcGlVY1AFVPZ5oHuYOdX7AZOT+STLkBB67O0HJGGY/90VAFZA==","salt":"qmME9kUX8dFozBjFBmXH1w==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
7ce17127-e70c-467f-aecc-a31e465da917	\N	password	280de7d9-7b39-40e0-91e6-73d934a2e7c0	1715268333832	\N	{"value":"OxQ4t46KPnR8u/qraq34pAR5xMQQloNkQrDbGbqYW69yKqHmKvk0MRdkesf1Tl+SjiylAky9vwT8E1f7wT/Olw==","salt":"H4r4rU0zvlmdvTRBCxEPPg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
d8d7dee8-317a-45a5-b9f6-e7c13897cc27	\N	password	4c18bb87-780b-4518-98ab-8183e1d9c056	1715299442742	\N	{"value":"iyaja+APksVXvO/W3YqXWOS9YsD3gasm0e/hATjO/CHSepuI/2J3/GPPdqfyJs3uKK+cZigGweXImQrPtyzryA==","salt":"5ogUd2UqEPtarH8tHed/xw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
0d36d0b7-a976-4679-8426-6382f82e029a	\N	password	13f378b1-2b68-4305-b7ab-e42b902e9e61	1715299482787	\N	{"value":"+nsOuNdlpjAwsaRtAUF5DjnrkO+XCKM4eJmA6Q3Lelr61dTN+2WQpZCIOnYTZ/JM2ApMmVZUw+Mak+phm236uA==","salt":"arWWIFHsIauz2INN83iw1g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
8094fc09-7a0e-449e-a62c-7a1bf267fd70	\N	password	5b1cc316-62aa-48cc-8f2b-9a3a75d2f0a7	1715299564000	\N	{"value":"q77GvB2UfRLI2ywMufk4vDFEcoQlOJlX5XRHw2L+cApHmnf9vWJaYAMF3OFntqP6Opn/NFSQOfi84YGLdyvlvA==","salt":"prkpwcF7XOI6Bk2yxG5THQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
5df22308-0c2c-494a-97af-30f0ac28ed49	\N	password	83e0952b-6abf-4e05-ad2b-4203440359d8	1715299745914	\N	{"value":"u/vxNnmRE4U/hqMDktSHBKCt8TEVvMFpQ8g8IAqKi9cx0glyqS31JxtHVfyO2QCfQnvDlj+rrsDCA2RFlGXrdg==","salt":"WQT55btHsJKxLv9WAxFrDw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
e0e5c3d4-9b9e-4787-a079-93d2d3a4a92e	\N	password	07c28a2e-345c-4269-b367-3cb6e483ccee	1715878757034	\N	{"value":"jeeqc85laEzJaPrjgd6Zf9oiI4coBYAR/Tf55cRbSXNRfSzhmcg9hYIEU3dPldVqKzUdRCqIRZds2siWrp0i9w==","salt":"5CkciEBwEGLkSAeg8zNsAQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
47380930-c73e-49d5-a179-49696002fa6d	\N	password	540ba3cf-dd07-4729-884e-1c65ee1ce2ce	1715878846905	\N	{"value":"nw71msvQAIiPhfvjmXC/aa/LSRcIKBDbb+oo8kfosUB1VKWCh+aEM1U8nYMg1dK6zjQNnDw2CZneuwJOJIbxSw==","salt":"xNjDXt8bXGMtHxDqH1aLtA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
3bd272e1-ed9d-4b28-9cb8-64fe35349d03	\N	password	f2d53503-ad13-4206-9016-111a0e124aaf	1715888077186	\N	{"value":"Iv8GCj+IaQKiiLtw1Tec9GOGPL7QzDQ9ykGVJChEO0npvVOXXaQK1cjFNa5YFHT3NeW6wGMIQTGFO3UrinRFhQ==","salt":"Uw/AcEzNnYb0kb/ppwgEFQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
8a86cc31-d7b5-4a06-8855-b98727bb4d48	\N	password	f9646cdc-d011-4d2b-8e77-9683d9485157	1716238978221	\N	{"value":"/vAvuXvDef6U8o2HYSdpYGsmEkpAXMZikw3R9R2NxU8Z9C1BPByWFQFq490bumSByPYZ/QMANuDFV2UbNTXVUg==","salt":"mF3KkQfmHPIER8nEeDEoIg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
aeba9c5b-8cc9-4511-8560-ffe9097cf5d5	\N	password	fe8c1817-ee19-4ee5-a98b-26f6eba227c9	1716239048399	\N	{"value":"eKTTCRwVU54w4MS9cGkULe6KUzReX04cfbjfDqX0EAKko4XNXt70N/ViQ+Zy1BtNf8WJum5Zv+J/ByC8w6fkXw==","salt":"JNm2d3j0TE4thMrRXfJQtQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
57652349-f944-48c8-846a-4af858dc7f49	\N	password	2d8f843f-8e66-432f-ad97-cdfdfef67a6b	1716239293310	\N	{"value":"a8MyEes/ur+z4UsePZvejTfzlHPrOgzZMp3tFJ7m3pEsKjKKhOA/dNa8exxXrvXYfmm4+ea1qEA8gZ09KOnlNQ==","salt":"Otjl2/H9p6pygmN4Hcqf3w==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
6a0612e4-075c-47aa-ae51-e5c0b899cb87	\N	password	3a06af98-7f3b-45d4-9956-78eb6cb2dac1	1716243044092	\N	{"value":"Qp0Hppwv1JS5yvYFkyXktVXJQJiwSxs/PCHk8YjagEsF8SjyYst2BcsP3MjOu92tXhX2RwxhcLXBhpx8BR2gMg==","salt":"RQ8X2tmCOnmwnpB7z3+77A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
db02c9d6-1523-49e3-8ac7-f5e77f9fee04	\N	password	e03c9ee7-1733-492b-a495-594b67392280	1716243136174	\N	{"value":"vfMl0pp+RXLjdGF7PY8F4KBM7e1sgl4StyAiYZFSzZlMp0vWxTKuR1ky3+jB8FUyR7qcsoPaY9x/qfY4dZRK3A==","salt":"JEU4Mh1VoDTO5EulvFuHZg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
eaa8e60e-ab56-438e-aea2-6cedefae199a	\N	password	bed26e83-627b-43c1-87ee-faa094c69909	1716243196097	\N	{"value":"/VyzneSddwCHmmdIYx7FK3wg+0+k/0xFPJmlWa6Eft/9FH+QnikaRyepMcSYfQHKvbgH+kee0kvuOaD01BjgDQ==","salt":"zPAV8FBVViRGY4rE44vJnA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
1517f5cb-20f5-4554-87a8-3ced05745600	\N	password	0b36810e-f04d-4019-9aa9-099d089260ae	1716243256494	\N	{"value":"NNdWVEkQHmR0YDd/NpY80RxYIPk5tmnspoBdSCv29oMq7ydKGMQVCl5j7iT6ZkUQEkh8+A/B9GZLb5JYmQQRCg==","salt":"O2EhJbkiRRC9acbXTf+itw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
6d3ef811-cf0e-4727-844a-6e50af084b36	\N	password	f7ab8ec5-e8fa-4916-942a-ee0f24a5117a	1716401545408	\N	{"value":"lgor+3TPa9M5EQcU5J9lLnt8w2IeDuzsIacs1938P55ssZuRN2cI5Ct0kBJxtG+S2IAxHeW3lbEVObUEnkNyCw==","salt":"JWU8wH41+paXovIx4/MHYQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
6c06c001-e99a-4d61-84e8-b4b0c3524be1	\N	password	0191549c-b4c1-41ef-a55a-b3b53859c433	1716401619665	\N	{"value":"BPMiRI9O3sX4WzRXsi7I3pk6QR0crg5WZS8b3NGz4Uv261b8LyWYtVNjtYNVGAvnIIhxJtSuS0LqH8CgKM7IaA==","salt":"cthl8pNVwyZXyk0mMWlxPQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
446a97cb-ac5f-489a-9c96-ff1699996c45	\N	password	75008614-ff47-44aa-9e46-61c0f0389953	1716401677781	\N	{"value":"CT3evJPhWW/n6gPB9NsyobDtEzR1uQEKOpNB+k++Zg/cQFt0RbvzqF8k5nWWE53AGi90NWGbBk+K2OeRlrBVMQ==","salt":"oCOrCp9w2w2t25iULIWfIw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
b5e65eb7-1949-464f-b8aa-b6bb4f882fb7	\N	password	035b10a5-5a57-4109-b6e5-58e83a41c496	1716401780722	\N	{"value":"mCetCnnbRA0lgY0KXYWNzLZwHkomD3lbk9ptbkrZXFAWonSAER9DsSYegeMzTk92OkHNdzJFlZZq+ny+8Ix+jQ==","salt":"uwkjbA0Z99MmOx05oWj/Tw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
7033a086-4c58-4312-89b4-aca2814d351b	\N	password	925d19eb-3206-4a7a-9d99-219a3f82c12b	1716401949767	\N	{"value":"ezZj5uEiuszP7m/9OZ8j5WcH0t1vXV60a5JrKKxN+R0mR8FPPepLJjqgp8VUCuoAhNDSIf8pVc0wPjAHHucjAg==","salt":"oJ2L7cBV6Awv2dnfnWeXXg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
c8710882-426d-432b-8119-8ba5b3580a92	\N	password	e58ce787-4046-4abe-923f-a912815b6f28	1716402018728	\N	{"value":"9HIXJFUygpPIA8QFDSL0QnhwpUrieZIh0esUWedjSxnVTnCOOfqOVGVl311oJkTxsxN3SOll6G/11qFIVGqfCA==","salt":"Jd7Gbk4F/nGLjjDUveMnWw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
29eb0504-1dfc-4a7b-ac5e-a43f5353aea9	\N	password	ae72dcfe-2dcc-4a1f-b931-3df25ac2f2c6	1716402199115	\N	{"value":"UhiKrfTkkG5g91AgEDK/Z4olB6THCJij+cQqQ8PPy5oQYUcZFJMaBzY3ASfVVfZ1w8KtGzVcAoDmOe9uynU34g==","salt":"J1/oX1LoL27mgc+vBBEltA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
0288a29d-8218-440c-96f3-789eb878cfdc	\N	password	f1cc39c3-627e-46a4-866e-c855cd614192	1716402422809	\N	{"value":"deIWd5nxFaL5Sd6LH/1M0phCofvrUCpGJt58U68WW0s1SWLI39ByOj2mda5M4aW0Puap8a9G3we3PeN2kvPajQ==","salt":"jmyMnpM+9ep3LMdfxbT/0g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
d01f19fb-7689-44c0-a484-ededbd5ef703	\N	password	68cea77d-6e1e-42eb-abd5-6d4abd5a3efd	1716402489071	\N	{"value":"1DwZ2mtRx7XVXVOoW/ldiS4W9ICejtJ/0ZJV57yyyD7hFT/UbssuzjgEql1w8e3leIsUnXMU3qrRsNWiSyKakw==","salt":"SQxhPWpcaHyFocoZy3jXXQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
e70f0d48-08b3-4f45-b9c4-c21a6cc37c94	\N	password	f303d92c-1307-4f8c-81c0-7716654c0e5a	1716402600909	\N	{"value":"ZHLbW8hMSoN9nqPOE2eCM/yeGoIFL8gisjrhrHwiWIY6Ze8BpUQFT1mmmgtwJi3RVrZG1qjRNaKfp7E0Ry762Q==","salt":"voBybWoM6SNUZUTXzlDBxQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
f3432d1e-0650-48ec-ab9f-93f1ab023f7b	\N	password	e44ea30e-2c92-4be3-bfa5-fe904b7fc17d	1716402659169	\N	{"value":"c8EX+KSCJxAHFEipOKaoV5LMr60r/WhLL/C5mynBFMQ1heHHChkctuYY94ZpQpgCR0BwFpIdcWOuPKBS1WxElw==","salt":"lPtKRlWQ0g20voMPTNvRYA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
b2513947-efb9-4419-a080-61f6b5a4ddec	\N	password	e6759928-1740-492a-aee0-dda5cde4cefa	1716402725894	\N	{"value":"4Q/i1WBEfbPnSDLl7UA7nao4wyxppYU1cZBMtYD9LypfO77KDoYz51gX8wOVIpPNfACQPUfvBIgvWbuPA70JJg==","salt":"qToKg3coxCasmCURP3txWA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
386612ef-eeea-45b5-9900-0fc8d01764af	\N	password	cba635e3-d5e9-4fa7-a57f-75d50134ab2a	1716402827167	\N	{"value":"8c4OT6yFEZoRBtde4oQzdNgVQbzAYGgm2ySwkC/oKAVUCdAKhLaiZyXOSnQIvQsxarqZBV59DZubYZA3dY4RMw==","salt":"I+otav+jvqaRw4SjgN5m+Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
53a326ec-9a77-4224-963c-127348963bcb	\N	password	d72d2312-a69a-4531-9490-ac895934a10c	1716404513970	\N	{"value":"lzgbcOH3QBdT5F4iHwaRohlSCFx3aCuiZ1tHo24juUooXrIJF5UXcrqspopp2+SxnF9rjtcxX24Vtenr88shqw==","salt":"JJSTmUbTbbleBVnQzeYD3Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
075f3f7f-e941-4193-903b-85aec4f7f2a1	\N	password	4cfd6767-855c-4847-a726-a1d5af24904c	1716416611300	\N	{"value":"s93V146xi0qLQkn9QmKL8Sh8BWgsRvNaMuOn+tJ+/LgoGrj1qVyrOt4YfjY1ktBDLP0W5B6LUD+DvXYJE3UtxA==","salt":"X+4pXWLRbUrIn5KFmAHNPA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
bad751b0-bbc5-4251-a967-7a34495651d5	\N	password	3d47428e-a4a5-45fe-9b84-69211387e812	1716470302309	\N	{"value":"oJ9low28Z7GbaifXf697FRjr0a9bOILrrdkC3GGFQ9CsiasA9gZyKBqTKPpJ5iZEsILwxMHrrIpZ99VF20NaCQ==","salt":"DOeYHg1Ict7tgtzI2K4gdA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
3e6d2ec5-0242-48d7-acc5-eef125e24fae	\N	password	511051be-8c83-45be-b4c9-822647b58ac9	1716470423377	\N	{"value":"SLkM7YGG4Eo2Pfk2G6SPmZTHEghq+rNhDo7qrXgJEYw46SZBWFcAq9AZuLjqaJz+EjCySKiliG5cWGZu56fmlA==","salt":"m4z11OB9hh7zSHKRFli7+A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
04247ffb-f3c4-4f19-b0ff-583f9f159f9f	\N	password	372b8deb-5717-4e23-a1d9-5e404a5eda8d	1716470432597	\N	{"value":"cTBArXtTKQcs+UqR+cvuC29c2JhiEuha51JydsSa9Kog/OYWs2l8G1Q2D/chmhUybXdNWjQq7k/s6ywlqPqwqA==","salt":"gE8nCfYtdlb+s+OJh5t6Yg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
e5257ac2-0073-4233-b810-9b6c03b4c425	\N	password	81bfca7e-1213-404e-ab5e-d46f78a6b240	1716473070183	\N	{"value":"JrM63B/Rk9Kxw08w5GKMEwTYl8vLENTC/zegPuIDGcci1iT+5xrKGr93522zEWXRJwhs5yPaxt7NoV0r/OOxaw==","salt":"2vCtiSncE/7HxSjGjxwwBA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
083eb1fc-aacd-4e29-b689-925881b54426	\N	password	91c7e988-2e94-41a7-b82a-52cc65b5c311	1716473229428	\N	{"value":"bHjcpY+YoywKdu9mAomaRq+AmZ/9ljxrsxAoVlbnRJ4atMqqirYl3ZfjZqpvd0dL57zwz+vRtO3CZ2zYAa1FJg==","salt":"vTS7gXumNnyAdCXUC/H+jg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
001c40af-32d3-4b3d-b036-e3e753b64773	\N	password	a8a25637-77a2-4734-9b21-17a63a6080e5	1716475750300	\N	{"value":"xOABzwb1+RqG+ANykqJpQQjxH2wyrsTCOPGuXlfpmQWbIDT7FAkLygMa3hD+t4fYX4Vy/JAecF9l8pMNbQpiDw==","salt":"dxUFdoBmIfylufKtnH8b0g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
13414f7a-e45c-47b2-8071-313f023c1c78	\N	password	15e0ab82-5518-40f2-83ad-7d4801520b41	1716475897504	\N	{"value":"brcyN3zNFWMZDrIpQA/+A5O74rOcxAkgDn9XFkP936bnsSjuLh2fwRo/OiDMW5F3ozdOWdxagl9TFuTdl/AkHw==","salt":"yS0S/QetyL/DJ1mLDqa6TQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
9aff3a56-ffda-4c36-98cf-b5f734bedbc6	\N	password	b61087a0-5a1f-4de3-a534-0e0cde9334bc	1716565664898	\N	{"value":"Hrkvih8mb8am+0WEinrZm6kvxt072pQIzjc6EoQDVQe79ay1pEEETDP0ylPJPI14KXosjfNtrRJ49nZkS28qzQ==","salt":"kfECEyskve7BHm8l6FZA0g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
43b9205d-3e92-4ae3-ada7-08d89559853e	\N	password	5fe59f21-5600-430b-9b7c-2f239727e1e9	1716581678317	\N	{"value":"2no7QTCp/BQmAYhCgypocoZVlRoV6oZQT61Rjg5fbOSwAxsGHLhHLVB6YnHrXhKZbf9o/FHtkIGOds2e4ai/Ag==","salt":"WFiKVwEaqkEh0E2JAmOF0w==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
2264e22f-3afc-45ff-9226-eb83afdcb43f	\N	password	57df4412-71c6-4122-bab7-c25f15762eff	1716659520206	\N	{"value":"afmo/8+hmEduy0bATXLIKao09UcZPurnW0F8pVj+g5eZQOmbrfKQx+rUZopLZuR9jPw7dkXOlHYR5vYMdGGhvg==","salt":"VE7bSX3FvnVH6Oe8+igyJA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
bf84042c-ae4b-480c-a95d-4c907bd0a4b5	\N	password	c9c15bc1-c4c8-4803-b326-7029b200e86d	1716661762521	\N	{"value":"4OsL5LO1KkNjnSu8BvhMwAGjEfB4O/i1MbbGJFZ369ADbfVurATZYaU2lP66zRn2J9WTxZWeuX2x+jzpmxj7Sw==","salt":"wzZUrDUTtOdBdVfmzcwr2Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
05bb3f78-65a5-45c4-a81a-e993925747f7	\N	password	c6e6b4f6-43a1-4d4b-b3cd-6ebe217c23fc	1716665993686	\N	{"value":"UTAanK/P51+W14mRPmdE+1UHkWYJNCYhSz6WkqfFbzDDblkfvCRupTZ/wuiiXukubSFBF+ISLY9IrafB78JJwg==","salt":"LXQHGRj10Y5mqHRoTCxQXQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
add5554f-ebdb-4023-8908-175c4738a714	\N	password	3324511b-2f8d-448b-892f-25f857a503d4	1716673387602	\N	{"value":"XgM8RnbStHMZ3bte6OP6xTahuK3U9WQdjYnfvf444PB3W1GVMnz2iLZjZpw7W02Cnir7NpyRMGvwDnt95nm5WA==","salt":"s3Lii+A6h3GGz5DuDkduRg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
6cbc369d-839c-4e6f-a0ad-2e1ee323dbfe	\N	password	b6441a09-8195-482d-9dde-446c1c995bc7	1716673472666	\N	{"value":"/R6DK42FCxiqR9Wcic3giEyBncY4+Xq5zIHh+JqUgYtE7eVm58tlJrM5VmoEOpRuHljY5SMvkQa6wjfrkQhlTA==","salt":"yjrkbOUdStnjQnkaZm74bQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
9653b26e-aff6-4dea-a4fc-fa57f926d416	\N	password	eb5df34c-a0f4-4296-957b-83f1da6e288d	1716673660068	\N	{"value":"aqv6oXOretPlHQzeZaVpuImlQqdtANhWq3ABu8eVkg8O+f+0qBFkAB10Vf5vf+nucQ+V824Y46BlUtBH5bwz6w==","salt":"wVIXMk2waV+IopPeESQc/Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
cd54609f-0757-45ff-a8d8-36f0bd7ec6f0	\N	password	3ae3bb30-495b-4b34-a10a-daffae687b6a	1716676483495	\N	{"value":"QULZsbI5KOyn3EUI4BjK65HDnWwYc/kvV0ypY6Y7TLyU37FwmCbdFPpu0Ck9Xo6FHYyI9NGKLEnUAJspnFf//Q==","salt":"Vvr2sbapOOxvkDudTuHkCg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ea6f4d77-207d-44f2-8bc3-500a29f47d82	\N	password	35daef6f-2cb9-4f13-a509-68a58af4adc3	1716821406815	\N	{"value":"b67DBEXKX1h/neAOaZgLjVkVyWtZiLAWgeR65zJ7ur6B3gZG4uVy3H2/FjpqAOW+X+GP76E6FocW5c1XgP7LrA==","salt":"TBnT9B+AvLHdV+ucCu30Pg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
099c4040-abc0-463c-8795-7a7fbe7742bc	\N	password	4e0eb1f5-c48b-4884-9888-f0073e6370ea	1716845320203	\N	{"value":"rrrHY/Zb6E256f2hXML1eUiM/jKuJLNvBwYXbnTO2N0od5n3hl3+pt9XQd1GdvPqXnYAkkx2/lbTVvpztT+3vA==","salt":"i9N/BdmTGxtQLph/2H+oIA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ba1beb73-1894-4f1e-9edb-176054b5ef50	\N	password	0338153c-c9bb-4180-90b2-4190324a3377	1716987086719	\N	{"value":"vLooZdHl5GJ0MIoSidDqZp0Wl34ktFYLWzqXJS2/ubcnSiLpuaV7zLQnQs1zTdKdIfBeoaClmcTOmNeygJ8Mqg==","salt":"lc2ASyuskdFePMsivSFaDQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
83a036fe-66ce-4107-92ef-8b0a6f77cae3	\N	password	805e10e2-6ec1-4c1a-adb9-03a64b0cff7a	1716987163758	\N	{"value":"uQq5jLnp7RXwfaHYskN60LWLNAVnCIFdJrSMxZpkBFGBAYBpeCHjPs41TLSWW2pWz+dqJkcz2A7Hlvv+70kqnw==","salt":"iUlx740gb0rBg6rptC/g9A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
acdc096f-c71e-44f3-97e8-5c930eef27a4	\N	password	13f96781-987b-4ad2-9713-74fcf62e8829	1716916347476	\N	{"value":"KnjC0uh271P+rQPVNfuSqs36hwj2ACEsgxFQwoAG9+yo2lVuw5IytsSX08tTPERT4HwqEg+FWPQxAYGDXO6l5Q==","salt":"dvBPvM6pJbF+CLkvtksMyA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
1cf47f95-0e49-4f74-97fa-91d4a36ae3d7	\N	password	791f4166-1d93-4098-8a12-95dd373430e1	1716934054590	\N	{"value":"6QYGELJgEh4+YRYQiCjNEeljjVMrkca6+7VbKczlndTg5ofHcmhxRkNoHAsSDpbJbfh84CPYp+91TK6UGJf4Ig==","salt":"0ifvrQD2PV0k3wq4KDI0Vg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
327aa97b-4662-4a22-9d52-b8cc1912c400	\N	password	db3b6fe6-7c1f-4f06-8ce5-9ba9a4c7eb51	1716934448073	\N	{"value":"etci2aJ7TQv6qBYNqkADL50vragombtGXegcyT2wEnIlzz3hxlQaGHwSebMDE4bJh0uLXvIWMSyb4EmZQXrr5A==","salt":"SHrro6nUC4CB3dJaElvCnA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
f824562d-d3c4-4927-ab65-a1beddc1207d	\N	password	caadbd8a-e8df-433e-9e06-566210465713	1716989605342	\N	{"value":"K4zA8jbw2fGTqlHGJ+olLIibTMZRHa7D9KY0motYZuB53CfqeYeFhSEg6eqBvEE/81hnbFvlwAO92lIWH3bM4Q==","salt":"Gfd+sA0RjXnXyCxnA2UHIw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
5cc6cdb5-8fe8-4501-8cae-b575f25df1cf	\N	password	ea88f7eb-e576-45ab-b59d-22cd42dc1c0c	1716989707922	\N	{"value":"Jay0oSqYg8T9ecn4qxyVeBMHru4yiRfNH7WG7qnu/WMt4s96VGLqUfBMJBXPehzDGWI1PADRGMLju3eIy7CMUA==","salt":"hwnNOvS99hauGf/JkgK6xw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
16a2d802-aa1b-48a0-8e2a-b8c6dc47fe07	\N	password	2af08086-5b2d-4464-a2eb-9f0a85372011	1716999938196	\N	{"value":"hKLfvbvMU+KlGAx11HJgleO922q+vBzDk0qGdss4p/R9XkvHxa3yIToQ2dVCNXcBcmk1RAqyr1lTaG86dwwe7A==","salt":"ZIs/XNlO4WuqdYT7MtrWKw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
eded3c46-0cb2-4fc0-a53f-491beb6f671c	\N	password	02e3b196-b475-40ff-9d92-36d3e1737cfe	1717015802403	\N	{"value":"gHjX1I/aWL7zTwZg3ehssyRU3HtgvcplhHnfsnZ8bOafLpaOfgCyszCabPlEsQE32xFMH3IEKcL6KelDLkqidw==","salt":"JjMidZN45BrFwPnx8THP4Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
50e1d354-6131-42c2-b05e-2f9f614ee643	\N	password	a9923fd3-5d93-4e6c-afe6-3674244a196b	1717082222690	\N	{"value":"N5xKpF+hfY6UWtkmjXYavQOlgWrWZXF1j/rStopJ+CmQLjxisrltZ9nwKhbGarar2vYwIg1qTG/9F29st2XaeQ==","salt":"3xLLRX88EEZ0uMzQdTDGxA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
9d3d4220-4208-4ceb-bbf2-b324799dac03	\N	password	0ee263d7-6a84-4f49-9d82-516c58d6d1ee	1717109570469	\N	{"value":"njhjQEE9vFaIJlf7x+pLNMccgbP/3dLvIi5+/BnZbhUBn2r6s2kuHtMQpsMbdibCEiZwXUjqDcoVjHlmLodPZg==","salt":"og9CqQ5S4M1d/VtxgiNbIg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
c3e5ad62-8fc9-426b-8bc5-a5c6839a8dde	\N	password	1426fc20-d890-4ac1-b17b-b8591e688509	1717020048913	\N	{"value":"F2LNccG3MnvlQovCGEP05Y0pJyTh6l9fD6/HwM8AxFi/it6ixde5pyS5kQxSRwaPJUYQsOUKIHQtJaMrFnFiag==","salt":"O3uRDy4PK2I3NKTTh8+hTg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
dea4a27b-9990-424c-8daa-6753a772802b	\N	password	7d31faec-4180-4291-89f4-65d9abd68f1e	1717078703429	\N	{"value":"tsWRHXbynRpkSfBzAfQ9i/bKOjkMPbPFFkC2743LXiunxMireuf8dVIQQXNK/NlhYMkyW4j0g0JYGvu/Q4JREQ==","salt":"fC1tCL/9A7UNpAhStBYL/w==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
1bb660f6-26d3-4181-af21-af6c31d89d78	\N	password	80add0de-c8b0-4397-8ac0-2a907944c2b7	1717078723329	\N	{"value":"B6JNsjCe+m2v6BL72H5vU++T8ljQVOUjAWq7rCwtEUPfyDgaHkF6GvAEkR/u8VBdf7jG/G/0+yY++mjBR3jbXQ==","salt":"NTRTRvE93qtk2XTOevx1Sg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
0443d9e5-f0ab-457a-9768-7735aa9cd0ee	\N	password	e4ed9a81-8086-4034-aceb-32877b82a314	1717078812100	\N	{"value":"IheSI81oolBkJ4wkD6crB7mAH0VBJbDXjxXhQw9h3ip27LQYX5c/j3p+BSmuwu085ssc72W2+FnXvwwacVGAMQ==","salt":"1byk7s9jpxakmr5rNw484Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
c302a65e-826e-4436-9e18-3dcc80e4fcb1	\N	password	16003bb0-854d-411a-b23c-f658eb33772f	1717078842279	\N	{"value":"z6xE0lzZmAXVsD9hkh4aBiTpt/tIX2vogBHXx3bUhXRu7Uvftc3WD/gRNyH6KzTKsWTvr61w1dhEnqUjbIJVAQ==","salt":"LSJRhyO2T4DT+S3FBHwnSw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
0fa99f64-2814-4113-bb44-e8d2c43fb08c	\N	password	c94ba7c0-c3ef-4646-a1fd-038983c70da3	1717079061075	\N	{"value":"GimgZHdKLl2Nhj2RV58VDIrlqxN1h246VDAYdQkx+Vc98qnuDKkJnjWKTpxKkT8eb00jjgndUARqIlX++evYPQ==","salt":"tRPXDx/pAWI//fhqMEVEpQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
df687b50-3bb2-460f-b4c9-62e0118af691	\N	password	be9909fc-13f6-4fff-baa3-e1346683522a	1717082363086	\N	{"value":"/EgAELp1+AwrCGlUYTs/Grv6y8A9xPpgpa290K2/rHNqFwQ1hHWiDl2Oe8R2zGap3A673YGtaZ9h0JJPhD21KA==","salt":"CGjVQ7nNZvhjnOVZmN9cbA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
e171a5c9-64c0-4d9e-bd1d-9372335fa37b	\N	password	7585e09b-bebc-4c47-b85e-b9e33c2a384f	1717082619129	\N	{"value":"bSna1Lmyl0iICaHYrLjeAsBzx8pbd4Yz2ESe4d6+BPEcqW7+ZhyD+jbnZaqVi1TgVfUUFDkZMuFhRddTAUapzA==","salt":"cWsuodSYUEkE0MgHdO+Ocg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
d1c569a7-9098-4925-9716-e304702cfabe	\N	password	948241e4-b2cd-447e-b6c7-53de0db9bd67	1717100445382	\N	{"value":"yulZPAQJhx+XuiaIQAzBZVsWh0maVZXDbABkD7OqsMXXxpMOjHRmaCLtwodvwlKu64UBNlIzi/EFsBYxLZ5lKA==","salt":"5mVm9Bfh+JMqFE17D1Hn9w==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ec1be91e-b4c2-43ea-97fb-7d41e07ffa1a	\N	password	8839fdfc-cedc-48ab-a2f8-6fbc97e6461c	1717100456724	\N	{"value":"V4Q0JHZgkthyffbECrkbG8VpSuLrj7xGbg9XZwxlJjz9BPnLgxgxh6FTuVHT7r/2oISAYUAJSIIdmylWzKh3SA==","salt":"erPLdqH6H0je+t2tc4u4lg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
986a45d3-92cd-4787-a05b-97836ff57bee	\N	password	a965ae6f-b24e-40df-86c0-7e1d0607badd	1717109643175	\N	{"value":"rv2CQgLv2NqOVd/+Exs2KYYvb3/8JCrHaMDAblJY5hwGIyNGkrsfu9pI7eBJMGMYj5SZ4WtBUN7peaP4zXWJfA==","salt":"wi6aSiQq+4BpaUT5pY9sDw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
82a87cb9-52b1-4215-94f4-f2ac05ee35a0	\N	password	b69ab408-6989-4294-8d8a-b05b109e923b	1717109728881	\N	{"value":"SG4LMDvtnrRkiJcfcCWA+SFoXNUw3733IF7SrcB0pgH+6fa9zKYeZOAZD45vUA9qQhdGT/ZdnPEzF0giDWFlIg==","salt":"fjf0H9/B+i+SOXE3JXNqJg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
5b42f455-6583-4537-b223-23e7e0fe3b16	\N	password	56e1744f-84ef-4d1b-86e2-554745fe7901	1717179204502	\N	{"value":"yAUnZz8Vx96PcsrwglEpT9sx/g9av3UiqMQCuWURVTN4ScjKiMkyRp/nHcbiBKtyWIjoQmduBewPnYppXGE48w==","salt":"9IRuhlUet+QJVNgnW1MshQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
0a65175f-82ee-4a5c-bd0a-18f3445f826a	\N	password	01f78740-8664-4eac-af0c-89eefafb289c	1717681751574	\N	{"value":"WNRt8zpQcxAoRCAQpfdbLI+nGx8a2Qg4kGcCHewFpeIhgTiZon5Bic021xiGdJArzEc21R+ZOWemYgOp5XuDWA==","salt":"tI4SLsKeejNqaT5AYPpYrw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
b3996f27-0d13-463b-af1d-d2a22525fa9d	\N	password	5059ca45-50fa-4416-95e8-0eb6d92400a9	1717682237382	\N	{"value":"3r/esDhvEGtkKq2OdhQfeWtukMaKXFxKK/o1p70OCVwJ2o/peECzye2SPLLxz1flVYR+R3ZZSKCmFmwq1DT4/A==","salt":"DURyLrt2EFHSIHdheIahUw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
59d4d7a5-ca5f-4375-8299-001e2a14650b	\N	password	42ff0fd2-c3d4-4edf-bb1f-80443e8650f3	1717682831726	\N	{"value":"uD1hdOFAHKljtUBbsmnwqcl01lagdHPJoTvigGIR+XYphOzmy4AsMUNMDqmtMdWEheBpXMwQ9gDay/AN2lsJyw==","salt":"wRBXWU89vqFLAJ19p04p9w==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
579f1e8f-25c3-446e-9d2c-91f44b2cbb6c	\N	password	1a6245d4-28cd-45be-a912-e48f2270f010	1717682947808	\N	{"value":"nNuV4UvZHPdiIS2v78Gn1xtrUTyHokLH8PuptO7hfe9qRQsXQegUd1Bpr8GZw1Tfb/qT0x0al/sntsqj05Xb4w==","salt":"mzj3aBOrodOTGgkM8hnnzQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
b0846067-c996-4aa1-9275-b9b19374e921	\N	password	d429ed65-c31e-48f5-a228-cbf1faada8db	1717682953306	\N	{"value":"5cYFIJY/lF71K2U3TQtOwYJO+lVpDuid/cO8wikgTI1uIGsfIjrw6YKqqWZebrpYsM6LH3iQ8R52CbFW7utsnA==","salt":"JHs17yWJyjPJJ6lqfXefUg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
92df06b9-8cf3-424f-88f0-b39c91881357	\N	password	bcd00946-3eaa-4b2e-b06c-b029c3fb85b9	1717683197931	\N	{"value":"GZOjy6p6Ol3VxyNjfCXOqY68YsBqPYTEjjIm4sbZP1KAKjMEW2pWlNIGUp8zS649v5Al93H1oB1a2OA5/Uthyg==","salt":"Ii2l5r0ptc/s7XhI3elmdw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
9e7b6f34-1cbf-4883-b2de-cc0e66a82405	\N	password	fb1a13e6-891c-4a9f-bb75-53d8d64dc8d3	1717683665802	\N	{"value":"Q1xtFMRYttk2SIGcJgFkEtvJ+0toTqjPRMVCExXYQaCRRpAUgpz5NE3nf1ETkCq+aWpTVgb02WIb59cOyugZug==","salt":"XknNdH1HslbzJe/dgthUTw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
f0deb104-82c1-42a1-b8a4-a1a264630ca1	\N	password	f5f74d64-8d49-420c-9906-bdfe82172a5d	1717685936064	\N	{"value":"ncG7t/XIRQdgWTeoCjL5CtZr7/l6G705V0xE7/wflgnWOuVx8NEE9g1biMi9Z4Gw7z/NuLY9NZBZMS///m9aew==","salt":"b4JKj4eNx9Ik6E/sUGMSyg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
6039f554-997e-4201-b3c0-69d9ad861c22	\N	password	8c547b32-b654-4481-9128-96eb039ff339	1717686593335	\N	{"value":"A3qQEFExM2FfvYHYPFNEO5VyZWXlHylatU+WoY7dtQZs2p3jtCUz7Vi7ctU4V/FEvZvULtE2nEiKujz27tz7Lg==","salt":"7nnIup0jM8Au6b53FuYiag==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
2dc3a93d-7386-4f41-8a3d-1d20bf3d93d9	\N	password	55eadc3f-ceb5-49a1-9001-f562ebc0c3ba	1717686644569	\N	{"value":"uyzD2Tz+oBLCvlCxHT22J2cZW+1Z9LDM5f50FNxsuRRZDU1RBjxX8Z9v2j31XTjWNWwEI9jYRThQjsfPYk/lkA==","salt":"xK4OD1ctcy4PvTZiUKT2lg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
b2d5176e-acb7-4e76-8df8-9b8590375561	\N	password	51b5964a-662e-4535-ba3c-5233ebac9155	1717686710223	\N	{"value":"90jgX9ZM7m9fn/EszEB9f/h9w+2SKID4yJwQ/A11Nqw7LHagIOO3PouLPQjAXA7vh0HASr031fofrnVwaHEP8w==","salt":"02qyMavZJkx0EllpjlZL7g==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
56f48c3b-5edc-4ac4-b271-70a599e61bd9	\N	password	dacf47ca-e857-4227-a9db-b492f31de9a1	1717686711417	\N	{"value":"mPZ0JfERmN9XCs97gYNPw6KVEziXLM9wdxCti6gyVb3qY23SwLGN/HdZdEhZlp7FvXSGi+GhfFsU+i5jpneIyw==","salt":"g9YKyaJxyd8D9M8kQJZSLA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
5d599565-b54b-48b7-afe3-c53041a92cf8	\N	password	03fcdd36-6140-46ff-8143-9c5e26ff48ba	1717686815524	\N	{"value":"zXCHvhr1s3gMYez0xKaV0Fg5JdPPlryK9wWVcTJ8lBaSJKOcUyrcTA5gSZhBlUoOnUJOSjpkfDpjUKr6KfXdLg==","salt":"l5YtO/Dtt/LYWqhO4eCGEA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
b0517200-69d5-43d4-96da-4f56dd9e1ad6	\N	password	9ecbe786-985e-4797-b0b9-2265046576ae	1717687568777	\N	{"value":"Jx1+eXoggo3FWKYpeZM4JC3ZPChpJBr9PbLMiVpalYv0RjSweDrIZKSgMuSOLAndMxDxgFjJImGQwg1wiGAX8Q==","salt":"Lv+GzjFlkkcGRV8B9YLFNQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
1d14d725-b79c-4235-a770-b745e6fdb39e	\N	password	648daee4-c126-47cb-a1c2-8b3a636e29bf	1717770174891	\N	{"value":"hs3NlxnczmZpmVlsVDjArRuTSPLj1mWprcUyrGVp2ZM+M5rmYFiY27DtiuPPHJfYNe1VOZJnXYndBEeNgIamnA==","salt":"Wh9V0aAS0/hn8RSRAEeh7Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
a67c5bb3-d8ab-4759-bbed-d78a1f0f0e1b	\N	password	6f5271e3-909f-401d-a38c-9eb41a1e81b0	1717797075599	\N	{"value":"nX4KEd3r5N/ZlEi5dnAhLotf54eqqrqyWdE8rH6Nw7mzuF8LOss9WjKsVyFUIRFtgHZyyy1PspIz32gRHww8Sg==","salt":"o97j/u9wmqyxkEViudfx1A==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
1f450713-9018-47b2-8d3f-4e20a9c6bebe	\N	password	49e7cfa7-16e6-41c9-a3d0-6311ca810032	1718027014364	\N	{"value":"+MSl8D8S52XH7a07F/myd+NgTybxbzyx8wPl1wjyYl4h9Em65PcUy7BKIaDls217RvEAUAV14vpV9Hd2HPBa6g==","salt":"b2tK4hFD6pfgjUo0zv3hRg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
e4eb0e40-52f7-457e-b463-13f336d3abd2	\N	password	89b7fe9c-df72-4489-b7de-74d8c4170712	1718030913729	\N	{"value":"E0u5V/JpkRe7JmSfvnnx1hlcUodLziY3VMG5jmhA2x57Lr9aFgSukKQKJoTCAc30Wdg2gT8VPi/uVNXcnDFgvA==","salt":"BeVUJ/IhkwYuKtpNf99z6Q==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
385c1fe0-e458-4fa6-be91-c13a0ad9a849	\N	password	4f95c6e3-cfe8-4c0d-a72e-bee793b66ff4	1718051828742	\N	{"value":"T1lR87TLtEDuQKWRNv35gNTOllqSt/XoCQUcVb7JgBIxclDosyWQodsEr+r94gy9ndc3z/PUBXCyl3xbJ7D43g==","salt":"WjjREbon+ecYs4nJ1RdFtA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
6650f89d-9843-44f1-b9e1-4cf9b0a2c082	\N	password	c4d7ff3f-dbac-49a6-a812-6529e8f0dc56	1718304981020	\N	{"value":"Fl98UhQeTIqUtNGZ/18Q9A2dIKTLmJ8A0z9VfF2qFy3vnIAUjjvZ6WQIBK9txG827Lals98Hp+t8tccDUMpWaA==","salt":"3Qym1zFA9shMDwd0geuk+w==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
491a9291-012b-41da-934e-53a1413a6bd5	\N	password	965141a7-abe0-4817-839a-7931edbe2bb1	1718753303542	My password	{"value":"pU5YitQ2ASgartoLeBcjgeVor8RqZWBZne3y+Nhbnx5oD76PW0kJy+PcXf1NJIZoE611EMG/GGAQ59sBa+ZTWw==","salt":"UVKSYYYkM+PuJKDaFq1VOg==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
8e0e60aa-975a-4c1e-9a9c-83977a879d87	\N	password	32733d05-b2c0-4dc2-90d7-ba39b82725a1	1718641090822	\N	{"value":"vP/Da1z6XX+9Jx0zfdu3AGVN9aI/3ee/drGl2qhtvR8bMypqo8D6Avu8f/mN9sPAzHeLwuf+lK0tYblBwrHmyg==","salt":"J0BGL8gk+awu2BtgTXPtgQ==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2024-02-13 15:47:14.445397	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	7839232414
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2024-02-13 15:47:14.481739	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	7839232414
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2024-02-13 15:47:14.643279	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.8.0	\N	\N	7839232414
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2024-02-13 15:47:14.655827	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	7839232414
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2024-02-13 15:47:14.951585	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	7839232414
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2024-02-13 15:47:14.959834	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	7839232414
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2024-02-13 15:47:15.2689	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	7839232414
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2024-02-13 15:47:15.277038	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	7839232414
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2024-02-13 15:47:15.302429	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.8.0	\N	\N	7839232414
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2024-02-13 15:47:15.651568	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.8.0	\N	\N	7839232414
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2024-02-13 15:47:15.844877	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	7839232414
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2024-02-13 15:47:15.853635	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	7839232414
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2024-02-13 15:47:15.949122	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	7839232414
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-02-13 15:47:16.004682	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.8.0	\N	\N	7839232414
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-02-13 15:47:16.010983	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	7839232414
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-02-13 15:47:16.017564	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.8.0	\N	\N	7839232414
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-02-13 15:47:16.026551	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.8.0	\N	\N	7839232414
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2024-02-13 15:47:16.173382	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.8.0	\N	\N	7839232414
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2024-02-13 15:47:16.280163	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	7839232414
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2024-02-13 15:47:16.300273	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	7839232414
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-02-13 15:47:17.627857	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	7839232414
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2024-02-13 15:47:16.308958	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	7839232414
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2024-02-13 15:47:16.317861	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	7839232414
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2024-02-13 15:47:16.433787	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.8.0	\N	\N	7839232414
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2024-02-13 15:47:16.465341	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	7839232414
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2024-02-13 15:47:16.478784	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	7839232414
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2024-02-13 15:47:16.599382	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.8.0	\N	\N	7839232414
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2024-02-13 15:47:16.823462	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.8.0	\N	\N	7839232414
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2024-02-13 15:47:16.834941	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	7839232414
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2024-02-13 15:47:16.983413	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.8.0	\N	\N	7839232414
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2024-02-13 15:47:17.024696	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.8.0	\N	\N	7839232414
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2024-02-13 15:47:17.083534	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.8.0	\N	\N	7839232414
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2024-02-13 15:47:17.101415	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.8.0	\N	\N	7839232414
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-02-13 15:47:17.123855	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	7839232414
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-02-13 15:47:17.129481	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	7839232414
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-02-13 15:47:17.214623	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	7839232414
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2024-02-13 15:47:17.229808	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.8.0	\N	\N	7839232414
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-02-13 15:47:17.253975	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	7839232414
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2024-02-13 15:47:17.263867	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.8.0	\N	\N	7839232414
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2024-02-13 15:47:17.274806	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.8.0	\N	\N	7839232414
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-02-13 15:47:17.279785	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	7839232414
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-02-13 15:47:17.284849	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	7839232414
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2024-02-13 15:47:17.30093	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.8.0	\N	\N	7839232414
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-02-13 15:47:17.600595	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.8.0	\N	\N	7839232414
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2024-02-13 15:47:17.612998	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.8.0	\N	\N	7839232414
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-02-13 15:47:17.643327	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.8.0	\N	\N	7839232414
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-02-13 15:47:17.648591	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	7839232414
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-02-13 15:47:17.789851	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.8.0	\N	\N	7839232414
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-02-13 15:47:17.806703	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.8.0	\N	\N	7839232414
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2024-02-13 15:47:17.95539	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.8.0	\N	\N	7839232414
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2024-02-13 15:47:18.035036	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.8.0	\N	\N	7839232414
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2024-02-13 15:47:18.052083	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	7839232414
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2024-02-13 15:47:18.078061	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.8.0	\N	\N	7839232414
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2024-02-13 15:47:18.096277	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.8.0	\N	\N	7839232414
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-02-13 15:47:18.125244	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.8.0	\N	\N	7839232414
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-02-13 15:47:18.147004	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.8.0	\N	\N	7839232414
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-02-13 15:47:18.262409	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.8.0	\N	\N	7839232414
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-02-13 15:47:19.493064	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.8.0	\N	\N	7839232414
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2024-02-13 15:47:19.568233	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.8.0	\N	\N	7839232414
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2024-02-13 15:47:19.592677	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	7839232414
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-02-13 15:47:19.627701	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.8.0	\N	\N	7839232414
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-02-13 15:47:19.641079	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.8.0	\N	\N	7839232414
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2024-02-13 15:47:19.651323	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	7839232414
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2024-02-13 15:47:19.660544	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	7839232414
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2024-02-13 15:47:19.67109	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.8.0	\N	\N	7839232414
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2024-02-13 15:47:19.710868	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.8.0	\N	\N	7839232414
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2024-02-13 15:47:19.723806	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.8.0	\N	\N	7839232414
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2024-02-13 15:47:19.735565	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.8.0	\N	\N	7839232414
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2024-02-13 15:47:19.767571	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.8.0	\N	\N	7839232414
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2024-02-13 15:47:19.785627	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.8.0	\N	\N	7839232414
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2024-02-13 15:47:19.798928	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.8.0	\N	\N	7839232414
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-02-13 15:47:19.837038	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	7839232414
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-02-13 15:47:19.864744	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	7839232414
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-02-13 15:47:19.870226	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	7839232414
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-02-13 15:47:19.942712	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.8.0	\N	\N	7839232414
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-02-13 15:47:19.964733	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.8.0	\N	\N	7839232414
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-02-13 15:47:19.974259	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.8.0	\N	\N	7839232414
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-02-13 15:47:19.979782	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.8.0	\N	\N	7839232414
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-02-13 15:47:20.021313	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.8.0	\N	\N	7839232414
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-02-13 15:47:20.033071	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.8.0	\N	\N	7839232414
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-02-13 15:47:20.053057	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.8.0	\N	\N	7839232414
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-02-13 15:47:20.058696	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	7839232414
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-02-13 15:47:20.071821	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	7839232414
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-02-13 15:47:20.076669	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	7839232414
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-02-13 15:47:20.09163	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	7839232414
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2024-02-13 15:47:20.106957	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.8.0	\N	\N	7839232414
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-02-13 15:47:20.129784	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.8.0	\N	\N	7839232414
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-02-13 15:47:20.153029	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.8.0	\N	\N	7839232414
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-02-13 15:47:20.172424	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.8.0	\N	\N	7839232414
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-02-13 15:47:20.188734	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.8.0	\N	\N	7839232414
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-02-13 15:47:20.203218	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	7839232414
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-02-13 15:47:20.22317	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.8.0	\N	\N	7839232414
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-02-13 15:47:20.227572	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	7839232414
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-02-13 15:47:20.243209	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	7839232414
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-02-13 15:47:20.248106	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.8.0	\N	\N	7839232414
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-02-13 15:47:20.263001	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.8.0	\N	\N	7839232414
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-02-13 15:47:20.284318	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	7839232414
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-02-13 15:47:20.28935	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	7839232414
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-02-13 15:47:20.321517	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	7839232414
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-02-13 15:47:20.335884	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	7839232414
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-02-13 15:47:20.341425	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	7839232414
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-02-13 15:47:20.355114	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.8.0	\N	\N	7839232414
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-02-13 15:47:20.368504	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.8.0	\N	\N	7839232414
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2024-02-13 15:47:20.388033	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.8.0	\N	\N	7839232414
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2024-02-13 15:47:20.401341	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.8.0	\N	\N	7839232414
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2024-02-13 15:47:20.414411	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.8.0	\N	\N	7839232414
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2024-02-13 15:47:20.425127	107	EXECUTED	8:af510cd1bb2ab6339c45372f3e491696	customChange		\N	4.8.0	\N	\N	7839232414
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-02-13 15:47:20.441286	108	EXECUTED	8:05c99fc610845ef66ee812b7921af0ef	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.8.0	\N	\N	7839232414
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-02-13 15:47:20.446336	109	MARK_RAN	8:314e803baf2f1ec315b3464e398b8247	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.8.0	\N	\N	7839232414
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-02-13 15:47:20.461282	110	EXECUTED	8:56e4677e7e12556f70b604c573840100	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	7839232414
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
ed5b49b5-f1d5-42c0-b2c5-8c2730931615	5718f080-fb4c-4e7b-a74e-170d3ded28c2	f
ed5b49b5-f1d5-42c0-b2c5-8c2730931615	66aacbb0-dec3-4326-9ee0-f4a491f64c89	t
ed5b49b5-f1d5-42c0-b2c5-8c2730931615	5b425348-1474-4f36-939d-167d7d6b798a	t
ed5b49b5-f1d5-42c0-b2c5-8c2730931615	01e59294-9d8f-462b-96e0-c745879bc2d1	t
ed5b49b5-f1d5-42c0-b2c5-8c2730931615	768bae59-69c9-4be4-a3ef-72edfbe3a48a	f
ed5b49b5-f1d5-42c0-b2c5-8c2730931615	504059c4-00ed-43f5-b60d-abd320a3a53a	f
ed5b49b5-f1d5-42c0-b2c5-8c2730931615	5f4c559b-bc64-4fef-a630-bf5cbe3fa57b	t
ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ed992b12-98d2-4dc2-b705-58b848f02a93	t
ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1204290e-1c4b-4fe9-a32d-d54bd11430f5	f
ed5b49b5-f1d5-42c0-b2c5-8c2730931615	f0b19668-c358-4e64-8586-0ee4fca9a09b	t
7285fde1-76e9-40f3-9950-b53009f25138	5fe94c35-8813-437f-bd68-ca4b26ae8b0d	t
7285fde1-76e9-40f3-9950-b53009f25138	178a6716-58be-4ea1-8f09-79e970a16b2d	t
7285fde1-76e9-40f3-9950-b53009f25138	074a80ec-246e-45b7-9c89-cd1423106c1d	t
7285fde1-76e9-40f3-9950-b53009f25138	abd67624-07c4-489d-b1a4-d0dfcf9702f6	t
7285fde1-76e9-40f3-9950-b53009f25138	15f5fb03-5365-43ca-a33c-0bf3accadd04	t
7285fde1-76e9-40f3-9950-b53009f25138	9d3effe3-10c8-4efd-9f3a-a567bd6bffed	t
7285fde1-76e9-40f3-9950-b53009f25138	1cbd77b9-6b49-4855-861d-60610f63aa8a	f
7285fde1-76e9-40f3-9950-b53009f25138	02f1670f-0014-47dd-b3e9-93ba9ebcdd69	f
7285fde1-76e9-40f3-9950-b53009f25138	4ac7bde8-a428-446b-82c1-9293abbd49f8	f
7285fde1-76e9-40f3-9950-b53009f25138	a90ec271-2918-4b40-bbfc-5cbd42e261d0	f
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
fc0a4195-cfc7-4f73-a33d-9d8d34e7e6d3	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	f	${role_default-roles}	default-roles-master	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	\N	\N
c8d2c2d9-75a3-494c-8cab-232b60ffff07	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	f	${role_create-realm}	create-realm	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	\N	\N
b665fddc-137e-429e-b631-471d2829d42a	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_create-client}	create-client	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
8825490d-b12d-427f-b364-feccbaa30616	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_view-realm}	view-realm	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
db0356f1-1395-416c-974e-3e60e36931e1	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_view-users}	view-users	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
03bccb30-89eb-47ff-8011-1a72ab2c5eec	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_view-clients}	view-clients	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
7a6141d4-7d37-4c90-93d8-ce3c338b5642	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_view-events}	view-events	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
8835da01-e973-472a-bf60-d8356cf8424a	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_view-identity-providers}	view-identity-providers	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
6a4d1f6b-ebde-47f6-8383-4f02f5629848	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_view-authorization}	view-authorization	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
7a02dac8-93b5-4135-84d9-57afceb5e5c3	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_manage-realm}	manage-realm	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
71009642-a7b2-492b-9ad1-35d89f958b04	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_manage-users}	manage-users	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
862cb80c-5ccf-4254-a9dc-6e03431640c8	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_manage-clients}	manage-clients	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
43a170eb-640d-4afd-9559-c4395f79dacd	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_manage-events}	manage-events	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
b35b86fc-dd4b-4664-9929-571e1eb0ff3b	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_manage-identity-providers}	manage-identity-providers	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
f82d660f-fd48-46f6-83f4-f8028de8afcd	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_manage-authorization}	manage-authorization	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
8e719873-9cf6-4194-bb16-eac58de1431f	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_query-users}	query-users	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
568fd5f8-a5a4-43af-964f-dae35029cd4d	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_query-clients}	query-clients	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
7c60b177-3e6c-4d35-b98f-d646e3273a1a	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_query-realms}	query-realms	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
5ba959f0-b88b-4b85-af86-6e72a9921f79	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	f	${role_admin}	admin	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	\N	\N
0b2a59e8-842a-4359-a4f7-02ddfb704425	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_query-groups}	query-groups	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
759349db-c3ff-4df4-90ea-1e9012aab84b	76162d2b-d704-496a-b208-c1bd42f3f271	t	${role_view-profile}	view-profile	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	76162d2b-d704-496a-b208-c1bd42f3f271	\N
ec40b358-90b6-49c9-b190-752e45b4075f	76162d2b-d704-496a-b208-c1bd42f3f271	t	${role_manage-account}	manage-account	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	76162d2b-d704-496a-b208-c1bd42f3f271	\N
5a48bc5c-c086-40a0-b092-121ab7d5f41a	76162d2b-d704-496a-b208-c1bd42f3f271	t	${role_manage-account-links}	manage-account-links	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	76162d2b-d704-496a-b208-c1bd42f3f271	\N
7d3f6f2d-f2ac-4363-ad94-d9ce632e405a	76162d2b-d704-496a-b208-c1bd42f3f271	t	${role_view-applications}	view-applications	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	76162d2b-d704-496a-b208-c1bd42f3f271	\N
7e2d9368-0d17-4e03-82dc-16ed2e527de9	76162d2b-d704-496a-b208-c1bd42f3f271	t	${role_view-consent}	view-consent	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	76162d2b-d704-496a-b208-c1bd42f3f271	\N
0e3bc134-4ee3-4e9f-8ad0-6d5d2a57affa	76162d2b-d704-496a-b208-c1bd42f3f271	t	${role_manage-consent}	manage-consent	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	76162d2b-d704-496a-b208-c1bd42f3f271	\N
a40b0bcd-9f00-4bff-96e4-d9bcb1e8520a	76162d2b-d704-496a-b208-c1bd42f3f271	t	${role_view-groups}	view-groups	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	76162d2b-d704-496a-b208-c1bd42f3f271	\N
d2afdfde-1091-40b0-a1a4-dfade4319a5e	76162d2b-d704-496a-b208-c1bd42f3f271	t	${role_delete-account}	delete-account	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	76162d2b-d704-496a-b208-c1bd42f3f271	\N
f34ba4a3-3c90-4acb-82c0-ae682e595cf7	4b280103-076c-4a54-b7ce-baf149ce8818	t	${role_read-token}	read-token	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	4b280103-076c-4a54-b7ce-baf149ce8818	\N
f5cddeec-145b-4c01-9ccd-2d85d7677c47	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	t	${role_impersonation}	impersonation	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	\N
fdd8ef73-85b4-429b-8b4a-d700de8d3c91	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	f	${role_offline-access}	offline_access	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	\N	\N
6f68d086-37e1-457d-a883-afb6ef357119	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	f	${role_uma_authorization}	uma_authorization	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	\N	\N
a9880f20-a124-4ab9-ab64-378823ee0b8c	7285fde1-76e9-40f3-9950-b53009f25138	f	${role_default-roles}	default-roles-regional-realm	7285fde1-76e9-40f3-9950-b53009f25138	\N	\N
6c71ec00-cfb3-4c1b-b880-b2a8843c62b1	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_create-client}	create-client	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
6cf82871-31c7-40b5-a4e8-141e0d41a253	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_view-realm}	view-realm	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
42f65007-da89-47fa-ac03-1e93c4711cf6	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_view-users}	view-users	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
c793ce93-7ae0-4f93-86de-2e7009a8493b	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_view-clients}	view-clients	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
efdea5ef-2339-4b7f-9f82-da5449e19942	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_view-events}	view-events	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
348636fe-2eae-4a78-a157-bbfba4df0022	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_view-identity-providers}	view-identity-providers	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
fce47445-94d9-4578-8c69-00b82585da33	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_view-authorization}	view-authorization	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
5c94516a-e86f-4e53-b073-73984c1721f7	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_manage-realm}	manage-realm	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
50130ba1-8adf-4eee-84c5-91ebdc29ab3a	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_manage-users}	manage-users	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
4ef64ba0-b136-4a03-92ea-19e96237c776	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_manage-clients}	manage-clients	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
3bcf36d2-3863-4a09-b467-cefa36c6e465	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_manage-events}	manage-events	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
69533a82-6c3d-4367-97d5-c9e560e526b6	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_manage-identity-providers}	manage-identity-providers	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
6f96e461-c3f4-471b-858d-9134fbe09505	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_manage-authorization}	manage-authorization	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
1c448c3c-c58a-4273-8610-9e93eaa0b526	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_query-users}	query-users	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
18f62975-84eb-4f1b-8975-6e84bf85a075	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_query-clients}	query-clients	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
cd3fc6bf-54ce-47a3-8f14-47f42212a180	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_query-realms}	query-realms	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
13391692-d6d7-4899-a882-08fd34de383c	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_query-groups}	query-groups	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
694fd4f6-9933-4962-9375-84b44345a712	7285fde1-76e9-40f3-9950-b53009f25138	f	${role_uma_authorization}	uma_authorization	7285fde1-76e9-40f3-9950-b53009f25138	\N	\N
d11af074-b52e-40f7-bf30-ed29fd52c085	7285fde1-76e9-40f3-9950-b53009f25138	f		Docente	7285fde1-76e9-40f3-9950-b53009f25138	\N	\N
5ba379b4-0cb4-4581-94e3-fbfa615b8fbf	7285fde1-76e9-40f3-9950-b53009f25138	f	${role_offline-access}	offline_access	7285fde1-76e9-40f3-9950-b53009f25138	\N	\N
68a277db-07ad-43b6-9c32-3f73f2a9b93e	7285fde1-76e9-40f3-9950-b53009f25138	f		Coordinador	7285fde1-76e9-40f3-9950-b53009f25138	\N	\N
81dc0b37-bc3c-4f12-9d1f-9c7d57132fd8	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_view-events}	view-events	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
77190e45-9750-4dc7-8e3a-1f1d48391536	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_manage-authorization}	manage-authorization	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
60a266c9-862f-4b8d-9464-028c07f1dad3	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_view-authorization}	view-authorization	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
0195ac30-5978-4926-bd96-7ff9ecb6ac24	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_query-groups}	query-groups	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
7ffbf265-ec7d-4b56-86d1-c4a5b04b2d62	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_view-users}	view-users	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
ae2dcc18-8d80-49ad-836e-f6ae0edaeb82	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_manage-users}	manage-users	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
6e725264-8417-48ab-871a-bef2c3cb0de0	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_query-realms}	query-realms	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
1034a713-897a-4ad3-a4c9-69d531e69650	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_realm-admin}	realm-admin	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
3ff0015f-939b-440c-8371-8ae54e728bd6	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_manage-identity-providers}	manage-identity-providers	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
9ce8e2b3-e1c0-4e63-bad7-dddbc13117ee	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_manage-clients}	manage-clients	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
bf6ff5b0-e788-4136-979f-278e99c71700	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_impersonation}	impersonation	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
2f65ce13-04fb-4de0-8256-2c36e4f7ee13	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_view-identity-providers}	view-identity-providers	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
ecaebba1-94f0-4c44-82d8-e5d612182a98	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_view-realm}	view-realm	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
68db5d35-0dae-494f-818c-a4c738586e82	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_query-clients}	query-clients	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
6cb77343-a604-483a-8176-e1eff84447f6	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_view-clients}	view-clients	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
2945e06f-d38a-431d-a16e-81c504d55af4	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_manage-events}	manage-events	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
6074774b-9f36-4b69-ba6f-9987fc9db453	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_manage-realm}	manage-realm	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
42abe204-e52e-446f-9b38-d21bc80919a1	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_query-users}	query-users	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
02b3a29f-ce4b-4992-a1d6-029c70d22c53	8a4fc698-798c-467d-b777-9f2882e1b9fc	t	${role_create-client}	create-client	7285fde1-76e9-40f3-9950-b53009f25138	8a4fc698-798c-467d-b777-9f2882e1b9fc	\N
a08ff438-1164-4acd-a492-5d972c6f2a5b	35009670-c406-4b2b-aced-8d9fe4140990	t	\N	Docente	7285fde1-76e9-40f3-9950-b53009f25138	35009670-c406-4b2b-aced-8d9fe4140990	\N
1fc4f930-b852-4914-817e-987208d0464a	35009670-c406-4b2b-aced-8d9fe4140990	t	\N	uma_protection	7285fde1-76e9-40f3-9950-b53009f25138	35009670-c406-4b2b-aced-8d9fe4140990	\N
4e49a989-a779-4107-8fb4-0860153e7e0f	35009670-c406-4b2b-aced-8d9fe4140990	t	\N	Coordinador	7285fde1-76e9-40f3-9950-b53009f25138	35009670-c406-4b2b-aced-8d9fe4140990	\N
ccbacf9e-37cb-409f-a913-a1f2c67be452	59dd42ad-8aab-4c70-bd48-1cfbc37a0404	t	${role_read-token}	read-token	7285fde1-76e9-40f3-9950-b53009f25138	59dd42ad-8aab-4c70-bd48-1cfbc37a0404	\N
55a9598f-c0c8-4544-b33d-ace82854cca8	b7026bfc-8a24-477c-b1ac-32e2b14945a9	t	${role_view-consent}	view-consent	7285fde1-76e9-40f3-9950-b53009f25138	b7026bfc-8a24-477c-b1ac-32e2b14945a9	\N
ab3b6835-2cab-4a88-b40b-1899a11c16e2	b7026bfc-8a24-477c-b1ac-32e2b14945a9	t	${role_manage-account-links}	manage-account-links	7285fde1-76e9-40f3-9950-b53009f25138	b7026bfc-8a24-477c-b1ac-32e2b14945a9	\N
c3a65059-78c1-4166-8391-e46706abe0d8	b7026bfc-8a24-477c-b1ac-32e2b14945a9	t	${role_delete-account}	delete-account	7285fde1-76e9-40f3-9950-b53009f25138	b7026bfc-8a24-477c-b1ac-32e2b14945a9	\N
32a740d3-b802-486c-8de0-998692686cdc	b7026bfc-8a24-477c-b1ac-32e2b14945a9	t	${role_manage-account}	manage-account	7285fde1-76e9-40f3-9950-b53009f25138	b7026bfc-8a24-477c-b1ac-32e2b14945a9	\N
d210b541-3628-4d20-aafb-9d8af2a88e31	b7026bfc-8a24-477c-b1ac-32e2b14945a9	t	${role_manage-consent}	manage-consent	7285fde1-76e9-40f3-9950-b53009f25138	b7026bfc-8a24-477c-b1ac-32e2b14945a9	\N
f8877a13-e511-4c41-ad15-607fb358499e	b7026bfc-8a24-477c-b1ac-32e2b14945a9	t	${role_view-profile}	view-profile	7285fde1-76e9-40f3-9950-b53009f25138	b7026bfc-8a24-477c-b1ac-32e2b14945a9	\N
c580ff99-4109-4731-aba1-a170e7aa1999	b7026bfc-8a24-477c-b1ac-32e2b14945a9	t	${role_view-applications}	view-applications	7285fde1-76e9-40f3-9950-b53009f25138	b7026bfc-8a24-477c-b1ac-32e2b14945a9	\N
566aea02-41ff-43ee-9bea-1e68363cb7b5	b7026bfc-8a24-477c-b1ac-32e2b14945a9	t	${role_view-groups}	view-groups	7285fde1-76e9-40f3-9950-b53009f25138	b7026bfc-8a24-477c-b1ac-32e2b14945a9	\N
ed097230-bf05-4d6d-8127-c4f7bd1faddf	1770c654-ff91-4ec6-9edd-dd515047759d	t	${role_impersonation}	impersonation	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1770c654-ff91-4ec6-9edd-dd515047759d	\N
38535122-c1a3-4c32-b9cd-6a044511f5fc	7285fde1-76e9-40f3-9950-b53009f25138	f		Estudiante	7285fde1-76e9-40f3-9950-b53009f25138	\N	\N
1b60f5e8-e147-43b6-8b0a-a8e2f6075477	7285fde1-76e9-40f3-9950-b53009f25138	f		Secretaría	7285fde1-76e9-40f3-9950-b53009f25138	\N	\N
b527d212-f000-4c76-b513-de2b40d1e24b	7285fde1-76e9-40f3-9950-b53009f25138	f		Administrador	7285fde1-76e9-40f3-9950-b53009f25138	\N	\N
8b391ae3-2d82-4557-820b-17360eaed26d	7285fde1-76e9-40f3-9950-b53009f25138	f		Superadmin	7285fde1-76e9-40f3-9950-b53009f25138	\N	\N
07c1b289-148a-407f-a8c8-637eed21db77	35009670-c406-4b2b-aced-8d9fe4140990	t		Secretaría	7285fde1-76e9-40f3-9950-b53009f25138	35009670-c406-4b2b-aced-8d9fe4140990	\N
7ffcdb7c-4ca9-4fb2-a8eb-25cd6fe74583	7285fde1-76e9-40f3-9950-b53009f25138	f		Institucional	7285fde1-76e9-40f3-9950-b53009f25138	\N	\N
f6ac7b11-e9ef-42fe-bf7f-aa3805210837	7285fde1-76e9-40f3-9950-b53009f25138	f		Gestor TIC	7285fde1-76e9-40f3-9950-b53009f25138	\N	\N
4955e15f-0da9-4f83-82ec-358bf6839a22	35009670-c406-4b2b-aced-8d9fe4140990	t		Estudiante	7285fde1-76e9-40f3-9950-b53009f25138	35009670-c406-4b2b-aced-8d9fe4140990	\N
31360eb0-5b71-4f10-8069-3ef4ed4e00e6	35009670-c406-4b2b-aced-8d9fe4140990	t		Institucional	7285fde1-76e9-40f3-9950-b53009f25138	35009670-c406-4b2b-aced-8d9fe4140990	\N
529853be-1fd7-490e-8f96-7688ec85dd18	35009670-c406-4b2b-aced-8d9fe4140990	t		Gestor TIC	7285fde1-76e9-40f3-9950-b53009f25138	35009670-c406-4b2b-aced-8d9fe4140990	\N
1d3f7a1a-54a2-4d35-8904-80557f3be18c	35009670-c406-4b2b-aced-8d9fe4140990	t		Administrador	7285fde1-76e9-40f3-9950-b53009f25138	35009670-c406-4b2b-aced-8d9fe4140990	\N
90753778-1cb0-463e-90a1-6b59fb210fc3	35009670-c406-4b2b-aced-8d9fe4140990	t		Superadmin	7285fde1-76e9-40f3-9950-b53009f25138	35009670-c406-4b2b-aced-8d9fe4140990	\N
e7da107d-c205-4df1-b571-85c5675595a9	7285fde1-76e9-40f3-9950-b53009f25138	f		Institución Educativa	7285fde1-76e9-40f3-9950-b53009f25138	\N	\N
ba9db196-c7e1-4d1e-8c4f-37b73b98e96e	35009670-c406-4b2b-aced-8d9fe4140990	t		Institución Educativa	7285fde1-76e9-40f3-9950-b53009f25138	35009670-c406-4b2b-aced-8d9fe4140990	\N
08ea9684-b1bb-4845-ae29-5469a1a42c54	35009670-c406-4b2b-aced-8d9fe4140990	t		Sistema	7285fde1-76e9-40f3-9950-b53009f25138	35009670-c406-4b2b-aced-8d9fe4140990	\N
a1bb442f-10f7-49d7-acad-8173d177e4b6	7285fde1-76e9-40f3-9950-b53009f25138	f		Sistema	7285fde1-76e9-40f3-9950-b53009f25138	\N	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.migration_model (id, version, update_time) FROM stdin;
pzivl	20.0.3	1707839241
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
38107e53-b970-4944-b30a-7f0b16f5f4f7	audience resolve	openid-connect	oidc-audience-resolve-mapper	ae4b02a2-42a8-4052-86cd-c72536846ca7	\N
d81e6bf6-cf4d-49f8-b613-f7c96d9501f7	locale	openid-connect	oidc-usermodel-attribute-mapper	65a8091a-60c9-4746-8531-4451378359ce	\N
1133819e-986f-4410-8254-c52d7af8d097	role list	saml	saml-role-list-mapper	\N	66aacbb0-dec3-4326-9ee0-f4a491f64c89
aeb10fab-4b27-44b2-bbdd-025e699b384d	full name	openid-connect	oidc-full-name-mapper	\N	5b425348-1474-4f36-939d-167d7d6b798a
bfa89948-bdbd-4f2b-bd83-08b7991cc936	family name	openid-connect	oidc-usermodel-property-mapper	\N	5b425348-1474-4f36-939d-167d7d6b798a
8d3dc433-56c6-4a7c-aa76-a1e050cabc60	given name	openid-connect	oidc-usermodel-property-mapper	\N	5b425348-1474-4f36-939d-167d7d6b798a
81680396-d887-4db7-85ba-79530b8e72f8	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	5b425348-1474-4f36-939d-167d7d6b798a
e2e28314-2d1e-46fd-a349-c1bfd08a5149	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	5b425348-1474-4f36-939d-167d7d6b798a
49f8421e-352b-46ff-894f-d0f4a8e88e74	username	openid-connect	oidc-usermodel-property-mapper	\N	5b425348-1474-4f36-939d-167d7d6b798a
5cd169c6-081d-438d-91b0-8d91eb2f88a3	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	5b425348-1474-4f36-939d-167d7d6b798a
600891f0-5e19-4df4-a6b0-3fc87309bfc1	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	5b425348-1474-4f36-939d-167d7d6b798a
01b4a103-82ea-4ae9-8468-a9587ee3a184	website	openid-connect	oidc-usermodel-attribute-mapper	\N	5b425348-1474-4f36-939d-167d7d6b798a
e306251a-390c-45a6-b35d-49ae3b601854	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	5b425348-1474-4f36-939d-167d7d6b798a
62227b3c-c174-4a1e-813d-515f077d3448	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	5b425348-1474-4f36-939d-167d7d6b798a
b7df9880-2cad-44ed-b21f-d36052fa18ac	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	5b425348-1474-4f36-939d-167d7d6b798a
249a64be-c5f5-49eb-93bc-2b9fef0cf2e0	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	5b425348-1474-4f36-939d-167d7d6b798a
922118ca-7e08-4589-bc48-70c7ee32d83d	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	5b425348-1474-4f36-939d-167d7d6b798a
b37c0f22-d0f1-4f98-8767-7268941e38a9	email	openid-connect	oidc-usermodel-property-mapper	\N	01e59294-9d8f-462b-96e0-c745879bc2d1
51699603-515e-427f-afdc-5b4e80979d15	email verified	openid-connect	oidc-usermodel-property-mapper	\N	01e59294-9d8f-462b-96e0-c745879bc2d1
de926f70-3990-472a-a469-95de6a63995c	address	openid-connect	oidc-address-mapper	\N	768bae59-69c9-4be4-a3ef-72edfbe3a48a
52f99d0a-6de9-481c-bcd5-06c3c3ee509f	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	504059c4-00ed-43f5-b60d-abd320a3a53a
bb5981a1-e917-4b5c-b7a0-0a1aaf11827a	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	504059c4-00ed-43f5-b60d-abd320a3a53a
97d57395-91cf-4a0d-9f5f-447c4d8fef39	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	5f4c559b-bc64-4fef-a630-bf5cbe3fa57b
34df3f60-4dc7-4426-83b8-403fc3066cf6	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	5f4c559b-bc64-4fef-a630-bf5cbe3fa57b
8c12b301-ca74-4d3e-aefa-6b0b3d99f800	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	5f4c559b-bc64-4fef-a630-bf5cbe3fa57b
9bf6fe1c-4125-446e-9e3f-4f5a35296b2d	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	ed992b12-98d2-4dc2-b705-58b848f02a93
54aa3e2b-0af8-47d9-9afa-cc584ac30236	upn	openid-connect	oidc-usermodel-property-mapper	\N	1204290e-1c4b-4fe9-a32d-d54bd11430f5
bc4fd1c9-74d6-4dc5-a587-b4150f402405	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	1204290e-1c4b-4fe9-a32d-d54bd11430f5
e701548c-863c-4f2f-8a13-886b0b3cd335	acr loa level	openid-connect	oidc-acr-mapper	\N	f0b19668-c358-4e64-8586-0ee4fca9a09b
681a2986-9c0d-438e-aebc-939bed3c9873	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	4ac7bde8-a428-446b-82c1-9293abbd49f8
020a002c-628d-4e2b-a2e8-3eefa0446f4a	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	4ac7bde8-a428-446b-82c1-9293abbd49f8
95486a2c-860f-4f8b-897a-4824d0330a28	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	abd67624-07c4-489d-b1a4-d0dfcf9702f6
d404cb96-98e9-4ae1-87ad-46e7daa5f1ae	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	abd67624-07c4-489d-b1a4-d0dfcf9702f6
f2dc2842-54f4-4178-80b5-f60934212920	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	abd67624-07c4-489d-b1a4-d0dfcf9702f6
09a48947-2ab8-4810-a1b7-d6fd1d828328	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	15f5fb03-5365-43ca-a33c-0bf3accadd04
2a53d80c-38da-43d5-85e3-dafd9fb99b42	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	a90ec271-2918-4b40-bbfc-5cbd42e261d0
ddb1cdd3-4761-4d13-9c01-10b07ef4622c	upn	openid-connect	oidc-usermodel-property-mapper	\N	a90ec271-2918-4b40-bbfc-5cbd42e261d0
a9a0c729-5926-40e9-bbea-969416b4e534	address	openid-connect	oidc-address-mapper	\N	02f1670f-0014-47dd-b3e9-93ba9ebcdd69
0c57fd33-7c42-4bbd-ac16-56ad0d54f31d	role list	saml	saml-role-list-mapper	\N	5fe94c35-8813-437f-bd68-ca4b26ae8b0d
294eaced-54c7-4d68-a65d-a0af8cb1a455	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	178a6716-58be-4ea1-8f09-79e970a16b2d
1e4b5d27-777e-40e7-afe8-05543cd29b4d	full name	openid-connect	oidc-full-name-mapper	\N	178a6716-58be-4ea1-8f09-79e970a16b2d
5db65bd4-cc25-49ec-bbdd-2e1d90685328	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	178a6716-58be-4ea1-8f09-79e970a16b2d
928fa58e-8c34-428f-95e8-d6eb9d460fda	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	178a6716-58be-4ea1-8f09-79e970a16b2d
d625d2d5-dd62-493f-b2a7-71b31bfe76e5	given name	openid-connect	oidc-usermodel-property-mapper	\N	178a6716-58be-4ea1-8f09-79e970a16b2d
b5476043-1e10-4bb1-8473-84f27d02ff34	username	openid-connect	oidc-usermodel-property-mapper	\N	178a6716-58be-4ea1-8f09-79e970a16b2d
bbb457a1-8916-407e-937a-c20e6915e574	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	178a6716-58be-4ea1-8f09-79e970a16b2d
23c5e8d6-7540-4b98-b57e-19f2d4aa82cd	family name	openid-connect	oidc-usermodel-property-mapper	\N	178a6716-58be-4ea1-8f09-79e970a16b2d
44711637-1303-4a61-9105-4332eaf76029	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	178a6716-58be-4ea1-8f09-79e970a16b2d
4c7bb049-12fb-4993-a975-28a35db421ee	website	openid-connect	oidc-usermodel-attribute-mapper	\N	178a6716-58be-4ea1-8f09-79e970a16b2d
701473f8-30be-4720-914d-10ea148952c8	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	178a6716-58be-4ea1-8f09-79e970a16b2d
5d689a29-ed29-419b-87e5-d01d8a24d47a	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	178a6716-58be-4ea1-8f09-79e970a16b2d
84f4079f-c112-40d9-bff2-10c2e156dc23	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	178a6716-58be-4ea1-8f09-79e970a16b2d
dde4fe16-8bbf-47f8-9c17-114555980a7c	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	178a6716-58be-4ea1-8f09-79e970a16b2d
1513a047-faf4-4c55-9c01-8975628bf319	email	openid-connect	oidc-usermodel-property-mapper	\N	074a80ec-246e-45b7-9c89-cd1423106c1d
ba7f99ff-9720-40fd-bb41-1a15942e7c85	email verified	openid-connect	oidc-usermodel-property-mapper	\N	074a80ec-246e-45b7-9c89-cd1423106c1d
a495c4eb-16d7-4d9b-9d2f-022e95e3f8cc	acr loa level	openid-connect	oidc-acr-mapper	\N	9d3effe3-10c8-4efd-9f3a-a567bd6bffed
a9995989-c6f2-47c9-9ba2-826737e58e80	audience resolve	openid-connect	oidc-audience-resolve-mapper	3b02d631-a61e-4b91-83d5-65121573a9af	\N
f57086fa-eacd-4241-9ca8-d4895e5d1043	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	35009670-c406-4b2b-aced-8d9fe4140990	\N
70f770b6-bab8-4454-81fa-b06ae59187e2	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	35009670-c406-4b2b-aced-8d9fe4140990	\N
5b6b8223-1172-4a6a-8b5f-542ab80330f1	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	35009670-c406-4b2b-aced-8d9fe4140990	\N
82592aeb-26d8-4268-bd5a-b034db658175	locale	openid-connect	oidc-usermodel-attribute-mapper	502d0adf-e637-458d-a6f1-b6d30a0032e5	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
d81e6bf6-cf4d-49f8-b613-f7c96d9501f7	true	userinfo.token.claim
d81e6bf6-cf4d-49f8-b613-f7c96d9501f7	locale	user.attribute
d81e6bf6-cf4d-49f8-b613-f7c96d9501f7	true	id.token.claim
d81e6bf6-cf4d-49f8-b613-f7c96d9501f7	true	access.token.claim
d81e6bf6-cf4d-49f8-b613-f7c96d9501f7	locale	claim.name
d81e6bf6-cf4d-49f8-b613-f7c96d9501f7	String	jsonType.label
1133819e-986f-4410-8254-c52d7af8d097	false	single
1133819e-986f-4410-8254-c52d7af8d097	Basic	attribute.nameformat
1133819e-986f-4410-8254-c52d7af8d097	Role	attribute.name
01b4a103-82ea-4ae9-8468-a9587ee3a184	true	userinfo.token.claim
01b4a103-82ea-4ae9-8468-a9587ee3a184	website	user.attribute
01b4a103-82ea-4ae9-8468-a9587ee3a184	true	id.token.claim
01b4a103-82ea-4ae9-8468-a9587ee3a184	true	access.token.claim
01b4a103-82ea-4ae9-8468-a9587ee3a184	website	claim.name
01b4a103-82ea-4ae9-8468-a9587ee3a184	String	jsonType.label
249a64be-c5f5-49eb-93bc-2b9fef0cf2e0	true	userinfo.token.claim
249a64be-c5f5-49eb-93bc-2b9fef0cf2e0	locale	user.attribute
249a64be-c5f5-49eb-93bc-2b9fef0cf2e0	true	id.token.claim
249a64be-c5f5-49eb-93bc-2b9fef0cf2e0	true	access.token.claim
249a64be-c5f5-49eb-93bc-2b9fef0cf2e0	locale	claim.name
249a64be-c5f5-49eb-93bc-2b9fef0cf2e0	String	jsonType.label
49f8421e-352b-46ff-894f-d0f4a8e88e74	true	userinfo.token.claim
49f8421e-352b-46ff-894f-d0f4a8e88e74	username	user.attribute
49f8421e-352b-46ff-894f-d0f4a8e88e74	true	id.token.claim
49f8421e-352b-46ff-894f-d0f4a8e88e74	true	access.token.claim
49f8421e-352b-46ff-894f-d0f4a8e88e74	preferred_username	claim.name
49f8421e-352b-46ff-894f-d0f4a8e88e74	String	jsonType.label
5cd169c6-081d-438d-91b0-8d91eb2f88a3	true	userinfo.token.claim
5cd169c6-081d-438d-91b0-8d91eb2f88a3	profile	user.attribute
5cd169c6-081d-438d-91b0-8d91eb2f88a3	true	id.token.claim
5cd169c6-081d-438d-91b0-8d91eb2f88a3	true	access.token.claim
5cd169c6-081d-438d-91b0-8d91eb2f88a3	profile	claim.name
5cd169c6-081d-438d-91b0-8d91eb2f88a3	String	jsonType.label
600891f0-5e19-4df4-a6b0-3fc87309bfc1	true	userinfo.token.claim
600891f0-5e19-4df4-a6b0-3fc87309bfc1	picture	user.attribute
600891f0-5e19-4df4-a6b0-3fc87309bfc1	true	id.token.claim
600891f0-5e19-4df4-a6b0-3fc87309bfc1	true	access.token.claim
600891f0-5e19-4df4-a6b0-3fc87309bfc1	picture	claim.name
600891f0-5e19-4df4-a6b0-3fc87309bfc1	String	jsonType.label
62227b3c-c174-4a1e-813d-515f077d3448	true	userinfo.token.claim
62227b3c-c174-4a1e-813d-515f077d3448	birthdate	user.attribute
62227b3c-c174-4a1e-813d-515f077d3448	true	id.token.claim
62227b3c-c174-4a1e-813d-515f077d3448	true	access.token.claim
62227b3c-c174-4a1e-813d-515f077d3448	birthdate	claim.name
62227b3c-c174-4a1e-813d-515f077d3448	String	jsonType.label
81680396-d887-4db7-85ba-79530b8e72f8	true	userinfo.token.claim
81680396-d887-4db7-85ba-79530b8e72f8	middleName	user.attribute
81680396-d887-4db7-85ba-79530b8e72f8	true	id.token.claim
81680396-d887-4db7-85ba-79530b8e72f8	true	access.token.claim
81680396-d887-4db7-85ba-79530b8e72f8	middle_name	claim.name
81680396-d887-4db7-85ba-79530b8e72f8	String	jsonType.label
8d3dc433-56c6-4a7c-aa76-a1e050cabc60	true	userinfo.token.claim
8d3dc433-56c6-4a7c-aa76-a1e050cabc60	firstName	user.attribute
8d3dc433-56c6-4a7c-aa76-a1e050cabc60	true	id.token.claim
8d3dc433-56c6-4a7c-aa76-a1e050cabc60	true	access.token.claim
8d3dc433-56c6-4a7c-aa76-a1e050cabc60	given_name	claim.name
8d3dc433-56c6-4a7c-aa76-a1e050cabc60	String	jsonType.label
922118ca-7e08-4589-bc48-70c7ee32d83d	true	userinfo.token.claim
922118ca-7e08-4589-bc48-70c7ee32d83d	updatedAt	user.attribute
922118ca-7e08-4589-bc48-70c7ee32d83d	true	id.token.claim
922118ca-7e08-4589-bc48-70c7ee32d83d	true	access.token.claim
922118ca-7e08-4589-bc48-70c7ee32d83d	updated_at	claim.name
922118ca-7e08-4589-bc48-70c7ee32d83d	long	jsonType.label
aeb10fab-4b27-44b2-bbdd-025e699b384d	true	userinfo.token.claim
aeb10fab-4b27-44b2-bbdd-025e699b384d	true	id.token.claim
aeb10fab-4b27-44b2-bbdd-025e699b384d	true	access.token.claim
b7df9880-2cad-44ed-b21f-d36052fa18ac	true	userinfo.token.claim
b7df9880-2cad-44ed-b21f-d36052fa18ac	zoneinfo	user.attribute
b7df9880-2cad-44ed-b21f-d36052fa18ac	true	id.token.claim
b7df9880-2cad-44ed-b21f-d36052fa18ac	true	access.token.claim
b7df9880-2cad-44ed-b21f-d36052fa18ac	zoneinfo	claim.name
b7df9880-2cad-44ed-b21f-d36052fa18ac	String	jsonType.label
bfa89948-bdbd-4f2b-bd83-08b7991cc936	true	userinfo.token.claim
bfa89948-bdbd-4f2b-bd83-08b7991cc936	lastName	user.attribute
bfa89948-bdbd-4f2b-bd83-08b7991cc936	true	id.token.claim
bfa89948-bdbd-4f2b-bd83-08b7991cc936	true	access.token.claim
bfa89948-bdbd-4f2b-bd83-08b7991cc936	family_name	claim.name
bfa89948-bdbd-4f2b-bd83-08b7991cc936	String	jsonType.label
e2e28314-2d1e-46fd-a349-c1bfd08a5149	true	userinfo.token.claim
e2e28314-2d1e-46fd-a349-c1bfd08a5149	nickname	user.attribute
e2e28314-2d1e-46fd-a349-c1bfd08a5149	true	id.token.claim
e2e28314-2d1e-46fd-a349-c1bfd08a5149	true	access.token.claim
e2e28314-2d1e-46fd-a349-c1bfd08a5149	nickname	claim.name
e2e28314-2d1e-46fd-a349-c1bfd08a5149	String	jsonType.label
e306251a-390c-45a6-b35d-49ae3b601854	true	userinfo.token.claim
e306251a-390c-45a6-b35d-49ae3b601854	gender	user.attribute
e306251a-390c-45a6-b35d-49ae3b601854	true	id.token.claim
e306251a-390c-45a6-b35d-49ae3b601854	true	access.token.claim
e306251a-390c-45a6-b35d-49ae3b601854	gender	claim.name
e306251a-390c-45a6-b35d-49ae3b601854	String	jsonType.label
51699603-515e-427f-afdc-5b4e80979d15	true	userinfo.token.claim
51699603-515e-427f-afdc-5b4e80979d15	emailVerified	user.attribute
51699603-515e-427f-afdc-5b4e80979d15	true	id.token.claim
51699603-515e-427f-afdc-5b4e80979d15	true	access.token.claim
51699603-515e-427f-afdc-5b4e80979d15	email_verified	claim.name
51699603-515e-427f-afdc-5b4e80979d15	boolean	jsonType.label
b37c0f22-d0f1-4f98-8767-7268941e38a9	true	userinfo.token.claim
b37c0f22-d0f1-4f98-8767-7268941e38a9	email	user.attribute
b37c0f22-d0f1-4f98-8767-7268941e38a9	true	id.token.claim
b37c0f22-d0f1-4f98-8767-7268941e38a9	true	access.token.claim
b37c0f22-d0f1-4f98-8767-7268941e38a9	email	claim.name
b37c0f22-d0f1-4f98-8767-7268941e38a9	String	jsonType.label
de926f70-3990-472a-a469-95de6a63995c	formatted	user.attribute.formatted
de926f70-3990-472a-a469-95de6a63995c	country	user.attribute.country
de926f70-3990-472a-a469-95de6a63995c	postal_code	user.attribute.postal_code
de926f70-3990-472a-a469-95de6a63995c	true	userinfo.token.claim
de926f70-3990-472a-a469-95de6a63995c	street	user.attribute.street
de926f70-3990-472a-a469-95de6a63995c	true	id.token.claim
de926f70-3990-472a-a469-95de6a63995c	region	user.attribute.region
de926f70-3990-472a-a469-95de6a63995c	true	access.token.claim
de926f70-3990-472a-a469-95de6a63995c	locality	user.attribute.locality
52f99d0a-6de9-481c-bcd5-06c3c3ee509f	true	userinfo.token.claim
52f99d0a-6de9-481c-bcd5-06c3c3ee509f	phoneNumber	user.attribute
52f99d0a-6de9-481c-bcd5-06c3c3ee509f	true	id.token.claim
52f99d0a-6de9-481c-bcd5-06c3c3ee509f	true	access.token.claim
52f99d0a-6de9-481c-bcd5-06c3c3ee509f	phone_number	claim.name
52f99d0a-6de9-481c-bcd5-06c3c3ee509f	String	jsonType.label
bb5981a1-e917-4b5c-b7a0-0a1aaf11827a	true	userinfo.token.claim
bb5981a1-e917-4b5c-b7a0-0a1aaf11827a	phoneNumberVerified	user.attribute
bb5981a1-e917-4b5c-b7a0-0a1aaf11827a	true	id.token.claim
bb5981a1-e917-4b5c-b7a0-0a1aaf11827a	true	access.token.claim
bb5981a1-e917-4b5c-b7a0-0a1aaf11827a	phone_number_verified	claim.name
bb5981a1-e917-4b5c-b7a0-0a1aaf11827a	boolean	jsonType.label
34df3f60-4dc7-4426-83b8-403fc3066cf6	true	multivalued
34df3f60-4dc7-4426-83b8-403fc3066cf6	foo	user.attribute
34df3f60-4dc7-4426-83b8-403fc3066cf6	true	access.token.claim
34df3f60-4dc7-4426-83b8-403fc3066cf6	resource_access.${client_id}.roles	claim.name
34df3f60-4dc7-4426-83b8-403fc3066cf6	String	jsonType.label
97d57395-91cf-4a0d-9f5f-447c4d8fef39	true	multivalued
97d57395-91cf-4a0d-9f5f-447c4d8fef39	foo	user.attribute
97d57395-91cf-4a0d-9f5f-447c4d8fef39	true	access.token.claim
97d57395-91cf-4a0d-9f5f-447c4d8fef39	realm_access.roles	claim.name
97d57395-91cf-4a0d-9f5f-447c4d8fef39	String	jsonType.label
54aa3e2b-0af8-47d9-9afa-cc584ac30236	true	userinfo.token.claim
54aa3e2b-0af8-47d9-9afa-cc584ac30236	username	user.attribute
54aa3e2b-0af8-47d9-9afa-cc584ac30236	true	id.token.claim
54aa3e2b-0af8-47d9-9afa-cc584ac30236	true	access.token.claim
54aa3e2b-0af8-47d9-9afa-cc584ac30236	upn	claim.name
54aa3e2b-0af8-47d9-9afa-cc584ac30236	String	jsonType.label
bc4fd1c9-74d6-4dc5-a587-b4150f402405	true	multivalued
bc4fd1c9-74d6-4dc5-a587-b4150f402405	foo	user.attribute
bc4fd1c9-74d6-4dc5-a587-b4150f402405	true	id.token.claim
bc4fd1c9-74d6-4dc5-a587-b4150f402405	true	access.token.claim
bc4fd1c9-74d6-4dc5-a587-b4150f402405	groups	claim.name
bc4fd1c9-74d6-4dc5-a587-b4150f402405	String	jsonType.label
e701548c-863c-4f2f-8a13-886b0b3cd335	true	id.token.claim
e701548c-863c-4f2f-8a13-886b0b3cd335	true	access.token.claim
020a002c-628d-4e2b-a2e8-3eefa0446f4a	true	userinfo.token.claim
020a002c-628d-4e2b-a2e8-3eefa0446f4a	phoneNumberVerified	user.attribute
020a002c-628d-4e2b-a2e8-3eefa0446f4a	true	id.token.claim
020a002c-628d-4e2b-a2e8-3eefa0446f4a	true	access.token.claim
020a002c-628d-4e2b-a2e8-3eefa0446f4a	phone_number_verified	claim.name
020a002c-628d-4e2b-a2e8-3eefa0446f4a	boolean	jsonType.label
681a2986-9c0d-438e-aebc-939bed3c9873	true	userinfo.token.claim
681a2986-9c0d-438e-aebc-939bed3c9873	phoneNumber	user.attribute
681a2986-9c0d-438e-aebc-939bed3c9873	true	id.token.claim
681a2986-9c0d-438e-aebc-939bed3c9873	true	access.token.claim
681a2986-9c0d-438e-aebc-939bed3c9873	phone_number	claim.name
681a2986-9c0d-438e-aebc-939bed3c9873	String	jsonType.label
95486a2c-860f-4f8b-897a-4824d0330a28	foo	user.attribute
95486a2c-860f-4f8b-897a-4824d0330a28	true	access.token.claim
95486a2c-860f-4f8b-897a-4824d0330a28	realm_access.roles	claim.name
95486a2c-860f-4f8b-897a-4824d0330a28	String	jsonType.label
95486a2c-860f-4f8b-897a-4824d0330a28	true	multivalued
d404cb96-98e9-4ae1-87ad-46e7daa5f1ae	foo	user.attribute
d404cb96-98e9-4ae1-87ad-46e7daa5f1ae	true	access.token.claim
d404cb96-98e9-4ae1-87ad-46e7daa5f1ae	resource_access.${client_id}.roles	claim.name
d404cb96-98e9-4ae1-87ad-46e7daa5f1ae	String	jsonType.label
d404cb96-98e9-4ae1-87ad-46e7daa5f1ae	true	multivalued
2a53d80c-38da-43d5-85e3-dafd9fb99b42	true	multivalued
2a53d80c-38da-43d5-85e3-dafd9fb99b42	true	userinfo.token.claim
2a53d80c-38da-43d5-85e3-dafd9fb99b42	foo	user.attribute
2a53d80c-38da-43d5-85e3-dafd9fb99b42	true	id.token.claim
2a53d80c-38da-43d5-85e3-dafd9fb99b42	true	access.token.claim
2a53d80c-38da-43d5-85e3-dafd9fb99b42	groups	claim.name
2a53d80c-38da-43d5-85e3-dafd9fb99b42	String	jsonType.label
ddb1cdd3-4761-4d13-9c01-10b07ef4622c	true	userinfo.token.claim
ddb1cdd3-4761-4d13-9c01-10b07ef4622c	username	user.attribute
ddb1cdd3-4761-4d13-9c01-10b07ef4622c	true	id.token.claim
ddb1cdd3-4761-4d13-9c01-10b07ef4622c	true	access.token.claim
ddb1cdd3-4761-4d13-9c01-10b07ef4622c	upn	claim.name
ddb1cdd3-4761-4d13-9c01-10b07ef4622c	String	jsonType.label
a9a0c729-5926-40e9-bbea-969416b4e534	formatted	user.attribute.formatted
a9a0c729-5926-40e9-bbea-969416b4e534	country	user.attribute.country
a9a0c729-5926-40e9-bbea-969416b4e534	postal_code	user.attribute.postal_code
a9a0c729-5926-40e9-bbea-969416b4e534	true	userinfo.token.claim
a9a0c729-5926-40e9-bbea-969416b4e534	street	user.attribute.street
a9a0c729-5926-40e9-bbea-969416b4e534	true	id.token.claim
a9a0c729-5926-40e9-bbea-969416b4e534	region	user.attribute.region
a9a0c729-5926-40e9-bbea-969416b4e534	true	access.token.claim
a9a0c729-5926-40e9-bbea-969416b4e534	locality	user.attribute.locality
0c57fd33-7c42-4bbd-ac16-56ad0d54f31d	false	single
0c57fd33-7c42-4bbd-ac16-56ad0d54f31d	Basic	attribute.nameformat
0c57fd33-7c42-4bbd-ac16-56ad0d54f31d	Role	attribute.name
1e4b5d27-777e-40e7-afe8-05543cd29b4d	true	id.token.claim
1e4b5d27-777e-40e7-afe8-05543cd29b4d	true	access.token.claim
1e4b5d27-777e-40e7-afe8-05543cd29b4d	true	userinfo.token.claim
23c5e8d6-7540-4b98-b57e-19f2d4aa82cd	true	userinfo.token.claim
23c5e8d6-7540-4b98-b57e-19f2d4aa82cd	lastName	user.attribute
23c5e8d6-7540-4b98-b57e-19f2d4aa82cd	true	id.token.claim
23c5e8d6-7540-4b98-b57e-19f2d4aa82cd	true	access.token.claim
23c5e8d6-7540-4b98-b57e-19f2d4aa82cd	family_name	claim.name
23c5e8d6-7540-4b98-b57e-19f2d4aa82cd	String	jsonType.label
294eaced-54c7-4d68-a65d-a0af8cb1a455	true	userinfo.token.claim
294eaced-54c7-4d68-a65d-a0af8cb1a455	middleName	user.attribute
294eaced-54c7-4d68-a65d-a0af8cb1a455	true	id.token.claim
294eaced-54c7-4d68-a65d-a0af8cb1a455	true	access.token.claim
294eaced-54c7-4d68-a65d-a0af8cb1a455	middle_name	claim.name
294eaced-54c7-4d68-a65d-a0af8cb1a455	String	jsonType.label
44711637-1303-4a61-9105-4332eaf76029	true	userinfo.token.claim
44711637-1303-4a61-9105-4332eaf76029	locale	user.attribute
44711637-1303-4a61-9105-4332eaf76029	true	id.token.claim
44711637-1303-4a61-9105-4332eaf76029	true	access.token.claim
44711637-1303-4a61-9105-4332eaf76029	locale	claim.name
44711637-1303-4a61-9105-4332eaf76029	String	jsonType.label
4c7bb049-12fb-4993-a975-28a35db421ee	true	userinfo.token.claim
4c7bb049-12fb-4993-a975-28a35db421ee	website	user.attribute
4c7bb049-12fb-4993-a975-28a35db421ee	true	id.token.claim
4c7bb049-12fb-4993-a975-28a35db421ee	true	access.token.claim
4c7bb049-12fb-4993-a975-28a35db421ee	website	claim.name
4c7bb049-12fb-4993-a975-28a35db421ee	String	jsonType.label
5d689a29-ed29-419b-87e5-d01d8a24d47a	true	userinfo.token.claim
5d689a29-ed29-419b-87e5-d01d8a24d47a	birthdate	user.attribute
5d689a29-ed29-419b-87e5-d01d8a24d47a	true	id.token.claim
5d689a29-ed29-419b-87e5-d01d8a24d47a	true	access.token.claim
5d689a29-ed29-419b-87e5-d01d8a24d47a	birthdate	claim.name
5d689a29-ed29-419b-87e5-d01d8a24d47a	String	jsonType.label
5db65bd4-cc25-49ec-bbdd-2e1d90685328	true	userinfo.token.claim
5db65bd4-cc25-49ec-bbdd-2e1d90685328	nickname	user.attribute
5db65bd4-cc25-49ec-bbdd-2e1d90685328	true	id.token.claim
5db65bd4-cc25-49ec-bbdd-2e1d90685328	true	access.token.claim
5db65bd4-cc25-49ec-bbdd-2e1d90685328	nickname	claim.name
5db65bd4-cc25-49ec-bbdd-2e1d90685328	String	jsonType.label
701473f8-30be-4720-914d-10ea148952c8	true	userinfo.token.claim
701473f8-30be-4720-914d-10ea148952c8	gender	user.attribute
701473f8-30be-4720-914d-10ea148952c8	true	id.token.claim
701473f8-30be-4720-914d-10ea148952c8	true	access.token.claim
701473f8-30be-4720-914d-10ea148952c8	gender	claim.name
701473f8-30be-4720-914d-10ea148952c8	String	jsonType.label
84f4079f-c112-40d9-bff2-10c2e156dc23	true	userinfo.token.claim
84f4079f-c112-40d9-bff2-10c2e156dc23	zoneinfo	user.attribute
84f4079f-c112-40d9-bff2-10c2e156dc23	true	id.token.claim
84f4079f-c112-40d9-bff2-10c2e156dc23	true	access.token.claim
84f4079f-c112-40d9-bff2-10c2e156dc23	zoneinfo	claim.name
84f4079f-c112-40d9-bff2-10c2e156dc23	String	jsonType.label
928fa58e-8c34-428f-95e8-d6eb9d460fda	true	userinfo.token.claim
928fa58e-8c34-428f-95e8-d6eb9d460fda	profile	user.attribute
928fa58e-8c34-428f-95e8-d6eb9d460fda	true	id.token.claim
928fa58e-8c34-428f-95e8-d6eb9d460fda	true	access.token.claim
928fa58e-8c34-428f-95e8-d6eb9d460fda	profile	claim.name
928fa58e-8c34-428f-95e8-d6eb9d460fda	String	jsonType.label
b5476043-1e10-4bb1-8473-84f27d02ff34	true	userinfo.token.claim
b5476043-1e10-4bb1-8473-84f27d02ff34	username	user.attribute
b5476043-1e10-4bb1-8473-84f27d02ff34	true	id.token.claim
b5476043-1e10-4bb1-8473-84f27d02ff34	true	access.token.claim
b5476043-1e10-4bb1-8473-84f27d02ff34	preferred_username	claim.name
b5476043-1e10-4bb1-8473-84f27d02ff34	String	jsonType.label
bbb457a1-8916-407e-937a-c20e6915e574	true	userinfo.token.claim
bbb457a1-8916-407e-937a-c20e6915e574	picture	user.attribute
bbb457a1-8916-407e-937a-c20e6915e574	true	id.token.claim
bbb457a1-8916-407e-937a-c20e6915e574	true	access.token.claim
bbb457a1-8916-407e-937a-c20e6915e574	picture	claim.name
bbb457a1-8916-407e-937a-c20e6915e574	String	jsonType.label
d625d2d5-dd62-493f-b2a7-71b31bfe76e5	true	userinfo.token.claim
d625d2d5-dd62-493f-b2a7-71b31bfe76e5	firstName	user.attribute
d625d2d5-dd62-493f-b2a7-71b31bfe76e5	true	id.token.claim
d625d2d5-dd62-493f-b2a7-71b31bfe76e5	true	access.token.claim
d625d2d5-dd62-493f-b2a7-71b31bfe76e5	given_name	claim.name
d625d2d5-dd62-493f-b2a7-71b31bfe76e5	String	jsonType.label
dde4fe16-8bbf-47f8-9c17-114555980a7c	true	userinfo.token.claim
dde4fe16-8bbf-47f8-9c17-114555980a7c	updatedAt	user.attribute
dde4fe16-8bbf-47f8-9c17-114555980a7c	true	id.token.claim
dde4fe16-8bbf-47f8-9c17-114555980a7c	true	access.token.claim
dde4fe16-8bbf-47f8-9c17-114555980a7c	updated_at	claim.name
dde4fe16-8bbf-47f8-9c17-114555980a7c	long	jsonType.label
1513a047-faf4-4c55-9c01-8975628bf319	true	userinfo.token.claim
1513a047-faf4-4c55-9c01-8975628bf319	email	user.attribute
1513a047-faf4-4c55-9c01-8975628bf319	true	id.token.claim
1513a047-faf4-4c55-9c01-8975628bf319	true	access.token.claim
1513a047-faf4-4c55-9c01-8975628bf319	email	claim.name
1513a047-faf4-4c55-9c01-8975628bf319	String	jsonType.label
ba7f99ff-9720-40fd-bb41-1a15942e7c85	true	userinfo.token.claim
ba7f99ff-9720-40fd-bb41-1a15942e7c85	emailVerified	user.attribute
ba7f99ff-9720-40fd-bb41-1a15942e7c85	true	id.token.claim
ba7f99ff-9720-40fd-bb41-1a15942e7c85	true	access.token.claim
ba7f99ff-9720-40fd-bb41-1a15942e7c85	email_verified	claim.name
ba7f99ff-9720-40fd-bb41-1a15942e7c85	boolean	jsonType.label
a495c4eb-16d7-4d9b-9d2f-022e95e3f8cc	true	id.token.claim
a495c4eb-16d7-4d9b-9d2f-022e95e3f8cc	true	access.token.claim
a495c4eb-16d7-4d9b-9d2f-022e95e3f8cc	true	userinfo.token.claim
5b6b8223-1172-4a6a-8b5f-542ab80330f1	clientAddress	user.session.note
5b6b8223-1172-4a6a-8b5f-542ab80330f1	true	id.token.claim
5b6b8223-1172-4a6a-8b5f-542ab80330f1	true	access.token.claim
5b6b8223-1172-4a6a-8b5f-542ab80330f1	clientAddress	claim.name
5b6b8223-1172-4a6a-8b5f-542ab80330f1	String	jsonType.label
70f770b6-bab8-4454-81fa-b06ae59187e2	clientId	user.session.note
70f770b6-bab8-4454-81fa-b06ae59187e2	true	id.token.claim
70f770b6-bab8-4454-81fa-b06ae59187e2	true	access.token.claim
70f770b6-bab8-4454-81fa-b06ae59187e2	clientId	claim.name
70f770b6-bab8-4454-81fa-b06ae59187e2	String	jsonType.label
f57086fa-eacd-4241-9ca8-d4895e5d1043	clientHost	user.session.note
f57086fa-eacd-4241-9ca8-d4895e5d1043	true	id.token.claim
f57086fa-eacd-4241-9ca8-d4895e5d1043	true	access.token.claim
f57086fa-eacd-4241-9ca8-d4895e5d1043	clientHost	claim.name
f57086fa-eacd-4241-9ca8-d4895e5d1043	String	jsonType.label
f57086fa-eacd-4241-9ca8-d4895e5d1043	true	userinfo.token.claim
70f770b6-bab8-4454-81fa-b06ae59187e2	true	userinfo.token.claim
5b6b8223-1172-4a6a-8b5f-542ab80330f1	true	userinfo.token.claim
82592aeb-26d8-4268-bd5a-b034db658175	true	userinfo.token.claim
82592aeb-26d8-4268-bd5a-b034db658175	locale	user.attribute
82592aeb-26d8-4268-bd5a-b034db658175	true	id.token.claim
82592aeb-26d8-4268-bd5a-b034db658175	true	access.token.claim
82592aeb-26d8-4268-bd5a-b034db658175	locale	claim.name
82592aeb-26d8-4268-bd5a-b034db658175	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
7285fde1-76e9-40f3-9950-b53009f25138	60	300	259200	\N	\N	\N	t	f	0	\N	regional-realm	0	\N	f	f	f	f	EXTERNAL	259200	36000	f	f	1770c654-ff91-4ec6-9edd-dd515047759d	1800	f	\N	f	f	f	t	0	1	30	6	HmacSHA1	totp	557c53fd-8517-4ff9-b34d-80c060d18dcf	458cb7e3-abc8-46da-a998-7240945706de	bce0e814-decf-46b2-8bd7-f97d2c7dd7ad	3faac329-2df6-4217-b008-d3241e43f8ef	b8c0a29c-1d35-4b21-afd7-59f35e79916a	2592000	f	900	t	f	49fb7811-1ecb-4a23-967a-a1fb71d8c8ff	0	f	0	0	a9880f20-a124-4ab9-ab64-378823ee0b8c
ed5b49b5-f1d5-42c0-b2c5-8c2730931615	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	ca2f047a-7b3f-4aa7-a1f3-7b7e82832267	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	7ecfff58-a414-45d9-b10b-746ca070e548	d1fc3a79-6ae7-4ba5-9484-78c861ce0602	308fa2df-c0d4-429a-9ace-03ff1e1433dd	ed997573-5c27-43fc-9a28-785286cadfc4	c623c6b8-5650-4d82-911b-19bc6ccf1547	2592000	f	900	t	f	38b782c8-cc7a-4f31-9c34-36041d7839b4	0	f	0	0	fc0a4195-cfc7-4f73-a33d-9d8d34e7e6d3
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	
_browser_header.xContentTypeOptions	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	nosniff
_browser_header.xRobotsTag	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	none
_browser_header.xFrameOptions	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	SAMEORIGIN
_browser_header.contentSecurityPolicy	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1; mode=block
_browser_header.strictTransportSecurity	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	max-age=31536000; includeSubDomains
bruteForceProtected	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	false
permanentLockout	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	false
maxFailureWaitSeconds	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	900
minimumQuickLoginWaitSeconds	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	60
waitIncrementSeconds	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	60
quickLoginCheckMilliSeconds	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	1000
maxDeltaTimeSeconds	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	43200
failureFactor	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	30
realmReusableOtpCode	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	false
displayName	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	Keycloak
displayNameHtml	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	RS256
offlineSessionMaxLifespanEnabled	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	false
offlineSessionMaxLifespan	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	5184000
_browser_header.contentSecurityPolicyReportOnly	7285fde1-76e9-40f3-9950-b53009f25138	
_browser_header.xContentTypeOptions	7285fde1-76e9-40f3-9950-b53009f25138	nosniff
_browser_header.xRobotsTag	7285fde1-76e9-40f3-9950-b53009f25138	none
_browser_header.xFrameOptions	7285fde1-76e9-40f3-9950-b53009f25138	SAMEORIGIN
_browser_header.contentSecurityPolicy	7285fde1-76e9-40f3-9950-b53009f25138	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	7285fde1-76e9-40f3-9950-b53009f25138	1; mode=block
_browser_header.strictTransportSecurity	7285fde1-76e9-40f3-9950-b53009f25138	max-age=31536000; includeSubDomains
bruteForceProtected	7285fde1-76e9-40f3-9950-b53009f25138	false
permanentLockout	7285fde1-76e9-40f3-9950-b53009f25138	false
maxFailureWaitSeconds	7285fde1-76e9-40f3-9950-b53009f25138	900
minimumQuickLoginWaitSeconds	7285fde1-76e9-40f3-9950-b53009f25138	60
waitIncrementSeconds	7285fde1-76e9-40f3-9950-b53009f25138	60
quickLoginCheckMilliSeconds	7285fde1-76e9-40f3-9950-b53009f25138	1000
maxDeltaTimeSeconds	7285fde1-76e9-40f3-9950-b53009f25138	43200
failureFactor	7285fde1-76e9-40f3-9950-b53009f25138	30
realmReusableOtpCode	7285fde1-76e9-40f3-9950-b53009f25138	false
defaultSignatureAlgorithm	7285fde1-76e9-40f3-9950-b53009f25138	RS256
offlineSessionMaxLifespanEnabled	7285fde1-76e9-40f3-9950-b53009f25138	false
offlineSessionMaxLifespan	7285fde1-76e9-40f3-9950-b53009f25138	5184000
clientSessionIdleTimeout	7285fde1-76e9-40f3-9950-b53009f25138	0
clientSessionMaxLifespan	7285fde1-76e9-40f3-9950-b53009f25138	0
clientOfflineSessionIdleTimeout	7285fde1-76e9-40f3-9950-b53009f25138	0
clientOfflineSessionMaxLifespan	7285fde1-76e9-40f3-9950-b53009f25138	0
actionTokenGeneratedByAdminLifespan	7285fde1-76e9-40f3-9950-b53009f25138	43200
actionTokenGeneratedByUserLifespan	7285fde1-76e9-40f3-9950-b53009f25138	300
oauth2DeviceCodeLifespan	7285fde1-76e9-40f3-9950-b53009f25138	600
oauth2DevicePollingInterval	7285fde1-76e9-40f3-9950-b53009f25138	5
webAuthnPolicyRpEntityName	7285fde1-76e9-40f3-9950-b53009f25138	keycloak
webAuthnPolicySignatureAlgorithms	7285fde1-76e9-40f3-9950-b53009f25138	ES256
webAuthnPolicyRpId	7285fde1-76e9-40f3-9950-b53009f25138	
webAuthnPolicyAttestationConveyancePreference	7285fde1-76e9-40f3-9950-b53009f25138	not specified
webAuthnPolicyAuthenticatorAttachment	7285fde1-76e9-40f3-9950-b53009f25138	not specified
webAuthnPolicyRequireResidentKey	7285fde1-76e9-40f3-9950-b53009f25138	not specified
webAuthnPolicyUserVerificationRequirement	7285fde1-76e9-40f3-9950-b53009f25138	not specified
webAuthnPolicyCreateTimeout	7285fde1-76e9-40f3-9950-b53009f25138	0
webAuthnPolicyAvoidSameAuthenticatorRegister	7285fde1-76e9-40f3-9950-b53009f25138	false
webAuthnPolicyRpEntityNamePasswordless	7285fde1-76e9-40f3-9950-b53009f25138	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	7285fde1-76e9-40f3-9950-b53009f25138	ES256
webAuthnPolicyRpIdPasswordless	7285fde1-76e9-40f3-9950-b53009f25138	
webAuthnPolicyAttestationConveyancePreferencePasswordless	7285fde1-76e9-40f3-9950-b53009f25138	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	7285fde1-76e9-40f3-9950-b53009f25138	not specified
webAuthnPolicyRequireResidentKeyPasswordless	7285fde1-76e9-40f3-9950-b53009f25138	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	7285fde1-76e9-40f3-9950-b53009f25138	not specified
webAuthnPolicyCreateTimeoutPasswordless	7285fde1-76e9-40f3-9950-b53009f25138	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	7285fde1-76e9-40f3-9950-b53009f25138	false
cibaBackchannelTokenDeliveryMode	7285fde1-76e9-40f3-9950-b53009f25138	poll
cibaExpiresIn	7285fde1-76e9-40f3-9950-b53009f25138	120
cibaInterval	7285fde1-76e9-40f3-9950-b53009f25138	5
cibaAuthRequestedUserHint	7285fde1-76e9-40f3-9950-b53009f25138	login_hint
parRequestUriLifespan	7285fde1-76e9-40f3-9950-b53009f25138	60
client-policies.profiles	7285fde1-76e9-40f3-9950-b53009f25138	{"profiles":[]}
client-policies.policies	7285fde1-76e9-40f3-9950-b53009f25138	{"policies":[]}
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
ed5b49b5-f1d5-42c0-b2c5-8c2730931615	jboss-logging
7285fde1-76e9-40f3-9950-b53009f25138	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	ed5b49b5-f1d5-42c0-b2c5-8c2730931615
password	password	t	t	7285fde1-76e9-40f3-9950-b53009f25138
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.redirect_uris (client_id, value) FROM stdin;
76162d2b-d704-496a-b208-c1bd42f3f271	/realms/master/account/*
ae4b02a2-42a8-4052-86cd-c72536846ca7	/realms/master/account/*
65a8091a-60c9-4746-8531-4451378359ce	/admin/master/console/*
b7026bfc-8a24-477c-b1ac-32e2b14945a9	/realms/regional-realm/account/*
3b02d631-a61e-4b91-83d5-65121573a9af	/realms/regional-realm/account/*
35009670-c406-4b2b-aced-8d9fe4140990	http://localhost:8080/*
502d0adf-e637-458d-a6f1-b6d30a0032e5	/admin/regional-realm/console/*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
7cad7c7c-afa6-4d93-9904-d380822baeb3	VERIFY_EMAIL	Verify Email	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	t	f	VERIFY_EMAIL	50
d42e93a0-2432-432e-ab2e-fbe878c96c5f	UPDATE_PROFILE	Update Profile	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	t	f	UPDATE_PROFILE	40
db1006c3-e923-417d-88f3-b1e5e74faa3b	CONFIGURE_TOTP	Configure OTP	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	t	f	CONFIGURE_TOTP	10
5de5bd7c-a4dc-4751-89b0-8a63076a47ca	UPDATE_PASSWORD	Update Password	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	t	f	UPDATE_PASSWORD	30
7d2326e8-7268-4180-9cf8-45463ac24631	terms_and_conditions	Terms and Conditions	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	f	f	terms_and_conditions	20
51518ec4-4e67-4602-b9a2-62eed4d8d061	delete_account	Delete Account	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	f	f	delete_account	60
acb32d28-8656-411c-8f7c-de58602777b0	update_user_locale	Update User Locale	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	t	f	update_user_locale	1000
6a7a72a7-201f-49c3-ba96-8f7ef60f330e	webauthn-register	Webauthn Register	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	t	f	webauthn-register	70
e47cfdf6-5847-4458-a810-aca42bcd0ddb	webauthn-register-passwordless	Webauthn Register Passwordless	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	t	f	webauthn-register-passwordless	80
73c187d5-5c03-42b1-8840-eea92234b9a3	CONFIGURE_TOTP	Configure OTP	7285fde1-76e9-40f3-9950-b53009f25138	t	f	CONFIGURE_TOTP	10
642b0a30-a10f-41d3-bd4f-65f56c7dfdc3	terms_and_conditions	Terms and Conditions	7285fde1-76e9-40f3-9950-b53009f25138	f	f	terms_and_conditions	20
97e48419-9fb5-4696-94ac-774643b0a64f	UPDATE_PASSWORD	Update Password	7285fde1-76e9-40f3-9950-b53009f25138	t	f	UPDATE_PASSWORD	30
fab264c0-41e6-4f85-97a5-a9de8c7097de	UPDATE_PROFILE	Update Profile	7285fde1-76e9-40f3-9950-b53009f25138	t	f	UPDATE_PROFILE	40
c8db59ab-39ed-41ba-a2c9-e60be17041c9	VERIFY_EMAIL	Verify Email	7285fde1-76e9-40f3-9950-b53009f25138	t	f	VERIFY_EMAIL	50
e3db9a31-b613-4a64-a1ca-1da422f564dc	delete_account	Delete Account	7285fde1-76e9-40f3-9950-b53009f25138	f	f	delete_account	60
ad37b16f-e099-4dc1-ae3b-23cf3da3f5c1	webauthn-register	Webauthn Register	7285fde1-76e9-40f3-9950-b53009f25138	t	f	webauthn-register	70
af26ef7a-a990-4e84-a494-a17ef5aef34a	webauthn-register-passwordless	Webauthn Register Passwordless	7285fde1-76e9-40f3-9950-b53009f25138	t	f	webauthn-register-passwordless	80
3fba5dad-d333-419c-8625-3ff662925c01	update_user_locale	Update User Locale	7285fde1-76e9-40f3-9950-b53009f25138	t	f	update_user_locale	1000
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
ae4b02a2-42a8-4052-86cd-c72536846ca7	a40b0bcd-9f00-4bff-96e4-d9bcb1e8520a
ae4b02a2-42a8-4052-86cd-c72536846ca7	ec40b358-90b6-49c9-b190-752e45b4075f
3b02d631-a61e-4b91-83d5-65121573a9af	32a740d3-b802-486c-8de0-998692686cdc
3b02d631-a61e-4b91-83d5-65121573a9af	566aea02-41ff-43ee-9bea-1e68363cb7b5
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
document_type_id	1	2af08086-5b2d-4464-a2eb-9f0a85372011	ae9e5eae-980e-44bb-ac8b-8852cac4ac79
document	1114873652	2af08086-5b2d-4464-a2eb-9f0a85372011	1fb0a4cf-46a2-462e-bfbd-69b1a0b2f538
status	1	2af08086-5b2d-4464-a2eb-9f0a85372011	190d69ac-1336-46d6-b29c-e1b2335073e6
document_type_id	1	a05de10d-ffcb-4a25-9036-d753878b6f9f	3fb01350-3345-4cd6-a110-68795a5520da
document_type_id	2	0b712472-2dc1-4a11-bfc5-79dae2f1f407	5c4eca78-43bb-4e5a-b1c8-6307fd2d1edd
status	1	0b712472-2dc1-4a11-bfc5-79dae2f1f407	45c9d2e1-19de-4c8c-9b32-e0d37a85d732
document_type_id	1	5ed10d1e-01ec-4d28-9af3-ca35d791bf8e	02dfcd4b-219b-48d3-a9a7-7e7137c3b329
document	1713458701	5ed10d1e-01ec-4d28-9af3-ca35d791bf8e	c02d9044-dc01-414b-a369-ca2462f0d30d
status	1	5ed10d1e-01ec-4d28-9af3-ca35d791bf8e	4e48c629-79fa-468a-93f0-e57c9610c928
document	11157634366	5bfe59e7-e008-4745-b2da-a2bcddbf6a1d	855aa02d-2c70-42b3-892f-95ddeb98a3ee
document_type_id	1	4fdd3a5f-9118-460a-94de-580387545e59	6dd1dff8-d1b0-4025-bcf9-45d435e0e046
document	11120348	4fdd3a5f-9118-460a-94de-580387545e59	379b46d2-2ba4-45d9-b885-67263f53dc67
status	1	4fdd3a5f-9118-460a-94de-580387545e59	f10715be-95aa-490a-b730-f54b8417c872
document_type_id	1	25bfc9e3-60e0-424e-92de-0f6d18c82bfc	fad3fd56-a170-4412-aeaa-33b07827aa2d
document	1234567890	25bfc9e3-60e0-424e-92de-0f6d18c82bfc	47cc1ec2-506d-4671-83c8-5bf2c5e93b32
status	1	25bfc9e3-60e0-424e-92de-0f6d18c82bfc	63e16912-8db7-435c-ba13-ac4bdf4d344f
status	1	72ee82f2-1197-4f7d-8bae-c9eccaf52821	6c0d7fd1-16ef-488c-b20b-c6808b486bff
document_type_id	1	1215bbd5-f7a9-46f5-a075-038b3d860367	e17879f9-a2cf-4d22-b0fc-df39a767bfa1
document	111464748	1215bbd5-f7a9-46f5-a075-038b3d860367	154a1579-b9a6-4195-bbda-5989795f525c
document_type_id	1	5bfe59e7-e008-4745-b2da-a2bcddbf6a1d	677adbb4-44b5-430f-8bf4-4041645d3830
status	1	1215bbd5-f7a9-46f5-a075-038b3d860367	895c14ca-3188-4c16-ad73-bee45d1cd3b2
document_type_id	1	e4e8223b-c613-46d6-bf2a-43e167a0586a	dc8c0caa-b738-49db-9bd4-1a15d66ab65c
document	1123563	e4e8223b-c613-46d6-bf2a-43e167a0586a	2769c45c-a3dc-4acc-9c38-0514d4eee421
status	1	e4e8223b-c613-46d6-bf2a-43e167a0586a	be41ff50-9ea2-41c9-b84a-4e21ad64ca2a
document_type_id	1	5ea24cee-ec94-4bcb-938a-fde68c09b174	7ff74a11-1c4e-4a9b-ab48-f9687e59391f
document	1123545	5ea24cee-ec94-4bcb-938a-fde68c09b174	8bc879c4-f4fd-46e9-b84f-1ec629513071
status	1	5ea24cee-ec94-4bcb-938a-fde68c09b174	662b4b13-b254-4878-a67d-b6ec3596561f
status	1	a05de10d-ffcb-4a25-9036-d753878b6f9f	ac5004de-d6d0-4326-8781-301cc0689995
document_type_id	1	955dbf89-0e83-488f-9541-b26cc4a41494	723732d4-0493-436d-bdb1-15c78fa2022d
document	1234353	955dbf89-0e83-488f-9541-b26cc4a41494	5b5a9a13-3262-4b60-bc7c-46694f252f8f
status	1	955dbf89-0e83-488f-9541-b26cc4a41494	10279f76-a72d-49f0-b78f-9a0f6c14c0e6
document_type_id	2	4c460c7d-23d9-4f32-80a6-958826a65ac6	8c8cae9a-d458-4854-bf48-3f20a9658ec4
document	1110049332	4c460c7d-23d9-4f32-80a6-958826a65ac6	07ee989b-cd7e-4fe2-9037-4bae610dd1f6
status	1	4c460c7d-23d9-4f32-80a6-958826a65ac6	419f6fa4-b4b0-4180-ba31-0d51e6875faf
avatar_id	1	733415bf-7a92-48e3-a040-a4fe4aed5f2f	a3e1b220-53f6-407c-82d6-d82c60e2d684
document_type_id	1	733415bf-7a92-48e3-a040-a4fe4aed5f2f	b9b0cb82-7e10-4120-95f5-d53629798d7c
document	9876543210	733415bf-7a92-48e3-a040-a4fe4aed5f2f	b2d0c916-fe77-4661-a195-18ce6ab48d70
status	1	733415bf-7a92-48e3-a040-a4fe4aed5f2f	290bb483-bb8c-401c-b4ae-62e9fbd23ee4
document_type_id	1	16fa502c-57cf-4055-9543-a0eacc6291e8	722c957e-813a-48d5-ad12-3cefd3c21a0d
document	1113653765	16fa502c-57cf-4055-9543-a0eacc6291e8	faef6ba4-d3f4-4cdc-aa7f-1c324a575cf3
status	1	16fa502c-57cf-4055-9543-a0eacc6291e8	21090c76-0f6a-4f3e-be65-d647a9031c02
document_type_id	1	6933834e-59b1-4f18-b82d-9eb9c4728c98	20e81e69-4cd3-4600-8680-b78313c11eb9
document	1115676789	6933834e-59b1-4f18-b82d-9eb9c4728c98	82a511cc-bc35-43f1-9562-e7ec263aa7c8
status	1	6933834e-59b1-4f18-b82d-9eb9c4728c98	071d2f6b-4a62-4282-a46b-0b67fff1fcf5
document_type_id	1	e1566680-d554-4636-ab44-b79fcfbe5d7f	9310f044-7d0e-400f-9178-ee1f59d5255f
document	11123342	e1566680-d554-4636-ab44-b79fcfbe5d7f	4ac1c023-c450-4f56-bd88-22d43286bb31
status	1	e1566680-d554-4636-ab44-b79fcfbe5d7f	7d30b13d-b9ed-415b-97b6-4afdbd1145f2
document_type_id	1	1ed7195c-9659-4831-984a-ff734c85a886	5acd6ef3-7b04-45b4-8805-98f485cc18d6
document	111065473	1ed7195c-9659-4831-984a-ff734c85a886	b7070b0f-38d9-4494-80b3-ec7bc838d1b6
status	1	1ed7195c-9659-4831-984a-ff734c85a886	408cf5f7-52f7-4364-9932-915bfbce3d34
document_type_id	2	2e55e737-747c-4051-869d-c077e9217664	f8621377-acff-465e-a9c4-1e048e65a904
document	1244567	2e55e737-747c-4051-869d-c077e9217664	131a4894-cba9-45be-8e8d-429bc9e19d77
status	1	2e55e737-747c-4051-869d-c077e9217664	f68fb37d-423b-4565-9542-d40c4bf96c06
document_type_id	2	62e188c9-8ad7-4f6b-a927-cf1854cbd68d	977e8d45-d90f-4c42-9108-863218e19150
document	11103534	62e188c9-8ad7-4f6b-a927-cf1854cbd68d	b5e4aac4-0705-4eda-8fa0-ecdbba349993
document_type_id	1	66e2a633-fd06-4935-8ed3-0b7c0c1c4254	889c8e73-7daf-4a80-8c6b-25fc60812b86
document_type_id	1	23dc6e35-5123-49dd-855a-6bbc89e7cc8f	4d60579d-2427-4ac2-b840-60434af1bd79
document	12345654	23dc6e35-5123-49dd-855a-6bbc89e7cc8f	155aec35-ae66-44c1-abd4-23f09979e7f3
status	1	23dc6e35-5123-49dd-855a-6bbc89e7cc8f	b54ee5ec-ceb5-4be0-880f-dd8c450da823
document_type_id	1	dfcf8074-02c5-4545-b648-5953717c4d21	559651c7-23d5-41ff-9f06-47599db5b844
document_type_id	1	884e45fe-2db9-45b4-966b-cb37517f2ea0	1911f2a8-aa67-4bc3-bbb9-d7db48722c77
document_type_id	1	15718055-3738-4e99-85ec-594f8b307122	14454b6c-0f54-400b-8ffb-77011a058b72
document_type_id	1	b803f43f-5fa7-4aea-b076-3ad85bce6585	fbced40c-349f-482c-93b9-a0f223997f8f
document_type_id	1	1efa5c4f-60ec-41d1-b9bb-92210aa2560f	f221583c-68e3-4571-9ae5-9fae9597187b
status	1	884e45fe-2db9-45b4-966b-cb37517f2ea0	3be3c773-44bb-4eb9-a0dd-a9f4271ed816
status	1	dfcf8074-02c5-4545-b648-5953717c4d21	65692465-25c0-44a3-925d-a059a66a0b08
status	1	15718055-3738-4e99-85ec-594f8b307122	8e77f128-efc9-42ef-bc8d-acab7377153f
document	111456789	1efa5c4f-60ec-41d1-b9bb-92210aa2560f	2b1579d2-53a2-4a3b-b967-62986f49d116
status	1	1efa5c4f-60ec-41d1-b9bb-92210aa2560f	70461310-88a5-4f5f-8b57-d3bb4c0b0a77
document_type_id	1	474681f4-b61e-4740-ab8e-59ac2ae82a06	c6674074-53d4-4317-b88b-e7344b6bd6e8
status	1	474681f4-b61e-4740-ab8e-59ac2ae82a06	a7b29a02-1df2-46e6-8aa3-cdaec4372bc1
status	1	b803f43f-5fa7-4aea-b076-3ad85bce6585	8a4117a0-0865-4676-ac8f-b32e562c33b7
document	1114567272	884e45fe-2db9-45b4-966b-cb37517f2ea0	9e87275f-2f72-4a19-b3c9-f450e32f9af1
document	1114674873	dfcf8074-02c5-4545-b648-5953717c4d21	3e2f7c4a-7a42-4882-ab84-7ade077f8336
document	1114765231	15718055-3738-4e99-85ec-594f8b307122	e50f5d53-2006-4303-a545-214e3287dfb9
document_type_id	1	7b9993cc-2d01-4d63-9093-2177c614d407	5d00e889-2c98-4359-b579-6308ade6bc27
document	12345346	7b9993cc-2d01-4d63-9093-2177c614d407	dd3b3b6a-7457-4106-9e70-5e01072ef2d8
document_type_id	1	1e1d0fbb-e9a6-4c49-ab05-7a2e85aa87cf	881c4a84-ff26-43c3-92df-f33edc919063
document	1712935737	1e1d0fbb-e9a6-4c49-ab05-7a2e85aa87cf	6030fe18-e571-4e36-a6ff-8bd2294a9b34
status	1	7b9993cc-2d01-4d63-9093-2177c614d407	c170551f-87ad-4552-8550-75b8e6cc64a2
document	111223454	474681f4-b61e-4740-ab8e-59ac2ae82a06	07ffc7fc-ca14-4226-b548-1d0cb8d366a5
document	11456398	b803f43f-5fa7-4aea-b076-3ad85bce6585	255b470e-fdbb-4217-b1b2-8aabb4d7b51a
document_type_id	1	52d5bd1f-dd8b-4ac9-b650-108e8dc1765a	5561c924-0ef5-4a30-a6c3-6b0cb1f0934b
document	1111765436	52d5bd1f-dd8b-4ac9-b650-108e8dc1765a	db768756-821e-449e-9e3b-a55da795eeb7
status	1	52d5bd1f-dd8b-4ac9-b650-108e8dc1765a	acfefd57-0d66-4f8a-ad8b-f1698524e2ea
document_type_id	1	23876565-b218-4170-aeb1-602484f62367	98ae1ea1-6c96-42fe-82d5-096769f31620
document	1112343542	23876565-b218-4170-aeb1-602484f62367	f07eaa89-2d8e-4f87-b5be-eb44479829dc
status	1	23876565-b218-4170-aeb1-602484f62367	b94e59c8-79d5-4e41-9a6a-d45be0304044
document_type_id	1	e82f596a-d606-48b3-b735-f4701b5fa930	67f3e70c-7b5d-49a1-af55-484a001996a0
document	112056479	e82f596a-d606-48b3-b735-f4701b5fa930	fe6a7d91-e0b9-457d-b0c7-94e54ecdb46b
status	1	e82f596a-d606-48b3-b735-f4701b5fa930	13a07f06-fec2-49be-9a8c-024487d80641
document_type_id	1	5988b29b-dbae-4d50-ab58-20e9a9695f6d	e28edf71-2cd8-4280-a91f-7541bcdd7887
status	1	5988b29b-dbae-4d50-ab58-20e9a9695f6d	7c538f3f-2732-46e2-aa49-961c3b61d1e2
document_type_id	1	c223d845-28d1-40b1-adae-89ad5cd9a3aa	8ba2f775-8955-4531-8dc8-3a763eab5429
document	1112345220	c223d845-28d1-40b1-adae-89ad5cd9a3aa	6eebe4a9-95d7-4986-9d43-9e2ceb753c8a
status	1	c223d845-28d1-40b1-adae-89ad5cd9a3aa	f559211f-b39d-4a42-8aab-2e3bab712938
document	1110674965	0b712472-2dc1-4a11-bfc5-79dae2f1f407	51a8f6a8-f1ed-41fb-b6ed-0f996f7b4e7c
document_type_id	1	34afd408-2820-484a-9681-9b875d80bcd6	0c1831f2-d7ec-4b5c-8a22-5b5099744a28
document	38867264	34afd408-2820-484a-9681-9b875d80bcd6	cb6c5032-caae-4641-9548-7011d3d96166
status	1	34afd408-2820-484a-9681-9b875d80bcd6	e66dea67-f7a9-415e-af27-f8fa93ce5383
document	11146572344	a05de10d-ffcb-4a25-9036-d753878b6f9f	a42a21cf-1e4a-42a4-bfe7-f63c4140025c
document_type_id	1	650c4f87-ef2b-4f50-9ac7-be7aba48a6d3	260248f0-c736-4aa2-b038-809f5821028e
document	1234567891	650c4f87-ef2b-4f50-9ac7-be7aba48a6d3	ebedb116-969f-4f24-a887-5b95b6ea305a
status	1	650c4f87-ef2b-4f50-9ac7-be7aba48a6d3	e98f5da5-055f-43bb-8a1a-3a049d4b4e16
document_type_id	1	f699754d-3106-456c-b6fb-82842131ce70	ea8ed96f-e8b0-4fae-b954-2c93970b75dd
document	1113456784	f699754d-3106-456c-b6fb-82842131ce70	c1f4acb2-3256-47d3-9202-526f4510e321
status	1	f699754d-3106-456c-b6fb-82842131ce70	64b8cd9a-ce5a-4db8-acef-84848c699b8d
document_type_id	1	091d1ef6-ac17-400c-a48d-dae43a5f52b5	fc38c8ae-9680-49a6-91ed-069d9f280114
document	1148764132	091d1ef6-ac17-400c-a48d-dae43a5f52b5	0594bb6f-a19c-4d6b-a004-7a64da54a139
status	1	091d1ef6-ac17-400c-a48d-dae43a5f52b5	eabf05a6-6b5a-4409-a235-d9c49ff1d179
document_type_id	1	61059eb2-95f8-4d4c-80b7-5d8d6474fcf3	3f014f62-2393-4f3c-8c80-751d31bb0b4c
document	1114567123	61059eb2-95f8-4d4c-80b7-5d8d6474fcf3	cad045ee-7805-4598-8534-6fb82061af2a
status	0	61059eb2-95f8-4d4c-80b7-5d8d6474fcf3	b444a317-a743-4b45-bba4-90c0f105b211
document_type_id	1	efa60f8f-2b72-4dff-bf5c-d3a747d8fa08	e0912238-eecf-4f86-a5b4-6812a6733117
document	1114567321	efa60f8f-2b72-4dff-bf5c-d3a747d8fa08	4b1a51c6-fb21-4dbb-8be5-bf682ccdd2d0
status	1	efa60f8f-2b72-4dff-bf5c-d3a747d8fa08	e7ade2f5-027a-4ff3-a1d9-7417fea8d89b
document_type_id	1	63d44b1c-b79d-4fe6-a420-cb36c24d1bab	2b1648e3-9bfd-4562-ae2b-afb3563eef5c
document	11223456	63d44b1c-b79d-4fe6-a420-cb36c24d1bab	3bd6245a-666a-4ac4-8ebd-527516022fee
status	1	63d44b1c-b79d-4fe6-a420-cb36c24d1bab	9d850fb2-f7ef-4b5b-9b04-2d6919534c86
document_type_id	1	3a8a0a88-ed37-48bc-a271-1e05bf5ebbbc	06e60609-bc1e-4a97-959b-4ee4fe39e743
document	432123	3a8a0a88-ed37-48bc-a271-1e05bf5ebbbc	cd8a4cd4-359e-421a-9768-6ee79af666b7
status	1	3a8a0a88-ed37-48bc-a271-1e05bf5ebbbc	32b4f446-81b9-4a9d-8365-77fd2f95cf2c
document_type_id	1	165558c1-79ed-48e1-b2d9-bb6b004242f1	5af6115a-03d3-4fea-b9cd-ff6ccac691ea
document	1112353	165558c1-79ed-48e1-b2d9-bb6b004242f1	e49bf6a5-4ce0-4caa-a91a-8e20d32a2a1e
status	1	165558c1-79ed-48e1-b2d9-bb6b004242f1	8ce9a3db-e160-419c-b223-85eba9da3522
document_type_id	1	72ee82f2-1197-4f7d-8bae-c9eccaf52821	98e32d97-29b0-4957-b816-33b65782016a
document	1114567824	72ee82f2-1197-4f7d-8bae-c9eccaf52821	94b5d2b1-1490-4c96-ba27-1b76487514ae
status	1	62e188c9-8ad7-4f6b-a927-cf1854cbd68d	a8dfa155-e73d-4401-b6b1-532f9566f7cf
document_type_id	1	e4a6d2e1-8228-4eda-b8a6-7ad349be1ecd	f1b21f81-8c3d-4048-8198-9c7f504caf4d
document	111368345	e4a6d2e1-8228-4eda-b8a6-7ad349be1ecd	55336b18-83b5-4b68-ae4a-c57ebc5412ff
status	1	e4a6d2e1-8228-4eda-b8a6-7ad349be1ecd	1790b3c3-13ad-4635-8f82-8823b0db7315
document_type_id	1	6d5806d4-7049-4170-a86d-7f5e0e653f2e	781b2c60-1e42-4380-8a05-8cf284c6f21a
document	101023423	6d5806d4-7049-4170-a86d-7f5e0e653f2e	74e4167a-1f75-4af3-ab53-b250845a1be9
status	1	6d5806d4-7049-4170-a86d-7f5e0e653f2e	1324e69d-aa49-4f93-9675-d0c67a7f2823
document_type_id	1	0bcfbeff-daab-4f14-9bfd-4179bc5dacf3	168966f6-9a97-4f81-97c7-e674d2056e69
document	11113234	0bcfbeff-daab-4f14-9bfd-4179bc5dacf3	4927c05e-6aa6-4504-857e-81c40a8bf1d6
status	1	0bcfbeff-daab-4f14-9bfd-4179bc5dacf3	1a4ca3b1-19a5-4c3b-a0cb-e73b304dd60e
document_type_id	1	6c3ad97b-ada6-49b0-a57b-ca93c357a4b0	e5bb9246-237a-4bc0-ae2f-03680f2ba3ab
document	111180343	6c3ad97b-ada6-49b0-a57b-ca93c357a4b0	93abdc87-79a0-4b7a-85ce-ce88a8e88843
status	1	6c3ad97b-ada6-49b0-a57b-ca93c357a4b0	bac53b21-8a5e-4e60-a498-1dbd6e8b1ebf
document_type_id	1	25ced1d6-dddb-4758-9716-adc20b739eb5	90bd8d9a-fa2b-454c-9637-3c49b2be286c
document	1113545	25ced1d6-dddb-4758-9716-adc20b739eb5	f8511527-68c8-4495-9262-cde6a59feeb5
status	1	25ced1d6-dddb-4758-9716-adc20b739eb5	0785e640-b9c5-40ca-85ed-089522bcdfe5
document_type_id	1	0c2f832a-9252-4573-aa75-d43ceac78ca8	a34bf3f9-5f13-4cfb-b119-249690fb478d
document	11223	0c2f832a-9252-4573-aa75-d43ceac78ca8	b4ed2837-2384-44ad-be07-4946974ffc82
status	1	0c2f832a-9252-4573-aa75-d43ceac78ca8	a3c23ff2-ccf5-4ad9-8ac5-4da6d56c65c5
document_type_id	1	fa06e958-cde8-4fc2-baed-da2062e20a4f	271d99fe-f1c4-4fb9-851c-545b9dfcad62
document	1012343	fa06e958-cde8-4fc2-baed-da2062e20a4f	e693ea72-ff95-4b52-bf0a-d56d3cc610d4
status	1	fa06e958-cde8-4fc2-baed-da2062e20a4f	179b80c0-781d-4a2d-a858-94a8d70edf39
document_type_id	1	f5b7c025-5680-43be-a093-28d99b475386	44c87b56-ab6e-4069-bbb1-243dfe785c4a
document	1223543	f5b7c025-5680-43be-a093-28d99b475386	322f7ba5-c78d-4545-b311-f4b5619b1fc0
status	1	f5b7c025-5680-43be-a093-28d99b475386	6592b34b-e912-42d5-9171-8ab3a7cdbba0
document_type_id	1	1d56cc28-3106-47c6-ae22-5eefa83015a8	433fdee3-8a3b-4469-a9be-b97b1e1bc56c
document	1123432	1d56cc28-3106-47c6-ae22-5eefa83015a8	b3fb0c8e-1c34-4635-b4c3-cfa8dbf0d228
status	1	1d56cc28-3106-47c6-ae22-5eefa83015a8	28f8880e-53f2-4645-9106-ab515d515982
document_type_id	1	1c0e10c9-5865-4287-b7aa-2f3f95cb6ad2	b04419cf-bc00-4f83-b672-c51e2c6a964d
document	11124234	1c0e10c9-5865-4287-b7aa-2f3f95cb6ad2	6ebc5337-6315-433b-839c-c33ba0660c31
status	1	1c0e10c9-5865-4287-b7aa-2f3f95cb6ad2	b1cd7c30-7510-472f-803c-89c5ee1a27b8
document_type_id	1	14a27dff-9d31-4008-924b-20ce531aaead	6fa82cf1-1f49-41f4-afc0-b312e442e1bc
document	1953674	14a27dff-9d31-4008-924b-20ce531aaead	68daa69e-c5c3-4ca7-ae7d-d3c45612427f
status	1	14a27dff-9d31-4008-924b-20ce531aaead	6cd70790-99cd-4f50-9120-889c9a90d62a
document_type_id	2	24454791-6aa2-4067-b158-8b13a4808ca9	64ca3f72-c8ab-473b-a0ea-5b2def120294
document	11102343	24454791-6aa2-4067-b158-8b13a4808ca9	565b7711-f1d6-44e7-8101-53eb2fd5c874
status	1	24454791-6aa2-4067-b158-8b13a4808ca9	edd0812d-58fd-4b2b-bfa3-4b074b9d68c1
document_type_id	2	348847b5-391a-4ace-b46f-4611dee37aa9	0c27ea2d-3278-48a3-a3a9-6ea5556c9dbd
document	1101323	348847b5-391a-4ace-b46f-4611dee37aa9	93f1b0e3-6eed-431d-a8a5-320054c8f46b
status	1	348847b5-391a-4ace-b46f-4611dee37aa9	297b4f03-1c34-4028-a021-67cb4b607da5
document_type_id	1	c0ec4e2b-9e77-4567-9bb0-80a5cd82bbde	114e8e4e-5e25-4290-b6b0-e6307aa6d46e
document	1122343	c0ec4e2b-9e77-4567-9bb0-80a5cd82bbde	1d351ba4-88bd-4366-b46a-538052692a63
status	1	c0ec4e2b-9e77-4567-9bb0-80a5cd82bbde	70274d3f-ecc0-4d30-bb0b-e7844a02bc2b
document_type_id	2	c85c3e28-058e-4172-ad3b-31a0f9b877ad	2e33d498-9876-4141-a4fa-fb394b874d4c
document	110342	c85c3e28-058e-4172-ad3b-31a0f9b877ad	f94eea60-5e0e-41d0-a6aa-a14a4092d7b2
status	1	c85c3e28-058e-4172-ad3b-31a0f9b877ad	0470a655-1904-427e-88f6-64f675f70137
document_type_id	1	bdd8865d-d55e-41bc-818a-0793d42d4804	ea07ee64-bff5-4a75-b98a-fa749d88e7e0
document	1113244	bdd8865d-d55e-41bc-818a-0793d42d4804	be4db138-9020-494e-956c-e48fe92f1b48
status	1	bdd8865d-d55e-41bc-818a-0793d42d4804	42ac70ac-4847-4c9a-9e28-cb8105eed4dc
document_type_id	1	1426fc20-d890-4ac1-b17b-b8591e688509	64fcf25f-04e8-4877-8c5f-930b0afabec7
document	11023341	1426fc20-d890-4ac1-b17b-b8591e688509	4286e656-152a-46bc-92a4-390cfc088a8f
status	1	1426fc20-d890-4ac1-b17b-b8591e688509	68771a59-883b-44ef-bf12-f1825d12bab1
document_type_id	1	d4120265-1938-49dd-8f23-72d4ee67fdfd	1f43fdda-cb72-4011-8648-f987ca9d3f3e
document	1110342	d4120265-1938-49dd-8f23-72d4ee67fdfd	66500d81-bb27-41fc-9210-7a1971dc33f1
status	1	d4120265-1938-49dd-8f23-72d4ee67fdfd	f5ed8950-896b-4a1f-b941-adda1c08624e
document_type_id	1	013ff66c-bf50-4505-b2ef-fad3f99d7c6e	a1800c9f-ed30-4022-8ec5-59421f3366af
document	11012324	013ff66c-bf50-4505-b2ef-fad3f99d7c6e	a7d22a64-1ce5-4f93-ba3e-4e2ff6b1b932
status	1	013ff66c-bf50-4505-b2ef-fad3f99d7c6e	cb6e15ee-e68b-4cc8-868f-2a677622a241
document_type_id	1	ce1ad31a-f6d2-49d1-ad7b-35503ae4874f	b89e55eb-2328-464f-8bc9-849c50f06c46
document	11012342	ce1ad31a-f6d2-49d1-ad7b-35503ae4874f	1954663f-e481-4b8e-8e10-7ea25a5088cf
status	1	ce1ad31a-f6d2-49d1-ad7b-35503ae4874f	576f8129-9e69-4abe-b4c1-2ffd51efedb3
document_type_id	1	706bc342-07f0-442a-8a17-f0cbf568c179	7670006d-d3bd-4f82-b5a8-279e59a0426b
document	3242432423423	706bc342-07f0-442a-8a17-f0cbf568c179	cd95aeda-dfaa-413b-bd84-f8c9f2633f08
status	1	706bc342-07f0-442a-8a17-f0cbf568c179	4903dcab-c2da-490b-9c52-14a96cc368c5
status	1	66e2a633-fd06-4935-8ed3-0b7c0c1c4254	c495eeba-1a05-4af1-8b49-078460cf1b5e
document_type_id	1	337939ac-8e1f-4497-929d-e1096588d702	e88d0dcb-8dae-4cc1-be64-4c06c61e35cf
document	112133242	337939ac-8e1f-4497-929d-e1096588d702	9f96bd24-5ab3-4ffb-8ee8-4d6d8a9e55aa
status	1	337939ac-8e1f-4497-929d-e1096588d702	e953b2d0-b07d-4080-8697-92b8643800e3
status	1	1e1d0fbb-e9a6-4c49-ab05-7a2e85aa87cf	dbeb4443-e731-404d-9c8e-e1ad1234e22d
document_type_id	1	70007130-64a0-4d8b-b7ed-ea913dfac04b	c308fb3f-b88e-48df-a08c-3ad10f543290
document	45353453	70007130-64a0-4d8b-b7ed-ea913dfac04b	6ff97bd6-59af-4c9b-b2da-37ccb038fdeb
status	1	70007130-64a0-4d8b-b7ed-ea913dfac04b	8c793ab0-ec85-4b09-8430-fc3e53aecf98
document_type_id	1	f2d53503-ad13-4206-9016-111a0e124aaf	4d0d13cf-70b3-4c93-ac86-8bdfd35d6bdf
document	1100303135	f2d53503-ad13-4206-9016-111a0e124aaf	d3f6e213-9f09-4040-98f7-268637021849
status	1	f2d53503-ad13-4206-9016-111a0e124aaf	270aa891-c407-4ce3-9048-8db675b1ce08
document_type_id	1	4c18bb87-780b-4518-98ab-8183e1d9c056	bbb2e9c0-13ed-4140-b3e9-41d0d77bfe1f
document	21213516516	4c18bb87-780b-4518-98ab-8183e1d9c056	05066424-6fa8-4da4-8cb7-03f6574a5db3
status	1	4c18bb87-780b-4518-98ab-8183e1d9c056	1f1516b6-9d15-4c83-a6f9-2a46f5f82dd5
document_type_id	1	13f378b1-2b68-4305-b7ab-e42b902e9e61	3b094001-d20d-437c-9011-90b07756ac0d
document	2354776867	13f378b1-2b68-4305-b7ab-e42b902e9e61	635cf00a-641d-4a65-a4bb-23e828357f5f
status	1	13f378b1-2b68-4305-b7ab-e42b902e9e61	393c3c84-f9d3-4bee-8e34-35de1e03f3a7
document_type_id	1	5b1cc316-62aa-48cc-8f2b-9a3a75d2f0a7	e83c93fa-b338-4c04-b98a-0736e2575221
document	654564165	5b1cc316-62aa-48cc-8f2b-9a3a75d2f0a7	8ee0b996-a1dc-4fb0-9ba6-41d4b1ae255d
status	1	5b1cc316-62aa-48cc-8f2b-9a3a75d2f0a7	680226ea-9e81-40f2-b880-3b015c778885
document_type_id	1	83e0952b-6abf-4e05-ad2b-4203440359d8	cbd8d7ae-df64-4932-97e8-4a2806b8f5c0
document	23546679	83e0952b-6abf-4e05-ad2b-4203440359d8	46c033d7-6b42-46bc-abac-601b7163bdc6
status	1	83e0952b-6abf-4e05-ad2b-4203440359d8	03274a1b-6042-4bea-904f-28903d4bf877
document_type_id	1	f9646cdc-d011-4d2b-8e77-9683d9485157	f1afc829-8cd8-46ad-bedd-a0e01b108d9d
document	12234231	f9646cdc-d011-4d2b-8e77-9683d9485157	dc0e8c61-c4df-4d64-a60f-3e2a2e25d6d2
status	1	f9646cdc-d011-4d2b-8e77-9683d9485157	32011ccc-f4a1-4467-80c3-15da62062630
document_type_id	1	3a06af98-7f3b-45d4-9956-78eb6cb2dac1	a96cf874-a8c4-4cfc-9a00-9e81dfa23fee
document	111345554463	3a06af98-7f3b-45d4-9956-78eb6cb2dac1	1ced9ada-4016-4bec-bf39-2baa9a2f35f6
status	1	3a06af98-7f3b-45d4-9956-78eb6cb2dac1	b984bb42-9187-415f-b251-9cf21faf2379
document_type_id	1	f7ab8ec5-e8fa-4916-942a-ee0f24a5117a	a209228f-52f2-4ce2-bc8d-0a74c0271c07
document	111223433	f7ab8ec5-e8fa-4916-942a-ee0f24a5117a	37feb602-b0c9-4b39-8769-bf211a534c40
status	1	f7ab8ec5-e8fa-4916-942a-ee0f24a5117a	e56cca4f-0031-4a10-909f-ec064787032a
document_type_id	1	0191549c-b4c1-41ef-a55a-b3b53859c433	746beaaa-fa59-46fa-b0d7-ae3d3cf32233
document	11242423	0191549c-b4c1-41ef-a55a-b3b53859c433	047b5719-d65c-4127-b02c-bd85e7c394bd
status	1	0191549c-b4c1-41ef-a55a-b3b53859c433	b25a51ab-fe58-4fd7-a15c-36ddb3589ccf
document_type_id	1	75008614-ff47-44aa-9e46-61c0f0389953	7c779af9-96b5-41b3-b52f-3d8bf41c0e12
document	11233241	75008614-ff47-44aa-9e46-61c0f0389953	a111f6bc-84fc-4912-9e92-f22dbedbec73
status	1	75008614-ff47-44aa-9e46-61c0f0389953	a4fe323c-66ee-4707-809f-40fcc7065807
document_type_id	2	e6759928-1740-492a-aee0-dda5cde4cefa	93df32fd-2234-4374-b13f-acf710a15995
document	543121422	e6759928-1740-492a-aee0-dda5cde4cefa	ee9efece-3912-4e8c-aacf-5c36d3117372
status	1	e6759928-1740-492a-aee0-dda5cde4cefa	c6320b66-3471-417c-be65-180b4fc827c1
document_type_id	1	4cfd6767-855c-4847-a726-a1d5af24904c	ba8560e9-b2a3-4fcc-a4f5-12987758e715
document	123456	4cfd6767-855c-4847-a726-a1d5af24904c	3204e82e-3bbd-43b2-9523-82c94aa84fd0
status	1	4cfd6767-855c-4847-a726-a1d5af24904c	bff8b778-05c7-4dc9-9124-b2870c8c1abf
document_type_id	1	3d47428e-a4a5-45fe-9b84-69211387e812	1b82f214-bc35-4ce3-82ff-cef134a1d441
status	0	3d47428e-a4a5-45fe-9b84-69211387e812	317caccf-3d43-4852-b81b-f40310be1d3f
document	99999999999	3d47428e-a4a5-45fe-9b84-69211387e812	c4994443-40e6-4c83-a15f-e1dbd4531b4e
document_type_id	1	15e0ab82-5518-40f2-83ad-7d4801520b41	eec6a9ff-dfd9-47f8-99a9-e30faa876415
document	2945743	15e0ab82-5518-40f2-83ad-7d4801520b41	1b935b49-f1d0-4e63-8c30-7b4d2eee9a09
status	1	15e0ab82-5518-40f2-83ad-7d4801520b41	71d5ed1e-cf19-48d3-8112-a85a95ed6508
document_type_id	2	a8a25637-77a2-4734-9b21-17a63a6080e5	263f6f9e-a00c-483d-9126-f6d9f960c4d4
document	10932780003	a8a25637-77a2-4734-9b21-17a63a6080e5	95f0ef61-1879-4202-82e1-a6ec512a178c
status	1	a8a25637-77a2-4734-9b21-17a63a6080e5	b18d1545-7750-4b40-91fd-ffed7fef3cc3
avatar_id	7	13f96781-987b-4ad2-9713-74fcf62e8829	3405ad7b-d6e2-4285-871b-c474826a1561
document_type_id	1	13f96781-987b-4ad2-9713-74fcf62e8829	7ef9744b-b98f-47b3-8be4-dc2ea5fe020d
document	11111111111111	13f96781-987b-4ad2-9713-74fcf62e8829	044e180e-626b-4206-a958-42752062656a
status	1	13f96781-987b-4ad2-9713-74fcf62e8829	ff382518-3b1e-4668-86f3-c7cc44dc90ea
document_type_id	1	5fe59f21-5600-430b-9b7c-2f239727e1e9	732916a4-37a2-46de-8e63-979f21773dbb
document	22222222222222	5fe59f21-5600-430b-9b7c-2f239727e1e9	79d172ec-263f-4299-9b6f-e39acbc4ceb6
status	1	5fe59f21-5600-430b-9b7c-2f239727e1e9	b5a4164c-dfd4-4bac-90f6-3583fdf10ae0
document_type_id	5	3324511b-2f8d-448b-892f-25f857a503d4	44506227-46c2-477a-9d10-12e3d2bf95da
document	1061818546	3324511b-2f8d-448b-892f-25f857a503d4	17e02c9f-d7a7-477b-b22f-d93d30eab0be
status	1	3324511b-2f8d-448b-892f-25f857a503d4	13492f61-709d-4d58-a901-9ee458d55fb8
document_type_id	1	35daef6f-2cb9-4f13-a509-68a58af4adc3	f8b9a13b-ed37-4734-bab0-7b51437d416b
document	1113576378	35daef6f-2cb9-4f13-a509-68a58af4adc3	53a6c1b3-2b31-411d-be28-a364b2e2bcff
status	1	35daef6f-2cb9-4f13-a509-68a58af4adc3	fbb1f36b-8d41-4aba-96c6-611b344c639a
document	1110988342	66e2a633-fd06-4935-8ed3-0b7c0c1c4254	c72d7fb3-b2ac-414a-8ed0-047314a3a834
document	1112543565	5988b29b-dbae-4d50-ab58-20e9a9695f6d	032fb178-63dc-42a2-9db3-deff770a3a19
document_type_id	1	791f4166-1d93-4098-8a12-95dd373430e1	e377e7d5-582b-4540-93ea-9df7d2846671
document	1115736364	791f4166-1d93-4098-8a12-95dd373430e1	6f32f54a-1f23-497d-bc26-8e4e4be21451
status	1	791f4166-1d93-4098-8a12-95dd373430e1	acef6f78-fc26-4f0e-883d-1e1f13722e78
status	1	5bfe59e7-e008-4745-b2da-a2bcddbf6a1d	d06d4774-f90f-4565-aa1f-b9471c4bda46
document_type_id	5	16003bb0-854d-411a-b23c-f658eb33772f	320330e1-fd49-4d61-b008-be3f85bd6e10
document	1063567898	16003bb0-854d-411a-b23c-f658eb33772f	7fd1bacd-1d2a-440c-8a00-da59c08770b6
status	1	16003bb0-854d-411a-b23c-f658eb33772f	74b23409-199f-4016-a82e-b0ef8472500b
document_type_id	2	80add0de-c8b0-4397-8ac0-2a907944c2b7	2704d567-ce12-4ae0-9187-68babb01266d
document	1062764698	80add0de-c8b0-4397-8ac0-2a907944c2b7	0d6eb56a-099a-474e-a431-f90683cd522e
status	1	80add0de-c8b0-4397-8ac0-2a907944c2b7	ecba143d-f701-43a2-9efc-67f569b71a82
document_type_id	2	7d31faec-4180-4291-89f4-65d9abd68f1e	df8f03a2-57d8-493b-9126-c47fd1e93997
document	1061234567	7d31faec-4180-4291-89f4-65d9abd68f1e	848edea9-ac0c-4b49-864d-cf580c6d0729
status	1	7d31faec-4180-4291-89f4-65d9abd68f1e	c869582c-f494-41dd-b53c-d4c13681996f
document_type_id	2	c94ba7c0-c3ef-4646-a1fd-038983c70da3	143e682d-c4f3-4aa9-82b8-3a1cd9ec35bf
document	123456756	c94ba7c0-c3ef-4646-a1fd-038983c70da3	07e717eb-3c87-4ed6-83e1-7f037818bbc6
status	1	c94ba7c0-c3ef-4646-a1fd-038983c70da3	77472d30-917a-4d50-b885-170a8ce31283
document_type_id	2	3f5a88d3-0d6a-4da4-bfc2-9de3835c8cb1	8e0afca8-d12f-42fd-ac23-a57a96d4930a
document	123456789	3f5a88d3-0d6a-4da4-bfc2-9de3835c8cb1	1fb891ad-23be-498e-ab9b-e9e38b9d3c25
status	1	3f5a88d3-0d6a-4da4-bfc2-9de3835c8cb1	125550a3-b685-4c5f-8e2e-7301f4630620
document_type_id	1	e03c9ee7-1733-492b-a495-594b67392280	75b84337-13e9-4d12-b2fc-38b32a6c2d08
document	11232423	e03c9ee7-1733-492b-a495-594b67392280	34e9c19f-98f9-4493-a0bf-2434dd6f190e
status	1	e03c9ee7-1733-492b-a495-594b67392280	18b88736-5cdd-48fe-a857-728b6904c557
document_type_id	1	0b36810e-f04d-4019-9aa9-099d089260ae	53652112-be2a-4142-a808-8c6910cc1b85
document	1121420	0b36810e-f04d-4019-9aa9-099d089260ae	560e2409-a3f5-4ecb-b1d1-ad1c62e65452
status	1	0b36810e-f04d-4019-9aa9-099d089260ae	6f478b12-406f-4649-ab35-b65e2cc9ccc3
document_type_id	2	d47df20d-1474-4fda-b325-267527e61750	db00ca08-2039-4f14-81d4-52908ac1db4f
document	15621651651	d47df20d-1474-4fda-b325-267527e61750	91d69425-1b37-448a-83f5-ba3ec31ea1b1
status	1	d47df20d-1474-4fda-b325-267527e61750	1b8c4894-3073-48ba-8d0a-ea7fb066ac55
document_type_id	5	8c547b32-b654-4481-9128-96eb039ff339	72bd15b3-7cde-410a-afed-3113a8ac72c0
document	931222831746	8c547b32-b654-4481-9128-96eb039ff339	b19b5a90-bbc8-4a06-abab-d7884d9c2c1d
status	1	8c547b32-b654-4481-9128-96eb039ff339	aa694ebf-9e67-48e3-b009-17979bd543d5
document_type_id	5	55eadc3f-ceb5-49a1-9001-f562ebc0c3ba	219958e5-b9ac-4ffd-9cf3-41536a0c2b19
document	1114459848	55eadc3f-ceb5-49a1-9001-f562ebc0c3ba	cf488c6f-f550-445f-8327-bfa56bd4ac78
status	1	55eadc3f-ceb5-49a1-9001-f562ebc0c3ba	418ae31f-8374-480b-9de3-94247b2c454e
document_type_id	2	03fcdd36-6140-46ff-8143-9c5e26ff48ba	a6535c8f-e834-46eb-8685-f6f33e68facc
document	11145543322	03fcdd36-6140-46ff-8143-9c5e26ff48ba	50520c50-c69a-46c5-9ac3-8df968f9daac
status	1	03fcdd36-6140-46ff-8143-9c5e26ff48ba	30fdd78f-c49b-4b5d-8092-8d732a47e392
document_type_id	1	9ecbe786-985e-4797-b0b9-2265046576ae	682bb535-4f1c-4420-aff8-b17caf027018
document	1412312311	9ecbe786-985e-4797-b0b9-2265046576ae	50d1eb2b-7af9-45c6-8432-1b9005c55d3f
status	1	9ecbe786-985e-4797-b0b9-2265046576ae	fec87b35-6c3e-476e-a45d-755a1a2b539c
document_type_id	2	32733d05-b2c0-4dc2-90d7-ba39b82725a1	90bed15d-6d88-4f1a-b1c9-40beaa4bdc16
document	2347238729	32733d05-b2c0-4dc2-90d7-ba39b82725a1	d51c66e8-9710-47a6-91be-423171ec4cc7
status	1	32733d05-b2c0-4dc2-90d7-ba39b82725a1	0dcf3853-0857-45b9-973a-fee4a5eb5b13
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
6347d9bd-3923-4283-a50c-6ba437309c91	\N	15eea6b0-892e-4379-bef7-d15d50ecb5fe	f	t	\N	\N	\N	ed5b49b5-f1d5-42c0-b2c5-8c2730931615	admin	1707839248575	\N	0
e4a6d2e1-8228-4eda-b8a6-7ad349be1ecd	andros@yopmail.com	andros@yopmail.com	t	t	\N	ANDROS GIO	GONZALES	7285fde1-76e9-40f3-9950-b53009f25138	andros	1713448972918	\N	0
2af08086-5b2d-4464-a2eb-9f0a85372011	edwin.fajardo@yopmail.com	edwin.fajardo@yopmail.com	t	t	\N	EDWIN	FAJARDO	7285fde1-76e9-40f3-9950-b53009f25138	edwin.fajardo	1713283815779	\N	0
61059eb2-95f8-4d4c-80b7-5d8d6474fcf3	alejandra.velazquez@yopmail.com	alejandra.velazquez@yopmail.com	t	t	\N	ALEJANDRA	VELAZQUEZ	7285fde1-76e9-40f3-9950-b53009f25138	alejandra.velazquez	1713286616905	\N	0
efa60f8f-2b72-4dff-bf5c-d3a747d8fa08	sulesy.guzman@yopmail.com	sulesy.guzman@yopmail.com	t	t	\N	SULESY	GUZMAN	7285fde1-76e9-40f3-9950-b53009f25138	sulesy.guzman	1713286950767	\N	0
66e2a633-fd06-4935-8ed3-0b7c0c1c4254	nicolperez@yopmail.com	nicolperez@yopmail.com	t	t	\N	NICOLE	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	nicolperez	1712785034679	\N	0
474681f4-b61e-4740-ab8e-59ac2ae82a06	institucional.regional@yopmail.com	institucional.regional@yopmail.com	t	t	\N	ANDRES	VELEZ	7285fde1-76e9-40f3-9950-b53009f25138	institucional.regional	1710260643147	\N	0
a05de10d-ffcb-4a25-9036-d753878b6f9f	estoesunaprueba@yopmail.com	estoesunaprueba@yopmail.com	t	t	\N	MARIA	SEGURA	7285fde1-76e9-40f3-9950-b53009f25138	estoesunaprueba	1710956174453	\N	0
72ee82f2-1197-4f7d-8bae-c9eccaf52821	juan.rodriguez@yopmail.com	juan.rodriguez@yopmail.com	t	t	\N	JUAN JOSE	RODRIGUEZ	7285fde1-76e9-40f3-9950-b53009f25138	juan.rodriguez	1713295631733	\N	0
25bfc9e3-60e0-424e-92de-0f6d18c82bfc	superadmin.regional@yopmail.com	superadmin.regional@yopmail.com	t	t	\N	SUPERADMINN SUPERADMIN	SUPERADMIN SUPERADMIN	7285fde1-76e9-40f3-9950-b53009f25138	superadmin.regional	\N	\N	0
e82f596a-d606-48b3-b735-f4701b5fa930	mariocasas@yopmail.com	mariocasas@yopmail.com	t	t	\N	MARIO	CASAS	7285fde1-76e9-40f3-9950-b53009f25138	mariocasas	1713209113815	\N	0
1215bbd5-f7a9-46f5-a075-038b3d860367	juan.reyes@yopmail.com	juan.reyes@yopmail.com	t	t	\N	JUAN PABLO	REYES	7285fde1-76e9-40f3-9950-b53009f25138	juan.reyes	1713295713569	\N	0
4fdd3a5f-9118-460a-94de-580387545e59	tatianagonza@yopmail.com	tatianagonza@yopmail.com	t	t	\N	TATIANA	GONZALES	7285fde1-76e9-40f3-9950-b53009f25138	tatianagonza	1713301123447	\N	0
5ea24cee-ec94-4bcb-938a-fde68c09b174	angel@yopmail.com	angel@yopmail.com	t	t	\N	ANGEL	ARICAPA	7285fde1-76e9-40f3-9950-b53009f25138	angel	1713301202339	\N	0
dfcf8074-02c5-4545-b648-5953717c4d21	secretaria.valle@yopmail.com	secretaria.valle@yopmail.com	t	t	\N	SECRETARIA	VALLE	7285fde1-76e9-40f3-9950-b53009f25138	secretaria.valle	1712955861381	\N	0
4c460c7d-23d9-4f32-80a6-958826a65ac6	andrea@yopmail.com	andrea@yopmail.com	t	t	\N	ANDREA	VARGAS	7285fde1-76e9-40f3-9950-b53009f25138	andrea	1713363829826	\N	0
6933834e-59b1-4f18-b82d-9eb9c4728c98	lina.asprilla@yopmail.com	lina.asprilla@yopmail.com	t	t	\N	LINA	ASPRILLA	7285fde1-76e9-40f3-9950-b53009f25138	lina.asprilla	1713370964536	\N	0
f699754d-3106-456c-b6fb-82842131ce70	juancastro@yopmail.com	juancastro@yopmail.com	t	t	\N	JUAN	CASTRO	7285fde1-76e9-40f3-9950-b53009f25138	juancastro	1713276167179	\N	0
e1566680-d554-4636-ab44-b79fcfbe5d7f	tatiana@yopmail.com	tatiana@yopmail.com	t	t	\N	TATIANA	CAICEDO	7285fde1-76e9-40f3-9950-b53009f25138	tatiana	1713371174749	\N	0
1ed7195c-9659-4831-984a-ff734c85a886	sofia@yopmail.com	sofia@yopmail.com	t	t	\N	SOFIA	SEGURA	7285fde1-76e9-40f3-9950-b53009f25138	sofia	1713371280156	\N	0
091d1ef6-ac17-400c-a48d-dae43a5f52b5	johanaperez@yopmail.com	johanaperez@yopmail.com	t	t	\N	JOHANA	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	johanaperez	1713276377957	\N	0
62e188c9-8ad7-4f6b-a927-cf1854cbd68d	angie.santos@yopmail.com	angie.santos@yopmail.com	t	t	\N	ANGIE	SANTOS	7285fde1-76e9-40f3-9950-b53009f25138	angie.santos	1713448874001	\N	0
5bfe59e7-e008-4745-b2da-a2bcddbf6a1d	docente.regional@yopmail.com	docente.regional@yopmail.com	t	t	\N	JUANITO	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	docente.regional	\N	\N	0
6d5806d4-7049-4170-a86d-7f5e0e653f2e	giss@yopmail.com	giss@yopmail.com	t	t	\N	GISS	FAJARDO	7285fde1-76e9-40f3-9950-b53009f25138	giss	1713449083389	\N	0
0bcfbeff-daab-4f14-9bfd-4179bc5dacf3	edwin@yopmail.com	edwin@yopmail.com	t	t	\N	EDWIN	CASTRO	7285fde1-76e9-40f3-9950-b53009f25138	edwin	1713449330278	\N	0
0b712472-2dc1-4a11-bfc5-79dae2f1f407	angie@yopmail.com	angie@yopmail.com	t	t	\N	ANGIE	VIDAL	7285fde1-76e9-40f3-9950-b53009f25138	angie	1713233432387	\N	0
6c3ad97b-ada6-49b0-a57b-ca93c357a4b0	jhosua.molina@yopmail.com	jhosua.molina@yopmail.com	t	t	\N	JHOSUA	MOLINA	7285fde1-76e9-40f3-9950-b53009f25138	jhosua.molina	1713449417401	\N	0
24454791-6aa2-4067-b158-8b13a4808ca9	andrea.solarte@yopmail.com	andrea.solarte@yopmail.com	t	t	\N	ANDREA	SOLARTE	7285fde1-76e9-40f3-9950-b53009f25138	andrea.solarte	1713463638233	\N	0
348847b5-391a-4ace-b46f-4611dee37aa9	mariana.cuevas@yopmail.com	mariana.cuevas@yopmail.com	t	t	\N	MARIANA	CUEVAS	7285fde1-76e9-40f3-9950-b53009f25138	mariana.cuevas	1713463730968	\N	0
70007130-64a0-4d8b-b7ed-ea913dfac04b	nicolperezz@yopmail.com	nicolperezz@yopmail.com	t	t	\N	NICOLE	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	nicolperezz	1714660328951	\N	0
52d5bd1f-dd8b-4ac9-b650-108e8dc1765a	maria.castro@yopmail.com	maria.castro@yopmail.com	t	t	\N	MARIA	CASTRO	7285fde1-76e9-40f3-9950-b53009f25138	maria.castro	1713208930434	\N	0
1e1d0fbb-e9a6-4c49-ab05-7a2e85aa87cf	pepito33@yopmail.com	pepito33@yopmail.com	t	t	\N	PEPITO	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	pepito33	1712935737741	\N	0
55a9ef32-1560-41de-8752-084bc7e58494	angied@yopmail.com	angied@yopmail.com	t	t	\N	Pepito	Perez	7285fde1-76e9-40f3-9950-b53009f25138	angied	1713450249299	\N	0
14a27dff-9d31-4008-924b-20ce531aaead	mariopayan@yopmail.com	mariopayan@yopmail.com	t	t	\N	MARIO	PAYAN	7285fde1-76e9-40f3-9950-b53009f25138	mariopayan	1713456382787	\N	0
e4cc5a54-5ff1-4a5e-b90c-11466df588df	rfoijfdidids@kdh.com	rfoijfdidids@kdh.com	t	t	\N	EL COORDINADOR	fsfsdfsdfs	7285fde1-76e9-40f3-9950-b53009f25138	el coordinadorfsfsdfsdfs	1712323065821	\N	0
733415bf-7a92-48e3-a040-a4fe4aed5f2f	estudiante.regional@yopmail.com	estudiante.regional@yopmail.com	t	t	\N	JUANITO	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	estudiante.regional	\N	\N	0
23dc6e35-5123-49dd-855a-6bbc89e7cc8f	camilo@yopmail.com	camilo@yopmail.com	t	t	\N	Camilo Andres	Cuevas	7285fde1-76e9-40f3-9950-b53009f25138	camilocuevas	1712929875061	\N	0
f2d53503-ad13-4206-9016-111a0e124aaf	spark2@yopmail.com	spark2@yopmail.com	t	t	\N	NICOLAS CORTES	ANDRES RIOS	7285fde1-76e9-40f3-9950-b53009f25138	spark2	1715887944161	\N	0
884e45fe-2db9-45b4-966b-cb37517f2ea0	secretaria.cauca@yopmail.com	secretaria.cauca@yopmail.com	t	t	\N	SECRETARIA	CAUCA	7285fde1-76e9-40f3-9950-b53009f25138	secretaria.cauca	1712956078412	\N	0
1efa5c4f-60ec-41d1-b9bb-92210aa2560f	juan.pedroza@yopmail.com	juan.pedroza@yopmail.com	t	t	\N	JUAN DAVID	PEDROZA	7285fde1-76e9-40f3-9950-b53009f25138	juan.pedroza	1713281820076	\N	0
63d44b1c-b79d-4fe6-a420-cb36c24d1bab	henrry@yopmail.com	henrry@yopmail.com	t	t	\N	HENRRY	PIEDRAITA	7285fde1-76e9-40f3-9950-b53009f25138	henrry	1713293172096	\N	0
c223d845-28d1-40b1-adae-89ad5cd9a3aa	lola@yopmail.com	lola@yopmail.com	t	t	\N	LOLA	FAJARDO	7285fde1-76e9-40f3-9950-b53009f25138	lola	1713293446563	\N	0
3a8a0a88-ed37-48bc-a271-1e05bf5ebbbc	angela@yopmail.com	angela@yopmail.com	t	t	\N	ANGELA	GONZALES	7285fde1-76e9-40f3-9950-b53009f25138	angela	1713293519188	\N	0
165558c1-79ed-48e1-b2d9-bb6b004242f1	luisa@yopmail.com	luisa@yopmail.com	t	t	\N	LUISA	ALZATE	7285fde1-76e9-40f3-9950-b53009f25138	luisa	1713293780953	\N	0
e4e8223b-c613-46d6-bf2a-43e167a0586a	malory@yopmail.com	malory@yopmail.com	t	t	\N	MALORY	LASO	7285fde1-76e9-40f3-9950-b53009f25138	malory	1713299094983	\N	0
15718055-3738-4e99-85ec-594f8b307122	secretaria.narino@yopmail.com	secretaria.narino@yopmail.com	t	t	\N	SECRETARIA	NARINO	7285fde1-76e9-40f3-9950-b53009f25138	secretaria.narino	1712956502536	\N	0
b803f43f-5fa7-4aea-b076-3ad85bce6585	institucion.educativa@yopmail.com	institucion.educativa@yopmail.com	t	t	\N	JUAN	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	institucion.educativa	1712956851649	\N	0
23876565-b218-4170-aeb1-602484f62367	rodolfo@yopmail.com	rodolfo@yopmail.com	t	t	\N	RODOLFO	VANEGAS	7285fde1-76e9-40f3-9950-b53009f25138	rodolfo	1713313540611	\N	0
955dbf89-0e83-488f-9541-b26cc4a41494	nixon@yopmail.com	nixon@yopmail.com	t	t	\N	NIXON	AYALA	7285fde1-76e9-40f3-9950-b53009f25138	nixon	1713313600680	\N	0
7b9993cc-2d01-4d63-9093-2177c614d407	yuri@yopmail.com	yuri@yopmail.com	t	t	\N	YURI	ROA	7285fde1-76e9-40f3-9950-b53009f25138	yuri	1713313669349	\N	0
16fa502c-57cf-4055-9543-a0eacc6291e8	pedro.guzman@yopmail.com	pedro.guzman@yopmail.com	t	t	\N	PEDRO	GUZMAN	7285fde1-76e9-40f3-9950-b53009f25138	pedro.guzman	1713368116432	\N	0
2e55e737-747c-4051-869d-c077e9217664	cristian@yopmail.com	cristian@yopmail.com	t	t	\N	CRISTIAN	CASTRO	7285fde1-76e9-40f3-9950-b53009f25138	cristian	1713448056610	\N	0
25ced1d6-dddb-4758-9716-adc20b739eb5	katy@yopmail.com	katy@yopmail.com	t	t	\N	KATY	PIEDRAITA	7285fde1-76e9-40f3-9950-b53009f25138	katy	1713454228966	\N	0
0c2f832a-9252-4573-aa75-d43ceac78ca8	jenny@yopmail.com	jenny@yopmail.com	t	t	\N	JENNY	POTES	7285fde1-76e9-40f3-9950-b53009f25138	jenny	1713454297617	\N	0
fa06e958-cde8-4fc2-baed-da2062e20a4f	carlos@yopmail.com	carlos@yopmail.com	t	t	\N	CARLOS	CABRERA	7285fde1-76e9-40f3-9950-b53009f25138	carlos	1713454560884	\N	0
f5b7c025-5680-43be-a093-28d99b475386	docente-peer1@yopmail.com	docente-peer1@yopmail.com	t	t	\N	MAURICIO	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	docente-peer1	1713454710182	\N	0
1d56cc28-3106-47c6-ae22-5eefa83015a8	pedroperez@yopmail.com	pedroperez@yopmail.com	t	t	\N	PEDRO	SANTOS	7285fde1-76e9-40f3-9950-b53009f25138	pedroperez	1713454792312	\N	0
1c0e10c9-5865-4287-b7aa-2f3f95cb6ad2	mariapie@yopmail.com	mariapie@yopmail.com	t	t	\N	MARIA	PIEDRAITA	7285fde1-76e9-40f3-9950-b53009f25138	mariapie	1713454923561	\N	0
c85c3e28-058e-4172-ad3b-31a0f9b877ad	miriam@yopmail.com	miriam@yopmail.com	t	t	\N	MIRIAM	POTES	7285fde1-76e9-40f3-9950-b53009f25138	miriam	1713467004683	\N	0
5ed10d1e-01ec-4d28-9af3-ca35d791bf8e	elena@yopmail.com	elena@yopmail.com	t	t	\N	ELENA	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	elena	1713458704081	\N	0
c0ec4e2b-9e77-4567-9bb0-80a5cd82bbde	camila.marino@yopmail.com	camila.marino@yopmail.com	t	t	\N	CAMILA	MARINO	7285fde1-76e9-40f3-9950-b53009f25138	camila.marino	1713463908772	\N	0
bdd8865d-d55e-41bc-818a-0793d42d4804	dianamaru@yopmail.com	dianamaru@yopmail.com	t	t	\N	DIANA	MARULANDA	7285fde1-76e9-40f3-9950-b53009f25138	dianamaru	1713467096267	\N	0
1426fc20-d890-4ac1-b17b-b8591e688509	sisifo@yopmail.com	sisifo@yopmail.com	t	t	\N	SISIFO	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	sisifo	1713471943232	\N	0
d4120265-1938-49dd-8f23-72d4ee67fdfd	julian.martinez@yopmail.com	julian.martinez@yopmail.com	t	t	\N	JULIAN	MARTINEZ	7285fde1-76e9-40f3-9950-b53009f25138	julian.martinez	1713472744126	\N	0
013ff66c-bf50-4505-b2ef-fad3f99d7c6e	nancy@yopmail.com	nancy@yopmail.com	t	t	\N	NANCY	REYES	7285fde1-76e9-40f3-9950-b53009f25138	nancy	1713472912890	\N	0
19487b26-a45c-49d5-af8d-66f0203c2595	mariorodriguez@yopmail.com	mariorodriguez@yopmail.com	t	t	\N	MARIO	RODRIGUEZ	7285fde1-76e9-40f3-9950-b53009f25138	mariorodriguez	1714663427251	\N	0
3aec32aa-9c41-45a1-a9d8-ee2eaaa0acf7	mariorodriguezz@yopmail.com	mariorodriguezz@yopmail.com	t	t	\N	MARIO	RODRIGUEZZ	7285fde1-76e9-40f3-9950-b53009f25138	mariorodriguezz	1714663540110	\N	0
1f942eec-5cb1-4698-af00-586a0d6a263e	mariocasaas@yopmail.com	mariocasaas@yopmail.com	t	t	\N	MARIO	CASAS	7285fde1-76e9-40f3-9950-b53009f25138	mariocasaas	1714664185676	\N	0
cd8fe726-c7dd-4014-8a85-5b156e3db936	mariocasaaas@yopmail.com	mariocasaaas@yopmail.com	t	t	\N	MARIO	CASAS	7285fde1-76e9-40f3-9950-b53009f25138	mariocasaaas	1714664377444	\N	0
f6bd8c8c-5e71-41cd-8d73-6d6eb50d8b09	mariocaseas@yopmail.com	mariocaseas@yopmail.com	t	t	\N	MARIO	CASAS	7285fde1-76e9-40f3-9950-b53009f25138	mariocaseas	1714669849507	\N	0
af141ff5-d16d-47a2-9643-1444059f8476	amariocaseas@yopmail.com	amariocaseas@yopmail.com	t	t	\N	MARIO	CASAS	7285fde1-76e9-40f3-9950-b53009f25138	amariocaseas	1714669893256	\N	0
ce1ad31a-f6d2-49d1-ad7b-35503ae4874f	sophiasegura@yopmail.com	sophiasegura@yopmail.com	t	t	\N	SOPHIA	SEGURA	7285fde1-76e9-40f3-9950-b53009f25138	sophiasegura	1713881488320	\N	0
650c4f87-ef2b-4f50-9ac7-be7aba48a6d3	administrador.regional@yopmail.com	administrador.regional@yopmail.com	t	t	\N	ADMINN	ADMIN	7285fde1-76e9-40f3-9950-b53009f25138	administrador.regional	1710260465705	\N	0
5988b29b-dbae-4d50-ab58-20e9a9695f6d	emirato@yopmail.com	emirato@yopmail.com	t	t	\N	SOCRATES	EMIRATO	7285fde1-76e9-40f3-9950-b53009f25138	emirato	1713267074011	\N	0
34afd408-2820-484a-9681-9b875d80bcd6	jose.escobar@yopmail.com	jose.escobar@yopmail.com	t	t	\N	JOSE	ESCOBAR	7285fde1-76e9-40f3-9950-b53009f25138	jose.escobar	1713280806135	\N	0
07198925-a1a9-43c3-b3b5-d324d0ee38b8	mariocaosas@yopmail.com	mariocaosas@yopmail.com	t	t	\N	MARIO	CASAS	7285fde1-76e9-40f3-9950-b53009f25138	mariocaosas	1714670124577	\N	0
bb0a481e-668d-4487-8a0f-ce138ba4c59f	estoesunaprueba2@yopmail.com	estoesunaprueba2@yopmail.com	t	t	\N	MARIA FERNANDA	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	estoesunaprueba2	1714671291160	\N	0
337939ac-8e1f-4497-929d-e1096588d702	rodolfo.aricapa@yopmail.com	rodolfo.aricapa@yopmail.com	t	t	\N	RODOLFO	ARICAPA	7285fde1-76e9-40f3-9950-b53009f25138	rodolfo.aricapa	1714682309965	\N	0
f9646cdc-d011-4d2b-8e77-9683d9485157	jorge.erazo@yopmail.com	jorge.erazo@yopmail.com	t	t	\N	JORGE	ERAZO	7285fde1-76e9-40f3-9950-b53009f25138	jorge.erazo	1716238978101	\N	0
3f5a88d3-0d6a-4da4-bfc2-9de3835c8cb1	usuariounity@yopmail.com	usuariounity@yopmail.com	t	t	\N	USUARIO	UNITY	7285fde1-76e9-40f3-9950-b53009f25138	usuariounity	1715025349398	\N	0
eedd37c5-15b0-48d9-a80d-4306241da853	julio.jaramillo@yopmail.com	julio.jaramillo@yopmail.com	t	t	\N	JULIO	JARAMILLO	7285fde1-76e9-40f3-9950-b53009f25138	julio.jaramillo	1715028083021	\N	0
fe8c1817-ee19-4ee5-a98b-26f6eba227c9	marino.cuevas@yopmail.com	marino.cuevas@yopmail.com	t	t	\N	MARINO	CUEVAS	7285fde1-76e9-40f3-9950-b53009f25138	marino.cuevas	1716239048324	\N	0
41ec1bd9-f26a-47d6-bca4-d9d71be87d0a	santiago.marin@yopmail.com	santiago.marin@yopmail.com	t	t	\N	SANTIAGO	MARIN	7285fde1-76e9-40f3-9950-b53009f25138	santiago.marin	1715031771316	\N	0
706bc342-07f0-442a-8a17-f0cbf568c179	otrasecretaria@yopmail.com	otrasecretaria@yopmail.com	t	t	\N	OTRA	SECRETARIA	7285fde1-76e9-40f3-9950-b53009f25138	otrasecretaria	1715182597593	\N	0
2d8f843f-8e66-432f-ad97-cdfdfef67a6b	jaime.adames@yopmail.com	jaime.adames@yopmail.com	t	t	\N	JAIME	ADAMES	7285fde1-76e9-40f3-9950-b53009f25138	jaime.adames	1716239293232	\N	0
70936cfc-cfc3-4b73-9ebb-fca04511a122	maicol.dominguez@yopmail.com	maicol.dominguez@yopmail.com	t	t	\N	MAICOL	DOMINGUEZ	7285fde1-76e9-40f3-9950-b53009f25138	maicol.dominguez	1715183814213	\N	0
ca86dd04-d3a1-44f9-96bd-6af27acbfb04	manuel.perez@yopmail.com	manuel.perez@yopmail.com	t	t	\N	MANUEL	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	manuel.perez	1715183916027	\N	0
d47df20d-1474-4fda-b325-267527e61750	usuariocalidad1@yopmail.com	usuariocalidad1@yopmail.com	t	t	\N	USUARIO	CALIDADUNO	7285fde1-76e9-40f3-9950-b53009f25138	usuariocalidad1	1715184556918	\N	0
3a06af98-7f3b-45d4-9956-78eb6cb2dac1	supervision.estudiante2@yopmail.com	supervision.estudiante2@yopmail.com	t	t	\N	SUPERVISIONESTUDIANTEDOS	SUPERVISIONESTUDIANTEDOS	7285fde1-76e9-40f3-9950-b53009f25138	supervision.estudiante2	1716243044013	\N	0
6ac01bc6-e22b-41e6-8115-ce9628c895d5	marcela-fuentes@yopmail.com	marcela-fuentes@yopmail.com	t	t	\N	MARCELA	FUENTES	7285fde1-76e9-40f3-9950-b53009f25138	marcela-fuentes	1715192513670	\N	0
81189a1a-105e-4e2b-8769-b414e8c535fc	catalina.villegas@yopmail.com	catalina.villegas@yopmail.com	t	t	\N	CATALINA	VILLEGAS	7285fde1-76e9-40f3-9950-b53009f25138	catalina.villegas	1715192619926	\N	0
e03c9ee7-1733-492b-a495-594b67392280	estudiante.interventoria1@yopmail.com	estudiante.interventoria1@yopmail.com	t	t	\N	ESTUDIANTE	INTERVENTORIAUNO	7285fde1-76e9-40f3-9950-b53009f25138	estudiante.interventoria1	1716243136091	\N	0
280de7d9-7b39-40e0-91e6-73d934a2e7c0	juan.benitez@yopmail.com	juan.benitez@yopmail.com	t	t	\N	JUAN CARLOS	BENITEZ	7285fde1-76e9-40f3-9950-b53009f25138	juan.benitez	1715268333739	\N	0
4c18bb87-780b-4518-98ab-8183e1d9c056	supervision1@yopmail.com	supervision1@yopmail.com	t	t	\N	USUARIO	SUPERVISIONUNO	7285fde1-76e9-40f3-9950-b53009f25138	supervision1	1715299442631	\N	0
bed26e83-627b-43c1-87ee-faa094c69909	supervision.estudiante1@yopmail.com	supervision.estudiante1@yopmail.com	t	t	\N	SUPERVISIONESTUDIANTEUNO	SUPERVISIONESTUDIANTEUNO	7285fde1-76e9-40f3-9950-b53009f25138	supervision.estudiante1	1716243195985	\N	0
13f378b1-2b68-4305-b7ab-e42b902e9e61	supervision2@yopmail.com	supervision2@yopmail.com	t	t	\N	USUARIO	SUPERVISIONDOS	7285fde1-76e9-40f3-9950-b53009f25138	supervision2	1715299482707	\N	0
5b1cc316-62aa-48cc-8f2b-9a3a75d2f0a7	interventoria1@yopmail.com	interventoria1@yopmail.com	t	t	\N	USUARIO	INTERVENTORIAUNO	7285fde1-76e9-40f3-9950-b53009f25138	interventoria1	1715299563919	\N	0
0b36810e-f04d-4019-9aa9-099d089260ae	estudiante.interventoria2@yopmail.com	estudiante.interventoria2@yopmail.com	t	t	\N	ESTUDIANTE	INTERVENTORIADOS	7285fde1-76e9-40f3-9950-b53009f25138	estudiante.interventoria2	1716243256405	\N	0
83e0952b-6abf-4e05-ad2b-4203440359d8	interventoria2@yopmail.com	interventoria2@yopmail.com	t	t	\N	USUARIO	INTERVENTORIADOS	7285fde1-76e9-40f3-9950-b53009f25138	interventoria2	1715299745835	\N	0
07c28a2e-345c-4269-b367-3cb6e483ccee	juan.dominguez@yopmail.com	juan.dominguez@yopmail.com	t	t	\N	JUAN	DOMINGUEZ	7285fde1-76e9-40f3-9950-b53009f25138	juan.dominguez	1715878756491	\N	0
540ba3cf-dd07-4729-884e-1c65ee1ce2ce	otrasecretarias@yopmail.com	otrasecretarias@yopmail.com	t	t	\N	OTRA	SECRETARIAS	7285fde1-76e9-40f3-9950-b53009f25138	otrasecretarias	1715878846820	\N	0
035b10a5-5a57-4109-b6e5-58e83a41c496	docenten4@yopmail.com	docenten4@yopmail.com	t	t	\N	DOCENTE	CUATRO	7285fde1-76e9-40f3-9950-b53009f25138	docenten4	1716401780645	\N	0
f7ab8ec5-e8fa-4916-942a-ee0f24a5117a	docenten1@yopmail.com	docenten1@yopmail.com	t	t	\N	DOCENTE	UNO	7285fde1-76e9-40f3-9950-b53009f25138	docenten1	1716401545322	\N	0
0191549c-b4c1-41ef-a55a-b3b53859c433	docenten2@yopmail.com	docenten2@yopmail.com	t	t	\N	DOCENTE	DOS	7285fde1-76e9-40f3-9950-b53009f25138	docenten2	1716401619558	\N	0
75008614-ff47-44aa-9e46-61c0f0389953	docenten3@yopmail.com	docenten3@yopmail.com	t	t	\N	DOCENTE	TRES	7285fde1-76e9-40f3-9950-b53009f25138	docenten3	1716401677706	\N	0
925d19eb-3206-4a7a-9d99-219a3f82c12b	docenten5@yopmail.com	docenten5@yopmail.com	t	t	\N	DOCENTE	CINCO	7285fde1-76e9-40f3-9950-b53009f25138	docenten5	1716401949658	\N	0
e58ce787-4046-4abe-923f-a912815b6f28	docenten6@yopmail.com	docenten6@yopmail.com	t	t	\N	DOCENTE	SEIS	7285fde1-76e9-40f3-9950-b53009f25138	docenten6	1716402018657	\N	0
ae72dcfe-2dcc-4a1f-b931-3df25ac2f2c6	estudianten1@yopmail.com	estudianten1@yopmail.com	t	t	\N	ESTUDIANTE	UNO	7285fde1-76e9-40f3-9950-b53009f25138	estudianten1	1716402199043	\N	0
f1cc39c3-627e-46a4-866e-c855cd614192	estudianten2@yopmail.com	estudianten2@yopmail.com	t	t	\N	ESTUDIANTE	DOS	7285fde1-76e9-40f3-9950-b53009f25138	estudianten2	1716402422738	\N	0
68cea77d-6e1e-42eb-abd5-6d4abd5a3efd	estudianten3@yopmail.com	estudianten3@yopmail.com	t	t	\N	ESTUDIANTE	TRES	7285fde1-76e9-40f3-9950-b53009f25138	estudianten3	1716402488789	\N	0
f303d92c-1307-4f8c-81c0-7716654c0e5a	estudianten4@yopmail.com	estudianten4@yopmail.com	t	t	\N	ESTUDIANTE	CUATRO	7285fde1-76e9-40f3-9950-b53009f25138	estudianten4	1716402600824	\N	0
e44ea30e-2c92-4be3-bfa5-fe904b7fc17d	estudianten5@yopmail.com	estudianten5@yopmail.com	t	t	\N	ESTUDIANTE	CINCO	7285fde1-76e9-40f3-9950-b53009f25138	estudianten5	1716402659099	\N	0
e6759928-1740-492a-aee0-dda5cde4cefa	estudianten6@yopmail.com	estudianten6@yopmail.com	t	t	\N	ESTUDIANTE	SEIS	7285fde1-76e9-40f3-9950-b53009f25138	estudianten6	1716402725801	\N	0
7585e09b-bebc-4c47-b85e-b9e33c2a384f	isabela.sanchez@yopmail.com	isabela.sanchez@yopmail.com	t	t	\N	ISABELA	SANCHEZ	7285fde1-76e9-40f3-9950-b53009f25138	isabela.sanchez	1717082619046	\N	0
cba635e3-d5e9-4fa7-a57f-75d50134ab2a	estudianten7@yopmail.com	estudianten7@yopmail.com	t	t	\N	ESTUDIANTE	SIETE	7285fde1-76e9-40f3-9950-b53009f25138	estudianten7	1716402827090	\N	0
d72d2312-a69a-4531-9490-ac895934a10c	eduardo.perea@yopmail.com	eduardo.perea@yopmail.com	t	t	\N	EDUARDO	PEREA	7285fde1-76e9-40f3-9950-b53009f25138	eduardo.perea	1716404513901	\N	0
4cfd6767-855c-4847-a726-a1d5af24904c	henry1@yopmail.com	henry1@yopmail.com	t	t	\N	PEPITOS PEPITO	PEREZZ PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	henry1	1716414597472	\N	0
57df4412-71c6-4122-bab7-c25f15762eff	sebastianprimero@yopmail.com	sebastianprimero@yopmail.com	t	t	\N	SEBASTIAN	RENGIFO MUNOZ	7285fde1-76e9-40f3-9950-b53009f25138	sebastianprimero	1716659520132	\N	0
3d47428e-a4a5-45fe-9b84-69211387e812	drosal@yomail.com	drosal@yomail.com	t	t	\N	PRUEBA PRUEBA	PRUEBA PRUEBA	7285fde1-76e9-40f3-9950-b53009f25138	drosal	1716470302195	\N	0
511051be-8c83-45be-b4c9-822647b58ac9	jokb202@hotmail.com	jokb202@hotmail.com	t	t	\N	JAIRO ORLANDO	CARDENAS BENAVIDES	7285fde1-76e9-40f3-9950-b53009f25138	jokb202	1716470423240	\N	0
372b8deb-5717-4e23-a1d9-5e404a5eda8d	juancasatro@gmail.com	juancasatro@gmail.com	t	t	\N	JUAN MIGUEL	ARTURO CASTRO	7285fde1-76e9-40f3-9950-b53009f25138	juancasatro	1716470432491	\N	0
81bfca7e-1213-404e-ab5e-d46f78a6b240	dporpasto@hotmail.com	dporpasto@hotmail.com	t	t	\N	VICTOR WILLIAM	SOLARTE ANDRADE	7285fde1-76e9-40f3-9950-b53009f25138	dporpasto	1716473070096	\N	0
91c7e988-2e94-41a7-b82a-52cc65b5c311	julianvilla@gmail.com	julianvilla@gmail.com	t	t	\N	JAIME JAVIER	ZAMORA MONCAYO	7285fde1-76e9-40f3-9950-b53009f25138	julianvilla	1716473229340	\N	0
15e0ab82-5518-40f2-83ad-7d4801520b41	docenten2ssss@yopmail.com	docenten2ssss@yopmail.com	t	t	\N	GUSTAVO ERNESTO	SOLARTE LUNAS	7285fde1-76e9-40f3-9950-b53009f25138	docenten2ssss	1716475897411	\N	0
a8a25637-77a2-4734-9b21-17a63a6080e5	juan@gmail.com	juan@gmail.com	t	t	\N	CARLOS MANUEL	CARMONA ENRIQUEZ	7285fde1-76e9-40f3-9950-b53009f25138	juan	1716475750217	\N	0
13f96781-987b-4ad2-9713-74fcf62e8829	estudiantespecial@yopmail.com	estudiantespecial@yopmail.com	t	t	\N	ESTUDIANTE	ESPECIAL	7285fde1-76e9-40f3-9950-b53009f25138	estudiantespecial	1716561017415	\N	0
b61087a0-5a1f-4de3-a534-0e0cde9334bc	johana.prado@yopmail.com	johana.prado@yopmail.com	t	t	\N	JOHANA	PRADO	7285fde1-76e9-40f3-9950-b53009f25138	johana.prado	1716565664814	\N	0
5fe59f21-5600-430b-9b7c-2f239727e1e9	especialdosestudiante@yopmail.com	especialdosestudiante@yopmail.com	t	t	\N	ESTUDIANTEESPECIAL	DOS	7285fde1-76e9-40f3-9950-b53009f25138	especialdosestudiante	1716581678218	\N	0
3324511b-2f8d-448b-892f-25f857a503d4	camiloprimero@yopmail.com	camiloprimero@yopmail.com	t	t	\N	CAMILO JUAN	RENGIFO MUNOZ	7285fde1-76e9-40f3-9950-b53009f25138	camiloprimero	1716659353548	\N	0
c9c15bc1-c4c8-4803-b326-7029b200e86d	henrydocente@yopmail.com	henrydocente@yopmail.com	t	t	\N	HENRY	RENGIFO	7285fde1-76e9-40f3-9950-b53009f25138	henrydocente	1716661762447	\N	0
c6e6b4f6-43a1-4d4b-b3cd-6ebe217c23fc	jeronimo@yopmail.com	jeronimo@yopmail.com	t	t	\N	JERONIMO	OSPINA	7285fde1-76e9-40f3-9950-b53009f25138	jeronimo	1716665993594	\N	0
b6441a09-8195-482d-9dde-446c1c995bc7	julietaprimero@yopmail.com	julietaprimero@yopmail.com	t	t	\N	JULIETA	OSPINA	7285fde1-76e9-40f3-9950-b53009f25138	julietaprimero	1716673472535	\N	0
eb5df34c-a0f4-4296-957b-83f1da6e288d	julietasegundo@yopmail.com	julietasegundo@yopmail.com	t	t	\N	JULIET	OSPINA	7285fde1-76e9-40f3-9950-b53009f25138	julietasegundo	1716673659963	\N	0
3ae3bb30-495b-4b34-a10a-daffae687b6a	joselitodocente@yopmail.com	joselitodocente@yopmail.com	t	t	\N	JOSELITO	OSPINA	7285fde1-76e9-40f3-9950-b53009f25138	joselitodocente	1716676483271	\N	0
35daef6f-2cb9-4f13-a509-68a58af4adc3	nicolasnino@yopmail.com	nicolasnino@yopmail.com	t	t	\N	NICOLAS	NIÑO LÓPEZ	7285fde1-76e9-40f3-9950-b53009f25138	nicolasnino	1716821406724	\N	0
4e0eb1f5-c48b-4884-9888-f0073e6370ea	pruebauuid@yopmail.com	pruebauuid@yopmail.com	t	t	\N	PRUEBA UUID	PRUEBA	7285fde1-76e9-40f3-9950-b53009f25138	pruebauuid	1716845320131	\N	0
791f4166-1d93-4098-8a12-95dd373430e1	pedromarin@yopmail.com	pedromarin@yopmail.com	t	t	\N	PEDRO	MARÍN	7285fde1-76e9-40f3-9950-b53009f25138	pedromarin	1716934054470	\N	0
db3b6fe6-7c1f-4f06-8ce5-9ba9a4c7eb51	george.santos@yopmail.com	george.santos@yopmail.com	t	t	\N	GEORGE	SANTOS	7285fde1-76e9-40f3-9950-b53009f25138	george.santos	1716934447973	\N	0
a9923fd3-5d93-4e6c-afe6-3674244a196b	password.image@yopmail.com	password.image@yopmail.com	t	t	\N	PRIMERO	IMAGE	7285fde1-76e9-40f3-9950-b53009f25138	password.image	1716934826674	\N	0
0ee263d7-6a84-4f49-9d82-516c58d6d1ee	prueba.dos.password@yopmail.com	prueba.dos.password@yopmail.com	t	t	\N	PRUEBA PASSWORD	DOS IMAGE	7285fde1-76e9-40f3-9950-b53009f25138	prueba.dos.password	1716934962222	\N	0
0338153c-c9bb-4180-90b2-4190324a3377	julio.cesar@yopmail.com	julio.cesar@yopmail.com	t	t	\N	JULIO	CESAR	7285fde1-76e9-40f3-9950-b53009f25138	julio.cesar	1716987086620	\N	0
805e10e2-6ec1-4c1a-adb9-03a64b0cff7a	angie.medina@yopmail.com	angie.medina@yopmail.com	t	t	\N	ANGIE	MEDINA VARGAS	7285fde1-76e9-40f3-9950-b53009f25138	angie.medina	1716987163684	\N	0
caadbd8a-e8df-433e-9e06-566210465713	juancamilo.benitez@yopmail.com	juancamilo.benitez@yopmail.com	t	t	\N	JUAN CAMILO	BENITEZ	7285fde1-76e9-40f3-9950-b53009f25138	juancamilo.benitez	1716989605268	\N	0
ea88f7eb-e576-45ab-b59d-22cd42dc1c0c	alejandra.guzman@yopmail.com	alejandra.guzman@yopmail.com	t	t	\N	ALEJANDRA	GUZMAN	7285fde1-76e9-40f3-9950-b53009f25138	alejandra.guzman	1716989707850	\N	0
02e3b196-b475-40ff-9d92-36d3e1737cfe	prueba.edit@yopmail.com	prueba.edit@yopmail.com	t	t	\N	PRUEBA EDIT	PASSWORD IMAGE	7285fde1-76e9-40f3-9950-b53009f25138	prueba.edit	1717015313352	\N	0
e4ed9a81-8086-4034-aceb-32877b82a314	docente1@yopmail.com	docente1@yopmail.com	t	t	\N	ARMANDO HERNEY	HOYOS ZUÑIGA	7285fde1-76e9-40f3-9950-b53009f25138	docente1	1717078811982	\N	0
16003bb0-854d-411a-b23c-f658eb33772f	colegio@gmail.com	colegio@gmail.com	t	t	\N	CARLOS ADRIANO	MUELAS MUÑOZ	7285fde1-76e9-40f3-9950-b53009f25138	colegio	1717078842095	\N	0
7d31faec-4180-4291-89f4-65d9abd68f1e	aprendiz.soporte@talentum.edu.co	aprendiz.soporte@talentum.edu.co	t	t	\N	DIANA LUCIA	BARRIOS NUÑEZ	7285fde1-76e9-40f3-9950-b53009f25138	aprendiz.soporte	1717078703097	\N	0
80add0de-c8b0-4397-8ac0-2a907944c2b7	mariaperez@gmail.com	mariaperez@gmail.com	t	t	\N	MARIA LUCIA	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	mariaperez	1717078723229	\N	0
c94ba7c0-c3ef-4646-a1fd-038983c70da3	gardocente1@yahoo.com	gardocente1@yahoo.com	t	t	\N	YERNEY JAIR	MENDEZ LUNA	7285fde1-76e9-40f3-9950-b53009f25138	gardocente1	1717079060936	\N	0
948241e4-b2cd-447e-b6c7-53de0db9bd67	prueba1717100445@yopmail.com	prueba1717100445@yopmail.com	t	t	\N	ELENA	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	prueba1717100445	1717100445232	\N	0
be9909fc-13f6-4fff-baa3-e1346683522a	lina.password.image@yopmail.com	lina.password.image@yopmail.com	t	t	\N	LINA	JARAMILLO PASSWORDIMAGE	7285fde1-76e9-40f3-9950-b53009f25138	lina.password.image	1717082362983	\N	0
8839fdfc-cedc-48ab-a2f8-6fbc97e6461c	passwordhint@yopmail.com	passwordhint@yopmail.com	t	t	\N	PRUEBA UUID	PRUEBA	7285fde1-76e9-40f3-9950-b53009f25138	passwordhint	1717100456610	\N	0
a965ae6f-b24e-40df-86c0-7e1d0607badd	passwor.image.tres@yopmail.com	passwor.image.tres@yopmail.com	t	t	\N	PASSWORD IMAGE	TRES	7285fde1-76e9-40f3-9950-b53009f25138	passwor.image.tres	1717109643097	\N	0
b69ab408-6989-4294-8d8a-b05b109e923b	password.image.4@yopmail.com	password.image.4@yopmail.com	t	t	\N	PASSWORD IMAGE	CUATRO	7285fde1-76e9-40f3-9950-b53009f25138	password.image.4	1717109728806	\N	0
56e1744f-84ef-4d1b-86e2-554745fe7901	password.image.cinco@yopmail.com	password.image.cinco@yopmail.com	t	t	\N	PASSWORD IMAGE	CINCO	7285fde1-76e9-40f3-9950-b53009f25138	password.image.cinco	1717179094386	\N	0
01f78740-8664-4eac-af0c-89eefafb289c	giselle@yopmail.com	giselle@yopmail.com	t	t	\N	GISELLE	BENITEZ	7285fde1-76e9-40f3-9950-b53009f25138	giselle	1717681751424	\N	0
5059ca45-50fa-4416-95e8-0eb6d92400a9	angel.acosta@yopmail.com	angel.acosta@yopmail.com	t	t	\N	ANGEL	ACOSTA	7285fde1-76e9-40f3-9950-b53009f25138	angel.acosta	1717682237286	\N	0
42ff0fd2-c3d4-4edf-bb1f-80443e8650f3	estudiante.nuevo@yopmail.com	estudiante.nuevo@yopmail.com	t	t	\N	ESTUDIANTE	NUEVO	7285fde1-76e9-40f3-9950-b53009f25138	estudiante.nuevo	1717682831610	\N	0
1a6245d4-28cd-45be-a912-e48f2270f010	pablito.prueba@yopmail.com	pablito.prueba@yopmail.com	t	t	\N	PABLITO	MARTINEZ	7285fde1-76e9-40f3-9950-b53009f25138	pablito.prueba	1717682947716	\N	0
d429ed65-c31e-48f5-a228-cbf1faada8db	estudiante.contrasena@yopmail.com	estudiante.contrasena@yopmail.com	t	t	\N	ESTUDIANTE	CONTRASENA	7285fde1-76e9-40f3-9950-b53009f25138	estudiante.contrasena	1717682953213	\N	0
bcd00946-3eaa-4b2e-b06c-b029c3fb85b9	carlos.vargas@yopmail.com	carlos.vargas@yopmail.com	t	t	\N	CARLOS	VARGAS	7285fde1-76e9-40f3-9950-b53009f25138	carlos.vargas	1717683197842	\N	0
fb1a13e6-891c-4a9f-bb75-53d8d64dc8d3	correo@correo.com	correo@correo.com	t	t	\N	A A	S F	7285fde1-76e9-40f3-9950-b53009f25138	correo	1717683665697	\N	0
f5f74d64-8d49-420c-9906-bdfe82172a5d	estudiantev1@yopmail.com	estudiantev1@yopmail.com	t	t	\N	USUARIO	PRUEBAV	7285fde1-76e9-40f3-9950-b53009f25138	estudiantev1	1717685935901	\N	0
55eadc3f-ceb5-49a1-9001-f562ebc0c3ba	angelito013@gmail.com	angelito013@gmail.com	t	t	\N	LAUREN SOFIA	OLIVARES ORTIZ	7285fde1-76e9-40f3-9950-b53009f25138	angelito013	1717686644479	\N	0
51b5964a-662e-4535-ba3c-5233ebac9155	sagrado123@gmail.com	sagrado123@gmail.com	t	t	\N	JORGE ANDRES	ARIAS RAMIREZ	7285fde1-76e9-40f3-9950-b53009f25138	sagrado123	1717686710097	\N	0
dacf47ca-e857-4227-a9db-b492f31de9a1	docenten1ggg@yopmail.com	docenten1ggg@yopmail.com	t	t	\N	ALBERT	RODRIGUEZ RENDON	7285fde1-76e9-40f3-9950-b53009f25138	docenten1ggg	1717686711291	\N	0
8c547b32-b654-4481-9128-96eb039ff339	julietaperez123@gmail.com	julietaperez123@gmail.com	t	t	\N	JULIETA	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	julietaperez123	1717686593246	\N	0
03fcdd36-6140-46ff-8143-9c5e26ff48ba	aprendiz.soportejj@talentum.edu.co	aprendiz.soportejj@talentum.edu.co	t	t	\N	JOSUELO GREGORIO	CDCCD	7285fde1-76e9-40f3-9950-b53009f25138	aprendiz.soportejj	1717686815428	\N	0
9ecbe786-985e-4797-b0b9-2265046576ae	johana.bahamon@yopmail.com	johana.bahamon@yopmail.com	t	t	\N	JOHANA	BAHAMON	7285fde1-76e9-40f3-9950-b53009f25138	johana.bahamon	1717687568663	\N	0
648daee4-c126-47cb-a1c2-8b3a636e29bf	carla.giraldo@yopmail.com	carla.giraldo@yopmail.com	t	t	\N	CARLA	GIRALDO	7285fde1-76e9-40f3-9950-b53009f25138	carla.giraldo	1717770156425	\N	0
6f5271e3-909f-401d-a38c-9eb41a1e81b0	david.perdomo@yopmail.com	david.perdomo@yopmail.com	t	t	\N	DAVID	PERDOMO	7285fde1-76e9-40f3-9950-b53009f25138	david.perdomo	1717797075442	\N	0
49e7cfa7-16e6-41c9-a3d0-6311ca810032	pabloperez@yopmail.com	pabloperez@yopmail.com	t	t	\N	PABLO	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	pabloperez	1718027014143	\N	0
89b7fe9c-df72-4489-b7de-74d8c4170712	joseospina@yopmail.com	joseospina@yopmail.com	t	t	\N	JOSE	OSPINA	7285fde1-76e9-40f3-9950-b53009f25138	joseospina	1718030913333	\N	0
4f95c6e3-cfe8-4c0d-a72e-bee793b66ff4	lizgomez@yopmail.com	lizgomez@yopmail.com	t	t	\N	LIZ	GOMÉZ NARIÑO	7285fde1-76e9-40f3-9950-b53009f25138	lizgomez	1718051828636	\N	0
c4d7ff3f-dbac-49a6-a812-6529e8f0dc56	steven.piedraita@yopmail.com	steven.piedraita@yopmail.com	t	t	\N	STEVEN	PIEDRAITA	7285fde1-76e9-40f3-9950-b53009f25138	steven.piedraita	1718304980529	\N	0
965141a7-abe0-4817-839a-7931edbe2bb1	system.regional@yopmail.com	system.regional@yopmail.com	t	t	\N	SYSTEM	API	7285fde1-76e9-40f3-9950-b53009f25138	system.regional	1718394695201	\N	0
32733d05-b2c0-4dc2-90d7-ba39b82725a1	miguel.angel@yopmail.com	miguel.angel@yopmail.com	t	t	\N	MIGUEL ANGEL	GUEVARA PATIÑO	7285fde1-76e9-40f3-9950-b53009f25138	miguel.angel	1718641048861	\N	0
e61a43c4-6b8e-46df-b866-7aa74685ce76	rabbit1718747324@yopmail.com	rabbit1718747324@yopmail.com	t	t	\N	ELENA	PEREZ	7285fde1-76e9-40f3-9950-b53009f25138	rabbit1718747324	1718747335381	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
fc0a4195-cfc7-4f73-a33d-9d8d34e7e6d3	6347d9bd-3923-4283-a50c-6ba437309c91
5ba959f0-b88b-4b85-af86-6e72a9921f79	6347d9bd-3923-4283-a50c-6ba437309c91
a9880f20-a124-4ab9-ab64-378823ee0b8c	2af08086-5b2d-4464-a2eb-9f0a85372011
38535122-c1a3-4c32-b9cd-6a044511f5fc	2af08086-5b2d-4464-a2eb-9f0a85372011
d11af074-b52e-40f7-bf30-ed29fd52c085	5bfe59e7-e008-4745-b2da-a2bcddbf6a1d
a9880f20-a124-4ab9-ab64-378823ee0b8c	63d44b1c-b79d-4fe6-a420-cb36c24d1bab
6c71ec00-cfb3-4c1b-b880-b2a8843c62b1	6347d9bd-3923-4283-a50c-6ba437309c91
6cf82871-31c7-40b5-a4e8-141e0d41a253	6347d9bd-3923-4283-a50c-6ba437309c91
42f65007-da89-47fa-ac03-1e93c4711cf6	6347d9bd-3923-4283-a50c-6ba437309c91
c793ce93-7ae0-4f93-86de-2e7009a8493b	6347d9bd-3923-4283-a50c-6ba437309c91
efdea5ef-2339-4b7f-9f82-da5449e19942	6347d9bd-3923-4283-a50c-6ba437309c91
348636fe-2eae-4a78-a157-bbfba4df0022	6347d9bd-3923-4283-a50c-6ba437309c91
fce47445-94d9-4578-8c69-00b82585da33	6347d9bd-3923-4283-a50c-6ba437309c91
5c94516a-e86f-4e53-b073-73984c1721f7	6347d9bd-3923-4283-a50c-6ba437309c91
50130ba1-8adf-4eee-84c5-91ebdc29ab3a	6347d9bd-3923-4283-a50c-6ba437309c91
4ef64ba0-b136-4a03-92ea-19e96237c776	6347d9bd-3923-4283-a50c-6ba437309c91
3bcf36d2-3863-4a09-b467-cefa36c6e465	6347d9bd-3923-4283-a50c-6ba437309c91
69533a82-6c3d-4367-97d5-c9e560e526b6	6347d9bd-3923-4283-a50c-6ba437309c91
6f96e461-c3f4-471b-858d-9134fbe09505	6347d9bd-3923-4283-a50c-6ba437309c91
1c448c3c-c58a-4273-8610-9e93eaa0b526	6347d9bd-3923-4283-a50c-6ba437309c91
18f62975-84eb-4f1b-8975-6e84bf85a075	6347d9bd-3923-4283-a50c-6ba437309c91
cd3fc6bf-54ce-47a3-8f14-47f42212a180	6347d9bd-3923-4283-a50c-6ba437309c91
13391692-d6d7-4899-a882-08fd34de383c	6347d9bd-3923-4283-a50c-6ba437309c91
e7da107d-c205-4df1-b571-85c5675595a9	63d44b1c-b79d-4fe6-a420-cb36c24d1bab
a9880f20-a124-4ab9-ab64-378823ee0b8c	c223d845-28d1-40b1-adae-89ad5cd9a3aa
38535122-c1a3-4c32-b9cd-6a044511f5fc	c223d845-28d1-40b1-adae-89ad5cd9a3aa
a9880f20-a124-4ab9-ab64-378823ee0b8c	3a8a0a88-ed37-48bc-a271-1e05bf5ebbbc
38535122-c1a3-4c32-b9cd-6a044511f5fc	3a8a0a88-ed37-48bc-a271-1e05bf5ebbbc
a9880f20-a124-4ab9-ab64-378823ee0b8c	165558c1-79ed-48e1-b2d9-bb6b004242f1
38535122-c1a3-4c32-b9cd-6a044511f5fc	165558c1-79ed-48e1-b2d9-bb6b004242f1
a9880f20-a124-4ab9-ab64-378823ee0b8c	e4e8223b-c613-46d6-bf2a-43e167a0586a
a9880f20-a124-4ab9-ab64-378823ee0b8c	650c4f87-ef2b-4f50-9ac7-be7aba48a6d3
38535122-c1a3-4c32-b9cd-6a044511f5fc	733415bf-7a92-48e3-a040-a4fe4aed5f2f
8b391ae3-2d82-4557-820b-17360eaed26d	25bfc9e3-60e0-424e-92de-0f6d18c82bfc
38535122-c1a3-4c32-b9cd-6a044511f5fc	e4e8223b-c613-46d6-bf2a-43e167a0586a
a9880f20-a124-4ab9-ab64-378823ee0b8c	23876565-b218-4170-aeb1-602484f62367
d11af074-b52e-40f7-bf30-ed29fd52c085	23876565-b218-4170-aeb1-602484f62367
a9880f20-a124-4ab9-ab64-378823ee0b8c	a05de10d-ffcb-4a25-9036-d753878b6f9f
d11af074-b52e-40f7-bf30-ed29fd52c085	a05de10d-ffcb-4a25-9036-d753878b6f9f
a9880f20-a124-4ab9-ab64-378823ee0b8c	955dbf89-0e83-488f-9541-b26cc4a41494
38535122-c1a3-4c32-b9cd-6a044511f5fc	955dbf89-0e83-488f-9541-b26cc4a41494
a9880f20-a124-4ab9-ab64-378823ee0b8c	7b9993cc-2d01-4d63-9093-2177c614d407
38535122-c1a3-4c32-b9cd-6a044511f5fc	7b9993cc-2d01-4d63-9093-2177c614d407
a9880f20-a124-4ab9-ab64-378823ee0b8c	16fa502c-57cf-4055-9543-a0eacc6291e8
38535122-c1a3-4c32-b9cd-6a044511f5fc	16fa502c-57cf-4055-9543-a0eacc6291e8
a9880f20-a124-4ab9-ab64-378823ee0b8c	2e55e737-747c-4051-869d-c077e9217664
38535122-c1a3-4c32-b9cd-6a044511f5fc	2e55e737-747c-4051-869d-c077e9217664
a9880f20-a124-4ab9-ab64-378823ee0b8c	25ced1d6-dddb-4758-9716-adc20b739eb5
d11af074-b52e-40f7-bf30-ed29fd52c085	25ced1d6-dddb-4758-9716-adc20b739eb5
a9880f20-a124-4ab9-ab64-378823ee0b8c	0c2f832a-9252-4573-aa75-d43ceac78ca8
d11af074-b52e-40f7-bf30-ed29fd52c085	0c2f832a-9252-4573-aa75-d43ceac78ca8
a9880f20-a124-4ab9-ab64-378823ee0b8c	fa06e958-cde8-4fc2-baed-da2062e20a4f
d11af074-b52e-40f7-bf30-ed29fd52c085	fa06e958-cde8-4fc2-baed-da2062e20a4f
a9880f20-a124-4ab9-ab64-378823ee0b8c	f5b7c025-5680-43be-a093-28d99b475386
d11af074-b52e-40f7-bf30-ed29fd52c085	f5b7c025-5680-43be-a093-28d99b475386
a9880f20-a124-4ab9-ab64-378823ee0b8c	1d56cc28-3106-47c6-ae22-5eefa83015a8
d11af074-b52e-40f7-bf30-ed29fd52c085	1d56cc28-3106-47c6-ae22-5eefa83015a8
a9880f20-a124-4ab9-ab64-378823ee0b8c	1c0e10c9-5865-4287-b7aa-2f3f95cb6ad2
d11af074-b52e-40f7-bf30-ed29fd52c085	1c0e10c9-5865-4287-b7aa-2f3f95cb6ad2
a9880f20-a124-4ab9-ab64-378823ee0b8c	5ed10d1e-01ec-4d28-9af3-ca35d791bf8e
38535122-c1a3-4c32-b9cd-6a044511f5fc	5ed10d1e-01ec-4d28-9af3-ca35d791bf8e
a9880f20-a124-4ab9-ab64-378823ee0b8c	c85c3e28-058e-4172-ad3b-31a0f9b877ad
38535122-c1a3-4c32-b9cd-6a044511f5fc	c85c3e28-058e-4172-ad3b-31a0f9b877ad
a9880f20-a124-4ab9-ab64-378823ee0b8c	bdd8865d-d55e-41bc-818a-0793d42d4804
38535122-c1a3-4c32-b9cd-6a044511f5fc	bdd8865d-d55e-41bc-818a-0793d42d4804
d11af074-b52e-40f7-bf30-ed29fd52c085	013ff66c-bf50-4505-b2ef-fad3f99d7c6e
a9880f20-a124-4ab9-ab64-378823ee0b8c	ce1ad31a-f6d2-49d1-ad7b-35503ae4874f
a9880f20-a124-4ab9-ab64-378823ee0b8c	e4cc5a54-5ff1-4a5e-b90c-11466df588df
e7da107d-c205-4df1-b571-85c5675595a9	ce1ad31a-f6d2-49d1-ad7b-35503ae4874f
a9880f20-a124-4ab9-ab64-378823ee0b8c	70007130-64a0-4d8b-b7ed-ea913dfac04b
38535122-c1a3-4c32-b9cd-6a044511f5fc	70007130-64a0-4d8b-b7ed-ea913dfac04b
a9880f20-a124-4ab9-ab64-378823ee0b8c	19487b26-a45c-49d5-af8d-66f0203c2595
38535122-c1a3-4c32-b9cd-6a044511f5fc	19487b26-a45c-49d5-af8d-66f0203c2595
a9880f20-a124-4ab9-ab64-378823ee0b8c	66e2a633-fd06-4935-8ed3-0b7c0c1c4254
38535122-c1a3-4c32-b9cd-6a044511f5fc	66e2a633-fd06-4935-8ed3-0b7c0c1c4254
a9880f20-a124-4ab9-ab64-378823ee0b8c	23dc6e35-5123-49dd-855a-6bbc89e7cc8f
68a277db-07ad-43b6-9c32-3f73f2a9b93e	23dc6e35-5123-49dd-855a-6bbc89e7cc8f
a9880f20-a124-4ab9-ab64-378823ee0b8c	1e1d0fbb-e9a6-4c49-ab05-7a2e85aa87cf
38535122-c1a3-4c32-b9cd-6a044511f5fc	1e1d0fbb-e9a6-4c49-ab05-7a2e85aa87cf
a9880f20-a124-4ab9-ab64-378823ee0b8c	dfcf8074-02c5-4545-b648-5953717c4d21
1b60f5e8-e147-43b6-8b0a-a8e2f6075477	dfcf8074-02c5-4545-b648-5953717c4d21
a9880f20-a124-4ab9-ab64-378823ee0b8c	884e45fe-2db9-45b4-966b-cb37517f2ea0
1b60f5e8-e147-43b6-8b0a-a8e2f6075477	884e45fe-2db9-45b4-966b-cb37517f2ea0
a9880f20-a124-4ab9-ab64-378823ee0b8c	15718055-3738-4e99-85ec-594f8b307122
1b60f5e8-e147-43b6-8b0a-a8e2f6075477	15718055-3738-4e99-85ec-594f8b307122
a9880f20-a124-4ab9-ab64-378823ee0b8c	b803f43f-5fa7-4aea-b076-3ad85bce6585
e7da107d-c205-4df1-b571-85c5675595a9	b803f43f-5fa7-4aea-b076-3ad85bce6585
a9880f20-a124-4ab9-ab64-378823ee0b8c	52d5bd1f-dd8b-4ac9-b650-108e8dc1765a
d11af074-b52e-40f7-bf30-ed29fd52c085	52d5bd1f-dd8b-4ac9-b650-108e8dc1765a
a9880f20-a124-4ab9-ab64-378823ee0b8c	e82f596a-d606-48b3-b735-f4701b5fa930
38535122-c1a3-4c32-b9cd-6a044511f5fc	e82f596a-d606-48b3-b735-f4701b5fa930
a9880f20-a124-4ab9-ab64-378823ee0b8c	61059eb2-95f8-4d4c-80b7-5d8d6474fcf3
d11af074-b52e-40f7-bf30-ed29fd52c085	61059eb2-95f8-4d4c-80b7-5d8d6474fcf3
a9880f20-a124-4ab9-ab64-378823ee0b8c	0b712472-2dc1-4a11-bfc5-79dae2f1f407
38535122-c1a3-4c32-b9cd-6a044511f5fc	0b712472-2dc1-4a11-bfc5-79dae2f1f407
a9880f20-a124-4ab9-ab64-378823ee0b8c	5988b29b-dbae-4d50-ab58-20e9a9695f6d
d11af074-b52e-40f7-bf30-ed29fd52c085	5988b29b-dbae-4d50-ab58-20e9a9695f6d
a9880f20-a124-4ab9-ab64-378823ee0b8c	f699754d-3106-456c-b6fb-82842131ce70
d11af074-b52e-40f7-bf30-ed29fd52c085	f699754d-3106-456c-b6fb-82842131ce70
a9880f20-a124-4ab9-ab64-378823ee0b8c	091d1ef6-ac17-400c-a48d-dae43a5f52b5
38535122-c1a3-4c32-b9cd-6a044511f5fc	091d1ef6-ac17-400c-a48d-dae43a5f52b5
a9880f20-a124-4ab9-ab64-378823ee0b8c	efa60f8f-2b72-4dff-bf5c-d3a747d8fa08
e7da107d-c205-4df1-b571-85c5675595a9	efa60f8f-2b72-4dff-bf5c-d3a747d8fa08
a9880f20-a124-4ab9-ab64-378823ee0b8c	72ee82f2-1197-4f7d-8bae-c9eccaf52821
d11af074-b52e-40f7-bf30-ed29fd52c085	72ee82f2-1197-4f7d-8bae-c9eccaf52821
e7da107d-c205-4df1-b571-85c5675595a9	474681f4-b61e-4740-ab8e-59ac2ae82a06
a9880f20-a124-4ab9-ab64-378823ee0b8c	1215bbd5-f7a9-46f5-a075-038b3d860367
38535122-c1a3-4c32-b9cd-6a044511f5fc	1215bbd5-f7a9-46f5-a075-038b3d860367
a9880f20-a124-4ab9-ab64-378823ee0b8c	4fdd3a5f-9118-460a-94de-580387545e59
38535122-c1a3-4c32-b9cd-6a044511f5fc	4fdd3a5f-9118-460a-94de-580387545e59
a9880f20-a124-4ab9-ab64-378823ee0b8c	5ea24cee-ec94-4bcb-938a-fde68c09b174
38535122-c1a3-4c32-b9cd-6a044511f5fc	5ea24cee-ec94-4bcb-938a-fde68c09b174
a9880f20-a124-4ab9-ab64-378823ee0b8c	4c460c7d-23d9-4f32-80a6-958826a65ac6
a9880f20-a124-4ab9-ab64-378823ee0b8c	34afd408-2820-484a-9681-9b875d80bcd6
38535122-c1a3-4c32-b9cd-6a044511f5fc	34afd408-2820-484a-9681-9b875d80bcd6
38535122-c1a3-4c32-b9cd-6a044511f5fc	4c460c7d-23d9-4f32-80a6-958826a65ac6
a9880f20-a124-4ab9-ab64-378823ee0b8c	6933834e-59b1-4f18-b82d-9eb9c4728c98
d11af074-b52e-40f7-bf30-ed29fd52c085	6933834e-59b1-4f18-b82d-9eb9c4728c98
a9880f20-a124-4ab9-ab64-378823ee0b8c	e1566680-d554-4636-ab44-b79fcfbe5d7f
38535122-c1a3-4c32-b9cd-6a044511f5fc	e1566680-d554-4636-ab44-b79fcfbe5d7f
a9880f20-a124-4ab9-ab64-378823ee0b8c	1ed7195c-9659-4831-984a-ff734c85a886
a9880f20-a124-4ab9-ab64-378823ee0b8c	1efa5c4f-60ec-41d1-b9bb-92210aa2560f
38535122-c1a3-4c32-b9cd-6a044511f5fc	1efa5c4f-60ec-41d1-b9bb-92210aa2560f
38535122-c1a3-4c32-b9cd-6a044511f5fc	1ed7195c-9659-4831-984a-ff734c85a886
a9880f20-a124-4ab9-ab64-378823ee0b8c	62e188c9-8ad7-4f6b-a927-cf1854cbd68d
38535122-c1a3-4c32-b9cd-6a044511f5fc	62e188c9-8ad7-4f6b-a927-cf1854cbd68d
a9880f20-a124-4ab9-ab64-378823ee0b8c	e4a6d2e1-8228-4eda-b8a6-7ad349be1ecd
d11af074-b52e-40f7-bf30-ed29fd52c085	e4a6d2e1-8228-4eda-b8a6-7ad349be1ecd
a9880f20-a124-4ab9-ab64-378823ee0b8c	6d5806d4-7049-4170-a86d-7f5e0e653f2e
e7da107d-c205-4df1-b571-85c5675595a9	6d5806d4-7049-4170-a86d-7f5e0e653f2e
a9880f20-a124-4ab9-ab64-378823ee0b8c	0bcfbeff-daab-4f14-9bfd-4179bc5dacf3
d11af074-b52e-40f7-bf30-ed29fd52c085	0bcfbeff-daab-4f14-9bfd-4179bc5dacf3
a9880f20-a124-4ab9-ab64-378823ee0b8c	6c3ad97b-ada6-49b0-a57b-ca93c357a4b0
38535122-c1a3-4c32-b9cd-6a044511f5fc	6c3ad97b-ada6-49b0-a57b-ca93c357a4b0
a9880f20-a124-4ab9-ab64-378823ee0b8c	55a9ef32-1560-41de-8752-084bc7e58494
8b391ae3-2d82-4557-820b-17360eaed26d	55a9ef32-1560-41de-8752-084bc7e58494
a9880f20-a124-4ab9-ab64-378823ee0b8c	14a27dff-9d31-4008-924b-20ce531aaead
e7da107d-c205-4df1-b571-85c5675595a9	14a27dff-9d31-4008-924b-20ce531aaead
a9880f20-a124-4ab9-ab64-378823ee0b8c	24454791-6aa2-4067-b158-8b13a4808ca9
e7da107d-c205-4df1-b571-85c5675595a9	24454791-6aa2-4067-b158-8b13a4808ca9
a9880f20-a124-4ab9-ab64-378823ee0b8c	348847b5-391a-4ace-b46f-4611dee37aa9
e7da107d-c205-4df1-b571-85c5675595a9	348847b5-391a-4ace-b46f-4611dee37aa9
a9880f20-a124-4ab9-ab64-378823ee0b8c	c0ec4e2b-9e77-4567-9bb0-80a5cd82bbde
e7da107d-c205-4df1-b571-85c5675595a9	c0ec4e2b-9e77-4567-9bb0-80a5cd82bbde
a9880f20-a124-4ab9-ab64-378823ee0b8c	1426fc20-d890-4ac1-b17b-b8591e688509
e7da107d-c205-4df1-b571-85c5675595a9	1426fc20-d890-4ac1-b17b-b8591e688509
a9880f20-a124-4ab9-ab64-378823ee0b8c	d4120265-1938-49dd-8f23-72d4ee67fdfd
d11af074-b52e-40f7-bf30-ed29fd52c085	d4120265-1938-49dd-8f23-72d4ee67fdfd
a9880f20-a124-4ab9-ab64-378823ee0b8c	013ff66c-bf50-4505-b2ef-fad3f99d7c6e
a9880f20-a124-4ab9-ab64-378823ee0b8c	3aec32aa-9c41-45a1-a9d8-ee2eaaa0acf7
38535122-c1a3-4c32-b9cd-6a044511f5fc	3aec32aa-9c41-45a1-a9d8-ee2eaaa0acf7
a9880f20-a124-4ab9-ab64-378823ee0b8c	1f942eec-5cb1-4698-af00-586a0d6a263e
38535122-c1a3-4c32-b9cd-6a044511f5fc	1f942eec-5cb1-4698-af00-586a0d6a263e
a9880f20-a124-4ab9-ab64-378823ee0b8c	cd8fe726-c7dd-4014-8a85-5b156e3db936
38535122-c1a3-4c32-b9cd-6a044511f5fc	cd8fe726-c7dd-4014-8a85-5b156e3db936
a9880f20-a124-4ab9-ab64-378823ee0b8c	f6bd8c8c-5e71-41cd-8d73-6d6eb50d8b09
38535122-c1a3-4c32-b9cd-6a044511f5fc	f6bd8c8c-5e71-41cd-8d73-6d6eb50d8b09
a9880f20-a124-4ab9-ab64-378823ee0b8c	af141ff5-d16d-47a2-9643-1444059f8476
38535122-c1a3-4c32-b9cd-6a044511f5fc	af141ff5-d16d-47a2-9643-1444059f8476
a9880f20-a124-4ab9-ab64-378823ee0b8c	07198925-a1a9-43c3-b3b5-d324d0ee38b8
38535122-c1a3-4c32-b9cd-6a044511f5fc	07198925-a1a9-43c3-b3b5-d324d0ee38b8
a9880f20-a124-4ab9-ab64-378823ee0b8c	bb0a481e-668d-4487-8a0f-ce138ba4c59f
d11af074-b52e-40f7-bf30-ed29fd52c085	bb0a481e-668d-4487-8a0f-ce138ba4c59f
a9880f20-a124-4ab9-ab64-378823ee0b8c	337939ac-8e1f-4497-929d-e1096588d702
e7da107d-c205-4df1-b571-85c5675595a9	337939ac-8e1f-4497-929d-e1096588d702
a9880f20-a124-4ab9-ab64-378823ee0b8c	3f5a88d3-0d6a-4da4-bfc2-9de3835c8cb1
38535122-c1a3-4c32-b9cd-6a044511f5fc	3f5a88d3-0d6a-4da4-bfc2-9de3835c8cb1
a9880f20-a124-4ab9-ab64-378823ee0b8c	eedd37c5-15b0-48d9-a80d-4306241da853
e7da107d-c205-4df1-b571-85c5675595a9	eedd37c5-15b0-48d9-a80d-4306241da853
a9880f20-a124-4ab9-ab64-378823ee0b8c	41ec1bd9-f26a-47d6-bca4-d9d71be87d0a
38535122-c1a3-4c32-b9cd-6a044511f5fc	41ec1bd9-f26a-47d6-bca4-d9d71be87d0a
a9880f20-a124-4ab9-ab64-378823ee0b8c	706bc342-07f0-442a-8a17-f0cbf568c179
1b60f5e8-e147-43b6-8b0a-a8e2f6075477	706bc342-07f0-442a-8a17-f0cbf568c179
a9880f20-a124-4ab9-ab64-378823ee0b8c	70936cfc-cfc3-4b73-9ebb-fca04511a122
38535122-c1a3-4c32-b9cd-6a044511f5fc	70936cfc-cfc3-4b73-9ebb-fca04511a122
a9880f20-a124-4ab9-ab64-378823ee0b8c	ca86dd04-d3a1-44f9-96bd-6af27acbfb04
d11af074-b52e-40f7-bf30-ed29fd52c085	ca86dd04-d3a1-44f9-96bd-6af27acbfb04
a9880f20-a124-4ab9-ab64-378823ee0b8c	d47df20d-1474-4fda-b325-267527e61750
38535122-c1a3-4c32-b9cd-6a044511f5fc	d47df20d-1474-4fda-b325-267527e61750
a9880f20-a124-4ab9-ab64-378823ee0b8c	6ac01bc6-e22b-41e6-8115-ce9628c895d5
38535122-c1a3-4c32-b9cd-6a044511f5fc	6ac01bc6-e22b-41e6-8115-ce9628c895d5
a9880f20-a124-4ab9-ab64-378823ee0b8c	81189a1a-105e-4e2b-8769-b414e8c535fc
38535122-c1a3-4c32-b9cd-6a044511f5fc	81189a1a-105e-4e2b-8769-b414e8c535fc
a9880f20-a124-4ab9-ab64-378823ee0b8c	280de7d9-7b39-40e0-91e6-73d934a2e7c0
e7da107d-c205-4df1-b571-85c5675595a9	280de7d9-7b39-40e0-91e6-73d934a2e7c0
a9880f20-a124-4ab9-ab64-378823ee0b8c	4c18bb87-780b-4518-98ab-8183e1d9c056
a9880f20-a124-4ab9-ab64-378823ee0b8c	13f378b1-2b68-4305-b7ab-e42b902e9e61
a9880f20-a124-4ab9-ab64-378823ee0b8c	5b1cc316-62aa-48cc-8f2b-9a3a75d2f0a7
a9880f20-a124-4ab9-ab64-378823ee0b8c	83e0952b-6abf-4e05-ad2b-4203440359d8
a9880f20-a124-4ab9-ab64-378823ee0b8c	07c28a2e-345c-4269-b367-3cb6e483ccee
38535122-c1a3-4c32-b9cd-6a044511f5fc	07c28a2e-345c-4269-b367-3cb6e483ccee
a9880f20-a124-4ab9-ab64-378823ee0b8c	540ba3cf-dd07-4729-884e-1c65ee1ce2ce
1b60f5e8-e147-43b6-8b0a-a8e2f6075477	540ba3cf-dd07-4729-884e-1c65ee1ce2ce
a9880f20-a124-4ab9-ab64-378823ee0b8c	f2d53503-ad13-4206-9016-111a0e124aaf
38535122-c1a3-4c32-b9cd-6a044511f5fc	f2d53503-ad13-4206-9016-111a0e124aaf
a9880f20-a124-4ab9-ab64-378823ee0b8c	f9646cdc-d011-4d2b-8e77-9683d9485157
d11af074-b52e-40f7-bf30-ed29fd52c085	f9646cdc-d011-4d2b-8e77-9683d9485157
a9880f20-a124-4ab9-ab64-378823ee0b8c	fe8c1817-ee19-4ee5-a98b-26f6eba227c9
38535122-c1a3-4c32-b9cd-6a044511f5fc	fe8c1817-ee19-4ee5-a98b-26f6eba227c9
a9880f20-a124-4ab9-ab64-378823ee0b8c	2d8f843f-8e66-432f-ad97-cdfdfef67a6b
38535122-c1a3-4c32-b9cd-6a044511f5fc	2d8f843f-8e66-432f-ad97-cdfdfef67a6b
a08ff438-1164-4acd-a492-5d972c6f2a5b	4c18bb87-780b-4518-98ab-8183e1d9c056
ba9db196-c7e1-4d1e-8c4f-37b73b98e96e	13f378b1-2b68-4305-b7ab-e42b902e9e61
ba9db196-c7e1-4d1e-8c4f-37b73b98e96e	5b1cc316-62aa-48cc-8f2b-9a3a75d2f0a7
a08ff438-1164-4acd-a492-5d972c6f2a5b	83e0952b-6abf-4e05-ad2b-4203440359d8
a9880f20-a124-4ab9-ab64-378823ee0b8c	3a06af98-7f3b-45d4-9956-78eb6cb2dac1
38535122-c1a3-4c32-b9cd-6a044511f5fc	3a06af98-7f3b-45d4-9956-78eb6cb2dac1
a9880f20-a124-4ab9-ab64-378823ee0b8c	e03c9ee7-1733-492b-a495-594b67392280
38535122-c1a3-4c32-b9cd-6a044511f5fc	e03c9ee7-1733-492b-a495-594b67392280
a9880f20-a124-4ab9-ab64-378823ee0b8c	bed26e83-627b-43c1-87ee-faa094c69909
38535122-c1a3-4c32-b9cd-6a044511f5fc	bed26e83-627b-43c1-87ee-faa094c69909
a9880f20-a124-4ab9-ab64-378823ee0b8c	0b36810e-f04d-4019-9aa9-099d089260ae
38535122-c1a3-4c32-b9cd-6a044511f5fc	0b36810e-f04d-4019-9aa9-099d089260ae
a9880f20-a124-4ab9-ab64-378823ee0b8c	f7ab8ec5-e8fa-4916-942a-ee0f24a5117a
d11af074-b52e-40f7-bf30-ed29fd52c085	f7ab8ec5-e8fa-4916-942a-ee0f24a5117a
a9880f20-a124-4ab9-ab64-378823ee0b8c	0191549c-b4c1-41ef-a55a-b3b53859c433
d11af074-b52e-40f7-bf30-ed29fd52c085	0191549c-b4c1-41ef-a55a-b3b53859c433
a9880f20-a124-4ab9-ab64-378823ee0b8c	75008614-ff47-44aa-9e46-61c0f0389953
d11af074-b52e-40f7-bf30-ed29fd52c085	75008614-ff47-44aa-9e46-61c0f0389953
a9880f20-a124-4ab9-ab64-378823ee0b8c	035b10a5-5a57-4109-b6e5-58e83a41c496
d11af074-b52e-40f7-bf30-ed29fd52c085	035b10a5-5a57-4109-b6e5-58e83a41c496
a9880f20-a124-4ab9-ab64-378823ee0b8c	925d19eb-3206-4a7a-9d99-219a3f82c12b
d11af074-b52e-40f7-bf30-ed29fd52c085	925d19eb-3206-4a7a-9d99-219a3f82c12b
a9880f20-a124-4ab9-ab64-378823ee0b8c	e58ce787-4046-4abe-923f-a912815b6f28
d11af074-b52e-40f7-bf30-ed29fd52c085	e58ce787-4046-4abe-923f-a912815b6f28
a9880f20-a124-4ab9-ab64-378823ee0b8c	ae72dcfe-2dcc-4a1f-b931-3df25ac2f2c6
38535122-c1a3-4c32-b9cd-6a044511f5fc	ae72dcfe-2dcc-4a1f-b931-3df25ac2f2c6
a9880f20-a124-4ab9-ab64-378823ee0b8c	f1cc39c3-627e-46a4-866e-c855cd614192
38535122-c1a3-4c32-b9cd-6a044511f5fc	f1cc39c3-627e-46a4-866e-c855cd614192
a9880f20-a124-4ab9-ab64-378823ee0b8c	68cea77d-6e1e-42eb-abd5-6d4abd5a3efd
38535122-c1a3-4c32-b9cd-6a044511f5fc	68cea77d-6e1e-42eb-abd5-6d4abd5a3efd
a9880f20-a124-4ab9-ab64-378823ee0b8c	f303d92c-1307-4f8c-81c0-7716654c0e5a
38535122-c1a3-4c32-b9cd-6a044511f5fc	f303d92c-1307-4f8c-81c0-7716654c0e5a
a9880f20-a124-4ab9-ab64-378823ee0b8c	e44ea30e-2c92-4be3-bfa5-fe904b7fc17d
38535122-c1a3-4c32-b9cd-6a044511f5fc	e44ea30e-2c92-4be3-bfa5-fe904b7fc17d
a9880f20-a124-4ab9-ab64-378823ee0b8c	e6759928-1740-492a-aee0-dda5cde4cefa
38535122-c1a3-4c32-b9cd-6a044511f5fc	e6759928-1740-492a-aee0-dda5cde4cefa
a9880f20-a124-4ab9-ab64-378823ee0b8c	cba635e3-d5e9-4fa7-a57f-75d50134ab2a
38535122-c1a3-4c32-b9cd-6a044511f5fc	cba635e3-d5e9-4fa7-a57f-75d50134ab2a
a9880f20-a124-4ab9-ab64-378823ee0b8c	d72d2312-a69a-4531-9490-ac895934a10c
e7da107d-c205-4df1-b571-85c5675595a9	d72d2312-a69a-4531-9490-ac895934a10c
a9880f20-a124-4ab9-ab64-378823ee0b8c	4cfd6767-855c-4847-a726-a1d5af24904c
d11af074-b52e-40f7-bf30-ed29fd52c085	4cfd6767-855c-4847-a726-a1d5af24904c
a9880f20-a124-4ab9-ab64-378823ee0b8c	3d47428e-a4a5-45fe-9b84-69211387e812
1b60f5e8-e147-43b6-8b0a-a8e2f6075477	3d47428e-a4a5-45fe-9b84-69211387e812
a9880f20-a124-4ab9-ab64-378823ee0b8c	511051be-8c83-45be-b4c9-822647b58ac9
38535122-c1a3-4c32-b9cd-6a044511f5fc	511051be-8c83-45be-b4c9-822647b58ac9
a9880f20-a124-4ab9-ab64-378823ee0b8c	372b8deb-5717-4e23-a1d9-5e404a5eda8d
38535122-c1a3-4c32-b9cd-6a044511f5fc	372b8deb-5717-4e23-a1d9-5e404a5eda8d
a9880f20-a124-4ab9-ab64-378823ee0b8c	81bfca7e-1213-404e-ab5e-d46f78a6b240
38535122-c1a3-4c32-b9cd-6a044511f5fc	81bfca7e-1213-404e-ab5e-d46f78a6b240
a9880f20-a124-4ab9-ab64-378823ee0b8c	91c7e988-2e94-41a7-b82a-52cc65b5c311
38535122-c1a3-4c32-b9cd-6a044511f5fc	91c7e988-2e94-41a7-b82a-52cc65b5c311
a9880f20-a124-4ab9-ab64-378823ee0b8c	a8a25637-77a2-4734-9b21-17a63a6080e5
38535122-c1a3-4c32-b9cd-6a044511f5fc	a8a25637-77a2-4734-9b21-17a63a6080e5
a9880f20-a124-4ab9-ab64-378823ee0b8c	15e0ab82-5518-40f2-83ad-7d4801520b41
38535122-c1a3-4c32-b9cd-6a044511f5fc	15e0ab82-5518-40f2-83ad-7d4801520b41
a9880f20-a124-4ab9-ab64-378823ee0b8c	13f96781-987b-4ad2-9713-74fcf62e8829
38535122-c1a3-4c32-b9cd-6a044511f5fc	13f96781-987b-4ad2-9713-74fcf62e8829
a9880f20-a124-4ab9-ab64-378823ee0b8c	b61087a0-5a1f-4de3-a534-0e0cde9334bc
38535122-c1a3-4c32-b9cd-6a044511f5fc	b61087a0-5a1f-4de3-a534-0e0cde9334bc
a9880f20-a124-4ab9-ab64-378823ee0b8c	5fe59f21-5600-430b-9b7c-2f239727e1e9
38535122-c1a3-4c32-b9cd-6a044511f5fc	5fe59f21-5600-430b-9b7c-2f239727e1e9
a9880f20-a124-4ab9-ab64-378823ee0b8c	3324511b-2f8d-448b-892f-25f857a503d4
38535122-c1a3-4c32-b9cd-6a044511f5fc	3324511b-2f8d-448b-892f-25f857a503d4
a9880f20-a124-4ab9-ab64-378823ee0b8c	57df4412-71c6-4122-bab7-c25f15762eff
38535122-c1a3-4c32-b9cd-6a044511f5fc	57df4412-71c6-4122-bab7-c25f15762eff
a9880f20-a124-4ab9-ab64-378823ee0b8c	c9c15bc1-c4c8-4803-b326-7029b200e86d
d11af074-b52e-40f7-bf30-ed29fd52c085	c9c15bc1-c4c8-4803-b326-7029b200e86d
a9880f20-a124-4ab9-ab64-378823ee0b8c	c6e6b4f6-43a1-4d4b-b3cd-6ebe217c23fc
38535122-c1a3-4c32-b9cd-6a044511f5fc	c6e6b4f6-43a1-4d4b-b3cd-6ebe217c23fc
a9880f20-a124-4ab9-ab64-378823ee0b8c	b6441a09-8195-482d-9dde-446c1c995bc7
38535122-c1a3-4c32-b9cd-6a044511f5fc	b6441a09-8195-482d-9dde-446c1c995bc7
a9880f20-a124-4ab9-ab64-378823ee0b8c	eb5df34c-a0f4-4296-957b-83f1da6e288d
38535122-c1a3-4c32-b9cd-6a044511f5fc	eb5df34c-a0f4-4296-957b-83f1da6e288d
a9880f20-a124-4ab9-ab64-378823ee0b8c	3ae3bb30-495b-4b34-a10a-daffae687b6a
d11af074-b52e-40f7-bf30-ed29fd52c085	3ae3bb30-495b-4b34-a10a-daffae687b6a
a9880f20-a124-4ab9-ab64-378823ee0b8c	35daef6f-2cb9-4f13-a509-68a58af4adc3
38535122-c1a3-4c32-b9cd-6a044511f5fc	35daef6f-2cb9-4f13-a509-68a58af4adc3
a9880f20-a124-4ab9-ab64-378823ee0b8c	4e0eb1f5-c48b-4884-9888-f0073e6370ea
38535122-c1a3-4c32-b9cd-6a044511f5fc	4e0eb1f5-c48b-4884-9888-f0073e6370ea
a9880f20-a124-4ab9-ab64-378823ee0b8c	791f4166-1d93-4098-8a12-95dd373430e1
38535122-c1a3-4c32-b9cd-6a044511f5fc	791f4166-1d93-4098-8a12-95dd373430e1
a9880f20-a124-4ab9-ab64-378823ee0b8c	db3b6fe6-7c1f-4f06-8ce5-9ba9a4c7eb51
38535122-c1a3-4c32-b9cd-6a044511f5fc	db3b6fe6-7c1f-4f06-8ce5-9ba9a4c7eb51
a9880f20-a124-4ab9-ab64-378823ee0b8c	a9923fd3-5d93-4e6c-afe6-3674244a196b
38535122-c1a3-4c32-b9cd-6a044511f5fc	a9923fd3-5d93-4e6c-afe6-3674244a196b
a9880f20-a124-4ab9-ab64-378823ee0b8c	0ee263d7-6a84-4f49-9d82-516c58d6d1ee
38535122-c1a3-4c32-b9cd-6a044511f5fc	0ee263d7-6a84-4f49-9d82-516c58d6d1ee
a9880f20-a124-4ab9-ab64-378823ee0b8c	0338153c-c9bb-4180-90b2-4190324a3377
d11af074-b52e-40f7-bf30-ed29fd52c085	0338153c-c9bb-4180-90b2-4190324a3377
a9880f20-a124-4ab9-ab64-378823ee0b8c	805e10e2-6ec1-4c1a-adb9-03a64b0cff7a
38535122-c1a3-4c32-b9cd-6a044511f5fc	805e10e2-6ec1-4c1a-adb9-03a64b0cff7a
a9880f20-a124-4ab9-ab64-378823ee0b8c	caadbd8a-e8df-433e-9e06-566210465713
38535122-c1a3-4c32-b9cd-6a044511f5fc	caadbd8a-e8df-433e-9e06-566210465713
a9880f20-a124-4ab9-ab64-378823ee0b8c	ea88f7eb-e576-45ab-b59d-22cd42dc1c0c
38535122-c1a3-4c32-b9cd-6a044511f5fc	ea88f7eb-e576-45ab-b59d-22cd42dc1c0c
a9880f20-a124-4ab9-ab64-378823ee0b8c	02e3b196-b475-40ff-9d92-36d3e1737cfe
38535122-c1a3-4c32-b9cd-6a044511f5fc	02e3b196-b475-40ff-9d92-36d3e1737cfe
a9880f20-a124-4ab9-ab64-378823ee0b8c	7d31faec-4180-4291-89f4-65d9abd68f1e
38535122-c1a3-4c32-b9cd-6a044511f5fc	7d31faec-4180-4291-89f4-65d9abd68f1e
a9880f20-a124-4ab9-ab64-378823ee0b8c	80add0de-c8b0-4397-8ac0-2a907944c2b7
38535122-c1a3-4c32-b9cd-6a044511f5fc	80add0de-c8b0-4397-8ac0-2a907944c2b7
a9880f20-a124-4ab9-ab64-378823ee0b8c	e4ed9a81-8086-4034-aceb-32877b82a314
38535122-c1a3-4c32-b9cd-6a044511f5fc	e4ed9a81-8086-4034-aceb-32877b82a314
a9880f20-a124-4ab9-ab64-378823ee0b8c	16003bb0-854d-411a-b23c-f658eb33772f
38535122-c1a3-4c32-b9cd-6a044511f5fc	16003bb0-854d-411a-b23c-f658eb33772f
a9880f20-a124-4ab9-ab64-378823ee0b8c	c94ba7c0-c3ef-4646-a1fd-038983c70da3
38535122-c1a3-4c32-b9cd-6a044511f5fc	c94ba7c0-c3ef-4646-a1fd-038983c70da3
a9880f20-a124-4ab9-ab64-378823ee0b8c	be9909fc-13f6-4fff-baa3-e1346683522a
38535122-c1a3-4c32-b9cd-6a044511f5fc	be9909fc-13f6-4fff-baa3-e1346683522a
a9880f20-a124-4ab9-ab64-378823ee0b8c	7585e09b-bebc-4c47-b85e-b9e33c2a384f
d11af074-b52e-40f7-bf30-ed29fd52c085	7585e09b-bebc-4c47-b85e-b9e33c2a384f
a9880f20-a124-4ab9-ab64-378823ee0b8c	948241e4-b2cd-447e-b6c7-53de0db9bd67
38535122-c1a3-4c32-b9cd-6a044511f5fc	948241e4-b2cd-447e-b6c7-53de0db9bd67
a9880f20-a124-4ab9-ab64-378823ee0b8c	8839fdfc-cedc-48ab-a2f8-6fbc97e6461c
38535122-c1a3-4c32-b9cd-6a044511f5fc	8839fdfc-cedc-48ab-a2f8-6fbc97e6461c
a9880f20-a124-4ab9-ab64-378823ee0b8c	a965ae6f-b24e-40df-86c0-7e1d0607badd
38535122-c1a3-4c32-b9cd-6a044511f5fc	a965ae6f-b24e-40df-86c0-7e1d0607badd
a9880f20-a124-4ab9-ab64-378823ee0b8c	b69ab408-6989-4294-8d8a-b05b109e923b
38535122-c1a3-4c32-b9cd-6a044511f5fc	b69ab408-6989-4294-8d8a-b05b109e923b
a9880f20-a124-4ab9-ab64-378823ee0b8c	56e1744f-84ef-4d1b-86e2-554745fe7901
38535122-c1a3-4c32-b9cd-6a044511f5fc	56e1744f-84ef-4d1b-86e2-554745fe7901
a9880f20-a124-4ab9-ab64-378823ee0b8c	01f78740-8664-4eac-af0c-89eefafb289c
d11af074-b52e-40f7-bf30-ed29fd52c085	01f78740-8664-4eac-af0c-89eefafb289c
a9880f20-a124-4ab9-ab64-378823ee0b8c	5059ca45-50fa-4416-95e8-0eb6d92400a9
38535122-c1a3-4c32-b9cd-6a044511f5fc	5059ca45-50fa-4416-95e8-0eb6d92400a9
a9880f20-a124-4ab9-ab64-378823ee0b8c	42ff0fd2-c3d4-4edf-bb1f-80443e8650f3
38535122-c1a3-4c32-b9cd-6a044511f5fc	42ff0fd2-c3d4-4edf-bb1f-80443e8650f3
a9880f20-a124-4ab9-ab64-378823ee0b8c	1a6245d4-28cd-45be-a912-e48f2270f010
38535122-c1a3-4c32-b9cd-6a044511f5fc	1a6245d4-28cd-45be-a912-e48f2270f010
a9880f20-a124-4ab9-ab64-378823ee0b8c	d429ed65-c31e-48f5-a228-cbf1faada8db
38535122-c1a3-4c32-b9cd-6a044511f5fc	d429ed65-c31e-48f5-a228-cbf1faada8db
a9880f20-a124-4ab9-ab64-378823ee0b8c	bcd00946-3eaa-4b2e-b06c-b029c3fb85b9
38535122-c1a3-4c32-b9cd-6a044511f5fc	bcd00946-3eaa-4b2e-b06c-b029c3fb85b9
a9880f20-a124-4ab9-ab64-378823ee0b8c	fb1a13e6-891c-4a9f-bb75-53d8d64dc8d3
38535122-c1a3-4c32-b9cd-6a044511f5fc	fb1a13e6-891c-4a9f-bb75-53d8d64dc8d3
a9880f20-a124-4ab9-ab64-378823ee0b8c	f5f74d64-8d49-420c-9906-bdfe82172a5d
38535122-c1a3-4c32-b9cd-6a044511f5fc	f5f74d64-8d49-420c-9906-bdfe82172a5d
a9880f20-a124-4ab9-ab64-378823ee0b8c	8c547b32-b654-4481-9128-96eb039ff339
38535122-c1a3-4c32-b9cd-6a044511f5fc	8c547b32-b654-4481-9128-96eb039ff339
a9880f20-a124-4ab9-ab64-378823ee0b8c	55eadc3f-ceb5-49a1-9001-f562ebc0c3ba
38535122-c1a3-4c32-b9cd-6a044511f5fc	55eadc3f-ceb5-49a1-9001-f562ebc0c3ba
a9880f20-a124-4ab9-ab64-378823ee0b8c	51b5964a-662e-4535-ba3c-5233ebac9155
38535122-c1a3-4c32-b9cd-6a044511f5fc	51b5964a-662e-4535-ba3c-5233ebac9155
a9880f20-a124-4ab9-ab64-378823ee0b8c	dacf47ca-e857-4227-a9db-b492f31de9a1
38535122-c1a3-4c32-b9cd-6a044511f5fc	dacf47ca-e857-4227-a9db-b492f31de9a1
a9880f20-a124-4ab9-ab64-378823ee0b8c	03fcdd36-6140-46ff-8143-9c5e26ff48ba
38535122-c1a3-4c32-b9cd-6a044511f5fc	03fcdd36-6140-46ff-8143-9c5e26ff48ba
a9880f20-a124-4ab9-ab64-378823ee0b8c	9ecbe786-985e-4797-b0b9-2265046576ae
d11af074-b52e-40f7-bf30-ed29fd52c085	9ecbe786-985e-4797-b0b9-2265046576ae
a9880f20-a124-4ab9-ab64-378823ee0b8c	648daee4-c126-47cb-a1c2-8b3a636e29bf
38535122-c1a3-4c32-b9cd-6a044511f5fc	648daee4-c126-47cb-a1c2-8b3a636e29bf
a9880f20-a124-4ab9-ab64-378823ee0b8c	6f5271e3-909f-401d-a38c-9eb41a1e81b0
e7da107d-c205-4df1-b571-85c5675595a9	6f5271e3-909f-401d-a38c-9eb41a1e81b0
a9880f20-a124-4ab9-ab64-378823ee0b8c	49e7cfa7-16e6-41c9-a3d0-6311ca810032
d11af074-b52e-40f7-bf30-ed29fd52c085	49e7cfa7-16e6-41c9-a3d0-6311ca810032
a9880f20-a124-4ab9-ab64-378823ee0b8c	89b7fe9c-df72-4489-b7de-74d8c4170712
e7da107d-c205-4df1-b571-85c5675595a9	89b7fe9c-df72-4489-b7de-74d8c4170712
a9880f20-a124-4ab9-ab64-378823ee0b8c	4f95c6e3-cfe8-4c0d-a72e-bee793b66ff4
38535122-c1a3-4c32-b9cd-6a044511f5fc	4f95c6e3-cfe8-4c0d-a72e-bee793b66ff4
a9880f20-a124-4ab9-ab64-378823ee0b8c	c4d7ff3f-dbac-49a6-a812-6529e8f0dc56
e7da107d-c205-4df1-b571-85c5675595a9	c4d7ff3f-dbac-49a6-a812-6529e8f0dc56
a9880f20-a124-4ab9-ab64-378823ee0b8c	965141a7-abe0-4817-839a-7931edbe2bb1
a1bb442f-10f7-49d7-acad-8173d177e4b6	965141a7-abe0-4817-839a-7931edbe2bb1
a9880f20-a124-4ab9-ab64-378823ee0b8c	32733d05-b2c0-4dc2-90d7-ba39b82725a1
38535122-c1a3-4c32-b9cd-6a044511f5fc	32733d05-b2c0-4dc2-90d7-ba39b82725a1
a9880f20-a124-4ab9-ab64-378823ee0b8c	e61a43c4-6b8e-46df-b866-7aa74685ce76
38535122-c1a3-4c32-b9cd-6a044511f5fc	e61a43c4-6b8e-46df-b866-7aa74685ce76
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak-regional-fase2
--

COPY public.web_origins (client_id, value) FROM stdin;
65a8091a-60c9-4746-8531-4451378359ce	+
35009670-c406-4b2b-aced-8d9fe4140990	*
502d0adf-e637-458d-a6f1-b6d30a0032e5	+
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak-regional-fase2
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak-regional-fase2
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: cloudsqlsuperuser
--

REVOKE ALL ON SCHEMA public FROM cloudsqladmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO cloudsqlsuperuser;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

