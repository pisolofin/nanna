PGDMP                      |            zitadel    16.2    16.2 �   !           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            "           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            #           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            $           1262    16385    zitadel    DATABASE     r   CREATE DATABASE zitadel WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE zitadel;
                postgres    false            %           0    0    DATABASE zitadel    ACL     *   GRANT ALL ON DATABASE zitadel TO zitadel;
                   postgres    false    4388            	            2615    16414    adminapi    SCHEMA        CREATE SCHEMA adminapi;
    DROP SCHEMA adminapi;
                zitadel    false            
            2615    16444    auth    SCHEMA        CREATE SCHEMA auth;
    DROP SCHEMA auth;
                zitadel    false                        2615    16395 
   eventstore    SCHEMA        CREATE SCHEMA eventstore;
    DROP SCHEMA eventstore;
                zitadel    false                        2615    16624    logstore    SCHEMA        CREATE SCHEMA logstore;
    DROP SCHEMA logstore;
                zitadel    false                        2615    16394    projections    SCHEMA        CREATE SCHEMA projections;
    DROP SCHEMA projections;
                zitadel    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            &           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4                        2615    16386    system    SCHEMA        CREATE SCHEMA system;
    DROP SCHEMA system;
                zitadel    false            �            1259    16422    current_sequences    TABLE     �   CREATE TABLE adminapi.current_sequences (
    view_name text NOT NULL,
    current_sequence bigint,
    event_date timestamp with time zone,
    last_successful_spooler_run timestamp with time zone,
    instance_id text NOT NULL
);
 '   DROP TABLE adminapi.current_sequences;
       adminapi         heap    zitadel    false    9            �            1259    16429    failed_events    TABLE     �   CREATE TABLE adminapi.failed_events (
    view_name text NOT NULL,
    failed_sequence bigint NOT NULL,
    failure_count smallint,
    err_msg text,
    instance_id text NOT NULL,
    last_failed timestamp with time zone
);
 #   DROP TABLE adminapi.failed_events;
       adminapi         heap    zitadel    false    9            �            1259    16415    locks    TABLE     �   CREATE TABLE adminapi.locks (
    locker_id text,
    locked_until timestamp(3) with time zone,
    view_name text NOT NULL,
    instance_id text NOT NULL
);
    DROP TABLE adminapi.locks;
       adminapi         heap    zitadel    false    9            �            1259    16436    styling    TABLE     �  CREATE TABLE adminapi.styling (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    label_policy_state smallint DEFAULT (0)::smallint NOT NULL,
    sequence bigint,
    primary_color text,
    background_color text,
    warn_color text,
    font_color text,
    primary_color_dark text,
    background_color_dark text,
    warn_color_dark text,
    font_color_dark text,
    logo_url text,
    icon_url text,
    logo_dark_url text,
    icon_dark_url text,
    font_url text,
    err_msg_popup boolean,
    disable_watermark boolean,
    hide_login_name_suffix boolean,
    instance_id text NOT NULL
);
    DROP TABLE adminapi.styling;
       adminapi         heap    zitadel    false    9            �            1259    16569    styling2    TABLE     �  CREATE TABLE adminapi.styling2 (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    label_policy_state smallint DEFAULT (0)::smallint NOT NULL,
    sequence bigint,
    primary_color text,
    background_color text,
    warn_color text,
    font_color text,
    primary_color_dark text,
    background_color_dark text,
    warn_color_dark text,
    font_color_dark text,
    logo_url text,
    icon_url text,
    logo_dark_url text,
    icon_dark_url text,
    font_url text,
    err_msg_popup boolean,
    disable_watermark boolean,
    hide_login_name_suffix boolean,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false
);
    DROP TABLE adminapi.styling2;
       adminapi         heap    zitadel    false    9            �            1259    16525    auth_requests    TABLE     �   CREATE TABLE auth.auth_requests (
    id text NOT NULL,
    request jsonb,
    code text,
    request_type smallint,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    instance_id text NOT NULL
);
    DROP TABLE auth.auth_requests;
       auth         heap    zitadel    false    10            �            1259    16452    current_sequences    TABLE     �   CREATE TABLE auth.current_sequences (
    view_name text NOT NULL,
    current_sequence bigint,
    event_date timestamp with time zone,
    last_successful_spooler_run timestamp with time zone,
    instance_id text NOT NULL
);
 #   DROP TABLE auth.current_sequences;
       auth         heap    zitadel    false    10            �            1259    16459    failed_events    TABLE     �   CREATE TABLE auth.failed_events (
    view_name text NOT NULL,
    failed_sequence bigint NOT NULL,
    failure_count smallint,
    err_msg text,
    instance_id text NOT NULL,
    last_failed timestamp with time zone
);
    DROP TABLE auth.failed_events;
       auth         heap    zitadel    false    10            �            1259    16518    idp_configs    TABLE     �  CREATE TABLE auth.idp_configs (
    idp_config_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    aggregate_id text,
    name text,
    idp_state smallint,
    idp_provider_type smallint,
    is_oidc boolean,
    oidc_client_id text,
    oidc_client_secret jsonb,
    oidc_issuer text,
    oidc_scopes text[],
    oidc_idp_display_name_mapping smallint,
    oidc_idp_username_mapping smallint,
    styling_type smallint,
    oauth_authorization_endpoint text,
    oauth_token_endpoint text,
    auto_register boolean,
    jwt_endpoint text,
    jwt_keys_endpoint text,
    jwt_header_name text,
    instance_id text NOT NULL
);
    DROP TABLE auth.idp_configs;
       auth         heap    zitadel    false    10            �            1259    16615    idp_configs2    TABLE     �  CREATE TABLE auth.idp_configs2 (
    idp_config_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    aggregate_id text,
    name text,
    idp_state smallint,
    idp_provider_type smallint,
    is_oidc boolean,
    oidc_client_id text,
    oidc_client_secret jsonb,
    oidc_issuer text,
    oidc_scopes text[],
    oidc_idp_display_name_mapping smallint,
    oidc_idp_username_mapping smallint,
    styling_type smallint,
    oauth_authorization_endpoint text,
    oauth_token_endpoint text,
    auto_register boolean,
    jwt_endpoint text,
    jwt_keys_endpoint text,
    jwt_header_name text,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false
);
    DROP TABLE auth.idp_configs2;
       auth         heap    zitadel    false    10            �            1259    16511    idp_providers    TABLE     o  CREATE TABLE auth.idp_providers (
    aggregate_id text NOT NULL,
    idp_config_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    name text,
    idp_config_type smallint,
    idp_provider_type smallint,
    idp_state smallint,
    styling_type smallint,
    instance_id text NOT NULL
);
    DROP TABLE auth.idp_providers;
       auth         heap    zitadel    false    10            �            1259    16606    idp_providers2    TABLE     �  CREATE TABLE auth.idp_providers2 (
    aggregate_id text NOT NULL,
    idp_config_id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    name text,
    idp_config_type smallint,
    idp_provider_type smallint,
    idp_state smallint,
    styling_type smallint,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false
);
     DROP TABLE auth.idp_providers2;
       auth         heap    zitadel    false    10            �            1259    16445    locks    TABLE     �   CREATE TABLE auth.locks (
    locker_id text,
    locked_until timestamp(3) with time zone,
    view_name text NOT NULL,
    instance_id text NOT NULL
);
    DROP TABLE auth.locks;
       auth         heap    zitadel    false    10            �            1259    16504    org_project_mapping    TABLE     �   CREATE TABLE auth.org_project_mapping (
    org_id text NOT NULL,
    project_id text NOT NULL,
    project_grant_id text,
    instance_id text NOT NULL
);
 %   DROP TABLE auth.org_project_mapping;
       auth         heap    zitadel    false    10            �            1259    16597    org_project_mapping2    TABLE     �   CREATE TABLE auth.org_project_mapping2 (
    org_id text NOT NULL,
    project_id text NOT NULL,
    project_grant_id text,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false
);
 &   DROP TABLE auth.org_project_mapping2;
       auth         heap    zitadel    false    10            �            1259    16496    refresh_tokens    TABLE     �  CREATE TABLE auth.refresh_tokens (
    id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    resource_owner text,
    token text,
    client_id text NOT NULL,
    user_agent_id text NOT NULL,
    user_id text NOT NULL,
    auth_time timestamp with time zone,
    idle_expiration timestamp with time zone,
    expiration timestamp with time zone,
    sequence bigint,
    scopes text[],
    audience text[],
    amr text[],
    instance_id text NOT NULL
);
     DROP TABLE auth.refresh_tokens;
       auth         heap    zitadel    false    10            �            1259    16487    tokens    TABLE     �  CREATE TABLE auth.tokens (
    id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    resource_owner text,
    application_id text,
    user_agent_id text,
    user_id text,
    expiration timestamp with time zone,
    sequence bigint,
    scopes text[],
    audience text[],
    preferred_language text,
    refresh_token_id text,
    is_pat boolean DEFAULT false NOT NULL,
    instance_id text NOT NULL
);
    DROP TABLE auth.tokens;
       auth         heap    zitadel    false    10            �            1259    16480    user_external_idps    TABLE     R  CREATE TABLE auth.user_external_idps (
    external_user_id text NOT NULL,
    idp_config_id text NOT NULL,
    user_id text,
    idp_name text,
    user_display_name text,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    resource_owner text,
    instance_id text NOT NULL
);
 $   DROP TABLE auth.user_external_idps;
       auth         heap    zitadel    false    10            �            1259    16588    user_external_idps2    TABLE     |  CREATE TABLE auth.user_external_idps2 (
    external_user_id text NOT NULL,
    idp_config_id text NOT NULL,
    user_id text,
    idp_name text,
    user_display_name text,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    sequence bigint,
    resource_owner text,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false
);
 %   DROP TABLE auth.user_external_idps2;
       auth         heap    zitadel    false    10            �            1259    16473    user_sessions    TABLE       CREATE TABLE auth.user_sessions (
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    resource_owner text,
    state smallint,
    user_agent_id text NOT NULL,
    user_id text NOT NULL,
    user_name text,
    password_verification timestamp with time zone,
    second_factor_verification timestamp with time zone,
    multi_factor_verification timestamp with time zone,
    sequence bigint,
    second_factor_verification_type smallint,
    multi_factor_verification_type smallint,
    user_display_name text,
    login_name text,
    external_login_verification timestamp with time zone,
    selected_idp_config_id text,
    passwordless_verification timestamp with time zone,
    avatar_key text,
    instance_id text NOT NULL
);
    DROP TABLE auth.user_sessions;
       auth         heap    zitadel    false    10            �            1259    16466    users    TABLE     �  CREATE TABLE auth.users (
    id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    resource_owner text,
    user_state smallint,
    password_set boolean,
    password_change_required boolean,
    password_change timestamp with time zone,
    last_login timestamp with time zone,
    user_name text,
    login_names text[],
    preferred_login_name text,
    first_name text,
    last_name text,
    nick_name text,
    display_name text,
    preferred_language text,
    gender smallint,
    email text,
    is_email_verified boolean,
    phone text,
    is_phone_verified boolean,
    country text,
    locality text,
    postal_code text,
    region text,
    street_address text,
    otp_state smallint,
    mfa_max_set_up smallint,
    mfa_init_skipped timestamp with time zone,
    sequence bigint,
    init_required boolean,
    username_change_required boolean,
    machine_name text,
    machine_description text,
    user_type text,
    u2f_tokens bytea,
    passwordless_tokens bytea,
    avatar_key text,
    passwordless_init_required boolean,
    password_init_required boolean,
    instance_id text NOT NULL
);
    DROP TABLE auth.users;
       auth         heap    zitadel    false    10            �            1259    16579    users2    TABLE       CREATE TABLE auth.users2 (
    id text NOT NULL,
    creation_date timestamp with time zone,
    change_date timestamp with time zone,
    resource_owner text,
    user_state smallint,
    password_set boolean,
    password_change_required boolean,
    password_change timestamp with time zone,
    last_login timestamp with time zone,
    user_name text,
    login_names text[],
    preferred_login_name text,
    first_name text,
    last_name text,
    nick_name text,
    display_name text,
    preferred_language text,
    gender smallint,
    email text,
    is_email_verified boolean,
    phone text,
    is_phone_verified boolean,
    country text,
    locality text,
    postal_code text,
    region text,
    street_address text,
    otp_state smallint,
    mfa_max_set_up smallint,
    mfa_init_skipped timestamp with time zone,
    sequence bigint,
    init_required boolean,
    username_change_required boolean,
    machine_name text,
    machine_description text,
    user_type text,
    u2f_tokens bytea,
    passwordless_tokens bytea,
    avatar_key text,
    passwordless_init_required boolean,
    password_init_required boolean,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false,
    otp_sms_added boolean DEFAULT false,
    otp_email_added boolean DEFAULT false
);
    DROP TABLE auth.users2;
       auth         heap    zitadel    false    10            �            1259    16396    events2    TABLE     �  CREATE TABLE eventstore.events2 (
    instance_id text NOT NULL,
    aggregate_type text NOT NULL,
    aggregate_id text NOT NULL,
    event_type text NOT NULL,
    sequence bigint NOT NULL,
    revision smallint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    payload jsonb,
    creator text NOT NULL,
    owner text NOT NULL,
    "position" numeric NOT NULL,
    in_tx_order integer NOT NULL
);
    DROP TABLE eventstore.events2;
    
   eventstore         heap    zitadel    false    8            �            1259    16406 
   system_seq    SEQUENCE     w   CREATE SEQUENCE eventstore.system_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE eventstore.system_seq;
    
   eventstore          zitadel    false    8            �            1259    16407    unique_constraints    TABLE     �   CREATE TABLE eventstore.unique_constraints (
    instance_id text NOT NULL,
    unique_type text NOT NULL,
    unique_field text NOT NULL
);
 *   DROP TABLE eventstore.unique_constraints;
    
   eventstore         heap    zitadel    false    8            �            1259    16625    access    TABLE     ]  CREATE TABLE logstore.access (
    log_date timestamp with time zone NOT NULL,
    protocol integer NOT NULL,
    request_url text NOT NULL,
    response_status integer NOT NULL,
    request_headers jsonb,
    response_headers jsonb,
    instance_id text NOT NULL,
    project_id text NOT NULL,
    requested_domain text,
    requested_host text
);
    DROP TABLE logstore.access;
       logstore         heap    zitadel    false    11            �            1259    16631 	   execution    TABLE     �   CREATE TABLE logstore.execution (
    log_date timestamp with time zone NOT NULL,
    took interval,
    message text NOT NULL,
    loglevel integer NOT NULL,
    instance_id text NOT NULL,
    action_id text NOT NULL,
    metadata jsonb
);
    DROP TABLE logstore.execution;
       logstore         heap    zitadel    false    11                       1259    16682    actions3    TABLE     �  CREATE TABLE projections.actions3 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    action_state smallint NOT NULL,
    sequence bigint NOT NULL,
    name text NOT NULL,
    script text DEFAULT ''::text NOT NULL,
    timeout bigint DEFAULT 0 NOT NULL,
    allowed_to_fail boolean DEFAULT false NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);
 !   DROP TABLE projections.actions3;
       projections         heap    zitadel    false    7                       1259    17005    apps6    TABLE     S  CREATE TABLE projections.apps6 (
    id text NOT NULL,
    name text NOT NULL,
    project_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    state smallint NOT NULL,
    sequence bigint NOT NULL
);
    DROP TABLE projections.apps6;
       projections         heap    zitadel    false    7                       1259    17013    apps6_api_configs    TABLE     �   CREATE TABLE projections.apps6_api_configs (
    app_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb,
    auth_method smallint NOT NULL
);
 *   DROP TABLE projections.apps6_api_configs;
       projections         heap    zitadel    false    7                        1259    17026    apps6_oidc_configs    TABLE       CREATE TABLE projections.apps6_oidc_configs (
    app_id text NOT NULL,
    instance_id text NOT NULL,
    version smallint NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb,
    redirect_uris text[],
    response_types smallint[],
    grant_types smallint[],
    application_type smallint NOT NULL,
    auth_method_type smallint NOT NULL,
    post_logout_redirect_uris text[],
    is_dev_mode boolean NOT NULL,
    access_token_type smallint NOT NULL,
    access_token_role_assertion boolean DEFAULT false NOT NULL,
    id_token_role_assertion boolean DEFAULT false NOT NULL,
    id_token_userinfo_assertion boolean DEFAULT false NOT NULL,
    clock_skew bigint DEFAULT 0 NOT NULL,
    additional_origins text[],
    skip_native_app_success_page boolean DEFAULT false NOT NULL
);
 +   DROP TABLE projections.apps6_oidc_configs;
       projections         heap    zitadel    false    7            !           1259    17044    apps6_saml_configs    TABLE     �   CREATE TABLE projections.apps6_saml_configs (
    app_id text NOT NULL,
    instance_id text NOT NULL,
    entity_id text NOT NULL,
    metadata bytea NOT NULL,
    metadata_url text NOT NULL
);
 +   DROP TABLE projections.apps6_saml_configs;
       projections         heap    zitadel    false    7            H           1259    17414    auth_requests    TABLE     �  CREATE TABLE projections.auth_requests (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    login_client text NOT NULL,
    client_id text NOT NULL,
    redirect_uri text NOT NULL,
    scope text[] NOT NULL,
    prompt smallint[],
    ui_locales text[],
    max_age bigint,
    login_hint text,
    hint_user_id text
);
 &   DROP TABLE projections.auth_requests;
       projections         heap    zitadel    false    7            4           1259    17227    authn_keys2    TABLE       CREATE TABLE projections.authn_keys2 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    aggregate_id text NOT NULL,
    sequence bigint NOT NULL,
    object_id text NOT NULL,
    expiration timestamp with time zone NOT NULL,
    identifier text NOT NULL,
    public_key bytea NOT NULL,
    enabled boolean DEFAULT true NOT NULL,
    type smallint DEFAULT 0 NOT NULL
);
 $   DROP TABLE projections.authn_keys2;
       projections         heap    zitadel    false    7            �            1259    16540    current_sequences    TABLE     �   CREATE TABLE projections.current_sequences (
    projection_name text NOT NULL,
    aggregate_type text NOT NULL,
    current_sequence bigint,
    instance_id text NOT NULL,
    "timestamp" timestamp with time zone
);
 *   DROP TABLE projections.current_sequences;
       projections         heap    zitadel    false    7            �            1259    16652    current_states    TABLE     :  CREATE TABLE projections.current_states (
    projection_name text NOT NULL,
    instance_id text NOT NULL,
    last_updated timestamp with time zone,
    aggregate_id text,
    aggregate_type text,
    sequence bigint,
    event_date timestamp with time zone,
    "position" numeric,
    filter_offset integer
);
 '   DROP TABLE projections.current_states;
       projections         heap    zitadel    false    7            &           1259    17096    custom_texts2    TABLE     �  CREATE TABLE projections.custom_texts2 (
    aggregate_id text NOT NULL,
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    is_default boolean NOT NULL,
    template text NOT NULL,
    language text NOT NULL,
    key text NOT NULL,
    text text NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);
 &   DROP TABLE projections.custom_texts2;
       projections         heap    zitadel    false    7            F           1259    17398    device_auth_requests    TABLE     L  CREATE TABLE projections.device_auth_requests (
    client_id text NOT NULL,
    device_code text NOT NULL,
    user_code text NOT NULL,
    scopes text[] NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    instance_id text NOT NULL
);
 -   DROP TABLE projections.device_auth_requests;
       projections         heap    zitadel    false    7                       1259    16750    domain_policies2    TABLE     &  CREATE TABLE projections.domain_policies2 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    user_login_must_be_domain boolean NOT NULL,
    validate_org_domains boolean NOT NULL,
    smtp_sender_address_matches_instance_domain boolean NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);
 )   DROP TABLE projections.domain_policies2;
       projections         heap    zitadel    false    7            �            1259    16547    failed_events    TABLE     �   CREATE TABLE projections.failed_events (
    projection_name text NOT NULL,
    failed_sequence bigint NOT NULL,
    failure_count smallint,
    error text,
    instance_id text NOT NULL,
    last_failed timestamp with time zone
);
 &   DROP TABLE projections.failed_events;
       projections         heap    zitadel    false    7            �            1259    16643    failed_events2    TABLE     p  CREATE TABLE projections.failed_events2 (
    projection_name text NOT NULL,
    instance_id text NOT NULL,
    aggregate_type text NOT NULL,
    aggregate_id text NOT NULL,
    event_creation_date timestamp with time zone NOT NULL,
    failed_sequence bigint NOT NULL,
    failure_count smallint DEFAULT 0,
    error text,
    last_failed timestamp with time zone
);
 '   DROP TABLE projections.failed_events2;
       projections         heap    zitadel    false    7                       1259    16695    flow_triggers3    TABLE     F  CREATE TABLE projections.flow_triggers3 (
    flow_type smallint NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    trigger_type smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    trigger_sequence bigint NOT NULL,
    action_id text NOT NULL
);
 '   DROP TABLE projections.flow_triggers3;
       projections         heap    zitadel    false    7            #           1259    17067    idp_login_policy_links5    TABLE     �  CREATE TABLE projections.idp_login_policy_links5 (
    idp_id text NOT NULL,
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    provider_type smallint NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);
 0   DROP TABLE projections.idp_login_policy_links5;
       projections         heap    zitadel    false    7                       1259    16845    idp_templates5    TABLE     |  CREATE TABLE projections.idp_templates5 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    state smallint NOT NULL,
    name text,
    owner_type smallint NOT NULL,
    type smallint NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL,
    is_creation_allowed boolean DEFAULT false NOT NULL,
    is_linking_allowed boolean DEFAULT false NOT NULL,
    is_auto_creation boolean DEFAULT false NOT NULL,
    is_auto_update boolean DEFAULT false NOT NULL
);
 '   DROP TABLE projections.idp_templates5;
       projections         heap    zitadel    false    7                       1259    16981    idp_templates5_apple    TABLE     �   CREATE TABLE projections.idp_templates5_apple (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    team_id text NOT NULL,
    key_id text NOT NULL,
    private_key jsonb NOT NULL,
    scopes text[]
);
 -   DROP TABLE projections.idp_templates5_apple;
       projections         heap    zitadel    false    7                       1259    16896    idp_templates5_azure    TABLE       CREATE TABLE projections.idp_templates5_azure (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text,
    tenant text,
    is_email_verified boolean DEFAULT false NOT NULL
);
 -   DROP TABLE projections.idp_templates5_azure;
       projections         heap    zitadel    false    7                       1259    16909    idp_templates5_github    TABLE     �   CREATE TABLE projections.idp_templates5_github (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text[]
);
 .   DROP TABLE projections.idp_templates5_github;
       projections         heap    zitadel    false    7                       1259    16921     idp_templates5_github_enterprise    TABLE     6  CREATE TABLE projections.idp_templates5_github_enterprise (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    authorization_endpoint text NOT NULL,
    token_endpoint text NOT NULL,
    user_endpoint text NOT NULL,
    scopes text[]
);
 9   DROP TABLE projections.idp_templates5_github_enterprise;
       projections         heap    zitadel    false    7                       1259    16933    idp_templates5_gitlab    TABLE     �   CREATE TABLE projections.idp_templates5_gitlab (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text[]
);
 .   DROP TABLE projections.idp_templates5_gitlab;
       projections         heap    zitadel    false    7                       1259    16945 !   idp_templates5_gitlab_self_hosted    TABLE     �   CREATE TABLE projections.idp_templates5_gitlab_self_hosted (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    issuer text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text[]
);
 :   DROP TABLE projections.idp_templates5_gitlab_self_hosted;
       projections         heap    zitadel    false    7                       1259    16957    idp_templates5_google    TABLE     �   CREATE TABLE projections.idp_templates5_google (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text[]
);
 .   DROP TABLE projections.idp_templates5_google;
       projections         heap    zitadel    false    7                       1259    16884    idp_templates5_jwt    TABLE     �   CREATE TABLE projections.idp_templates5_jwt (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    issuer text NOT NULL,
    jwt_endpoint text NOT NULL,
    keys_endpoint text NOT NULL,
    header_name text
);
 +   DROP TABLE projections.idp_templates5_jwt;
       projections         heap    zitadel    false    7                       1259    16969    idp_templates5_ldap2    TABLE       CREATE TABLE projections.idp_templates5_ldap2 (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    servers text[] NOT NULL,
    start_tls boolean NOT NULL,
    base_dn text NOT NULL,
    bind_dn text NOT NULL,
    bind_password jsonb NOT NULL,
    user_base text NOT NULL,
    user_object_classes text[] NOT NULL,
    user_filters text[] NOT NULL,
    timeout bigint NOT NULL,
    id_attribute text,
    first_name_attribute text,
    last_name_attribute text,
    display_name_attribute text,
    nick_name_attribute text,
    preferred_username_attribute text,
    email_attribute text,
    email_verified text,
    phone_attribute text,
    phone_verified_attribute text,
    preferred_language_attribute text,
    avatar_url_attribute text,
    profile_attribute text
);
 -   DROP TABLE projections.idp_templates5_ldap2;
       projections         heap    zitadel    false    7                       1259    16859    idp_templates5_oauth2    TABLE     K  CREATE TABLE projections.idp_templates5_oauth2 (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    authorization_endpoint text NOT NULL,
    token_endpoint text NOT NULL,
    user_endpoint text NOT NULL,
    scopes text[],
    id_attribute text NOT NULL
);
 .   DROP TABLE projections.idp_templates5_oauth2;
       projections         heap    zitadel    false    7                       1259    16871    idp_templates5_oidc    TABLE       CREATE TABLE projections.idp_templates5_oidc (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    issuer text NOT NULL,
    client_id text NOT NULL,
    client_secret jsonb NOT NULL,
    scopes text[],
    id_token_mapping boolean DEFAULT false NOT NULL
);
 ,   DROP TABLE projections.idp_templates5_oidc;
       projections         heap    zitadel    false    7                       1259    16993    idp_templates5_saml    TABLE     �   CREATE TABLE projections.idp_templates5_saml (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    metadata bytea NOT NULL,
    key jsonb NOT NULL,
    certificate bytea NOT NULL,
    binding text,
    with_signed_request boolean
);
 ,   DROP TABLE projections.idp_templates5_saml;
       projections         heap    zitadel    false    7            "           1259    17057    idp_user_links3    TABLE     �  CREATE TABLE projections.idp_user_links3 (
    idp_id text NOT NULL,
    user_id text NOT NULL,
    external_user_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    display_name text NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);
 (   DROP TABLE projections.idp_user_links3;
       projections         heap    zitadel    false    7                       1259    16810    idps3    TABLE     �  CREATE TABLE projections.idps3 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    state smallint NOT NULL,
    name text NOT NULL,
    styling_type smallint NOT NULL,
    owner_type smallint NOT NULL,
    auto_register boolean DEFAULT false NOT NULL,
    type smallint,
    owner_removed boolean DEFAULT false NOT NULL
);
    DROP TABLE projections.idps3;
       projections         heap    zitadel    false    7                       1259    16833    idps3_jwt_config    TABLE     �   CREATE TABLE projections.idps3_jwt_config (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    issuer text,
    keys_endpoint text,
    header_name text,
    endpoint text
);
 )   DROP TABLE projections.idps3_jwt_config;
       projections         heap    zitadel    false    7                       1259    16821    idps3_oidc_config    TABLE     5  CREATE TABLE projections.idps3_oidc_config (
    idp_id text NOT NULL,
    instance_id text NOT NULL,
    client_id text,
    client_secret jsonb,
    issuer text,
    scopes text[],
    display_name_mapping smallint,
    username_mapping smallint,
    authorization_endpoint text,
    token_endpoint text
);
 *   DROP TABLE projections.idps3_oidc_config;
       projections         heap    zitadel    false    7            0           1259    17192    instance_domains    TABLE     1  CREATE TABLE projections.instance_domains (
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    domain text NOT NULL,
    is_generated boolean NOT NULL,
    is_primary boolean NOT NULL
);
 )   DROP TABLE projections.instance_domains;
       projections         heap    zitadel    false    7            P           1259    17470    instance_features2    TABLE       CREATE TABLE projections.instance_features2 (
    instance_id text NOT NULL,
    key text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    value jsonb NOT NULL
);
 +   DROP TABLE projections.instance_features2;
       projections         heap    zitadel    false    7            1           1259    17200    instance_members4    TABLE     `  CREATE TABLE projections.instance_members4 (
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    user_id text NOT NULL,
    user_resource_owner text NOT NULL,
    roles text[],
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    id text NOT NULL
);
 *   DROP TABLE projections.instance_members4;
       projections         heap    zitadel    false    7            9           1259    17276 	   instances    TABLE     �  CREATE TABLE projections.instances (
    id text NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    change_date timestamp with time zone NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    default_org_id text DEFAULT ''::text NOT NULL,
    iam_project_id text DEFAULT ''::text NOT NULL,
    console_client_id text DEFAULT ''::text NOT NULL,
    console_app_id text DEFAULT ''::text NOT NULL,
    sequence bigint NOT NULL,
    default_language text DEFAULT ''::text NOT NULL
);
 "   DROP TABLE projections.instances;
       projections         heap    zitadel    false    7            @           1259    17336    keys4    TABLE     S  CREATE TABLE projections.keys4 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    algorithm text DEFAULT ''::text NOT NULL,
    use smallint DEFAULT 0 NOT NULL
);
    DROP TABLE projections.keys4;
       projections         heap    zitadel    false    7            C           1259    17369    keys4_certificate    TABLE     �   CREATE TABLE projections.keys4_certificate (
    id text NOT NULL,
    instance_id text NOT NULL,
    expiry timestamp with time zone NOT NULL,
    certificate bytea NOT NULL
);
 *   DROP TABLE projections.keys4_certificate;
       projections         heap    zitadel    false    7            A           1259    17345    keys4_private    TABLE     �   CREATE TABLE projections.keys4_private (
    id text NOT NULL,
    instance_id text NOT NULL,
    expiry timestamp with time zone NOT NULL,
    key jsonb NOT NULL
);
 &   DROP TABLE projections.keys4_private;
       projections         heap    zitadel    false    7            B           1259    17357    keys4_public    TABLE     �   CREATE TABLE projections.keys4_public (
    id text NOT NULL,
    instance_id text NOT NULL,
    expiry timestamp with time zone NOT NULL,
    key bytea NOT NULL
);
 %   DROP TABLE projections.keys4_public;
       projections         heap    zitadel    false    7            	           1259    16760    label_policies3    TABLE     �  CREATE TABLE projections.label_policies3 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    hide_login_name_suffix boolean DEFAULT false NOT NULL,
    watermark_disabled boolean DEFAULT false NOT NULL,
    should_error_popup boolean DEFAULT false NOT NULL,
    font_url text,
    light_primary_color text,
    light_warn_color text,
    light_background_color text,
    light_font_color text,
    light_logo_url text,
    light_icon_url text,
    dark_primary_color text,
    dark_warn_color text,
    dark_background_color text,
    dark_font_color text,
    dark_logo_url text,
    dark_icon_url text,
    owner_removed boolean DEFAULT false NOT NULL,
    theme_mode smallint DEFAULT 0 NOT NULL
);
 (   DROP TABLE projections.label_policies3;
       projections         heap    zitadel    false    7            M           1259    17449    limits    TABLE     @  CREATE TABLE projections.limits (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    audit_log_retention interval,
    block boolean
);
    DROP TABLE projections.limits;
       projections         heap    zitadel    false    7                       1259    16730    lockout_policies2    TABLE     �  CREATE TABLE projections.lockout_policies2 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    max_password_attempts bigint NOT NULL,
    show_failure boolean NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);
 *   DROP TABLE projections.lockout_policies2;
       projections         heap    zitadel    false    7            �            1259    16533    locks    TABLE     �   CREATE TABLE projections.locks (
    locker_id text,
    locked_until timestamp(3) with time zone,
    projection_name text NOT NULL,
    instance_id text NOT NULL
);
    DROP TABLE projections.locks;
       projections         heap    zitadel    false    7            ,           1259    17162    login_names3_domains    TABLE     �   CREATE TABLE projections.login_names3_domains (
    name text NOT NULL,
    is_primary boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    name_lower text GENERATED ALWAYS AS (lower(name)) STORED
);
 -   DROP TABLE projections.login_names3_domains;
       projections         heap    zitadel    false    7            -           1259    17170    login_names3_policies    TABLE     �   CREATE TABLE projections.login_names3_policies (
    must_be_domain boolean NOT NULL,
    is_default boolean NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL
);
 .   DROP TABLE projections.login_names3_policies;
       projections         heap    zitadel    false    7            +           1259    17153    login_names3_users    TABLE     �   CREATE TABLE projections.login_names3_users (
    id text NOT NULL,
    user_name text NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    user_name_lower text GENERATED ALWAYS AS (lower(user_name)) STORED
);
 +   DROP TABLE projections.login_names3_users;
       projections         heap    zitadel    false    7            .           1259    17178    login_names3    VIEW     �  CREATE VIEW projections.login_names3 AS
 SELECT user_id,
        CASE
            WHEN must_be_domain THEN concat(user_name, '@', domain)
            ELSE user_name
        END AS login_name,
    COALESCE(is_primary, true) AS is_primary,
    instance_id
   FROM ( SELECT policy_users.user_id,
            policy_users.user_name,
            policy_users.resource_owner,
            policy_users.instance_id,
            policy_users.must_be_domain,
            domains.name AS domain,
            domains.is_primary
           FROM (( SELECT users.id AS user_id,
                    users.user_name,
                    users.instance_id,
                    users.resource_owner,
                    COALESCE(policy_custom.must_be_domain, policy_default.must_be_domain) AS must_be_domain
                   FROM ((projections.login_names3_users users
                     LEFT JOIN projections.login_names3_policies policy_custom ON (((policy_custom.resource_owner = users.resource_owner) AND (policy_custom.instance_id = users.instance_id))))
                     LEFT JOIN projections.login_names3_policies policy_default ON (((policy_default.is_default = true) AND (policy_default.instance_id = users.instance_id))))) policy_users
             LEFT JOIN projections.login_names3_domains domains ON ((policy_users.must_be_domain AND (policy_users.resource_owner = domains.resource_owner) AND (policy_users.instance_id = domains.instance_id))))) login_names3;
 $   DROP VIEW projections.login_names3;
       projections          zitadel    false    299    299    299    299    300    300    300    300    301    301    301    301    7                       1259    16799    login_policies5    TABLE     �  CREATE TABLE projections.login_policies5 (
    aggregate_id text NOT NULL,
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    allow_register boolean NOT NULL,
    allow_username_password boolean NOT NULL,
    allow_external_idps boolean NOT NULL,
    force_mfa boolean NOT NULL,
    force_mfa_local_only boolean DEFAULT false NOT NULL,
    second_factors smallint[],
    multi_factors smallint[],
    passwordless_type smallint NOT NULL,
    hide_password_reset boolean NOT NULL,
    ignore_unknown_usernames boolean NOT NULL,
    allow_domain_discovery boolean NOT NULL,
    disable_login_with_email boolean NOT NULL,
    disable_login_with_phone boolean NOT NULL,
    default_redirect_uri text,
    password_check_lifetime bigint NOT NULL,
    external_login_check_lifetime bigint NOT NULL,
    mfa_init_skip_lifetime bigint NOT NULL,
    second_factor_check_lifetime bigint NOT NULL,
    multi_factor_check_lifetime bigint NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);
 (   DROP TABLE projections.login_policies5;
       projections         heap    zitadel    false    7            $           1259    17077    mail_templates2    TABLE     �  CREATE TABLE projections.mail_templates2 (
    aggregate_id text NOT NULL,
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    template bytea NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);
 (   DROP TABLE projections.mail_templates2;
       projections         heap    zitadel    false    7            %           1259    17087    message_texts2    TABLE     �  CREATE TABLE projections.message_texts2 (
    aggregate_id text NOT NULL,
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    type text NOT NULL,
    language text NOT NULL,
    title text,
    pre_header text,
    subject text,
    greeting text,
    text text,
    button_text text,
    footer_text text,
    owner_removed boolean DEFAULT false NOT NULL
);
 '   DROP TABLE projections.message_texts2;
       projections         heap    zitadel    false    7            I           1259    17421 
   milestones    TABLE     �   CREATE TABLE projections.milestones (
    instance_id text NOT NULL,
    type smallint NOT NULL,
    reached_date timestamp with time zone,
    last_pushed_date timestamp with time zone,
    primary_domain text,
    ignore_client_ids text[]
);
 #   DROP TABLE projections.milestones;
       projections         heap    zitadel    false    7            E           1259    17390    notification_policies    TABLE     �  CREATE TABLE projections.notification_policies (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean NOT NULL,
    password_change boolean NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);
 .   DROP TABLE projections.notification_policies;
       projections         heap    zitadel    false    7            ?           1259    17329    notification_providers    TABLE     {  CREATE TABLE projections.notification_providers (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    state smallint NOT NULL,
    provider_type smallint NOT NULL,
    compact boolean NOT NULL
);
 /   DROP TABLE projections.notification_providers;
       projections         heap    zitadel    false    7            >           1259    17322    oidc_settings2    TABLE     �  CREATE TABLE projections.oidc_settings2 (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    access_token_lifetime bigint NOT NULL,
    id_token_lifetime bigint NOT NULL,
    refresh_token_idle_expiration bigint NOT NULL,
    refresh_token_expiration bigint NOT NULL
);
 '   DROP TABLE projections.oidc_settings2;
       projections         heap    zitadel    false    7                       1259    16790    org_domains2    TABLE     �  CREATE TABLE projections.org_domains2 (
    org_id text NOT NULL,
    instance_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    domain text NOT NULL,
    is_verified boolean NOT NULL,
    is_primary boolean NOT NULL,
    validation_type smallint NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);
 %   DROP TABLE projections.org_domains2;
       projections         heap    zitadel    false    7            /           1259    17183    org_members4    TABLE     _  CREATE TABLE projections.org_members4 (
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    user_id text NOT NULL,
    user_resource_owner text NOT NULL,
    roles text[],
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    org_id text NOT NULL
);
 %   DROP TABLE projections.org_members4;
       projections         heap    zitadel    false    7                        1259    16673    org_metadata2    TABLE     f  CREATE TABLE projections.org_metadata2 (
    org_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    key text NOT NULL,
    value bytea,
    owner_removed boolean DEFAULT false NOT NULL
);
 &   DROP TABLE projections.org_metadata2;
       projections         heap    zitadel    false    7            �            1259    16663    orgs1    TABLE     l  CREATE TABLE projections.orgs1 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    org_state smallint NOT NULL,
    sequence bigint NOT NULL,
    name text NOT NULL,
    primary_domain text DEFAULT ''::text NOT NULL
);
    DROP TABLE projections.orgs1;
       projections         heap    zitadel    false    7                       1259    16720    password_age_policies2    TABLE     �  CREATE TABLE projections.password_age_policies2 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    expire_warn_days bigint NOT NULL,
    max_age_days bigint NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);
 /   DROP TABLE projections.password_age_policies2;
       projections         heap    zitadel    false    7                       1259    16710    password_complexity_policies2    TABLE     @  CREATE TABLE projections.password_complexity_policies2 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    min_length bigint NOT NULL,
    has_lowercase boolean NOT NULL,
    has_uppercase boolean NOT NULL,
    has_symbol boolean NOT NULL,
    has_number boolean NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);
 6   DROP TABLE projections.password_complexity_policies2;
       projections         heap    zitadel    false    7            5           1259    17238    personal_access_tokens3    TABLE     �  CREATE TABLE projections.personal_access_tokens3 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    user_id text NOT NULL,
    expiration timestamp with time zone NOT NULL,
    scopes text[],
    owner_removed boolean DEFAULT false NOT NULL
);
 0   DROP TABLE projections.personal_access_tokens3;
       projections         heap    zitadel    false    7                       1259    16740    privacy_policies3    TABLE       CREATE TABLE projections.privacy_policies3 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    privacy_link text NOT NULL,
    tos_link text NOT NULL,
    help_link text NOT NULL,
    support_email text NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);
 *   DROP TABLE projections.privacy_policies3;
       projections         heap    zitadel    false    7            3           1259    17218    project_grant_members4    TABLE     �  CREATE TABLE projections.project_grant_members4 (
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    user_id text NOT NULL,
    user_resource_owner text NOT NULL,
    roles text[],
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    project_id text NOT NULL,
    grant_id text NOT NULL,
    granted_org text NOT NULL
);
 /   DROP TABLE projections.project_grant_members4;
       projections         heap    zitadel    false    7            
           1259    16774    project_grants4    TABLE     �  CREATE TABLE projections.project_grants4 (
    grant_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    project_id text NOT NULL,
    granted_org_id text NOT NULL,
    granted_role_keys text[]
);
 (   DROP TABLE projections.project_grants4;
       projections         heap    zitadel    false    7            2           1259    17209    project_members4    TABLE     g  CREATE TABLE projections.project_members4 (
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    user_id text NOT NULL,
    user_resource_owner text NOT NULL,
    roles text[],
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    project_id text NOT NULL
);
 )   DROP TABLE projections.project_members4;
       projections         heap    zitadel    false    7                       1259    16783    project_roles4    TABLE     k  CREATE TABLE projections.project_roles4 (
    project_id text NOT NULL,
    role_key text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    display_name text NOT NULL,
    group_name text NOT NULL
);
 '   DROP TABLE projections.project_roles4;
       projections         heap    zitadel    false    7                       1259    16702 	   projects4    TABLE     �  CREATE TABLE projections.projects4 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    name text NOT NULL,
    project_role_assertion boolean NOT NULL,
    project_role_check boolean NOT NULL,
    has_project_check boolean NOT NULL,
    private_labeling_setting smallint NOT NULL
);
 "   DROP TABLE projections.projects4;
       projections         heap    zitadel    false    7            J           1259    17428    quotas    TABLE     �   CREATE TABLE projections.quotas (
    id text NOT NULL,
    instance_id text NOT NULL,
    unit smallint NOT NULL,
    amount bigint,
    from_anchor timestamp with time zone,
    "interval" interval,
    limit_usage boolean
);
    DROP TABLE projections.quotas;
       projections         heap    zitadel    false    7            L           1259    17442    quotas_notifications    TABLE     .  CREATE TABLE projections.quotas_notifications (
    instance_id text NOT NULL,
    unit smallint NOT NULL,
    id text NOT NULL,
    call_url text NOT NULL,
    percent bigint NOT NULL,
    repeat boolean NOT NULL,
    latest_due_period_start timestamp with time zone,
    next_due_threshold bigint
);
 -   DROP TABLE projections.quotas_notifications;
       projections         heap    zitadel    false    7            K           1259    17435    quotas_periods    TABLE     �   CREATE TABLE projections.quotas_periods (
    instance_id text NOT NULL,
    unit smallint NOT NULL,
    start timestamp with time zone NOT NULL,
    usage bigint NOT NULL
);
 '   DROP TABLE projections.quotas_periods;
       projections         heap    zitadel    false    7            N           1259    17456    restrictions2    TABLE     ^  CREATE TABLE projections.restrictions2 (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    disallow_public_org_registration boolean,
    allowed_languages text[]
);
 &   DROP TABLE projections.restrictions2;
       projections         heap    zitadel    false    7            :           1259    17289    secret_generators2    TABLE       CREATE TABLE projections.secret_generators2 (
    generator_type smallint NOT NULL,
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    length bigint NOT NULL,
    expiry bigint NOT NULL,
    include_lower_letters boolean NOT NULL,
    include_upper_letters boolean NOT NULL,
    include_digits boolean NOT NULL,
    include_symbols boolean NOT NULL
);
 +   DROP TABLE projections.secret_generators2;
       projections         heap    zitadel    false    7            D           1259    17381    security_policies2    TABLE     ^  CREATE TABLE projections.security_policies2 (
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    instance_id text NOT NULL,
    sequence bigint NOT NULL,
    enable_iframe_embedding boolean DEFAULT false NOT NULL,
    origins text[],
    enable_impersonation boolean DEFAULT false NOT NULL
);
 +   DROP TABLE projections.security_policies2;
       projections         heap    zitadel    false    7            G           1259    17406 	   sessions8    TABLE     �  CREATE TABLE projections.sessions8 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    creator text NOT NULL,
    user_id text,
    user_resource_owner text,
    user_checked_at timestamp with time zone,
    password_checked_at timestamp with time zone,
    intent_checked_at timestamp with time zone,
    webauthn_checked_at timestamp with time zone,
    webauthn_user_verified boolean,
    totp_checked_at timestamp with time zone,
    otp_sms_checked_at timestamp with time zone,
    otp_email_checked_at timestamp with time zone,
    metadata jsonb,
    token_id text,
    user_agent_fingerprint_id text,
    user_agent_ip text,
    user_agent_description text,
    user_agent_header jsonb,
    expiration timestamp with time zone
);
 "   DROP TABLE projections.sessions8;
       projections         heap    zitadel    false    7            <           1259    17303    sms_configs2    TABLE     D  CREATE TABLE projections.sms_configs2 (
    id text NOT NULL,
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL
);
 %   DROP TABLE projections.sms_configs2;
       projections         heap    zitadel    false    7            =           1259    17310    sms_configs2_twilio    TABLE     �   CREATE TABLE projections.sms_configs2_twilio (
    sms_id text NOT NULL,
    instance_id text NOT NULL,
    sid text NOT NULL,
    sender_number text NOT NULL,
    token jsonb NOT NULL
);
 ,   DROP TABLE projections.sms_configs2_twilio;
       projections         heap    zitadel    false    7            ;           1259    17296    smtp_configs1    TABLE     �  CREATE TABLE projections.smtp_configs1 (
    aggregate_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    tls boolean NOT NULL,
    sender_address text NOT NULL,
    sender_name text NOT NULL,
    reply_to_address text NOT NULL,
    host text NOT NULL,
    username text NOT NULL,
    password jsonb
);
 &   DROP TABLE projections.smtp_configs1;
       projections         heap    zitadel    false    7            O           1259    17463    system_features    TABLE     �   CREATE TABLE projections.system_features (
    key text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    value jsonb NOT NULL
);
 (   DROP TABLE projections.system_features;
       projections         heap    zitadel    false    7            8           1259    17266    user_auth_methods4    TABLE     �  CREATE TABLE projections.user_auth_methods4 (
    user_id text NOT NULL,
    method_type smallint NOT NULL,
    token_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    name text NOT NULL,
    owner_removed boolean DEFAULT false NOT NULL
);
 +   DROP TABLE projections.user_auth_methods4;
       projections         heap    zitadel    false    7            6           1259    17249    user_grants4    TABLE     �  CREATE TABLE projections.user_grants4 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    user_id text NOT NULL,
    resource_owner_user text NOT NULL,
    project_id text NOT NULL,
    resource_owner_project text NOT NULL,
    grant_id text NOT NULL,
    granted_org text NOT NULL,
    roles text[]
);
 %   DROP TABLE projections.user_grants4;
       projections         heap    zitadel    false    7            7           1259    17258    user_metadata5    TABLE     6  CREATE TABLE projections.user_metadata5 (
    user_id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    key text NOT NULL,
    value bytea
);
 '   DROP TABLE projections.user_metadata5;
       projections         heap    zitadel    false    7            '           1259    17105    users10    TABLE     W  CREATE TABLE projections.users10 (
    id text NOT NULL,
    creation_date timestamp with time zone NOT NULL,
    change_date timestamp with time zone NOT NULL,
    sequence bigint NOT NULL,
    state smallint NOT NULL,
    resource_owner text NOT NULL,
    instance_id text NOT NULL,
    username text NOT NULL,
    type smallint NOT NULL
);
     DROP TABLE projections.users10;
       projections         heap    zitadel    false    7            (           1259    17114    users10_humans    TABLE     �  CREATE TABLE projections.users10_humans (
    user_id text NOT NULL,
    instance_id text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    nick_name text,
    display_name text,
    preferred_language text,
    gender smallint,
    avatar_key text,
    email text NOT NULL,
    is_email_verified boolean DEFAULT false NOT NULL,
    phone text,
    is_phone_verified boolean
);
 '   DROP TABLE projections.users10_humans;
       projections         heap    zitadel    false    7            )           1259    17127    users10_machines    TABLE     �   CREATE TABLE projections.users10_machines (
    user_id text NOT NULL,
    instance_id text NOT NULL,
    name text NOT NULL,
    description text,
    secret jsonb,
    access_token_type smallint DEFAULT 0 NOT NULL
);
 )   DROP TABLE projections.users10_machines;
       projections         heap    zitadel    false    7            *           1259    17140    users10_notifications    TABLE     �   CREATE TABLE projections.users10_notifications (
    user_id text NOT NULL,
    instance_id text NOT NULL,
    last_email text,
    verified_email text,
    last_phone text,
    verified_phone text,
    password_set boolean DEFAULT false NOT NULL
);
 .   DROP TABLE projections.users10_notifications;
       projections         heap    zitadel    false    7            �            1259    16554    assets    TABLE       CREATE TABLE system.assets (
    instance_id text NOT NULL,
    asset_type text,
    resource_owner text NOT NULL,
    name text NOT NULL,
    content_type text,
    hash text GENERATED ALWAYS AS (md5(data)) STORED,
    data bytea,
    updated_at timestamp with time zone
);
    DROP TABLE system.assets;
       system         heap    zitadel    false    6            �            1259    16387    encryption_keys    TABLE     U   CREATE TABLE system.encryption_keys (
    id text NOT NULL,
    key text NOT NULL
);
 #   DROP TABLE system.encryption_keys;
       system         heap    zitadel    false    6            �          0    16422    current_sequences 
   TABLE DATA           �   COPY adminapi.current_sequences (view_name, current_sequence, event_date, last_successful_spooler_run, instance_id) FROM stdin;
    adminapi          zitadel    false    226   �      �          0    16429    failed_events 
   TABLE DATA           w   COPY adminapi.failed_events (view_name, failed_sequence, failure_count, err_msg, instance_id, last_failed) FROM stdin;
    adminapi          zitadel    false    227   %�      �          0    16415    locks 
   TABLE DATA           R   COPY adminapi.locks (locker_id, locked_until, view_name, instance_id) FROM stdin;
    adminapi          zitadel    false    225   B�      �          0    16436    styling 
   TABLE DATA           t  COPY adminapi.styling (aggregate_id, creation_date, change_date, label_policy_state, sequence, primary_color, background_color, warn_color, font_color, primary_color_dark, background_color_dark, warn_color_dark, font_color_dark, logo_url, icon_url, logo_dark_url, icon_dark_url, font_url, err_msg_popup, disable_watermark, hide_login_name_suffix, instance_id) FROM stdin;
    adminapi          zitadel    false    228   _�      �          0    16569    styling2 
   TABLE DATA           �  COPY adminapi.styling2 (aggregate_id, creation_date, change_date, label_policy_state, sequence, primary_color, background_color, warn_color, font_color, primary_color_dark, background_color_dark, warn_color_dark, font_color_dark, logo_url, icon_url, logo_dark_url, icon_dark_url, font_url, err_msg_popup, disable_watermark, hide_login_name_suffix, instance_id, owner_removed) FROM stdin;
    adminapi          zitadel    false    245   |�      �          0    16525    auth_requests 
   TABLE DATA           o   COPY auth.auth_requests (id, request, code, request_type, creation_date, change_date, instance_id) FROM stdin;
    auth          zitadel    false    240   	�      �          0    16452    current_sequences 
   TABLE DATA           |   COPY auth.current_sequences (view_name, current_sequence, event_date, last_successful_spooler_run, instance_id) FROM stdin;
    auth          zitadel    false    230   4�      �          0    16459    failed_events 
   TABLE DATA           s   COPY auth.failed_events (view_name, failed_sequence, failure_count, err_msg, instance_id, last_failed) FROM stdin;
    auth          zitadel    false    231   Q�      �          0    16518    idp_configs 
   TABLE DATA           �  COPY auth.idp_configs (idp_config_id, creation_date, change_date, sequence, aggregate_id, name, idp_state, idp_provider_type, is_oidc, oidc_client_id, oidc_client_secret, oidc_issuer, oidc_scopes, oidc_idp_display_name_mapping, oidc_idp_username_mapping, styling_type, oauth_authorization_endpoint, oauth_token_endpoint, auto_register, jwt_endpoint, jwt_keys_endpoint, jwt_header_name, instance_id) FROM stdin;
    auth          zitadel    false    239   n�      �          0    16615    idp_configs2 
   TABLE DATA           �  COPY auth.idp_configs2 (idp_config_id, creation_date, change_date, sequence, aggregate_id, name, idp_state, idp_provider_type, is_oidc, oidc_client_id, oidc_client_secret, oidc_issuer, oidc_scopes, oidc_idp_display_name_mapping, oidc_idp_username_mapping, styling_type, oauth_authorization_endpoint, oauth_token_endpoint, auto_register, jwt_endpoint, jwt_keys_endpoint, jwt_header_name, instance_id, owner_removed) FROM stdin;
    auth          zitadel    false    250   ��      �          0    16511    idp_providers 
   TABLE DATA           �   COPY auth.idp_providers (aggregate_id, idp_config_id, creation_date, change_date, sequence, name, idp_config_type, idp_provider_type, idp_state, styling_type, instance_id) FROM stdin;
    auth          zitadel    false    238   ��      �          0    16606    idp_providers2 
   TABLE DATA           �   COPY auth.idp_providers2 (aggregate_id, idp_config_id, creation_date, change_date, sequence, name, idp_config_type, idp_provider_type, idp_state, styling_type, instance_id, owner_removed) FROM stdin;
    auth          zitadel    false    249   ��      �          0    16445    locks 
   TABLE DATA           N   COPY auth.locks (locker_id, locked_until, view_name, instance_id) FROM stdin;
    auth          zitadel    false    229   ��      �          0    16504    org_project_mapping 
   TABLE DATA           ^   COPY auth.org_project_mapping (org_id, project_id, project_grant_id, instance_id) FROM stdin;
    auth          zitadel    false    237   ��      �          0    16597    org_project_mapping2 
   TABLE DATA           n   COPY auth.org_project_mapping2 (org_id, project_id, project_grant_id, instance_id, owner_removed) FROM stdin;
    auth          zitadel    false    248   �      �          0    16496    refresh_tokens 
   TABLE DATA           �   COPY auth.refresh_tokens (id, creation_date, change_date, resource_owner, token, client_id, user_agent_id, user_id, auth_time, idle_expiration, expiration, sequence, scopes, audience, amr, instance_id) FROM stdin;
    auth          zitadel    false    236   9�      �          0    16487    tokens 
   TABLE DATA           �   COPY auth.tokens (id, creation_date, change_date, resource_owner, application_id, user_agent_id, user_id, expiration, sequence, scopes, audience, preferred_language, refresh_token_id, is_pat, instance_id) FROM stdin;
    auth          zitadel    false    235   V�      �          0    16480    user_external_idps 
   TABLE DATA           �   COPY auth.user_external_idps (external_user_id, idp_config_id, user_id, idp_name, user_display_name, creation_date, change_date, sequence, resource_owner, instance_id) FROM stdin;
    auth          zitadel    false    234   l�      �          0    16588    user_external_idps2 
   TABLE DATA           �   COPY auth.user_external_idps2 (external_user_id, idp_config_id, user_id, idp_name, user_display_name, creation_date, change_date, sequence, resource_owner, instance_id, owner_removed) FROM stdin;
    auth          zitadel    false    247   ��      �          0    16473    user_sessions 
   TABLE DATA           �  COPY auth.user_sessions (creation_date, change_date, resource_owner, state, user_agent_id, user_id, user_name, password_verification, second_factor_verification, multi_factor_verification, sequence, second_factor_verification_type, multi_factor_verification_type, user_display_name, login_name, external_login_verification, selected_idp_config_id, passwordless_verification, avatar_key, instance_id) FROM stdin;
    auth          zitadel    false    233   ��      �          0    16466    users 
   TABLE DATA           �  COPY auth.users (id, creation_date, change_date, resource_owner, user_state, password_set, password_change_required, password_change, last_login, user_name, login_names, preferred_login_name, first_name, last_name, nick_name, display_name, preferred_language, gender, email, is_email_verified, phone, is_phone_verified, country, locality, postal_code, region, street_address, otp_state, mfa_max_set_up, mfa_init_skipped, sequence, init_required, username_change_required, machine_name, machine_description, user_type, u2f_tokens, passwordless_tokens, avatar_key, passwordless_init_required, password_init_required, instance_id) FROM stdin;
    auth          zitadel    false    232   '�      �          0    16579    users2 
   TABLE DATA           �  COPY auth.users2 (id, creation_date, change_date, resource_owner, user_state, password_set, password_change_required, password_change, last_login, user_name, login_names, preferred_login_name, first_name, last_name, nick_name, display_name, preferred_language, gender, email, is_email_verified, phone, is_phone_verified, country, locality, postal_code, region, street_address, otp_state, mfa_max_set_up, mfa_init_skipped, sequence, init_required, username_change_required, machine_name, machine_description, user_type, u2f_tokens, passwordless_tokens, avatar_key, passwordless_init_required, password_init_required, instance_id, owner_removed, otp_sms_added, otp_email_added) FROM stdin;
    auth          zitadel    false    246   D�      �          0    16396    events2 
   TABLE DATA           �   COPY eventstore.events2 (instance_id, aggregate_type, aggregate_id, event_type, sequence, revision, created_at, payload, creator, owner, "position", in_tx_order) FROM stdin;
 
   eventstore          zitadel    false    222   �      �          0    16407    unique_constraints 
   TABLE DATA           X   COPY eventstore.unique_constraints (instance_id, unique_type, unique_field) FROM stdin;
 
   eventstore          zitadel    false    224   G7      �          0    16625    access 
   TABLE DATA           �   COPY logstore.access (log_date, protocol, request_url, response_status, request_headers, response_headers, instance_id, project_id, requested_domain, requested_host) FROM stdin;
    logstore          zitadel    false    251   �9      �          0    16631 	   execution 
   TABLE DATA           j   COPY logstore.execution (log_date, took, message, loglevel, instance_id, action_id, metadata) FROM stdin;
    logstore          zitadel    false    252   �9      �          0    16682    actions3 
   TABLE DATA           �   COPY projections.actions3 (id, creation_date, change_date, resource_owner, instance_id, action_state, sequence, name, script, timeout, allowed_to_fail, owner_removed) FROM stdin;
    projections          zitadel    false    257   �9      �          0    17005    apps6 
   TABLE DATA           �   COPY projections.apps6 (id, name, project_id, creation_date, change_date, resource_owner, instance_id, state, sequence) FROM stdin;
    projections          zitadel    false    286   :      �          0    17013    apps6_api_configs 
   TABLE DATA           l   COPY projections.apps6_api_configs (app_id, instance_id, client_id, client_secret, auth_method) FROM stdin;
    projections          zitadel    false    287   ;      �          0    17026    apps6_oidc_configs 
   TABLE DATA           �  COPY projections.apps6_oidc_configs (app_id, instance_id, version, client_id, client_secret, redirect_uris, response_types, grant_types, application_type, auth_method_type, post_logout_redirect_uris, is_dev_mode, access_token_type, access_token_role_assertion, id_token_role_assertion, id_token_userinfo_assertion, clock_skew, additional_origins, skip_native_app_success_page) FROM stdin;
    projections          zitadel    false    288   �;      �          0    17044    apps6_saml_configs 
   TABLE DATA           i   COPY projections.apps6_saml_configs (app_id, instance_id, entity_id, metadata, metadata_url) FROM stdin;
    projections          zitadel    false    289   n<                0    17414    auth_requests 
   TABLE DATA           �   COPY projections.auth_requests (id, creation_date, change_date, sequence, resource_owner, instance_id, login_client, client_id, redirect_uri, scope, prompt, ui_locales, max_age, login_hint, hint_user_id) FROM stdin;
    projections          zitadel    false    328   �<                0    17227    authn_keys2 
   TABLE DATA           �   COPY projections.authn_keys2 (id, creation_date, change_date, resource_owner, instance_id, aggregate_id, sequence, object_id, expiration, identifier, public_key, enabled, type) FROM stdin;
    projections          zitadel    false    308   �<      �          0    16540    current_sequences 
   TABLE DATA           }   COPY projections.current_sequences (projection_name, aggregate_type, current_sequence, instance_id, "timestamp") FROM stdin;
    projections          zitadel    false    242   �<      �          0    16652    current_states 
   TABLE DATA           �   COPY projections.current_states (projection_name, instance_id, last_updated, aggregate_id, aggregate_type, sequence, event_date, "position", filter_offset) FROM stdin;
    projections          zitadel    false    254   �<      �          0    17096    custom_texts2 
   TABLE DATA           �   COPY projections.custom_texts2 (aggregate_id, instance_id, creation_date, change_date, sequence, is_default, template, language, key, text, owner_removed) FROM stdin;
    projections          zitadel    false    294   MB                0    17398    device_auth_requests 
   TABLE DATA           �   COPY projections.device_auth_requests (client_id, device_code, user_code, scopes, creation_date, change_date, sequence, instance_id) FROM stdin;
    projections          zitadel    false    326   �I      �          0    16750    domain_policies2 
   TABLE DATA           �   COPY projections.domain_policies2 (id, creation_date, change_date, sequence, state, user_login_must_be_domain, validate_org_domains, smtp_sender_address_matches_instance_domain, is_default, resource_owner, instance_id, owner_removed) FROM stdin;
    projections          zitadel    false    264   �I      �          0    16547    failed_events 
   TABLE DATA           ~   COPY projections.failed_events (projection_name, failed_sequence, failure_count, error, instance_id, last_failed) FROM stdin;
    projections          zitadel    false    243   J      �          0    16643    failed_events2 
   TABLE DATA           �   COPY projections.failed_events2 (projection_name, instance_id, aggregate_type, aggregate_id, event_creation_date, failed_sequence, failure_count, error, last_failed) FROM stdin;
    projections          zitadel    false    253   %J      �          0    16695    flow_triggers3 
   TABLE DATA           �   COPY projections.flow_triggers3 (flow_type, change_date, sequence, trigger_type, resource_owner, instance_id, trigger_sequence, action_id) FROM stdin;
    projections          zitadel    false    258   �J      �          0    17067    idp_login_policy_links5 
   TABLE DATA           �   COPY projections.idp_login_policy_links5 (idp_id, aggregate_id, creation_date, change_date, sequence, resource_owner, instance_id, provider_type, owner_removed) FROM stdin;
    projections          zitadel    false    291   K      �          0    16845    idp_templates5 
   TABLE DATA           �   COPY projections.idp_templates5 (id, creation_date, change_date, sequence, resource_owner, instance_id, state, name, owner_type, type, owner_removed, is_creation_allowed, is_linking_allowed, is_auto_creation, is_auto_update) FROM stdin;
    projections          zitadel    false    273   +K      �          0    16981    idp_templates5_apple 
   TABLE DATA           y   COPY projections.idp_templates5_apple (idp_id, instance_id, client_id, team_id, key_id, private_key, scopes) FROM stdin;
    projections          zitadel    false    284   HK      �          0    16896    idp_templates5_azure 
   TABLE DATA           �   COPY projections.idp_templates5_azure (idp_id, instance_id, client_id, client_secret, scopes, tenant, is_email_verified) FROM stdin;
    projections          zitadel    false    277   eK      �          0    16909    idp_templates5_github 
   TABLE DATA           k   COPY projections.idp_templates5_github (idp_id, instance_id, client_id, client_secret, scopes) FROM stdin;
    projections          zitadel    false    278   �K      �          0    16921     idp_templates5_github_enterprise 
   TABLE DATA           �   COPY projections.idp_templates5_github_enterprise (idp_id, instance_id, client_id, client_secret, authorization_endpoint, token_endpoint, user_endpoint, scopes) FROM stdin;
    projections          zitadel    false    279   �K      �          0    16933    idp_templates5_gitlab 
   TABLE DATA           k   COPY projections.idp_templates5_gitlab (idp_id, instance_id, client_id, client_secret, scopes) FROM stdin;
    projections          zitadel    false    280   �K      �          0    16945 !   idp_templates5_gitlab_self_hosted 
   TABLE DATA              COPY projections.idp_templates5_gitlab_self_hosted (idp_id, instance_id, issuer, client_id, client_secret, scopes) FROM stdin;
    projections          zitadel    false    281   �K      �          0    16957    idp_templates5_google 
   TABLE DATA           k   COPY projections.idp_templates5_google (idp_id, instance_id, client_id, client_secret, scopes) FROM stdin;
    projections          zitadel    false    282   �K      �          0    16884    idp_templates5_jwt 
   TABLE DATA           x   COPY projections.idp_templates5_jwt (idp_id, instance_id, issuer, jwt_endpoint, keys_endpoint, header_name) FROM stdin;
    projections          zitadel    false    276   L      �          0    16969    idp_templates5_ldap2 
   TABLE DATA           �  COPY projections.idp_templates5_ldap2 (idp_id, instance_id, servers, start_tls, base_dn, bind_dn, bind_password, user_base, user_object_classes, user_filters, timeout, id_attribute, first_name_attribute, last_name_attribute, display_name_attribute, nick_name_attribute, preferred_username_attribute, email_attribute, email_verified, phone_attribute, phone_verified_attribute, preferred_language_attribute, avatar_url_attribute, profile_attribute) FROM stdin;
    projections          zitadel    false    283   0L      �          0    16859    idp_templates5_oauth2 
   TABLE DATA           �   COPY projections.idp_templates5_oauth2 (idp_id, instance_id, client_id, client_secret, authorization_endpoint, token_endpoint, user_endpoint, scopes, id_attribute) FROM stdin;
    projections          zitadel    false    274   ML      �          0    16871    idp_templates5_oidc 
   TABLE DATA           �   COPY projections.idp_templates5_oidc (idp_id, instance_id, issuer, client_id, client_secret, scopes, id_token_mapping) FROM stdin;
    projections          zitadel    false    275   jL      �          0    16993    idp_templates5_saml 
   TABLE DATA           �   COPY projections.idp_templates5_saml (idp_id, instance_id, metadata, key, certificate, binding, with_signed_request) FROM stdin;
    projections          zitadel    false    285   �L      �          0    17057    idp_user_links3 
   TABLE DATA           �   COPY projections.idp_user_links3 (idp_id, user_id, external_user_id, creation_date, change_date, sequence, resource_owner, instance_id, display_name, owner_removed) FROM stdin;
    projections          zitadel    false    290   �L      �          0    16810    idps3 
   TABLE DATA           �   COPY projections.idps3 (id, creation_date, change_date, sequence, resource_owner, instance_id, state, name, styling_type, owner_type, auto_register, type, owner_removed) FROM stdin;
    projections          zitadel    false    270   �L      �          0    16833    idps3_jwt_config 
   TABLE DATA           r   COPY projections.idps3_jwt_config (idp_id, instance_id, issuer, keys_endpoint, header_name, endpoint) FROM stdin;
    projections          zitadel    false    272   �L      �          0    16821    idps3_oidc_config 
   TABLE DATA           �   COPY projections.idps3_oidc_config (idp_id, instance_id, client_id, client_secret, issuer, scopes, display_name_mapping, username_mapping, authorization_endpoint, token_endpoint) FROM stdin;
    projections          zitadel    false    271   �L      �          0    17192    instance_domains 
   TABLE DATA           �   COPY projections.instance_domains (instance_id, creation_date, change_date, sequence, domain, is_generated, is_primary) FROM stdin;
    projections          zitadel    false    304   M                0    17470    instance_features2 
   TABLE DATA           p   COPY projections.instance_features2 (instance_id, key, creation_date, change_date, sequence, value) FROM stdin;
    projections          zitadel    false    336   �M      �          0    17200    instance_members4 
   TABLE DATA           �   COPY projections.instance_members4 (creation_date, change_date, user_id, user_resource_owner, roles, sequence, resource_owner, instance_id, id) FROM stdin;
    projections          zitadel    false    305   �M                0    17276 	   instances 
   TABLE DATA           �   COPY projections.instances (id, name, change_date, creation_date, default_org_id, iam_project_id, console_client_id, console_app_id, sequence, default_language) FROM stdin;
    projections          zitadel    false    313   bN                0    17336    keys4 
   TABLE DATA           {   COPY projections.keys4 (id, creation_date, change_date, resource_owner, instance_id, sequence, algorithm, use) FROM stdin;
    projections          zitadel    false    320   �N                0    17369    keys4_certificate 
   TABLE DATA           V   COPY projections.keys4_certificate (id, instance_id, expiry, certificate) FROM stdin;
    projections          zitadel    false    323   dO                0    17345    keys4_private 
   TABLE DATA           J   COPY projections.keys4_private (id, instance_id, expiry, key) FROM stdin;
    projections          zitadel    false    321   �O                0    17357    keys4_public 
   TABLE DATA           I   COPY projections.keys4_public (id, instance_id, expiry, key) FROM stdin;
    projections          zitadel    false    322   �]      �          0    16760    label_policies3 
   TABLE DATA           �  COPY projections.label_policies3 (id, creation_date, change_date, sequence, state, is_default, resource_owner, instance_id, hide_login_name_suffix, watermark_disabled, should_error_popup, font_url, light_primary_color, light_warn_color, light_background_color, light_font_color, light_logo_url, light_icon_url, dark_primary_color, dark_warn_color, dark_background_color, dark_font_color, dark_logo_url, dark_icon_url, owner_removed, theme_mode) FROM stdin;
    projections          zitadel    false    265   Sa                0    17449    limits 
   TABLE DATA           �   COPY projections.limits (aggregate_id, creation_date, change_date, resource_owner, instance_id, sequence, audit_log_retention, block) FROM stdin;
    projections          zitadel    false    333   �a      �          0    16730    lockout_policies2 
   TABLE DATA           �   COPY projections.lockout_policies2 (id, creation_date, change_date, sequence, state, is_default, resource_owner, instance_id, max_password_attempts, show_failure, owner_removed) FROM stdin;
    projections          zitadel    false    262   	b      �          0    16533    locks 
   TABLE DATA           [   COPY projections.locks (locker_id, locked_until, projection_name, instance_id) FROM stdin;
    projections          zitadel    false    241   eb      �          0    17162    login_names3_domains 
   TABLE DATA           b   COPY projections.login_names3_domains (name, is_primary, resource_owner, instance_id) FROM stdin;
    projections          zitadel    false    300   �b      �          0    17170    login_names3_policies 
   TABLE DATA           m   COPY projections.login_names3_policies (must_be_domain, is_default, resource_owner, instance_id) FROM stdin;
    projections          zitadel    false    301   c      �          0    17153    login_names3_users 
   TABLE DATA           ]   COPY projections.login_names3_users (id, user_name, resource_owner, instance_id) FROM stdin;
    projections          zitadel    false    299   Hc      �          0    16799    login_policies5 
   TABLE DATA           7  COPY projections.login_policies5 (aggregate_id, instance_id, creation_date, change_date, sequence, is_default, allow_register, allow_username_password, allow_external_idps, force_mfa, force_mfa_local_only, second_factors, multi_factors, passwordless_type, hide_password_reset, ignore_unknown_usernames, allow_domain_discovery, disable_login_with_email, disable_login_with_phone, default_redirect_uri, password_check_lifetime, external_login_check_lifetime, mfa_init_skip_lifetime, second_factor_check_lifetime, multi_factor_check_lifetime, owner_removed) FROM stdin;
    projections          zitadel    false    269   �c      �          0    17077    mail_templates2 
   TABLE DATA           �   COPY projections.mail_templates2 (aggregate_id, instance_id, creation_date, change_date, sequence, state, is_default, template, owner_removed) FROM stdin;
    projections          zitadel    false    292   d      �          0    17087    message_texts2 
   TABLE DATA           �   COPY projections.message_texts2 (aggregate_id, instance_id, creation_date, change_date, sequence, state, type, language, title, pre_header, subject, greeting, text, button_text, footer_text, owner_removed) FROM stdin;
    projections          zitadel    false    293   7o                0    17421 
   milestones 
   TABLE DATA              COPY projections.milestones (instance_id, type, reached_date, last_pushed_date, primary_domain, ignore_client_ids) FROM stdin;
    projections          zitadel    false    329   �t                0    17390    notification_policies 
   TABLE DATA           �   COPY projections.notification_policies (id, creation_date, change_date, resource_owner, instance_id, sequence, state, is_default, password_change, owner_removed) FROM stdin;
    projections          zitadel    false    325   �u                0    17329    notification_providers 
   TABLE DATA           �   COPY projections.notification_providers (aggregate_id, creation_date, change_date, sequence, resource_owner, instance_id, state, provider_type, compact) FROM stdin;
    projections          zitadel    false    319   �u                0    17322    oidc_settings2 
   TABLE DATA           �   COPY projections.oidc_settings2 (aggregate_id, creation_date, change_date, resource_owner, instance_id, sequence, access_token_lifetime, id_token_lifetime, refresh_token_idle_expiration, refresh_token_expiration) FROM stdin;
    projections          zitadel    false    318   v      �          0    16790    org_domains2 
   TABLE DATA           �   COPY projections.org_domains2 (org_id, instance_id, creation_date, change_date, sequence, domain, is_verified, is_primary, validation_type, owner_removed) FROM stdin;
    projections          zitadel    false    268   |v      �          0    17183    org_members4 
   TABLE DATA           �   COPY projections.org_members4 (creation_date, change_date, user_id, user_resource_owner, roles, sequence, resource_owner, instance_id, org_id) FROM stdin;
    projections          zitadel    false    303   �v      �          0    16673    org_metadata2 
   TABLE DATA           �   COPY projections.org_metadata2 (org_id, creation_date, change_date, sequence, resource_owner, instance_id, key, value, owner_removed) FROM stdin;
    projections          zitadel    false    256   Ww      �          0    16663    orgs1 
   TABLE DATA           �   COPY projections.orgs1 (id, creation_date, change_date, resource_owner, instance_id, org_state, sequence, name, primary_domain) FROM stdin;
    projections          zitadel    false    255   tw      �          0    16720    password_age_policies2 
   TABLE DATA           �   COPY projections.password_age_policies2 (id, creation_date, change_date, sequence, state, is_default, resource_owner, instance_id, expire_warn_days, max_age_days, owner_removed) FROM stdin;
    projections          zitadel    false    261   �w      �          0    16710    password_complexity_policies2 
   TABLE DATA           �   COPY projections.password_complexity_policies2 (id, creation_date, change_date, sequence, state, is_default, resource_owner, instance_id, min_length, has_lowercase, has_uppercase, has_symbol, has_number, owner_removed) FROM stdin;
    projections          zitadel    false    260   Gx                0    17238    personal_access_tokens3 
   TABLE DATA           �   COPY projections.personal_access_tokens3 (id, creation_date, change_date, sequence, resource_owner, instance_id, user_id, expiration, scopes, owner_removed) FROM stdin;
    projections          zitadel    false    309   �x      �          0    16740    privacy_policies3 
   TABLE DATA           �   COPY projections.privacy_policies3 (id, creation_date, change_date, sequence, state, is_default, resource_owner, instance_id, privacy_link, tos_link, help_link, support_email, owner_removed) FROM stdin;
    projections          zitadel    false    263   �x                0    17218    project_grant_members4 
   TABLE DATA           �   COPY projections.project_grant_members4 (creation_date, change_date, user_id, user_resource_owner, roles, sequence, resource_owner, instance_id, project_id, grant_id, granted_org) FROM stdin;
    projections          zitadel    false    307   Wy      �          0    16774    project_grants4 
   TABLE DATA           �   COPY projections.project_grants4 (grant_id, creation_date, change_date, sequence, state, resource_owner, instance_id, project_id, granted_org_id, granted_role_keys) FROM stdin;
    projections          zitadel    false    266   ty                 0    17209    project_members4 
   TABLE DATA           �   COPY projections.project_members4 (creation_date, change_date, user_id, user_resource_owner, roles, sequence, resource_owner, instance_id, project_id) FROM stdin;
    projections          zitadel    false    306   �y      �          0    16783    project_roles4 
   TABLE DATA           �   COPY projections.project_roles4 (project_id, role_key, creation_date, change_date, sequence, resource_owner, instance_id, display_name, group_name) FROM stdin;
    projections          zitadel    false    267   z      �          0    16702 	   projects4 
   TABLE DATA           �   COPY projections.projects4 (id, creation_date, change_date, sequence, state, resource_owner, instance_id, name, project_role_assertion, project_role_check, has_project_check, private_labeling_setting) FROM stdin;
    projections          zitadel    false    259   �z                0    17428    quotas 
   TABLE DATA           j   COPY projections.quotas (id, instance_id, unit, amount, from_anchor, "interval", limit_usage) FROM stdin;
    projections          zitadel    false    330   {                0    17442    quotas_notifications 
   TABLE DATA           �   COPY projections.quotas_notifications (instance_id, unit, id, call_url, percent, repeat, latest_due_period_start, next_due_threshold) FROM stdin;
    projections          zitadel    false    332   6{                0    17435    quotas_periods 
   TABLE DATA           N   COPY projections.quotas_periods (instance_id, unit, start, usage) FROM stdin;
    projections          zitadel    false    331   S{                0    17456    restrictions2 
   TABLE DATA           �   COPY projections.restrictions2 (aggregate_id, creation_date, change_date, resource_owner, instance_id, sequence, disallow_public_org_registration, allowed_languages) FROM stdin;
    projections          zitadel    false    334   p{                0    17289    secret_generators2 
   TABLE DATA           �   COPY projections.secret_generators2 (generator_type, aggregate_id, creation_date, change_date, sequence, resource_owner, instance_id, length, expiry, include_lower_letters, include_upper_letters, include_digits, include_symbols) FROM stdin;
    projections          zitadel    false    314   �{                0    17381    security_policies2 
   TABLE DATA           �   COPY projections.security_policies2 (creation_date, change_date, instance_id, sequence, enable_iframe_embedding, origins, enable_impersonation) FROM stdin;
    projections          zitadel    false    324   C|                0    17406 	   sessions8 
   TABLE DATA           �  COPY projections.sessions8 (id, creation_date, change_date, sequence, state, resource_owner, instance_id, creator, user_id, user_resource_owner, user_checked_at, password_checked_at, intent_checked_at, webauthn_checked_at, webauthn_user_verified, totp_checked_at, otp_sms_checked_at, otp_email_checked_at, metadata, token_id, user_agent_fingerprint_id, user_agent_ip, user_agent_description, user_agent_header, expiration) FROM stdin;
    projections          zitadel    false    327   `|      
          0    17303    sms_configs2 
   TABLE DATA           �   COPY projections.sms_configs2 (id, aggregate_id, creation_date, change_date, sequence, state, resource_owner, instance_id) FROM stdin;
    projections          zitadel    false    316   }|                0    17310    sms_configs2_twilio 
   TABLE DATA           b   COPY projections.sms_configs2_twilio (sms_id, instance_id, sid, sender_number, token) FROM stdin;
    projections          zitadel    false    317   �|      	          0    17296    smtp_configs1 
   TABLE DATA           �   COPY projections.smtp_configs1 (aggregate_id, creation_date, change_date, sequence, resource_owner, instance_id, tls, sender_address, sender_name, reply_to_address, host, username, password) FROM stdin;
    projections          zitadel    false    315   �|                0    17463    system_features 
   TABLE DATA           `   COPY projections.system_features (key, creation_date, change_date, sequence, value) FROM stdin;
    projections          zitadel    false    335   �|                0    17266    user_auth_methods4 
   TABLE DATA           �   COPY projections.user_auth_methods4 (user_id, method_type, token_id, creation_date, change_date, sequence, state, resource_owner, instance_id, name, owner_removed) FROM stdin;
    projections          zitadel    false    312   �|                0    17249    user_grants4 
   TABLE DATA           �   COPY projections.user_grants4 (id, creation_date, change_date, sequence, state, resource_owner, instance_id, user_id, resource_owner_user, project_id, resource_owner_project, grant_id, granted_org, roles) FROM stdin;
    projections          zitadel    false    310   }                0    17258    user_metadata5 
   TABLE DATA           �   COPY projections.user_metadata5 (user_id, creation_date, change_date, sequence, resource_owner, instance_id, key, value) FROM stdin;
    projections          zitadel    false    311   +}      �          0    17105    users10 
   TABLE DATA           �   COPY projections.users10 (id, creation_date, change_date, sequence, state, resource_owner, instance_id, username, type) FROM stdin;
    projections          zitadel    false    295   H}      �          0    17114    users10_humans 
   TABLE DATA           �   COPY projections.users10_humans (user_id, instance_id, first_name, last_name, nick_name, display_name, preferred_language, gender, avatar_key, email, is_email_verified, phone, is_phone_verified) FROM stdin;
    projections          zitadel    false    296   �}      �          0    17127    users10_machines 
   TABLE DATA           s   COPY projections.users10_machines (user_id, instance_id, name, description, secret, access_token_type) FROM stdin;
    projections          zitadel    false    297   4~      �          0    17140    users10_notifications 
   TABLE DATA           �   COPY projections.users10_notifications (user_id, instance_id, last_email, verified_email, last_phone, verified_phone, password_set) FROM stdin;
    projections          zitadel    false    298   Q~      �          0    16554    assets 
   TABLE DATA           o   COPY system.assets (instance_id, asset_type, resource_owner, name, content_type, data, updated_at) FROM stdin;
    system          zitadel    false    244   �~      �          0    16387    encryption_keys 
   TABLE DATA           2   COPY system.encryption_keys (id, key) FROM stdin;
    system          zitadel    false    221   ��      '           0    0 
   system_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('eventstore.system_seq', 1, false);
       
   eventstore          zitadel    false    223            �           2606    16428 (   current_sequences current_sequences_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY adminapi.current_sequences
    ADD CONSTRAINT current_sequences_pkey PRIMARY KEY (view_name, instance_id);
 T   ALTER TABLE ONLY adminapi.current_sequences DROP CONSTRAINT current_sequences_pkey;
       adminapi            zitadel    false    226    226            �           2606    16435     failed_events failed_events_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY adminapi.failed_events
    ADD CONSTRAINT failed_events_pkey PRIMARY KEY (view_name, failed_sequence, instance_id);
 L   ALTER TABLE ONLY adminapi.failed_events DROP CONSTRAINT failed_events_pkey;
       adminapi            zitadel    false    227    227    227            �           2606    16421    locks locks_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY adminapi.locks
    ADD CONSTRAINT locks_pkey PRIMARY KEY (view_name, instance_id);
 <   ALTER TABLE ONLY adminapi.locks DROP CONSTRAINT locks_pkey;
       adminapi            zitadel    false    225    225                       2606    16577    styling2 styling2_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY adminapi.styling2
    ADD CONSTRAINT styling2_pkey PRIMARY KEY (instance_id, aggregate_id, label_policy_state);
 B   ALTER TABLE ONLY adminapi.styling2 DROP CONSTRAINT styling2_pkey;
       adminapi            zitadel    false    245    245    245            �           2606    16443    styling styling_pkey 
   CONSTRAINT        ALTER TABLE ONLY adminapi.styling
    ADD CONSTRAINT styling_pkey PRIMARY KEY (aggregate_id, label_policy_state, instance_id);
 @   ALTER TABLE ONLY adminapi.styling DROP CONSTRAINT styling_pkey;
       adminapi            zitadel    false    228    228    228                       2606    16531     auth_requests auth_requests_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY auth.auth_requests
    ADD CONSTRAINT auth_requests_pkey PRIMARY KEY (id, instance_id);
 H   ALTER TABLE ONLY auth.auth_requests DROP CONSTRAINT auth_requests_pkey;
       auth            zitadel    false    240    240            �           2606    16458 (   current_sequences current_sequences_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY auth.current_sequences
    ADD CONSTRAINT current_sequences_pkey PRIMARY KEY (view_name, instance_id);
 P   ALTER TABLE ONLY auth.current_sequences DROP CONSTRAINT current_sequences_pkey;
       auth            zitadel    false    230    230            �           2606    16465     failed_events failed_events_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY auth.failed_events
    ADD CONSTRAINT failed_events_pkey PRIMARY KEY (view_name, failed_sequence, instance_id);
 H   ALTER TABLE ONLY auth.failed_events DROP CONSTRAINT failed_events_pkey;
       auth            zitadel    false    231    231    231                       2606    16622    idp_configs2 idp_configs2_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY auth.idp_configs2
    ADD CONSTRAINT idp_configs2_pkey PRIMARY KEY (instance_id, idp_config_id);
 F   ALTER TABLE ONLY auth.idp_configs2 DROP CONSTRAINT idp_configs2_pkey;
       auth            zitadel    false    250    250            �           2606    16524    idp_configs idp_configs_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY auth.idp_configs
    ADD CONSTRAINT idp_configs_pkey PRIMARY KEY (idp_config_id, instance_id);
 D   ALTER TABLE ONLY auth.idp_configs DROP CONSTRAINT idp_configs_pkey;
       auth            zitadel    false    239    239                       2606    16613 "   idp_providers2 idp_providers2_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY auth.idp_providers2
    ADD CONSTRAINT idp_providers2_pkey PRIMARY KEY (instance_id, aggregate_id, idp_config_id);
 J   ALTER TABLE ONLY auth.idp_providers2 DROP CONSTRAINT idp_providers2_pkey;
       auth            zitadel    false    249    249    249            �           2606    16517     idp_providers idp_providers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY auth.idp_providers
    ADD CONSTRAINT idp_providers_pkey PRIMARY KEY (aggregate_id, idp_config_id, instance_id);
 H   ALTER TABLE ONLY auth.idp_providers DROP CONSTRAINT idp_providers_pkey;
       auth            zitadel    false    238    238    238            �           2606    16451    locks locks_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY auth.locks
    ADD CONSTRAINT locks_pkey PRIMARY KEY (view_name, instance_id);
 8   ALTER TABLE ONLY auth.locks DROP CONSTRAINT locks_pkey;
       auth            zitadel    false    229    229                       2606    16604 .   org_project_mapping2 org_project_mapping2_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY auth.org_project_mapping2
    ADD CONSTRAINT org_project_mapping2_pkey PRIMARY KEY (instance_id, org_id, project_id);
 V   ALTER TABLE ONLY auth.org_project_mapping2 DROP CONSTRAINT org_project_mapping2_pkey;
       auth            zitadel    false    248    248    248            �           2606    16510 ,   org_project_mapping org_project_mapping_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY auth.org_project_mapping
    ADD CONSTRAINT org_project_mapping_pkey PRIMARY KEY (org_id, project_id, instance_id);
 T   ALTER TABLE ONLY auth.org_project_mapping DROP CONSTRAINT org_project_mapping_pkey;
       auth            zitadel    false    237    237    237            �           2606    16502 "   refresh_tokens refresh_tokens_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id, instance_id);
 J   ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_pkey;
       auth            zitadel    false    236    236            �           2606    16494    tokens tokens_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY auth.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id, instance_id);
 :   ALTER TABLE ONLY auth.tokens DROP CONSTRAINT tokens_pkey;
       auth            zitadel    false    235    235                       2606    16595 ,   user_external_idps2 user_external_idps2_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY auth.user_external_idps2
    ADD CONSTRAINT user_external_idps2_pkey PRIMARY KEY (instance_id, external_user_id, idp_config_id);
 T   ALTER TABLE ONLY auth.user_external_idps2 DROP CONSTRAINT user_external_idps2_pkey;
       auth            zitadel    false    247    247    247            �           2606    16486 *   user_external_idps user_external_idps_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY auth.user_external_idps
    ADD CONSTRAINT user_external_idps_pkey PRIMARY KEY (external_user_id, idp_config_id, instance_id);
 R   ALTER TABLE ONLY auth.user_external_idps DROP CONSTRAINT user_external_idps_pkey;
       auth            zitadel    false    234    234    234            �           2606    16479     user_sessions user_sessions_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY auth.user_sessions
    ADD CONSTRAINT user_sessions_pkey PRIMARY KEY (user_agent_id, user_id, instance_id);
 H   ALTER TABLE ONLY auth.user_sessions DROP CONSTRAINT user_sessions_pkey;
       auth            zitadel    false    233    233    233                       2606    16586    users2 users2_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY auth.users2
    ADD CONSTRAINT users2_pkey PRIMARY KEY (instance_id, id);
 :   ALTER TABLE ONLY auth.users2 DROP CONSTRAINT users2_pkey;
       auth            zitadel    false    246    246            �           2606    16472    users users_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id, instance_id);
 8   ALTER TABLE ONLY auth.users DROP CONSTRAINT users_pkey;
       auth            zitadel    false    232    232            �           2606    16402    events2 events2_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY eventstore.events2
    ADD CONSTRAINT events2_pkey PRIMARY KEY (instance_id, aggregate_type, aggregate_id, sequence);
 B   ALTER TABLE ONLY eventstore.events2 DROP CONSTRAINT events2_pkey;
    
   eventstore            zitadel    false    222    222    222    222            �           2606    16413 *   unique_constraints unique_constraints_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY eventstore.unique_constraints
    ADD CONSTRAINT unique_constraints_pkey PRIMARY KEY (instance_id, unique_type, unique_field);
 X   ALTER TABLE ONLY eventstore.unique_constraints DROP CONSTRAINT unique_constraints_pkey;
    
   eventstore            zitadel    false    224    224    224            /           2606    16692    actions3 actions3_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY projections.actions3
    ADD CONSTRAINT actions3_pkey PRIMARY KEY (instance_id, id);
 E   ALTER TABLE ONLY projections.actions3 DROP CONSTRAINT actions3_pkey;
       projections            zitadel    false    257    257            }           2606    17019 (   apps6_api_configs apps6_api_configs_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY projections.apps6_api_configs
    ADD CONSTRAINT apps6_api_configs_pkey PRIMARY KEY (instance_id, app_id);
 W   ALTER TABLE ONLY projections.apps6_api_configs DROP CONSTRAINT apps6_api_configs_pkey;
       projections            zitadel    false    287    287            �           2606    17037 *   apps6_oidc_configs apps6_oidc_configs_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY projections.apps6_oidc_configs
    ADD CONSTRAINT apps6_oidc_configs_pkey PRIMARY KEY (instance_id, app_id);
 Y   ALTER TABLE ONLY projections.apps6_oidc_configs DROP CONSTRAINT apps6_oidc_configs_pkey;
       projections            zitadel    false    288    288            y           2606    17011    apps6 apps6_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY projections.apps6
    ADD CONSTRAINT apps6_pkey PRIMARY KEY (instance_id, id);
 ?   ALTER TABLE ONLY projections.apps6 DROP CONSTRAINT apps6_pkey;
       projections            zitadel    false    286    286            �           2606    17050 *   apps6_saml_configs apps6_saml_configs_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY projections.apps6_saml_configs
    ADD CONSTRAINT apps6_saml_configs_pkey PRIMARY KEY (instance_id, app_id);
 Y   ALTER TABLE ONLY projections.apps6_saml_configs DROP CONSTRAINT apps6_saml_configs_pkey;
       projections            zitadel    false    289    289            �           2606    17420     auth_requests auth_requests_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY projections.auth_requests
    ADD CONSTRAINT auth_requests_pkey PRIMARY KEY (instance_id, id);
 O   ALTER TABLE ONLY projections.auth_requests DROP CONSTRAINT auth_requests_pkey;
       projections            zitadel    false    328    328            �           2606    17235    authn_keys2 authn_keys2_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY projections.authn_keys2
    ADD CONSTRAINT authn_keys2_pkey PRIMARY KEY (instance_id, id);
 K   ALTER TABLE ONLY projections.authn_keys2 DROP CONSTRAINT authn_keys2_pkey;
       projections            zitadel    false    308    308                       2606    16546 (   current_sequences current_sequences_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.current_sequences
    ADD CONSTRAINT current_sequences_pkey PRIMARY KEY (projection_name, aggregate_type, instance_id);
 W   ALTER TABLE ONLY projections.current_sequences DROP CONSTRAINT current_sequences_pkey;
       projections            zitadel    false    242    242    242            %           2606    16658 "   current_states current_states_pkey 
   CONSTRAINT        ALTER TABLE ONLY projections.current_states
    ADD CONSTRAINT current_states_pkey PRIMARY KEY (projection_name, instance_id);
 Q   ALTER TABLE ONLY projections.current_states DROP CONSTRAINT current_states_pkey;
       projections            zitadel    false    254    254            �           2606    17103     custom_texts2 custom_texts2_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.custom_texts2
    ADD CONSTRAINT custom_texts2_pkey PRIMARY KEY (instance_id, aggregate_id, template, key, language);
 O   ALTER TABLE ONLY projections.custom_texts2 DROP CONSTRAINT custom_texts2_pkey;
       projections            zitadel    false    294    294    294    294    294            �           2606    17404 .   device_auth_requests device_auth_requests_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.device_auth_requests
    ADD CONSTRAINT device_auth_requests_pkey PRIMARY KEY (instance_id, device_code);
 ]   ALTER TABLE ONLY projections.device_auth_requests DROP CONSTRAINT device_auth_requests_pkey;
       projections            zitadel    false    326    326            D           2606    16758 &   domain_policies2 domain_policies2_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY projections.domain_policies2
    ADD CONSTRAINT domain_policies2_pkey PRIMARY KEY (instance_id, id);
 U   ALTER TABLE ONLY projections.domain_policies2 DROP CONSTRAINT domain_policies2_pkey;
       projections            zitadel    false    264    264            !           2606    16650 "   failed_events2 failed_events2_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.failed_events2
    ADD CONSTRAINT failed_events2_pkey PRIMARY KEY (projection_name, instance_id, aggregate_type, aggregate_id, failed_sequence);
 Q   ALTER TABLE ONLY projections.failed_events2 DROP CONSTRAINT failed_events2_pkey;
       projections            zitadel    false    253    253    253    253    253            	           2606    16553     failed_events failed_events_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.failed_events
    ADD CONSTRAINT failed_events_pkey PRIMARY KEY (projection_name, failed_sequence, instance_id);
 O   ALTER TABLE ONLY projections.failed_events DROP CONSTRAINT failed_events_pkey;
       projections            zitadel    false    243    243    243            2           2606    16701 "   flow_triggers3 flow_triggers3_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.flow_triggers3
    ADD CONSTRAINT flow_triggers3_pkey PRIMARY KEY (instance_id, flow_type, trigger_type, resource_owner, action_id);
 Q   ALTER TABLE ONLY projections.flow_triggers3 DROP CONSTRAINT flow_triggers3_pkey;
       projections            zitadel    false    258    258    258    258    258            �           2606    17074 4   idp_login_policy_links5 idp_login_policy_links5_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.idp_login_policy_links5
    ADD CONSTRAINT idp_login_policy_links5_pkey PRIMARY KEY (instance_id, aggregate_id, idp_id);
 c   ALTER TABLE ONLY projections.idp_login_policy_links5 DROP CONSTRAINT idp_login_policy_links5_pkey;
       projections            zitadel    false    291    291    291            u           2606    16987 .   idp_templates5_apple idp_templates5_apple_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_apple
    ADD CONSTRAINT idp_templates5_apple_pkey PRIMARY KEY (instance_id, idp_id);
 ]   ALTER TABLE ONLY projections.idp_templates5_apple DROP CONSTRAINT idp_templates5_apple_pkey;
       projections            zitadel    false    284    284            g           2606    16903 .   idp_templates5_azure idp_templates5_azure_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_azure
    ADD CONSTRAINT idp_templates5_azure_pkey PRIMARY KEY (instance_id, idp_id);
 ]   ALTER TABLE ONLY projections.idp_templates5_azure DROP CONSTRAINT idp_templates5_azure_pkey;
       projections            zitadel    false    277    277            k           2606    16927 F   idp_templates5_github_enterprise idp_templates5_github_enterprise_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_github_enterprise
    ADD CONSTRAINT idp_templates5_github_enterprise_pkey PRIMARY KEY (instance_id, idp_id);
 u   ALTER TABLE ONLY projections.idp_templates5_github_enterprise DROP CONSTRAINT idp_templates5_github_enterprise_pkey;
       projections            zitadel    false    279    279            i           2606    16915 0   idp_templates5_github idp_templates5_github_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_github
    ADD CONSTRAINT idp_templates5_github_pkey PRIMARY KEY (instance_id, idp_id);
 _   ALTER TABLE ONLY projections.idp_templates5_github DROP CONSTRAINT idp_templates5_github_pkey;
       projections            zitadel    false    278    278            m           2606    16939 0   idp_templates5_gitlab idp_templates5_gitlab_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_gitlab
    ADD CONSTRAINT idp_templates5_gitlab_pkey PRIMARY KEY (instance_id, idp_id);
 _   ALTER TABLE ONLY projections.idp_templates5_gitlab DROP CONSTRAINT idp_templates5_gitlab_pkey;
       projections            zitadel    false    280    280            o           2606    16951 H   idp_templates5_gitlab_self_hosted idp_templates5_gitlab_self_hosted_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_gitlab_self_hosted
    ADD CONSTRAINT idp_templates5_gitlab_self_hosted_pkey PRIMARY KEY (instance_id, idp_id);
 w   ALTER TABLE ONLY projections.idp_templates5_gitlab_self_hosted DROP CONSTRAINT idp_templates5_gitlab_self_hosted_pkey;
       projections            zitadel    false    281    281            q           2606    16963 0   idp_templates5_google idp_templates5_google_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_google
    ADD CONSTRAINT idp_templates5_google_pkey PRIMARY KEY (instance_id, idp_id);
 _   ALTER TABLE ONLY projections.idp_templates5_google DROP CONSTRAINT idp_templates5_google_pkey;
       projections            zitadel    false    282    282            e           2606    16890 *   idp_templates5_jwt idp_templates5_jwt_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY projections.idp_templates5_jwt
    ADD CONSTRAINT idp_templates5_jwt_pkey PRIMARY KEY (instance_id, idp_id);
 Y   ALTER TABLE ONLY projections.idp_templates5_jwt DROP CONSTRAINT idp_templates5_jwt_pkey;
       projections            zitadel    false    276    276            s           2606    16975 .   idp_templates5_ldap2 idp_templates5_ldap2_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_ldap2
    ADD CONSTRAINT idp_templates5_ldap2_pkey PRIMARY KEY (instance_id, idp_id);
 ]   ALTER TABLE ONLY projections.idp_templates5_ldap2 DROP CONSTRAINT idp_templates5_ldap2_pkey;
       projections            zitadel    false    283    283            a           2606    16865 0   idp_templates5_oauth2 idp_templates5_oauth2_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_oauth2
    ADD CONSTRAINT idp_templates5_oauth2_pkey PRIMARY KEY (instance_id, idp_id);
 _   ALTER TABLE ONLY projections.idp_templates5_oauth2 DROP CONSTRAINT idp_templates5_oauth2_pkey;
       projections            zitadel    false    274    274            c           2606    16878 ,   idp_templates5_oidc idp_templates5_oidc_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_oidc
    ADD CONSTRAINT idp_templates5_oidc_pkey PRIMARY KEY (instance_id, idp_id);
 [   ALTER TABLE ONLY projections.idp_templates5_oidc DROP CONSTRAINT idp_templates5_oidc_pkey;
       projections            zitadel    false    275    275            ^           2606    16856 "   idp_templates5 idp_templates5_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY projections.idp_templates5
    ADD CONSTRAINT idp_templates5_pkey PRIMARY KEY (instance_id, id);
 Q   ALTER TABLE ONLY projections.idp_templates5 DROP CONSTRAINT idp_templates5_pkey;
       projections            zitadel    false    273    273            w           2606    16999 ,   idp_templates5_saml idp_templates5_saml_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_saml
    ADD CONSTRAINT idp_templates5_saml_pkey PRIMARY KEY (instance_id, idp_id);
 [   ALTER TABLE ONLY projections.idp_templates5_saml DROP CONSTRAINT idp_templates5_saml_pkey;
       projections            zitadel    false    285    285            �           2606    17064 $   idp_user_links3 idp_user_links3_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.idp_user_links3
    ADD CONSTRAINT idp_user_links3_pkey PRIMARY KEY (instance_id, idp_id, external_user_id);
 S   ALTER TABLE ONLY projections.idp_user_links3 DROP CONSTRAINT idp_user_links3_pkey;
       projections            zitadel    false    290    290    290            [           2606    16839 &   idps3_jwt_config idps3_jwt_config_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY projections.idps3_jwt_config
    ADD CONSTRAINT idps3_jwt_config_pkey PRIMARY KEY (instance_id, idp_id);
 U   ALTER TABLE ONLY projections.idps3_jwt_config DROP CONSTRAINT idps3_jwt_config_pkey;
       projections            zitadel    false    272    272            Y           2606    16827 (   idps3_oidc_config idps3_oidc_config_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY projections.idps3_oidc_config
    ADD CONSTRAINT idps3_oidc_config_pkey PRIMARY KEY (instance_id, idp_id);
 W   ALTER TABLE ONLY projections.idps3_oidc_config DROP CONSTRAINT idps3_oidc_config_pkey;
       projections            zitadel    false    271    271            V           2606    16818    idps3 idps3_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY projections.idps3
    ADD CONSTRAINT idps3_pkey PRIMARY KEY (instance_id, id);
 ?   ALTER TABLE ONLY projections.idps3 DROP CONSTRAINT idps3_pkey;
       projections            zitadel    false    270    270            �           2606    17198 &   instance_domains instance_domains_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY projections.instance_domains
    ADD CONSTRAINT instance_domains_pkey PRIMARY KEY (instance_id, domain);
 U   ALTER TABLE ONLY projections.instance_domains DROP CONSTRAINT instance_domains_pkey;
       projections            zitadel    false    304    304                       2606    17476 *   instance_features2 instance_features2_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY projections.instance_features2
    ADD CONSTRAINT instance_features2_pkey PRIMARY KEY (instance_id, key);
 Y   ALTER TABLE ONLY projections.instance_features2 DROP CONSTRAINT instance_features2_pkey;
       projections            zitadel    false    336    336            �           2606    17206 (   instance_members4 instance_members4_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.instance_members4
    ADD CONSTRAINT instance_members4_pkey PRIMARY KEY (instance_id, id, user_id);
 W   ALTER TABLE ONLY projections.instance_members4 DROP CONSTRAINT instance_members4_pkey;
       projections            zitadel    false    305    305    305            �           2606    17288    instances instances_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY projections.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY projections.instances DROP CONSTRAINT instances_pkey;
       projections            zitadel    false    313            �           2606    17375 (   keys4_certificate keys4_certificate_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY projections.keys4_certificate
    ADD CONSTRAINT keys4_certificate_pkey PRIMARY KEY (instance_id, id);
 W   ALTER TABLE ONLY projections.keys4_certificate DROP CONSTRAINT keys4_certificate_pkey;
       projections            zitadel    false    323    323            �           2606    17344    keys4 keys4_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY projections.keys4
    ADD CONSTRAINT keys4_pkey PRIMARY KEY (instance_id, id);
 ?   ALTER TABLE ONLY projections.keys4 DROP CONSTRAINT keys4_pkey;
       projections            zitadel    false    320    320            �           2606    17351     keys4_private keys4_private_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY projections.keys4_private
    ADD CONSTRAINT keys4_private_pkey PRIMARY KEY (instance_id, id);
 O   ALTER TABLE ONLY projections.keys4_private DROP CONSTRAINT keys4_private_pkey;
       projections            zitadel    false    321    321            �           2606    17363    keys4_public keys4_public_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY projections.keys4_public
    ADD CONSTRAINT keys4_public_pkey PRIMARY KEY (instance_id, id);
 M   ALTER TABLE ONLY projections.keys4_public DROP CONSTRAINT keys4_public_pkey;
       projections            zitadel    false    322    322            G           2606    16772 $   label_policies3 label_policies3_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY projections.label_policies3
    ADD CONSTRAINT label_policies3_pkey PRIMARY KEY (instance_id, id, state);
 S   ALTER TABLE ONLY projections.label_policies3 DROP CONSTRAINT label_policies3_pkey;
       projections            zitadel    false    265    265    265            �           2606    17455    limits limits_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY projections.limits
    ADD CONSTRAINT limits_pkey PRIMARY KEY (instance_id, resource_owner);
 A   ALTER TABLE ONLY projections.limits DROP CONSTRAINT limits_pkey;
       projections            zitadel    false    333    333            >           2606    16738 (   lockout_policies2 lockout_policies2_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY projections.lockout_policies2
    ADD CONSTRAINT lockout_policies2_pkey PRIMARY KEY (instance_id, id);
 W   ALTER TABLE ONLY projections.lockout_policies2 DROP CONSTRAINT lockout_policies2_pkey;
       projections            zitadel    false    262    262                       2606    16539    locks locks_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY projections.locks
    ADD CONSTRAINT locks_pkey PRIMARY KEY (projection_name, instance_id);
 ?   ALTER TABLE ONLY projections.locks DROP CONSTRAINT locks_pkey;
       projections            zitadel    false    241    241            �           2606    17169 .   login_names3_domains login_names3_domains_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.login_names3_domains
    ADD CONSTRAINT login_names3_domains_pkey PRIMARY KEY (instance_id, resource_owner, name);
 ]   ALTER TABLE ONLY projections.login_names3_domains DROP CONSTRAINT login_names3_domains_pkey;
       projections            zitadel    false    300    300    300            �           2606    17176 0   login_names3_policies login_names3_policies_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.login_names3_policies
    ADD CONSTRAINT login_names3_policies_pkey PRIMARY KEY (instance_id, resource_owner);
 _   ALTER TABLE ONLY projections.login_names3_policies DROP CONSTRAINT login_names3_policies_pkey;
       projections            zitadel    false    301    301            �           2606    17159 *   login_names3_users login_names3_users_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY projections.login_names3_users
    ADD CONSTRAINT login_names3_users_pkey PRIMARY KEY (instance_id, id);
 Y   ALTER TABLE ONLY projections.login_names3_users DROP CONSTRAINT login_names3_users_pkey;
       projections            zitadel    false    299    299            S           2606    16808 $   login_policies5 login_policies5_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY projections.login_policies5
    ADD CONSTRAINT login_policies5_pkey PRIMARY KEY (instance_id, aggregate_id);
 S   ALTER TABLE ONLY projections.login_policies5 DROP CONSTRAINT login_policies5_pkey;
       projections            zitadel    false    269    269            �           2606    17085 $   mail_templates2 mail_templates2_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY projections.mail_templates2
    ADD CONSTRAINT mail_templates2_pkey PRIMARY KEY (instance_id, aggregate_id);
 S   ALTER TABLE ONLY projections.mail_templates2 DROP CONSTRAINT mail_templates2_pkey;
       projections            zitadel    false    292    292            �           2606    17094 "   message_texts2 message_texts2_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.message_texts2
    ADD CONSTRAINT message_texts2_pkey PRIMARY KEY (instance_id, aggregate_id, type, language);
 Q   ALTER TABLE ONLY projections.message_texts2 DROP CONSTRAINT message_texts2_pkey;
       projections            zitadel    false    293    293    293    293            �           2606    17427    milestones milestones_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY projections.milestones
    ADD CONSTRAINT milestones_pkey PRIMARY KEY (instance_id, type);
 I   ALTER TABLE ONLY projections.milestones DROP CONSTRAINT milestones_pkey;
       projections            zitadel    false    329    329            �           2606    17397 0   notification_policies notification_policies_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.notification_policies
    ADD CONSTRAINT notification_policies_pkey PRIMARY KEY (instance_id, id);
 _   ALTER TABLE ONLY projections.notification_policies DROP CONSTRAINT notification_policies_pkey;
       projections            zitadel    false    325    325            �           2606    17335 2   notification_providers notification_providers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.notification_providers
    ADD CONSTRAINT notification_providers_pkey PRIMARY KEY (instance_id, aggregate_id, provider_type);
 a   ALTER TABLE ONLY projections.notification_providers DROP CONSTRAINT notification_providers_pkey;
       projections            zitadel    false    319    319    319            �           2606    17328 "   oidc_settings2 oidc_settings2_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY projections.oidc_settings2
    ADD CONSTRAINT oidc_settings2_pkey PRIMARY KEY (instance_id, aggregate_id);
 Q   ALTER TABLE ONLY projections.oidc_settings2 DROP CONSTRAINT oidc_settings2_pkey;
       projections            zitadel    false    318    318            P           2606    16797    org_domains2 org_domains2_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY projections.org_domains2
    ADD CONSTRAINT org_domains2_pkey PRIMARY KEY (org_id, domain, instance_id);
 M   ALTER TABLE ONLY projections.org_domains2 DROP CONSTRAINT org_domains2_pkey;
       projections            zitadel    false    268    268    268            �           2606    17189    org_members4 org_members4_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY projections.org_members4
    ADD CONSTRAINT org_members4_pkey PRIMARY KEY (instance_id, org_id, user_id);
 M   ALTER TABLE ONLY projections.org_members4 DROP CONSTRAINT org_members4_pkey;
       projections            zitadel    false    303    303    303            ,           2606    16680     org_metadata2 org_metadata2_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY projections.org_metadata2
    ADD CONSTRAINT org_metadata2_pkey PRIMARY KEY (instance_id, org_id, key);
 O   ALTER TABLE ONLY projections.org_metadata2 DROP CONSTRAINT org_metadata2_pkey;
       projections            zitadel    false    256    256    256            )           2606    16670    orgs1 orgs1_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY projections.orgs1
    ADD CONSTRAINT orgs1_pkey PRIMARY KEY (instance_id, id);
 ?   ALTER TABLE ONLY projections.orgs1 DROP CONSTRAINT orgs1_pkey;
       projections            zitadel    false    255    255            ;           2606    16728 2   password_age_policies2 password_age_policies2_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.password_age_policies2
    ADD CONSTRAINT password_age_policies2_pkey PRIMARY KEY (instance_id, id);
 a   ALTER TABLE ONLY projections.password_age_policies2 DROP CONSTRAINT password_age_policies2_pkey;
       projections            zitadel    false    261    261            8           2606    16718 @   password_complexity_policies2 password_complexity_policies2_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.password_complexity_policies2
    ADD CONSTRAINT password_complexity_policies2_pkey PRIMARY KEY (instance_id, id);
 o   ALTER TABLE ONLY projections.password_complexity_policies2 DROP CONSTRAINT password_complexity_policies2_pkey;
       projections            zitadel    false    260    260            �           2606    17245 4   personal_access_tokens3 personal_access_tokens3_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.personal_access_tokens3
    ADD CONSTRAINT personal_access_tokens3_pkey PRIMARY KEY (instance_id, id);
 c   ALTER TABLE ONLY projections.personal_access_tokens3 DROP CONSTRAINT personal_access_tokens3_pkey;
       projections            zitadel    false    309    309            A           2606    16748 (   privacy_policies3 privacy_policies3_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY projections.privacy_policies3
    ADD CONSTRAINT privacy_policies3_pkey PRIMARY KEY (instance_id, id);
 W   ALTER TABLE ONLY projections.privacy_policies3 DROP CONSTRAINT privacy_policies3_pkey;
       projections            zitadel    false    263    263            �           2606    17224 2   project_grant_members4 project_grant_members4_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.project_grant_members4
    ADD CONSTRAINT project_grant_members4_pkey PRIMARY KEY (instance_id, project_id, grant_id, user_id);
 a   ALTER TABLE ONLY projections.project_grant_members4 DROP CONSTRAINT project_grant_members4_pkey;
       projections            zitadel    false    307    307    307    307            J           2606    16780 $   project_grants4 project_grants4_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY projections.project_grants4
    ADD CONSTRAINT project_grants4_pkey PRIMARY KEY (instance_id, grant_id);
 S   ALTER TABLE ONLY projections.project_grants4 DROP CONSTRAINT project_grants4_pkey;
       projections            zitadel    false    266    266            �           2606    17215 &   project_members4 project_members4_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.project_members4
    ADD CONSTRAINT project_members4_pkey PRIMARY KEY (instance_id, project_id, user_id);
 U   ALTER TABLE ONLY projections.project_members4 DROP CONSTRAINT project_members4_pkey;
       projections            zitadel    false    306    306    306            M           2606    16789 "   project_roles4 project_roles4_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.project_roles4
    ADD CONSTRAINT project_roles4_pkey PRIMARY KEY (instance_id, project_id, role_key);
 Q   ALTER TABLE ONLY projections.project_roles4 DROP CONSTRAINT project_roles4_pkey;
       projections            zitadel    false    267    267    267            4           2606    16708    projects4 projects4_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY projections.projects4
    ADD CONSTRAINT projects4_pkey PRIMARY KEY (instance_id, id);
 G   ALTER TABLE ONLY projections.projects4 DROP CONSTRAINT projects4_pkey;
       projections            zitadel    false    259    259            �           2606    17448 .   quotas_notifications quotas_notifications_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.quotas_notifications
    ADD CONSTRAINT quotas_notifications_pkey PRIMARY KEY (instance_id, unit, id);
 ]   ALTER TABLE ONLY projections.quotas_notifications DROP CONSTRAINT quotas_notifications_pkey;
       projections            zitadel    false    332    332    332            �           2606    17441 "   quotas_periods quotas_periods_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY projections.quotas_periods
    ADD CONSTRAINT quotas_periods_pkey PRIMARY KEY (instance_id, unit, start);
 Q   ALTER TABLE ONLY projections.quotas_periods DROP CONSTRAINT quotas_periods_pkey;
       projections            zitadel    false    331    331    331            �           2606    17434    quotas quotas_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY projections.quotas
    ADD CONSTRAINT quotas_pkey PRIMARY KEY (instance_id, unit);
 A   ALTER TABLE ONLY projections.quotas DROP CONSTRAINT quotas_pkey;
       projections            zitadel    false    330    330            �           2606    17462     restrictions2 restrictions2_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY projections.restrictions2
    ADD CONSTRAINT restrictions2_pkey PRIMARY KEY (instance_id, resource_owner);
 O   ALTER TABLE ONLY projections.restrictions2 DROP CONSTRAINT restrictions2_pkey;
       projections            zitadel    false    334    334            �           2606    17295 *   secret_generators2 secret_generators2_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.secret_generators2
    ADD CONSTRAINT secret_generators2_pkey PRIMARY KEY (instance_id, generator_type, aggregate_id);
 Y   ALTER TABLE ONLY projections.secret_generators2 DROP CONSTRAINT secret_generators2_pkey;
       projections            zitadel    false    314    314    314            �           2606    17389 *   security_policies2 security_policies2_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY projections.security_policies2
    ADD CONSTRAINT security_policies2_pkey PRIMARY KEY (instance_id);
 Y   ALTER TABLE ONLY projections.security_policies2 DROP CONSTRAINT security_policies2_pkey;
       projections            zitadel    false    324            �           2606    17412    sessions8 sessions8_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY projections.sessions8
    ADD CONSTRAINT sessions8_pkey PRIMARY KEY (instance_id, id);
 G   ALTER TABLE ONLY projections.sessions8 DROP CONSTRAINT sessions8_pkey;
       projections            zitadel    false    327    327            �           2606    17309    sms_configs2 sms_configs2_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY projections.sms_configs2
    ADD CONSTRAINT sms_configs2_pkey PRIMARY KEY (instance_id, id);
 M   ALTER TABLE ONLY projections.sms_configs2 DROP CONSTRAINT sms_configs2_pkey;
       projections            zitadel    false    316    316            �           2606    17316 ,   sms_configs2_twilio sms_configs2_twilio_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.sms_configs2_twilio
    ADD CONSTRAINT sms_configs2_twilio_pkey PRIMARY KEY (instance_id, sms_id);
 [   ALTER TABLE ONLY projections.sms_configs2_twilio DROP CONSTRAINT sms_configs2_twilio_pkey;
       projections            zitadel    false    317    317            �           2606    17302     smtp_configs1 smtp_configs1_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY projections.smtp_configs1
    ADD CONSTRAINT smtp_configs1_pkey PRIMARY KEY (instance_id, aggregate_id);
 O   ALTER TABLE ONLY projections.smtp_configs1 DROP CONSTRAINT smtp_configs1_pkey;
       projections            zitadel    false    315    315                       2606    17469 $   system_features system_features_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY projections.system_features
    ADD CONSTRAINT system_features_pkey PRIMARY KEY (key);
 S   ALTER TABLE ONLY projections.system_features DROP CONSTRAINT system_features_pkey;
       projections            zitadel    false    335            �           2606    17273 *   user_auth_methods4 user_auth_methods4_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.user_auth_methods4
    ADD CONSTRAINT user_auth_methods4_pkey PRIMARY KEY (instance_id, user_id, method_type, token_id);
 Y   ALTER TABLE ONLY projections.user_auth_methods4 DROP CONSTRAINT user_auth_methods4_pkey;
       projections            zitadel    false    312    312    312    312            �           2606    17255    user_grants4 user_grants4_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY projections.user_grants4
    ADD CONSTRAINT user_grants4_pkey PRIMARY KEY (instance_id, id);
 M   ALTER TABLE ONLY projections.user_grants4 DROP CONSTRAINT user_grants4_pkey;
       projections            zitadel    false    310    310            �           2606    17264 "   user_metadata5 user_metadata5_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY projections.user_metadata5
    ADD CONSTRAINT user_metadata5_pkey PRIMARY KEY (instance_id, user_id, key);
 Q   ALTER TABLE ONLY projections.user_metadata5 DROP CONSTRAINT user_metadata5_pkey;
       projections            zitadel    false    311    311    311            �           2606    17121 "   users10_humans users10_humans_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY projections.users10_humans
    ADD CONSTRAINT users10_humans_pkey PRIMARY KEY (instance_id, user_id);
 Q   ALTER TABLE ONLY projections.users10_humans DROP CONSTRAINT users10_humans_pkey;
       projections            zitadel    false    296    296            �           2606    17134 &   users10_machines users10_machines_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY projections.users10_machines
    ADD CONSTRAINT users10_machines_pkey PRIMARY KEY (instance_id, user_id);
 U   ALTER TABLE ONLY projections.users10_machines DROP CONSTRAINT users10_machines_pkey;
       projections            zitadel    false    297    297            �           2606    17147 0   users10_notifications users10_notifications_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY projections.users10_notifications
    ADD CONSTRAINT users10_notifications_pkey PRIMARY KEY (instance_id, user_id);
 _   ALTER TABLE ONLY projections.users10_notifications DROP CONSTRAINT users10_notifications_pkey;
       projections            zitadel    false    298    298            �           2606    17111    users10 users10_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY projections.users10
    ADD CONSTRAINT users10_pkey PRIMARY KEY (instance_id, id);
 C   ALTER TABLE ONLY projections.users10 DROP CONSTRAINT users10_pkey;
       projections            zitadel    false    295    295                       2606    16561    assets assets_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY system.assets
    ADD CONSTRAINT assets_pkey PRIMARY KEY (instance_id, resource_owner, name);
 <   ALTER TABLE ONLY system.assets DROP CONSTRAINT assets_pkey;
       system            zitadel    false    244    244    244            �           2606    16393 $   encryption_keys encryption_keys_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY system.encryption_keys
    ADD CONSTRAINT encryption_keys_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY system.encryption_keys DROP CONSTRAINT encryption_keys_pkey;
       system            zitadel    false    221            �           1259    16563 !   current_sequences_instance_id_idx    INDEX     h   CREATE INDEX current_sequences_instance_id_idx ON adminapi.current_sequences USING btree (instance_id);
 7   DROP INDEX adminapi.current_sequences_instance_id_idx;
       adminapi            zitadel    false    226            �           1259    16566    failed_events_instance_id_idx    INDEX     `   CREATE INDEX failed_events_instance_id_idx ON adminapi.failed_events USING btree (instance_id);
 3   DROP INDEX adminapi.failed_events_instance_id_idx;
       adminapi            zitadel    false    227                       1259    16578    st2_owner_removed_idx    INDEX     U   CREATE INDEX st2_owner_removed_idx ON adminapi.styling2 USING btree (owner_removed);
 +   DROP INDEX adminapi.st2_owner_removed_idx;
       adminapi            zitadel    false    245            �           1259    16532    auth_code_idx    INDEX     E   CREATE INDEX auth_code_idx ON auth.auth_requests USING btree (code);
    DROP INDEX auth.auth_code_idx;
       auth            zitadel    false    240            �           1259    16564 !   current_sequences_instance_id_idx    INDEX     d   CREATE INDEX current_sequences_instance_id_idx ON auth.current_sequences USING btree (instance_id);
 3   DROP INDEX auth.current_sequences_instance_id_idx;
       auth            zitadel    false    230                       1259    16596    ext_idps2_owner_removed_idx    INDEX     b   CREATE INDEX ext_idps2_owner_removed_idx ON auth.user_external_idps2 USING btree (owner_removed);
 -   DROP INDEX auth.ext_idps2_owner_removed_idx;
       auth            zitadel    false    247            �           1259    16567    failed_events_instance_id_idx    INDEX     \   CREATE INDEX failed_events_instance_id_idx ON auth.failed_events USING btree (instance_id);
 /   DROP INDEX auth.failed_events_instance_id_idx;
       auth            zitadel    false    231                       1259    16623    idp_conf2_owner_removed_idx    INDEX     [   CREATE INDEX idp_conf2_owner_removed_idx ON auth.idp_configs2 USING btree (owner_removed);
 -   DROP INDEX auth.idp_conf2_owner_removed_idx;
       auth            zitadel    false    250                       1259    16614    idp_prov2_owner_removed_idx    INDEX     ]   CREATE INDEX idp_prov2_owner_removed_idx ON auth.idp_providers2 USING btree (owner_removed);
 -   DROP INDEX auth.idp_prov2_owner_removed_idx;
       auth            zitadel    false    249            �           1259    16638    inst_app_tkn_idx    INDEX     X   CREATE INDEX inst_app_tkn_idx ON auth.tokens USING btree (instance_id, application_id);
 "   DROP INDEX auth.inst_app_tkn_idx;
       auth            zitadel    false    235    235            �           1259    16637    inst_refresh_tkn_idx    INDEX     ^   CREATE INDEX inst_refresh_tkn_idx ON auth.tokens USING btree (instance_id, refresh_token_id);
 &   DROP INDEX auth.inst_refresh_tkn_idx;
       auth            zitadel    false    235    235            �           1259    16639    inst_ro_tkn_idx    INDEX     W   CREATE INDEX inst_ro_tkn_idx ON auth.tokens USING btree (instance_id, resource_owner);
 !   DROP INDEX auth.inst_ro_tkn_idx;
       auth            zitadel    false    235    235            �           1259    16640    inst_usr_agnt_tkn_idx    INDEX     e   CREATE INDEX inst_usr_agnt_tkn_idx ON auth.tokens USING btree (instance_id, user_id, user_agent_id);
 '   DROP INDEX auth.inst_usr_agnt_tkn_idx;
       auth            zitadel    false    235    235    235                       1259    16605    org_proj_m2_owner_removed_idx    INDEX     e   CREATE INDEX org_proj_m2_owner_removed_idx ON auth.org_project_mapping2 USING btree (owner_removed);
 /   DROP INDEX auth.org_proj_m2_owner_removed_idx;
       auth            zitadel    false    248                       1259    16587    u2_owner_removed_idx    INDEX     N   CREATE INDEX u2_owner_removed_idx ON auth.users2 USING btree (owner_removed);
 &   DROP INDEX auth.u2_owner_removed_idx;
       auth            zitadel    false    246            �           1259    16503    unique_client_user_index    INDEX     u   CREATE UNIQUE INDEX unique_client_user_index ON auth.refresh_tokens USING btree (client_id, user_agent_id, user_id);
 *   DROP INDEX auth.unique_client_user_index;
       auth            zitadel    false    236    236    236            �           1259    16661    user_sessions_by_user    INDEX     ]   CREATE INDEX user_sessions_by_user ON auth.user_sessions USING btree (instance_id, user_id);
 '   DROP INDEX auth.user_sessions_by_user;
       auth            zitadel    false    233    233            �           1259    16662    active_instances_events    INDEX     �   CREATE INDEX active_instances_events ON eventstore.events2 USING btree (aggregate_type, event_type) WHERE ((aggregate_type = 'instance'::text) AND (event_type = ANY (ARRAY['instance.added'::text, 'instance.removed'::text])));
 /   DROP INDEX eventstore.active_instances_events;
    
   eventstore            zitadel    false    222    222    222    222            �           1259    16403    es_active_instances    INDEX     c   CREATE INDEX es_active_instances ON eventstore.events2 USING btree (created_at DESC, instance_id);
 +   DROP INDEX eventstore.es_active_instances;
    
   eventstore            zitadel    false    222    222            �           1259    16405    es_projection    INDEX     t   CREATE INDEX es_projection ON eventstore.events2 USING btree (instance_id, aggregate_type, event_type, "position");
 %   DROP INDEX eventstore.es_projection;
    
   eventstore            zitadel    false    222    222    222    222            �           1259    16404    es_wm    INDEX     n   CREATE INDEX es_wm ON eventstore.events2 USING btree (aggregate_id, instance_id, aggregate_type, event_type);
    DROP INDEX eventstore.es_wm;
    
   eventstore            zitadel    false    222    222    222    222            �           1259    16660    events2_current_sequence    INDEX     �   CREATE INDEX events2_current_sequence ON eventstore.events2 USING btree (sequence DESC, aggregate_id, aggregate_type, instance_id);
 0   DROP INDEX eventstore.events2_current_sequence;
    
   eventstore            zitadel    false    222    222    222    222                       1259    16636    log_date_desc    INDEX     j   CREATE INDEX log_date_desc ON logstore.execution USING btree (instance_id, log_date DESC) INCLUDE (took);
 #   DROP INDEX logstore.log_date_desc;
       logstore            zitadel    false    252    252    252                       1259    16630    protocol_date_desc    INDEX     �   CREATE INDEX protocol_date_desc ON logstore.access USING btree (instance_id, protocol, log_date DESC) INCLUDE (request_url, response_status, request_headers);
 (   DROP INDEX logstore.protocol_date_desc;
       logstore            zitadel    false    251    251    251    251    251    251            -           1259    16694    actions3_owner_removed_idx    INDEX     ]   CREATE INDEX actions3_owner_removed_idx ON projections.actions3 USING btree (owner_removed);
 3   DROP INDEX projections.actions3_owner_removed_idx;
       projections            zitadel    false    257            0           1259    16693    actions3_resource_owner_idx    INDEX     _   CREATE INDEX actions3_resource_owner_idx ON projections.actions3 USING btree (resource_owner);
 4   DROP INDEX projections.actions3_resource_owner_idx;
       projections            zitadel    false    257            {           1259    17025    apps6_api_configs_client_id_idx    INDEX     g   CREATE INDEX apps6_api_configs_client_id_idx ON projections.apps6_api_configs USING btree (client_id);
 8   DROP INDEX projections.apps6_api_configs_client_id_idx;
       projections            zitadel    false    287            ~           1259    17043     apps6_oidc_configs_client_id_idx    INDEX     i   CREATE INDEX apps6_oidc_configs_client_id_idx ON projections.apps6_oidc_configs USING btree (client_id);
 9   DROP INDEX projections.apps6_oidc_configs_client_id_idx;
       projections            zitadel    false    288            z           1259    17012    apps6_project_id_idx    INDEX     Q   CREATE INDEX apps6_project_id_idx ON projections.apps6 USING btree (project_id);
 -   DROP INDEX projections.apps6_project_id_idx;
       projections            zitadel    false    286            �           1259    17056     apps6_saml_configs_entity_id_idx    INDEX     i   CREATE INDEX apps6_saml_configs_entity_id_idx ON projections.apps6_saml_configs USING btree (entity_id);
 9   DROP INDEX projections.apps6_saml_configs_entity_id_idx;
       projections            zitadel    false    289            �           1259    17236    authn_keys2_enabled_idx    INDEX     W   CREATE INDEX authn_keys2_enabled_idx ON projections.authn_keys2 USING btree (enabled);
 0   DROP INDEX projections.authn_keys2_enabled_idx;
       projections            zitadel    false    308            �           1259    17237    authn_keys2_identifier_idx    INDEX     ]   CREATE INDEX authn_keys2_identifier_idx ON projections.authn_keys2 USING btree (identifier);
 3   DROP INDEX projections.authn_keys2_identifier_idx;
       projections            zitadel    false    308            #           1259    16659    cs_instance_id_idx    INDEX     Y   CREATE INDEX cs_instance_id_idx ON projections.current_states USING btree (instance_id);
 +   DROP INDEX projections.cs_instance_id_idx;
       projections            zitadel    false    254                       1259    16565 !   current_sequences_instance_id_idx    INDEX     k   CREATE INDEX current_sequences_instance_id_idx ON projections.current_sequences USING btree (instance_id);
 :   DROP INDEX projections.current_sequences_instance_id_idx;
       projections            zitadel    false    242            �           1259    17104    custom_texts2_owner_removed_idx    INDEX     g   CREATE INDEX custom_texts2_owner_removed_idx ON projections.custom_texts2 USING btree (owner_removed);
 8   DROP INDEX projections.custom_texts2_owner_removed_idx;
       projections            zitadel    false    294            �           1259    17405 "   device_auth_requests_user_code_idx    INDEX     z   CREATE INDEX device_auth_requests_user_code_idx ON projections.device_auth_requests USING btree (instance_id, user_code);
 ;   DROP INDEX projections.device_auth_requests_user_code_idx;
       projections            zitadel    false    326    326            B           1259    16759 "   domain_policies2_owner_removed_idx    INDEX     m   CREATE INDEX domain_policies2_owner_removed_idx ON projections.domain_policies2 USING btree (owner_removed);
 ;   DROP INDEX projections.domain_policies2_owner_removed_idx;
       projections            zitadel    false    264                       1259    16568    failed_events_instance_id_idx    INDEX     c   CREATE INDEX failed_events_instance_id_idx ON projections.failed_events USING btree (instance_id);
 6   DROP INDEX projections.failed_events_instance_id_idx;
       projections            zitadel    false    243            "           1259    16651    fe2_instance_id_idx    INDEX     Z   CREATE INDEX fe2_instance_id_idx ON projections.failed_events2 USING btree (instance_id);
 ,   DROP INDEX projections.fe2_instance_id_idx;
       projections            zitadel    false    253            �           1259    17076 )   idp_login_policy_links5_owner_removed_idx    INDEX     {   CREATE INDEX idp_login_policy_links5_owner_removed_idx ON projections.idp_login_policy_links5 USING btree (owner_removed);
 B   DROP INDEX projections.idp_login_policy_links5_owner_removed_idx;
       projections            zitadel    false    291            �           1259    17075 *   idp_login_policy_links5_resource_owner_idx    INDEX     }   CREATE INDEX idp_login_policy_links5_resource_owner_idx ON projections.idp_login_policy_links5 USING btree (resource_owner);
 C   DROP INDEX projections.idp_login_policy_links5_resource_owner_idx;
       projections            zitadel    false    291            \           1259    16858     idp_templates5_owner_removed_idx    INDEX     i   CREATE INDEX idp_templates5_owner_removed_idx ON projections.idp_templates5 USING btree (owner_removed);
 9   DROP INDEX projections.idp_templates5_owner_removed_idx;
       projections            zitadel    false    273            _           1259    16857 !   idp_templates5_resource_owner_idx    INDEX     k   CREATE INDEX idp_templates5_resource_owner_idx ON projections.idp_templates5 USING btree (resource_owner);
 :   DROP INDEX projections.idp_templates5_resource_owner_idx;
       projections            zitadel    false    273            �           1259    17066 !   idp_user_links3_owner_removed_idx    INDEX     k   CREATE INDEX idp_user_links3_owner_removed_idx ON projections.idp_user_links3 USING btree (owner_removed);
 :   DROP INDEX projections.idp_user_links3_owner_removed_idx;
       projections            zitadel    false    290            �           1259    17065    idp_user_links3_user_id_idx    INDEX     _   CREATE INDEX idp_user_links3_user_id_idx ON projections.idp_user_links3 USING btree (user_id);
 4   DROP INDEX projections.idp_user_links3_user_id_idx;
       projections            zitadel    false    290            T           1259    16820    idps3_owner_removed_idx    INDEX     W   CREATE INDEX idps3_owner_removed_idx ON projections.idps3 USING btree (owner_removed);
 0   DROP INDEX projections.idps3_owner_removed_idx;
       projections            zitadel    false    270            W           1259    16819    idps3_resource_owner_idx    INDEX     Y   CREATE INDEX idps3_resource_owner_idx ON projections.idps3 USING btree (resource_owner);
 1   DROP INDEX projections.idps3_resource_owner_idx;
       projections            zitadel    false    270            �           1259    17199 $   instance_domains_instance_domain_idx    INDEX     �   CREATE INDEX instance_domains_instance_domain_idx ON projections.instance_domains USING btree (domain) INCLUDE (creation_date, change_date, sequence, is_generated, is_primary);
 =   DROP INDEX projections.instance_domains_instance_domain_idx;
       projections            zitadel    false    304    304    304    304    304    304            �           1259    17208 !   instance_members4_im_instance_idx    INDEX     �   CREATE INDEX instance_members4_im_instance_idx ON projections.instance_members4 USING btree (instance_id) INCLUDE (creation_date, change_date, roles, sequence, resource_owner);
 :   DROP INDEX projections.instance_members4_im_instance_idx;
       projections            zitadel    false    305    305    305    305    305    305            �           1259    17207    instance_members4_user_id_idx    INDEX     c   CREATE INDEX instance_members4_user_id_idx ON projections.instance_members4 USING btree (user_id);
 6   DROP INDEX projections.instance_members4_user_id_idx;
       projections            zitadel    false    305            E           1259    16773 !   label_policies3_owner_removed_idx    INDEX     k   CREATE INDEX label_policies3_owner_removed_idx ON projections.label_policies3 USING btree (owner_removed);
 :   DROP INDEX projections.label_policies3_owner_removed_idx;
       projections            zitadel    false    265            <           1259    16739 #   lockout_policies2_owner_removed_idx    INDEX     o   CREATE INDEX lockout_policies2_owner_removed_idx ON projections.lockout_policies2 USING btree (owner_removed);
 <   DROP INDEX projections.lockout_policies2_owner_removed_idx;
       projections            zitadel    false    262            �           1259    17494    login_names3_domain_search    INDEX     �   CREATE INDEX login_names3_domain_search ON projections.login_names3_domains USING btree (instance_id, resource_owner, name_lower);
 3   DROP INDEX projections.login_names3_domain_search;
       projections            zitadel    false    300    300    300            �           1259    17495 !   login_names3_domain_search_result    INDEX     �   CREATE INDEX login_names3_domain_search_result ON projections.login_names3_domains USING btree (instance_id, resource_owner) INCLUDE (is_primary);
 :   DROP INDEX projections.login_names3_domain_search_result;
       projections            zitadel    false    300    300    300            �           1259    17177 $   login_names3_policies_is_default_idx    INDEX     �   CREATE INDEX login_names3_policies_is_default_idx ON projections.login_names3_policies USING btree (resource_owner, is_default);
 =   DROP INDEX projections.login_names3_policies_is_default_idx;
       projections            zitadel    false    301    301            �           1259    17160 )   login_names3_users_instance_user_name_idx    INDEX     �   CREATE INDEX login_names3_users_instance_user_name_idx ON projections.login_names3_users USING btree (instance_id, user_name) INCLUDE (resource_owner);
 B   DROP INDEX projections.login_names3_users_instance_user_name_idx;
       projections            zitadel    false    299    299    299            �           1259    17161 )   login_names3_users_lnu_instance_ro_id_idx    INDEX     �   CREATE INDEX login_names3_users_lnu_instance_ro_id_idx ON projections.login_names3_users USING btree (instance_id, resource_owner, id) INCLUDE (user_name);
 B   DROP INDEX projections.login_names3_users_lnu_instance_ro_id_idx;
       projections            zitadel    false    299    299    299    299            �           1259    17486    login_names3_users_search    INDEX     �   CREATE INDEX login_names3_users_search ON projections.login_names3_users USING btree (instance_id, user_name_lower) INCLUDE (resource_owner);
 2   DROP INDEX projections.login_names3_users_search;
       projections            zitadel    false    299    299    299            Q           1259    16809 !   login_policies5_owner_removed_idx    INDEX     k   CREATE INDEX login_policies5_owner_removed_idx ON projections.login_policies5 USING btree (owner_removed);
 :   DROP INDEX projections.login_policies5_owner_removed_idx;
       projections            zitadel    false    269            �           1259    17086 !   mail_templates2_owner_removed_idx    INDEX     k   CREATE INDEX mail_templates2_owner_removed_idx ON projections.mail_templates2 USING btree (owner_removed);
 :   DROP INDEX projections.mail_templates2_owner_removed_idx;
       projections            zitadel    false    292            �           1259    17095     message_texts2_owner_removed_idx    INDEX     i   CREATE INDEX message_texts2_owner_removed_idx ON projections.message_texts2 USING btree (owner_removed);
 9   DROP INDEX projections.message_texts2_owner_removed_idx;
       projections            zitadel    false    293            N           1259    16798    org_domains2_owner_removed_idx    INDEX     e   CREATE INDEX org_domains2_owner_removed_idx ON projections.org_domains2 USING btree (owner_removed);
 7   DROP INDEX projections.org_domains2_owner_removed_idx;
       projections            zitadel    false    268            �           1259    17191    org_members4_om_instance_idx    INDEX     �   CREATE INDEX org_members4_om_instance_idx ON projections.org_members4 USING btree (instance_id) INCLUDE (creation_date, change_date, roles, sequence, resource_owner);
 5   DROP INDEX projections.org_members4_om_instance_idx;
       projections            zitadel    false    303    303    303    303    303    303            �           1259    17190    org_members4_user_id_idx    INDEX     Y   CREATE INDEX org_members4_user_id_idx ON projections.org_members4 USING btree (user_id);
 1   DROP INDEX projections.org_members4_user_id_idx;
       projections            zitadel    false    303            *           1259    16681    org_metadata2_owner_removed_idx    INDEX     g   CREATE INDEX org_metadata2_owner_removed_idx ON projections.org_metadata2 USING btree (owner_removed);
 8   DROP INDEX projections.org_metadata2_owner_removed_idx;
       projections            zitadel    false    256            &           1259    16671    orgs1_domain_idx    INDEX     Q   CREATE INDEX orgs1_domain_idx ON projections.orgs1 USING btree (primary_domain);
 )   DROP INDEX projections.orgs1_domain_idx;
       projections            zitadel    false    255            '           1259    16672    orgs1_name_idx    INDEX     E   CREATE INDEX orgs1_name_idx ON projections.orgs1 USING btree (name);
 '   DROP INDEX projections.orgs1_name_idx;
       projections            zitadel    false    255            9           1259    16729 (   password_age_policies2_owner_removed_idx    INDEX     y   CREATE INDEX password_age_policies2_owner_removed_idx ON projections.password_age_policies2 USING btree (owner_removed);
 A   DROP INDEX projections.password_age_policies2_owner_removed_idx;
       projections            zitadel    false    261            6           1259    16719 /   password_complexity_policies2_owner_removed_idx    INDEX     �   CREATE INDEX password_complexity_policies2_owner_removed_idx ON projections.password_complexity_policies2 USING btree (owner_removed);
 H   DROP INDEX projections.password_complexity_policies2_owner_removed_idx;
       projections            zitadel    false    260            �           1259    17248 )   personal_access_tokens3_owner_removed_idx    INDEX     {   CREATE INDEX personal_access_tokens3_owner_removed_idx ON projections.personal_access_tokens3 USING btree (owner_removed);
 B   DROP INDEX projections.personal_access_tokens3_owner_removed_idx;
       projections            zitadel    false    309            �           1259    17247 *   personal_access_tokens3_resource_owner_idx    INDEX     }   CREATE INDEX personal_access_tokens3_resource_owner_idx ON projections.personal_access_tokens3 USING btree (resource_owner);
 C   DROP INDEX projections.personal_access_tokens3_resource_owner_idx;
       projections            zitadel    false    309            �           1259    17246 #   personal_access_tokens3_user_id_idx    INDEX     o   CREATE INDEX personal_access_tokens3_user_id_idx ON projections.personal_access_tokens3 USING btree (user_id);
 <   DROP INDEX projections.personal_access_tokens3_user_id_idx;
       projections            zitadel    false    309            ?           1259    16749 #   privacy_policies3_owner_removed_idx    INDEX     o   CREATE INDEX privacy_policies3_owner_removed_idx ON projections.privacy_policies3 USING btree (owner_removed);
 <   DROP INDEX projections.privacy_policies3_owner_removed_idx;
       projections            zitadel    false    263            �           1259    17226 '   project_grant_members4_pgm_instance_idx    INDEX     �   CREATE INDEX project_grant_members4_pgm_instance_idx ON projections.project_grant_members4 USING btree (instance_id) INCLUDE (creation_date, change_date, roles, sequence, resource_owner);
 @   DROP INDEX projections.project_grant_members4_pgm_instance_idx;
       projections            zitadel    false    307    307    307    307    307    307            �           1259    17225 "   project_grant_members4_user_id_idx    INDEX     m   CREATE INDEX project_grant_members4_user_id_idx ON projections.project_grant_members4 USING btree (user_id);
 ;   DROP INDEX projections.project_grant_members4_user_id_idx;
       projections            zitadel    false    307            H           1259    16782    project_grants4_granted_org_idx    INDEX     j   CREATE INDEX project_grants4_granted_org_idx ON projections.project_grants4 USING btree (granted_org_id);
 8   DROP INDEX projections.project_grants4_granted_org_idx;
       projections            zitadel    false    266            K           1259    16781 "   project_grants4_resource_owner_idx    INDEX     m   CREATE INDEX project_grants4_resource_owner_idx ON projections.project_grants4 USING btree (resource_owner);
 ;   DROP INDEX projections.project_grants4_resource_owner_idx;
       projections            zitadel    false    266            �           1259    17217     project_members4_pm_instance_idx    INDEX     �   CREATE INDEX project_members4_pm_instance_idx ON projections.project_members4 USING btree (instance_id) INCLUDE (creation_date, change_date, roles, sequence, resource_owner);
 9   DROP INDEX projections.project_members4_pm_instance_idx;
       projections            zitadel    false    306    306    306    306    306    306            �           1259    17216    project_members4_user_id_idx    INDEX     a   CREATE INDEX project_members4_user_id_idx ON projections.project_members4 USING btree (user_id);
 5   DROP INDEX projections.project_members4_user_id_idx;
       projections            zitadel    false    306            5           1259    16709    projects4_resource_owner_idx    INDEX     a   CREATE INDEX projects4_resource_owner_idx ON projections.projects4 USING btree (resource_owner);
 5   DROP INDEX projections.projects4_resource_owner_idx;
       projections            zitadel    false    259            �           1259    17413 +   sessions8_user_agent_fingerprint_id_idx_idx    INDEX     {   CREATE INDEX sessions8_user_agent_fingerprint_id_idx_idx ON projections.sessions8 USING btree (user_agent_fingerprint_id);
 D   DROP INDEX projections.sessions8_user_agent_fingerprint_id_idx_idx;
       projections            zitadel    false    327            �           1259    17275 $   user_auth_methods4_owner_removed_idx    INDEX     q   CREATE INDEX user_auth_methods4_owner_removed_idx ON projections.user_auth_methods4 USING btree (owner_removed);
 =   DROP INDEX projections.user_auth_methods4_owner_removed_idx;
       projections            zitadel    false    312            �           1259    17274 %   user_auth_methods4_resource_owner_idx    INDEX     s   CREATE INDEX user_auth_methods4_resource_owner_idx ON projections.user_auth_methods4 USING btree (resource_owner);
 >   DROP INDEX projections.user_auth_methods4_resource_owner_idx;
       projections            zitadel    false    312            �           1259    17257    user_grants4_resource_owner_idx    INDEX     g   CREATE INDEX user_grants4_resource_owner_idx ON projections.user_grants4 USING btree (resource_owner);
 8   DROP INDEX projections.user_grants4_resource_owner_idx;
       projections            zitadel    false    310            �           1259    17256    user_grants4_user_id_idx    INDEX     Y   CREATE INDEX user_grants4_user_id_idx ON projections.user_grants4 USING btree (user_id);
 1   DROP INDEX projections.user_grants4_user_id_idx;
       projections            zitadel    false    310            �           1259    17265 !   user_metadata5_resource_owner_idx    INDEX     k   CREATE INDEX user_metadata5_resource_owner_idx ON projections.user_metadata5 USING btree (resource_owner);
 :   DROP INDEX projections.user_metadata5_resource_owner_idx;
       projections            zitadel    false    311            �           1259    17113    users10_resource_owner_idx    INDEX     ]   CREATE INDEX users10_resource_owner_idx ON projections.users10 USING btree (resource_owner);
 3   DROP INDEX projections.users10_resource_owner_idx;
       projections            zitadel    false    295            �           1259    17112    users10_username_idx    INDEX     Q   CREATE INDEX users10_username_idx ON projections.users10 USING btree (username);
 -   DROP INDEX projections.users10_username_idx;
       projections            zitadel    false    295                       2606    17020 *   apps6_api_configs fk_api_configs_ref_apps6    FK CONSTRAINT     �   ALTER TABLE ONLY projections.apps6_api_configs
    ADD CONSTRAINT fk_api_configs_ref_apps6 FOREIGN KEY (instance_id, app_id) REFERENCES projections.apps6(instance_id, id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY projections.apps6_api_configs DROP CONSTRAINT fk_api_configs_ref_apps6;
       projections          zitadel    false    286    287    286    3961    287                       2606    16988 0   idp_templates5_apple fk_apple_ref_idp_templates5    FK CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_apple
    ADD CONSTRAINT fk_apple_ref_idp_templates5 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates5(instance_id, id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY projections.idp_templates5_apple DROP CONSTRAINT fk_apple_ref_idp_templates5;
       projections          zitadel    false    273    284    284    3934    273            	           2606    16904 0   idp_templates5_azure fk_azure_ref_idp_templates5    FK CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_azure
    ADD CONSTRAINT fk_azure_ref_idp_templates5 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates5(instance_id, id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY projections.idp_templates5_azure DROP CONSTRAINT fk_azure_ref_idp_templates5;
       projections          zitadel    false    273    277    273    277    3934                       2606    17376 *   keys4_certificate fk_certificate_ref_keys4    FK CONSTRAINT     �   ALTER TABLE ONLY projections.keys4_certificate
    ADD CONSTRAINT fk_certificate_ref_keys4 FOREIGN KEY (instance_id, id) REFERENCES projections.keys4(instance_id, id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY projections.keys4_certificate DROP CONSTRAINT fk_certificate_ref_keys4;
       projections          zitadel    false    323    323    320    320    4065                       2606    16928 H   idp_templates5_github_enterprise fk_github_enterprise_ref_idp_templates5    FK CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_github_enterprise
    ADD CONSTRAINT fk_github_enterprise_ref_idp_templates5 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates5(instance_id, id) ON DELETE CASCADE;
 w   ALTER TABLE ONLY projections.idp_templates5_github_enterprise DROP CONSTRAINT fk_github_enterprise_ref_idp_templates5;
       projections          zitadel    false    279    273    273    279    3934            
           2606    16916 2   idp_templates5_github fk_github_ref_idp_templates5    FK CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_github
    ADD CONSTRAINT fk_github_ref_idp_templates5 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates5(instance_id, id) ON DELETE CASCADE;
 a   ALTER TABLE ONLY projections.idp_templates5_github DROP CONSTRAINT fk_github_ref_idp_templates5;
       projections          zitadel    false    273    3934    273    278    278                       2606    16940 2   idp_templates5_gitlab fk_gitlab_ref_idp_templates5    FK CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_gitlab
    ADD CONSTRAINT fk_gitlab_ref_idp_templates5 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates5(instance_id, id) ON DELETE CASCADE;
 a   ALTER TABLE ONLY projections.idp_templates5_gitlab DROP CONSTRAINT fk_gitlab_ref_idp_templates5;
       projections          zitadel    false    3934    280    280    273    273                       2606    16952 J   idp_templates5_gitlab_self_hosted fk_gitlab_self_hosted_ref_idp_templates5    FK CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_gitlab_self_hosted
    ADD CONSTRAINT fk_gitlab_self_hosted_ref_idp_templates5 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates5(instance_id, id) ON DELETE CASCADE;
 y   ALTER TABLE ONLY projections.idp_templates5_gitlab_self_hosted DROP CONSTRAINT fk_gitlab_self_hosted_ref_idp_templates5;
       projections          zitadel    false    281    3934    273    281    273                       2606    16964 2   idp_templates5_google fk_google_ref_idp_templates5    FK CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_google
    ADD CONSTRAINT fk_google_ref_idp_templates5 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates5(instance_id, id) ON DELETE CASCADE;
 a   ALTER TABLE ONLY projections.idp_templates5_google DROP CONSTRAINT fk_google_ref_idp_templates5;
       projections          zitadel    false    3934    282    282    273    273                       2606    17122 $   users10_humans fk_humans_ref_users10    FK CONSTRAINT     �   ALTER TABLE ONLY projections.users10_humans
    ADD CONSTRAINT fk_humans_ref_users10 FOREIGN KEY (instance_id, user_id) REFERENCES projections.users10(instance_id, id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY projections.users10_humans DROP CONSTRAINT fk_humans_ref_users10;
       projections          zitadel    false    3990    295    295    296    296                       2606    16840 (   idps3_jwt_config fk_jwt_config_ref_idps3    FK CONSTRAINT     �   ALTER TABLE ONLY projections.idps3_jwt_config
    ADD CONSTRAINT fk_jwt_config_ref_idps3 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idps3(instance_id, id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY projections.idps3_jwt_config DROP CONSTRAINT fk_jwt_config_ref_idps3;
       projections          zitadel    false    272    3926    270    272    270                       2606    16891 ,   idp_templates5_jwt fk_jwt_ref_idp_templates5    FK CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_jwt
    ADD CONSTRAINT fk_jwt_ref_idp_templates5 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates5(instance_id, id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY projections.idp_templates5_jwt DROP CONSTRAINT fk_jwt_ref_idp_templates5;
       projections          zitadel    false    276    273    273    3934    276                       2606    16976 0   idp_templates5_ldap2 fk_ldap2_ref_idp_templates5    FK CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_ldap2
    ADD CONSTRAINT fk_ldap2_ref_idp_templates5 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates5(instance_id, id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY projections.idp_templates5_ldap2 DROP CONSTRAINT fk_ldap2_ref_idp_templates5;
       projections          zitadel    false    3934    273    283    273    283                       2606    17135 (   users10_machines fk_machines_ref_users10    FK CONSTRAINT     �   ALTER TABLE ONLY projections.users10_machines
    ADD CONSTRAINT fk_machines_ref_users10 FOREIGN KEY (instance_id, user_id) REFERENCES projections.users10(instance_id, id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY projections.users10_machines DROP CONSTRAINT fk_machines_ref_users10;
       projections          zitadel    false    297    295    295    3990    297                       2606    17148 2   users10_notifications fk_notifications_ref_users10    FK CONSTRAINT     �   ALTER TABLE ONLY projections.users10_notifications
    ADD CONSTRAINT fk_notifications_ref_users10 FOREIGN KEY (instance_id, user_id) REFERENCES projections.users10(instance_id, id) ON DELETE CASCADE;
 a   ALTER TABLE ONLY projections.users10_notifications DROP CONSTRAINT fk_notifications_ref_users10;
       projections          zitadel    false    298    3990    295    298    295                       2606    16866 2   idp_templates5_oauth2 fk_oauth2_ref_idp_templates5    FK CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_oauth2
    ADD CONSTRAINT fk_oauth2_ref_idp_templates5 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates5(instance_id, id) ON DELETE CASCADE;
 a   ALTER TABLE ONLY projections.idp_templates5_oauth2 DROP CONSTRAINT fk_oauth2_ref_idp_templates5;
       projections          zitadel    false    274    274    3934    273    273                       2606    16828 *   idps3_oidc_config fk_oidc_config_ref_idps3    FK CONSTRAINT     �   ALTER TABLE ONLY projections.idps3_oidc_config
    ADD CONSTRAINT fk_oidc_config_ref_idps3 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idps3(instance_id, id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY projections.idps3_oidc_config DROP CONSTRAINT fk_oidc_config_ref_idps3;
       projections          zitadel    false    270    271    271    3926    270                       2606    17038 ,   apps6_oidc_configs fk_oidc_configs_ref_apps6    FK CONSTRAINT     �   ALTER TABLE ONLY projections.apps6_oidc_configs
    ADD CONSTRAINT fk_oidc_configs_ref_apps6 FOREIGN KEY (instance_id, app_id) REFERENCES projections.apps6(instance_id, id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY projections.apps6_oidc_configs DROP CONSTRAINT fk_oidc_configs_ref_apps6;
       projections          zitadel    false    286    288    286    3961    288                       2606    16879 .   idp_templates5_oidc fk_oidc_ref_idp_templates5    FK CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_oidc
    ADD CONSTRAINT fk_oidc_ref_idp_templates5 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates5(instance_id, id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY projections.idp_templates5_oidc DROP CONSTRAINT fk_oidc_ref_idp_templates5;
       projections          zitadel    false    275    3934    273    273    275                       2606    17352 "   keys4_private fk_private_ref_keys4    FK CONSTRAINT     �   ALTER TABLE ONLY projections.keys4_private
    ADD CONSTRAINT fk_private_ref_keys4 FOREIGN KEY (instance_id, id) REFERENCES projections.keys4(instance_id, id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY projections.keys4_private DROP CONSTRAINT fk_private_ref_keys4;
       projections          zitadel    false    320    320    4065    321    321                       2606    17364     keys4_public fk_public_ref_keys4    FK CONSTRAINT     �   ALTER TABLE ONLY projections.keys4_public
    ADD CONSTRAINT fk_public_ref_keys4 FOREIGN KEY (instance_id, id) REFERENCES projections.keys4(instance_id, id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY projections.keys4_public DROP CONSTRAINT fk_public_ref_keys4;
       projections          zitadel    false    320    4065    322    322    320                       2606    17051 ,   apps6_saml_configs fk_saml_configs_ref_apps6    FK CONSTRAINT     �   ALTER TABLE ONLY projections.apps6_saml_configs
    ADD CONSTRAINT fk_saml_configs_ref_apps6 FOREIGN KEY (instance_id, app_id) REFERENCES projections.apps6(instance_id, id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY projections.apps6_saml_configs DROP CONSTRAINT fk_saml_configs_ref_apps6;
       projections          zitadel    false    289    289    286    286    3961                       2606    17000 .   idp_templates5_saml fk_saml_ref_idp_templates5    FK CONSTRAINT     �   ALTER TABLE ONLY projections.idp_templates5_saml
    ADD CONSTRAINT fk_saml_ref_idp_templates5 FOREIGN KEY (instance_id, idp_id) REFERENCES projections.idp_templates5(instance_id, id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY projections.idp_templates5_saml DROP CONSTRAINT fk_saml_ref_idp_templates5;
       projections          zitadel    false    273    3934    273    285    285                       2606    17317 .   sms_configs2_twilio fk_twilio_ref_sms_configs2    FK CONSTRAINT     �   ALTER TABLE ONLY projections.sms_configs2_twilio
    ADD CONSTRAINT fk_twilio_ref_sms_configs2 FOREIGN KEY (instance_id, sms_id) REFERENCES projections.sms_configs2(instance_id, id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY projections.sms_configs2_twilio DROP CONSTRAINT fk_twilio_ref_sms_configs2;
       projections          zitadel    false    316    317    317    4057    316            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   }   x�����0kj� *�S%ϒ&���G��6R�/��8X�����g��ie]��]mWݒ&�ea��*-�����x6m�)�"���w)����aǸ��������Y�w��B� ~I�      �     x��TMo�8='�"еuBQ������n��X�mz`��͚&�"�[�/I+�⤻�� @�9|���� l�=��8�8n��{����Ι�_���gNW�`��{Z�u������FB��ir��j�q�"/��đYpV ��_�X�l_u������Ns�].�%��¬D5��0|���R�O�F��y��J]ŋ�r���4mGQ)[��$����.͢��6���_�v��� ?F�"��N8'�.^��(�~t�s��wQd�l����R˔�-0��۲O�P�>ߜ��1Y�YI�"�l�C���O�zhn��C�f��cu�I�8ȤI����G0.�d4�D�����hD;=G����X���.K�1S����sk�`0�#�I;(�.�
5Ԙ*��1bt��w$[�\Ll�T!;D��Rz�.����QY0�m�0$w����l{@f�:vK �
�DF�o!����� �x��A�b�-1C�W�/L�G���tN!?D�BJz�`8Ik��� ������i=W�RǸ�%�'��8<KF���OK��ʙ��l�Eȟ͆����E'�灤�n(�v@�܈2o�>'L��Mm��X-�aS�@��AA�	��=�����΀A���-]��є�J�
���ү�2�p��5)�{H��<H��HTe���ŝ�cms�����������C��|q�NkO}��q��v�H����*����}"��/�������d�5����K��ʏ���ͮc׾w�"lZG��]���������ϳ/������o(E�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �     x�Ւ�n�@Ek�+��X��y�ʇ�A�H�@U��@���Tt���sf��D#=!�cF@i�)k�Z�Bc}�/�A0��3�o���(����=�7Mw�@(X-��Yv���ĕ�#Q������My��oۮ)��u۝���$���"�R���?��B��Iy?�c��Y�˲�����c��D����e�~.]p�'}��+Q�����s#S~8q��;�V�)j⪏-͔/��4��(�}$�����<�%�G      �      x������ � �      �      x������ � �      �   q   x���;�0D���(h����p�s�Q�������f�6H�-LC|Pl
Q�(�>���y��rI�S��f���$,˱��@�d�ɋ��1K�<D��������c��~ �e4�      �      x������ � �      �   �   x��Q=�0�����6\�rM�IAA��ĥhE����(�wۨ�R�[���I�=zF��
;�@H&ANPb�KƬ���k3ci�|w_֥�11h�a�1��:	���V>��|]�I�����������Xå#������_;ﴘ̇����O�iQA��jh�
�)�8�J�8	�Im���>�`9k��� ��y-UE7<�      �      x���َ�X�&|�BLc��tq_���h���?� 7�����(�Pw�(�}W/��!%��]r����T&�p��C��3;F�7���m0˭o�o/��yb`8���^�*�p����7���3�;I�Nb/4�2$�Űo�n������w���nT;�����۷���Y�gX�>\��߰?}��ű�o���)�^������(�kd�,��o����(���)<��dZ)PWnϓ8Irw�.�x���(`� �Q@�}_>� .�R��x{��q�����u�-�^#��y��?u!�f�ða[V?���09A�bOb4�2�r����>��ET���J�P$�2�ld.�r�������b.6�{i;��m-5�4sũߒz� ��ک(�i�~7��*{j𢩶
�w��X/{�;ZU[t������~Za�s�,3l��dh������M'R�����ˑ��2�0X��la\�Co��n]�������ѫ�.�	�RL�J����ϖ��xxE$s���&��F=[��3�@�$9��|��-����r��p��l9pO�N\�G�Q#�o쳥�ߒT�K �aP�7������l��p��]R*Vi��tVӀ��X�a�@v?�sӐw/.����ٱ\S����u���~;�$�{�U84�Y�c���y.8%�sY��7�~v4�X�����r@h� � 2������@��X�aIK�R��CL�eH3핲4K4M'꫚�ՙ�ć�[8f���������<��(�F0Xn�X���I�,v\�K�d���QcW=���G�����Vo^�Uyuv����Ƃ�ɨ�28���)���X�����{{�zJI�:��G��~T�F�	#����������*S�L�;� �$9|%�HE2	�p?V{CrlZo)N�n2��~�t�����SI��o�
�� p��s����j�ĔS�ϙ�&�9p���Y���1d�;���)W8��[Bm��3 �P���А�U""�z@��ݒq|�~8t2@y����4`�ם�	�u "f詷 �c��-J���i��±��c:(#}�I0E����z\VH�fVg����+�bx�B_��*�^l��c��f���H���w�(�4�	m�uՅ�����ƒ2u���8�s���y�$�����OR@R�~ ��|	T��@��0��Ǝ� i��>��K�fF�A�Q����N���X���6����cr��4I��M�v�F��Mk��;�J�4����,1C��Î�^��q0��ib.e��K�kN�i��$2��HUz߱8^��;i��g�nJ�ʾ9��Y��o)E|)�[�mv,ޚ[�r>���֙O*+�]J[L�����j���-�߅b�X0!LK(VXW��,�[�M�Z�b~��)O�.�eR�ǽ^�<�M���ښ�Q zhl>���^�qs^ULa�z�n�"��+q2W��G��C�:�ϑ:-�_�Ou�I�Ȍ�mg6����?��͡fx�Ӿ.Ti]��@�sw>U"��c��#�IK�j>��3b(��R��/T�PD<N"�O[��#��d�h��1u����\E��M���������&��-�' ���&}�mw�yV�a�y��f^[���>�8��V)xsns��3+pA&	�Ӷ�Z� �Y+�6�Y��VqĂ��Ә��d����e�Ǵ���>��E��U�x򁇕P������.���V�kȶ�~&�ñ٤�ú�Lt�Ӫ�w���|�+�HfB��J�i�@���մ�Z��Mǘ�|��lNtS�(�Rr��Rބ5bY��:���6B�<Vs�W�*�8���w�&&���\�}d�A�����5�o���m���j�e�W�s$��>x�ɰ��|t��i��?UA��ƑO��P�n:�����`+� ���c
�ڜleZ��V|����Zs�)�73���|�ݏ����^�%�n/���w{�bF�ݛO�u�j;�?czS�΃x~���r���(�Ju�I��F(��Ӄd�O�]iq,B����/e�eiiZ��9�q���H��!�)�| �QHLlv���	���*�q`JVߝ�X�D1/��9��b�k�h��p�w!/M��cY��ૃ�b�9�P�o%� ��L��ErMs�ΓN~�Wj�@2�l;@����K;�r������^�b�C�5�01���u��|�qÝ��N��o�M��d�@/�4qd�\_.��@l�߶�PkCN��Q�%��5����#}X�T ߁%��b�n)���|w��t���� �*W�6���%��FNJ�J'��c_:޻�Qw�=��K�c��]m|b;��`�ib~(:�d�|BL@���7��� RB)�#[�!�9��υݜ��R�^?a�X��Hn�:�e�k����&ħ��):w�+��l)�l�E���gY�5�Ȇ��/!^U�w>�[��+������28�q�:߀�o+K��S�z=���A�J��z�9�qu�F���b �� w�7�v\�J��6Gk@���H�V`��^!*Q�ն���b�`��Ϊ;����x\o-��{</΃�t|���w��Kq����� ��+�8��2��։N#���蛝hF4�4'{�M��t'��d��	���)���p�17wB���~�����d�C���v%K�e0e}#Ŷ
63���!�o$X��7ܧ�l��8�.���}�����q8/#��@v���x�C�y�"�^�!f������08�\��	���	߁O�ʴqq� �ؾ����7$�O���;����z������]��frw�9ϕk������@��8aI�j!?���΃cp]	�	�n��N׽�<�gك��ũkv�h� 05�6���)�!��1U�Eȧt�ڇ��NV�qn��+ ��a|�bA������M�������ȟ��Q����cm�>�^>a�ib���{gۆ82|Ks����{}�wMȾ���ե��гl{��[L^�c쏰5��=����V�;�����V�����y3 ��3�\�=��A�i�kuS���r����Ǆ��T��u\;�t��}���E�۪�=���܃�a���b������]��ا�Ѷ;�r<�-�'��0�;��=�]�C|�����8�%5@-����t�`;��UӖ��?��v 2�:�l��EyiQ�;ሷa}8�!z�_��Y�ۂ^F�X�~u�_?�WR׾��E|x��1�Ť�
ž���'�낏*��W�pp�+-����ᴱ���/�O?�
𪄐���6=�?��m�b̹Ox�����"��h�C~)g����(����a��v�e���i�|�y�q�Y,c�_�>��R���9�9���r56�%���~���پ���oR�OJ]����ϵZ��IO㌟��γ���%=�I⋐��9Ժg�)�$~ͬ�fF���0�ڣn����	�Ư49��x����6�j'�x~�D��#�Q�<`��9��'�&�Ԛ���W��I6$��8�U̠NR&x؜ [`(j�8�W�\q��u�\�-q����X�-�K��[  ��_V�����D��97e��Έ��?���K��q��s�&6X��ho�>絟��N�\ҋ�����`��~�%���=��Έ��~�֥��Id�}żP_�R�������ݒes���C�}x�2M?!f���j��'|�/��{�~��u�]Ycw�M���<����ϥ:�sz�h?l��V�lOz�y��?��
���6�͉���ߡOu����sm�����{���k/uY8����x�N��k���+�>S�_�Plss��Js��ѳ��doG�~Y��!L���M�������7\�#��/�쨸_�q���=�S/ ��=�~���^�����Gm���<'��$��'�Z���ֹ�3��6�|���R�3$���r�^̵O)�܍�^ec�{ez��u'��;�)\����y���Z�	��r���f$О��(��1�=�[�    OK�K�W���H{/��Eo��і>��`�ߧ��7ĈWճ}Tv���+�}����)dr�ӶLt��=�����?�d��'�9��ܓI/�/���'�e��G=����=��4�SG�hN	�&T ��q8�s�&��k{3�g5^��,3<���ҫ=շ5�=�ҍ�����O�=��������fy߳�������;�ʇ�N~������f>��Κ��~�]�ꂎ.a��bי}��9��'����:İ�ױ��Ӹ�:�]��c��fh���7��uib���=����h�����l�<�ӷ�n;�{�Z��f�L����A���> c��x�����9�s#�="��z����v�}�K������Y�a2�ߞ��?i?�Ɯ�AG�b���{m��;`�+t��:����>?�����'�~|���Q>6B�ֺ�'�v�;���8������(��������{�ZYI����O>�?�ޮ�6�je7�������YZ�>$���b���9��>�{�����dotT���9ut�ii��9�����38�3D��6z����G�g;����y�x^B�&z�<P)�R=�2�3���3@h�t~ª��V�����������.���`�㧪~��N ����l8�.�DL��?�6��S��SA�,�LH�;�mo�ڬ��6rʉ1����ϑ܄�˷`����g����C��21��1d·W��9�S8 ��ƽ�+��z�UD�=��K��3&��<	C�����Yl>#���|��"�?i���Y�c]� ���~���}�{����i�=��+��	8u�j�G���r�3xorʙ_��h�\�Y�9���;�NC�F�p�$������;�'ᾏm������;?<O.}c^��f�+��{l�����(���v�g�~��¯5���~���J�= �e��ot�7����^|F�u�;鱷K������ϟE��l2�1��pf�Ϟ���Γ���^���}�?���ӏ����3�����0}+4��?u�Yk"��gk������Gc���#v�G��u�Z�����1�cs�͗�{�e�ݽn��w�S�Y�WY��y��o��[f����l^��Ge������W5�����L�Ϊ�������u>��yV�q^^��-o��;C������;)!�zU(A�߈�_.�~�X����-���+���{�S���5��S� :VC������/%�wMq�-�o�:��O)jr���<��Ë�����I ���f��9�[�<Bi���9����7D���S�g�ˀ����{vӼa����L���y�*��o�_�6˃n��v��t��zjM>�_�gh ���{�Ӽ���g���%CE�T;��Cz���UR�ae�f�z~��f�iAFQ��%��v����I��ԂC?������x�z�����O�:)�z��ՙ�h�%�(��gD�RME�_2mt7���	�@�sT]�ѯ�0�/�ЂKԌp����2��}Y7�Q����ԕ�@.:���?���X���'���LK4̌�����"�.��_���3U�^����َ�˳-���eYd���,+Q�{����W]<�u�+���{�Ӽu�g�����m��4�4�Ӽ��z�<�d������W��>���`���u�{���ï��/d�&AWOc?�k�?K���q I��p0y~�&�QeJ�j&o/<�3���yE�3�sQ@ꂓ�������r,%�RxJ�\f�zQ| Iu��k�L����r7e�;��`�O��5���-�g�^�����S3�X��Ů��:D*�i�5=��ʃ�-&���0�)k��&p�����<���~	㐆ȧ�W��z1���)0V���>��Q��P͔��}^�N?Ԅ�a�C���/����)%}����Vهo$����wd'��WM	��s�?�C�;\S��Y�v�4u߀�/'�_b�,��4�o �?!muu�NW��
z�7 �ik�� �l;��ݥ��3Zz� ����
 g@_O��b���<h�i�������޲�i";
吮;�rBvX8����8OA��	G��N���?A�ߩ�_��{9Y���M��@�O�����t���ۢ)���c�aAI�b���^H	���T��]/@�S�H����_O�T P��OC����'�9������⟗��og~��雿����6������м䏷��˖W���M4E&�!�5�#���ꏣ�~��|�]Q�@�ۻ�(K�c�o���-��{tGkDq(��o;X��I��^��i�m�����%SR�l��U#0485�ᄵ�
���hI�4TA�J�/x�&�#�p�
��l�T����OY!ڙx{/�&UdlE�m�3U�9+qg-}<=i�F:���dP����DU�B;�@��y��ϯ��?�2	\�ip~��}c��F��i��Q�%ݷ�9�P��O��c�%�>2r�w򚚄���1p�����N�a�Tn���rqp8��`7��8�I����0q��s��/<vӏ̤��]2�o]��Kf����`;I'6��j����1(�4��x��d@RU7O�M�,@Đ�7��b��m��7�h�"{���!�ᩍ���N������G�4�T�&�r�L� "2OC��c�ǁ��c�g��⠔��������2G�N���s?�YL�iP�y`�b�~&D5J�B�T`GA]���_��@W��*��,b&p2&��%�5U��MC^��J�&���N��[P��W��}Rp��#����-����6���_e ��@?����q����N���j�A��88��P.���D%�[>�g��zϏ�Jܛgn��IT�4����θ&~
�4	�y����l�2O�죃��a�<���$&j�Se��@�O<�1$O]���2Ix�A��Hr6���/�w����B�&��G~���ƃ�<��G�M7�i�A�z���c	�P�#��*ɀ^���sF~2���P ��P�Of�d�i��}`!���(a͝A
P패(��e��$"��D��g)"�
JI����q�H�	g90��I��Y��l_<���`'���c"�h�c6�;��&vc��*��i��{�L�Of2�4��=:�𓙅
�{����O2D�f��xZ��D�p��#���Ta��!u��Af��� "����O���>��G����7��Ƃr���c�����G�F~����@#���/�J��(��G���]���M���7z����BpW>Nz�W~F�eD;���Y��p��	r�y�$#���q�+c;�o�g�oW��{�N���D��&�.r���B$�@*<'59��#��Do���ri����J�)�e �?��?gs�)�B��=������S,I����q��7 (��b?D�����x��4��t?���@C��?�������m�[XFf�4��?���*�x�*ޫ�u��`H(h��$�>R��:��$����C2�dX�����w�s�K�`O����)�=�2�����^�q$A��/qm�-M�8������5ߑĂ;_����`�ei�xr�m1Y4u���St�J��E��5��ST虆_@(���� �kB]ϰ �%�S�
Zq���q��.��^��)��dAA$�.�1�݂�E���� ns4�CK�O�D|Ig��~�o�b���(�8L�A��zyt:*��k,�u����q�ԝ���mT��������!����MP/:���-nd����x�*5�$�_�ڶU��f���D�������rI�����T���U8��ކ�Tf��$�.�*K�QN>L|����NCzL��b>�SKE]Ã���c�>������Wt&�r����$̧�)����$o8��t^Y�{Y��Ѩ��]L��� ��f�I@P��~rrD���ń���7BN�%_e��w����&�b�f����!Z/G��p���u�    k>ҞH+���G�p�b�Oc#�kr�|I��	��%��,�~�w$a��pO��4���]	7r#;�� ��������G)�4�׷g�<�0F��1{�r����w.���{��8vvܥ�4q�>�Ο���1�aө=!�_�"��1M	��W�H��eH�	jD�;~1�ߥ�4��F��3-r�`�G@y�ǀ��H�Q-�I���U��M`��9i�"��K�ir�Q�E�����uY
N��r�"*~7���D�P�#�Hӈ�����MMԟ��e�Bb x�#���y� ��� CP�S}d��=�� �D�G�n2�R��-:��D�1V���q!��Y<��'����Л��6���Muwo�@M�U��L%3<z{�ptn��^"����n�rRF���[=��s�k����r��;�P�v�4%Q^�p؅Ӛ��A���}C�UV��)|��г���\�=P�>ǂR�p�	�����ok��Fj�Y��[�N#�_kٰ�a�?�Ґr��Q?�������(����K�����bs2і��4����j7��1\�H{��v=��i�� ���畷�����d�����+(���|��ϗ�R	��Kg��A�]��᫗�㙅�~�c�9Mw,���>�r�����k��N�u|O�8���y������"%KįEJ�����0�Z��e�c!f<�p�.&S���*R�)�{���Q�H/����fi�y/�ؼz��É }��3�l�S�`!K-�k��a�e�@Z�gnѵ��P�{�?����>�Yt)��f�\�,EA���t){��\��,˓�{1p?P�����L�T+�G�s�r��5:C1҂an͵�G�I�%'rP����n�E�Tj�\���O>��`�[b.~-�B�!�w&��?���:t�P��$��"X�"Ҹu,!�Z��i�%�k�r`*�"��D���(��*<,��
>��x)OmE��PL���9�)�R4v��.cX	j���̏�6֡z�5���}J���ZJ�c3,Á�7�����4��$�ˡ�z!�k�Q�� ���Y, &"χ0y�d��O�<Y�H�Ǯ��CX��y�}.e�$ ��v9��J<���Cw"=b05�K<a5OCW"�ˑ��M~���V��`���.�sX������b��]�cj~�� 5��>#�K��ci]��p������� Uh�T�=��Z�Y��������r7a�+^�zap�
߅��+�C>�]%]̥�V��B�*J�z�ӵH
�����9�CT|�����4��u<4��Z1h��p�t��q��@B�X�����3N�.�&�_�����_|�Fc!}������/�d�G�7a�"��7 !�������.���-��ʟ�b^�C��b���+�7�T|�@��:�y&��D���4,�p�{��]� E�"�ˁ�y!1��@<	������4�2>��ZTji]�H�d!�{I�V\��7Iw�uU^���,�j2����s/FRǼg�6�q��	.8lR{����M�5.��0�~��k��Qgo����_�̿�D�������@53p �d��Л�s&ﺦ:Q���h�}!�̿6j�V�/�X��*���9S�=�Rs8A�`���@\��q���h�߽�I(�3E��)>������;�o��/F�o��^���v�?�V-�?���� ��M6;U��I_�!!3��J��z�ۋ�2\7� ��L�}�i��CLA�\��ϰ�d���D܇�ʄ<N�^�f�'�zd5_n�ŝZ���r�]�y�R~�7�K�k�Y���iq��Vt���z�'ɠ�=.�&��ki2	��=Ҍ;<���"���`i��|�9L|�l#~"���HF-��f�m$m�W��,�Q8Ƴl2	&����v���`�O}>����Å�����������P�!���q��@�󷦠|��;�iF3�Eb�'&�&Z���&�Rw?\�8�h� �S*���]�}������A�'���F��xF�[��� n�J�z#~,��x�_���렝,�%�Y�vn2��9����1��$*kj4mV����>G�W�'�dE��rY��ޚ���U�CK����2��loQ�|��u�f�za�eH?��޾����Ԏqvf��sC��;�&��j{��m.����&s%���l���N��X���d{JW�q���\y[ܭ�,�j��z��L��;����1��ڤ��6����^���Um�υTE]tFN�U0M��Sף7#n?�fsefn���P�mY7}}:��s�ha�k���E(�C*Lv�/2�=Q��0�Z6�u/�E��V�b؛�umX��N�AN�eK�29r�w��X���^Цsl��+&��J�lz�n�-L�,V��g/��m�]7b��l�Ҫvs��n�g�!6mSFe�.����w���yYb�RT��z�����;6��7ն���mn�e�油��u�l�m/�7M��[����e����ޔ��9n�q�t���y����ki�-�-uv3K�Lp�[Ш,Y������J����]�,6���F�6��_�j\��-��^�T���v��u~?���ߑ)��MYL�{l��a�	��1T�ބ	v��G7!8c	���[���F�a��:��������D��j�f�\����o��F$��"�ǳ��5�6Ŏ�{a�4��Ѯnfl�S_E�^����b5��M.�.gU5����&�-i�4Y,�٩`š��Tc�/��ĝ�E�;�s��V��c�=�vsAm�8�tK]�+�m�-�ywav�(+�y��ȭ�57��[��r~��fmUX���b�+�r�*B�0��I��ʵ`G	�����	ߪ��H�|oBF�f���W%�N�{:���Ѱ�wŖ��&���
E~��B܈����W�K2糕��Y���/���D�pc^��&D1��ٵj��e˶߈�QWݫt���Ɯ�ie�=�
_kE�8�ճ��n�ĢȨ��݀.QK��{w�jL���Ǜ�6u�4�-�0��Rؖ�S��v��G� ��s�>�1�`$�d��g�~���K��(rƶ��w��鵒mm��$[�,8U�v�\_d�B��˭�T�Z[����:�������:#�H�U�en�z��E�y��j��}@�c�l�b�r�I���!��zn&HB�%�U�d�Y�ޑn���v��$�Lo�,���[��j�8�ӥ��>��j'�eJ�s�^�\��s?���R�2���{ZE3�z ϶N+l�[�ڽA��G�Z�\wW��)r�A��6�_��z�[����ڛ���kӜUe�`���Y��\�F)}|HP�̦&Y��/M�z�mb$�lE}u���e�l	c�F.�����[�Zk�ː�׽R�6�!��$
����u��dY����c�Bx#Ρ�Ѱ���ݗ�56�m�ȝ�F���qӳ�r1a�u����L`M�a�Jo2	�Yq�ؽ�T6�\yJ�-�V�gM)O�l��;�j�#�6�y��LWT.����+���ȝ��FԮ,Upϙ_����oV�M����To�Ƥ��T�Z�am�Uu����n���rU[��S�+����G��n���e�+�"5e����yjR7�ž�e��B�mFls-�k��̲��`D�Fm[/���0�N>�Ϋ��_)�%Q�k��J[U,�ag��&��2>�����n��GS��ؖ°�4��6L7 �|�7~���v:k�G3�L��y��VZ��&e��_mk���lGӋ��73�V�����Б�%a�[�-Rb'M�uq!�F;Z�Q���\�ө{m�z$O���k�xxf���
&�5�%�������^gǱ�o7'7(ʦ���jK**;S��ln۶ֶ���YJ��`���]�$Ѓ!A�Df�t[�[�����jv�Q='���8V)�X5}AX����bK�`=������\��g�P��J�����'Ma�I{��1�R��%uEV�e������i&��R
Q�
��ȄH��Q�5�3f�2�= �Y#�Xs�b#ڄ�E�)v���u�b��r�W��r�b����榭�,���������f[�jC�X�,�>�يcW'HŴ� 	  p�m��Lu^+�������K��(�Q/�s�D�lfu�k
ĦQ+�����M��Z��ٹ�䚄��Q��uWkI^�{�W7�FV.T�ՙ����s�M�������9�L�z�.TyW
���:)VB�������ܢ��ӛ�Yݗ�˯�����]�Xֶ���F��Z�����#��1g؝�ӥ�K��k-�A�Gc1��V� �>�G�0�7�d<� s�r������2�Q!�]���UL�l���w���7����p�,?�\���:�SvQ)Wϻ˘Cq��"S)ٔ��l����LSxv@�%m`��5g\Q�E�Y��a�S������?d=�ُ������!�}c�w�im�&�*��v���ڃNk�'�7�}����~�p^��躿�
{��,-��.�7�,ve2�Tq��C �y�>X��J�OưP]��]鈼��I�U��3x��'��)���0�y׾�E��j�P�_��X.Y��R������?�����Ơ�dz�R<sG1��G�,sA#�d����!H=��x�V�h�G�$1���>}^���G>?�'��"�K(��wb���0�����T?��}��7>Y����;�����px��^�����Np/,G�,�J[���q+��ܐ'�n�G>?n�Q\b�$G��ʳ���g�n�ē^�w�W>n��;���"}Ft�A��I��Kp
�o*�܏�?��$�G?c�b9��1<ž��K��#=��,P���@!����/4C�ǖ��e>��ptB����whćod�e�[���Ԝ���-|:�V��<��'q��h���#�;��B�Y�8����K��ݳ!{nܹE���;����c�� X�ep��C���j�7ĸ�Lh��tE��p�Q�$Jc���I4�a�/�2h���t�l�g1�8����t��ͮ4��{�W��qz��&��V���0\-��J�X�y����ܬ�JlD�'�154�4��m�Uؓ�9�v0�-���ԛ�.Q��pWk�g��osf�XOm|Ԯ����I//4��=�1˒���2���g٪������
��,��-n]`� ���,�����as�����~��CwY/.ڵj/�z�kT��j��ֲ8��F%�I���� �U$�)G&^��UCt�]3��"�K�Yk�{��:�-�t���g��6�:�6�s�mg��3-�YH��55���$*�}m��.J����t��Ѹۛ6V�	��W�؜����q��T�͆���r��rb�,Z�2�|�t��
�%{�e'�Vy�q�ME`�IWٚc�]=/Ȝ_&Z���߰���	�Y�E����T��p�+�7�yvo��N�h�X��6���p�)O�衺�B����z��r����(�8}�٩wV�f\��ؔ�l��Q�ދl��ti=�	rGۣ�Z��MG��A�oH{��>5�J�����qtB
8�Ȟκ���߰�v�D�fi���<_\:����7F�f~�_Ef�#+�e25��]-�XG&������%�]���Tڎ�u��y5lt�R�QaS��U��ָ:�-rs��Vk��K�tP�d�7�V�����&��ؚP�	��Q�Ao���eq�ԇ�7�Lv��ڎk+���[�u�a��t��.��6�6k,�As����le�UHl�њY�`���5?����Vu��Զ� ���]I��ۛF���r.&��(d�D=/O����,;̲����\6
A���Kn�[��v�1w$ITN++�v5�f����l��v̭�����U�J=L���S��^�Dw+퐛��xQtJ�I'o�ZNH��Z�qV���^����VlI�z��n�1���myJ�� `����5���U�ѭ雩�_�	B��-����bTs�Yw��Y���0ߘ��|�ճ��T�
%-���rU���`U��;{���Z=�h<#���(��Z�9�u{T��eM�g�S�]�	f�j���-z�Ze}k��&!ͭ�d8�$��Ά����:�m�~yQ(��^�V�\�,�;����+�+�E��*r��n�Fc�G�fS��A��t�pA�f�G�bW�Pր4\�v�]q���Π��ѢU�dr;����!��Q���6�[�:�_��v�IF%}��M�VyS�+��`a�46��8]➖���n���v����1��4+)Z�6H�ϳ�G���hM_�^D�㻝��j�$+��,,�����p8�V�lV�X��d���C_� ?iK���� �@��+��.li�n��H��$ㅎlk��X�5��
�9��Q+X��\\ϖ�Xz���f��D_PLk����V񺷬��p��q�Xh���W��F�¦���ꢾ-K��K	��~��W���F�8�m%i1�Ey�����˅M�����"?�+d��M��Y�;��gs$�)����X�q[dz�lw�-Y����ײ����E?�$�pg��ؠ���Qg��ʙ��Ղ͏��6��e[U�1�ΐ�E|��֢����*��ǌ��VK���W��F.�O�
�C!*��]���ץau���~�5!;�W��Z���&.�`���W�W���S��Qa�c�7�8�;,�����zg=঵NM*:�vh��#�j8Β�]DS��H��eԚ�qck�*CO�nz�Y��,G� ?�ͺ��U7�Fs6Ms�6��\@�,�?�	aӫ��N$N��m��͆��~W��Ĩ��_�%U�m6E�U5�E�c��^8_���M�r��d�5�23�ۮ�Nr�����٠P�
�UZ��M\ZV��(�6����\���ʥ������Ua\���8�o�Ѻ�y�=_/�n�k��b.l x�`�Ei\S$���l��z��3�.����}gDk�Ƞ*���C��v�%^dDL�9���Lxi�v����s�Z�z�p�ÕQ�3��d��Ć\�Lq�W[��b�ql3�a$N�s�>�5�3㶹�:�ύ@��̈́����ޜ��}����f����bZ�Ԑ]���U'~ǫJ~I�hn�6��:�5�8��#��̽���M�X/��3v������vJ(s�5<����ԫ��{����r�@���Q8]�g�������e�`l�E{��0߱�!e��a������-�.�h����L+�R�9�t1˺���
�
�p�/�rM��r��ᡱ��:�[Ca���nI��{�+尰�S�uA8����/�Uքq݉v�؞m��:ń�__��#n7ܐ�ѼZ��R��~˙L�rX���mm�}c/{%��L���U����P��nR��ئ��F!З��d�/eu�S�e��R���~=��*BNi�yqO`�1pŽWL���CME�����?��O�?+گU      �   d  x����r�0�g�C�b_�� %@��A:�q@o�Mm��>�(��Nbz��_�$�"�h+�����Dj�����V�급^�Zp<c^lc���P9Z��� J���|+K�ƆL��#�p�d��ܖ�6��]��E)�$jh��q d�+��D}��Q?���A�� ���i&d�t�����N1���u�DE�Q(��A�}��"uG�� q��e��Ri���~ʳ���P�d	��R��Jû���.�2-��Ф�Vt��;3�W��{��9�T���}���\	���e�?\��c�b�|�b|Ծ��{�yR|/O�(�k��I�u��J�J<�9�J���0��ns`�Uff�u�YicA�;�&��|��%ʮ�dǁV t2� ҺM��Op?M`�@Z��zGh�fPR����~�j����u�����ߜ�����9��s u�i�v+fZbO6�S�u��dDsF3jn�%_$�Iqx�����hG��DX��撙V=���WƟ�
ޖ��N5u��=d��kf��y%��Z%���s����U��v�3g�;�������x��(�l
��b�T{�z�,���n�U�-dvD#|����f�Y�(      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x��ҽN�0�9}��Q+��V11 � ,TP�.����T*C��X���'?�!���.��K-o�i��vxzH�>������nA�=k��	K6���]]g�L|]"ʞ&i��P�ix=MuO��Uh ������(�F9*G�?���q�˄��dI�H��Z/�i�\K�!����XϹc�ȶ��/]v���TY�3� ����t[��P�3���Um���s�4�7;��      �   {   x�}�;
�@�z�0A�~�O��Y�C�*UNCHp��a�@PˤR������ �E�dj��k{�e}��^�OR��_+��M�T	b#�ke_d�G��(����?��²�4��c̷Z��N=5      �   �   x��PI�0<�o�:�i8�^�%�tQ�� �'�RāM�/�=3��J���i&�'$sDYH(�b}nI�e��4D��#4o��O�Kmho�Z^z�5\w��8�;]f�����]��)��_��vf�;��v���bխ`0\%�@��ԖJ~
n��G��i��[�s2����u�3�ox���U�v�$� ݌�      �      x������ � �            x������ � �            x������ � �      �      x������ � �      �   [  x��Y�r�8}&_1�[�tmI����[�h����������u2��*�l�C_��nڮ��o���}�ke�����6�^dB�s�I��!�5�`B=2���7�7�m�Ν����uA�����>��r��K��2WR��bn������sh��=Uͯb��~�^����Y�x�>�X����c���¿w'�e��j�]�mm���jȅ���U��U��Y�?-⬟¾��؀M���c3�}��UkA<�n�����)�$PF�E�-�vٱ�]��66er���6���ٸ�����cܩdT�H��R��[b��w0φ����x��p�|��T��*KuK4b���zH��s�0ƈ�][��U�~N�q�cZ(F�/����ɧ9�$W���H�́�mQ5�3!�N6��(AkF%�&�E�!��t�G�<� ��/���}|cSqIm��$��8���g��n,�����řqx���i�f��Eh���*��ҒO�����*�%��}�*�p�s41���ڪ|j �\1!�@�C�d��LT��N)ÄPK=X�#�ڂ���ZAߨ-��0%VY�0�s�1_u$bR܄��.g}&3ܩh��e�ݵl��F��V�!Y�4�����T@H�D#�l��c����6Iؙ4z�怤'�I(7.:+f�<
md0�m��.�':��G�[�-��7�s�1Ik.���K��]S�UQn1��bh�}���>Q���K�!
�P}��V�=�����1��j{��u���B��򻯨��-��|�,睈} �HVz���<�W4v�̧��6E���5�Y��	%K�+�Q��q�;��c��6�����2vd6$�rWeb��M�\;j�<���Iɜ&�������?91W���Fr���!�n����ZR���cWI��x$���οL�Q�:�����6����2��~{�>0;�˸�7��I���9�Sr��;0�e5��5h.��Ӣ�s��@-���k����(��y3wz�^q�j�s�t�ĝ�����>7ǁj�8.����ż��8���A���R/�]7�$TԼ��@���)�������]c5ãiz~ӡ��F���r�q5�
ɭ=*����Մ&�D������f;I��Wb2��h;�F�Q�a���҃b�PkT��cl��w��t�����f}�Gc,��gO�͏<a�B�
-�s���4�X6$o�v��CS�����|k�]w��`]g�㓸6>�*w�P�m���
�>�@Kz�V��}�a��FR��
 ��ը�P�ijL�s�T{q�ot�����4�Hv��㤿Fg��z���F�/1H�P'~4� 7��t���)�U      �   0  x�՚Ks�6����)�����HNN�4�IRO�6�L/�����
�V��o�(����u�% v.P��LDX`�\�z0�����7�O'��t6�M���7<�ɠ�|8~>vG��t2������qGt���:��g (�:o�8Nɗ/�3�m���C����qgu�B��T��|����{�P�A��f80?@S蒊:��B��	ilf�]px�۳�ܴ�#:g$�K`���m�C Y
`�&�4%�L@�.yO	!�a�y��(/�L�E�
7*N}�C�.�(��UvzV���&Wc�!'!]�I��C`]�A���H�`X��/s!RvL�r�0m�",vy�\�8�l�4�pe����@|�.�iB4^F�4&i�F�Jф\�u����|�'P�
pV4b)WK����Þ���fj�������pA�m�p��E���p�B+U��!�.�wߖWx{��fC��~m�\��
��6v�N��G��m����9e+D@Vw�8	��|j¢a���2�\�U�$R������S,r|��v�h֊�t�w�*[��j�Z��f��{d��p��y��G�f6X�T�A�7��;!�pn#��ڨg����T�a/��_K5b�y}���4��]�kk�v9z�ݷ��T�����������c�F)���U'�x�!g��R�B���}�h`/HC���&Ê�b���9�F6X)A��'�������m4S��F�؈�$�7uد��}�E��.��2u�DO_�q��Ii�FD(Z�*�y�g�3{��/���2�/�Y���^�M <��\h�����X@����#���B3ݿ]āьH����̸����+�Ϯ��+�G���S�no#^�� ��/<
�A��a[<(�� �*h�]U~�*g��Q�2\Z!�9��8N�ƶ$�tܰ �v�u�ư��z҇:F)s�D	�1D���F���ew}�R���ÌH6)��*ä���'�{�wj�u����\KԐ,5%?(�����<[�HM�lVFG�\#'�v9Oz0u��u~yz��]3��>��	�����+�r�	^��nC*�
��M�L�`�|Ɗ���WF�I�B�6d"��B�8&�	+XǕ����
��J�L&���7�I�٘���iE7&�f��Z1�=Ř�R+ʼ�ԇ��Ѐ1c�V�FT����M��}M3�˰a�N���飰]W��IEX����HI,/��"� �Z�ty��]����t+��((ku����t�����ko���ܤ2��ǂ���8��2h9&�V���<��aֆF���ܟ����)>ᘹ�J�PdS��4w�
�ش��U�$�&Y*�G �@�Q?��
�$$��s�D%y!*�0������#S�*��m,�����LG6X)��D��flØ�jbC����,�Jl5�,S�3cX�!��u�k=	��j���]�z(ťz���J�@~lb�����͍��x��g�޾Q�^`�6�=��j`CY��Ǭ��{�!,OT��a�_��ﶸ�R�v��T�~��_gf!���<�����Q��V~Yt�B6u��S�h�p�"��Y'��w�Yy��Cf���L �ЮX�$�0��"î(2�)?�˜s`Bg�BŇ�PAX*#_.H�ҟ����\��ȏ��XF�J+��Vu�@�k��!A�m����\&/���:i�DT�=������}�W���硨�|�d3���Lj��]�w���|��!Z�99-)�z&�;
aM�4����4]W
��� s�R`B�,ԁ�:, �k��2���]��N�7�d�8�mn��{tt��H��            x������ � �      �   N   x����	�0ki���FzI��Y\{��O m�;8DC�Ih6 {^Ċ��Ӭ�y�~��TuR����V�We�#(0      �      x������ � �      �   �   x�]ͽj�0@�Y~
�	���*�$��&�)��P�b9��DWƯ�ҭ�Y�k��x��2�L5M�8��@ۅ ��ծCtމ�c��5����LV���7N�`���B�x��ﻗ�vZhZ�>2��8�J���u�v��<��z��@s>��Xb�Êo�^f���)�y�Tɱ��þ���w���|��i�P�>�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   f   x���;�  й=������x��&$�Ȣ�wttq~�c�c�(�L�̡��V�(r�^\/���໖�CY������5/�q鲏���Y�BF��{�����/t         V   x���K
�  еs����3��H�I 	�����#�b��h�wD>x�z}�|��\m�>� $#�%ڍtb���a�]�V�9V�C���      �   ^   x���!�0Fa��OX������`0$�pw4�`����t�����Cz ����R��A�U&��jF��a>�}�;��f5�G�H1�i#         u   x����
�@뻯�	��nowS���2���$U*�^+����0�5��lU����<�iJBRZBKz�=�������;?�9�E�I���zl�����NΊH��.k�v9�7]�%�         m   x���;
�0k���۷ڟ�ᴾ�9�T!`ig`��U"ANC�5�s��4���i�� ~�w�0	'#�I;�/��i�p��G�+�3��X�uT�s~����s��/j�1�            x������ � �           x�����HvD�ݯXLJ�һ�{o���{�HA��7�Baî����\'h�I�P�h���(��$� $E����O���������P�� �����Z�(��㏹-��������,GY��^�f����Υ�!�Jց.	r�|J��u�N�尚?׵	j�� ��i���t}H�R�o�hЍ�������H%x�>��gd޹�(���n��7pP���y6-��bv��\��A[3��O��Ƈ�h����N�i���M�j��҆Al\������2?g���ҙ�]�pa���g�����ǃ)y��$цL{�zd �D���R����4��o���K���+0�,G_�x�o4�	�=�T
�:�4{�/p�w:hG�E�t<�ݗ���c�20N��k7��[� ��m�˵К�r����\�ŏ
|��ѡ�nE�~<\@n���wyz�fɁ�ˏa�Rw�#W�����f��(JO����E/H5���� P�Pf�&��a!߁��Q�W��籐+��0�e������L�nJ0˸Mn /�@mf�d���v�<���ѩ�£Y�ؑ[��ȫ3�ݛO�hN��9	��':�TA$5��(���P� #���j���9ѽ��3�+������,τ�Y�Şl�;�k]K���!��v#��Z���tj�`���b�HZ6��wܦ�;�c\���ZA���s}	-�S�R�c����d�r�	^2� �-%�X��>���	��T`��V�E�PH7n��tP͕I�2�4[�Y����`d��s�V�?�a��쩆,U��@�N��o� !,"[@���R�b���
�/t/�>�`�~�o���UDz�z���(�0�d&:Qt�@�ϓ�Ʃ�)!F��>m�e�+(� ��a/G�^��N�:�
ϩ���	+X�<�nS���x~vw��Eb7� p��і6����%1�}9ܤ��Lev��0�\�{W�fN-ں��oS�Jm��V���ߝ�-9�EB�	�;|	5ED��Ԥ�z�p�3��~�'0'%�\~U�o;3'�H��Wvgq���v�-S�<���I���@�#�V��Ћ�y�;Ƅ�+��oZ���1,�1ݶt��7�hI�I�יF5û����Q`���=kXu����6C���+�x��Tfd�7�+y?x�^`".M���n��� ��p%�b���Odph�a�n���);s�Y8�C�7�zDP�[a.��qţ@�ZU�d�����i +������輂{>��)w��.��0;���Wc��1�]\Xb8�뻢T��̋�FmAή���~�٣��
7E[m��B���~��k1>�Y��e�JP��Z����X������#)&��z�!V�m_��?X���i�uKp�zdm��8QఉX*���?Q�q
yP_���,E��^_���S�js1뛆K���0Qgo��@H�,M�v ��bu�PuTG�G]�AA.M�{SlÉpc͓H�ԑ�����_���_�Q[�Հ��:��V��^�&���Ps����H��+lg�R�I���_0!�`�~����B���/k����v�W�}n�-^�z�/qۄfߎ����l^�<���	(f����N%�/"
�4;���Z
0���|��V��{	�!J
<�?Ys�Y��t�7"��^�9\q�v���A�YıMҳ�ؑ#D~¦٘�͢=T�1�p7�����9˕u�^O�b)��da�����u�]�F�5�q�d��X�0r$l��J��YF|O�|�����x.�WP��M�c�U�aT�0��������%�Bf��=��/�I����g���������I�$`����	A�_���!b���/Gi���U|�6ݵq1]���8�0\7�b 궁�3�߃e����'!�=7%�s�|7�� /� '閊���z�H�f�SW�H�^�Ӯ���2�_A�u�>�ш��c��rډ��ވ�u��HY�A�,),[�4��I�E?�³# �;���_t����z[�d��t�j7�d[����P�PB��J�G�L��+����2�!��!Y�Њ�՗k^� V5�@��'�!*�ǔ�Ubg�7��
B�1�bۼ�O��	�,ˏ���b�V���'�Ki�k`���T�k�ۡQ�ށ�=�Э�����<���y)���1�I۵���0ؑg����\�فkt�X�����x�Q��+7�^�l���YWid/6�fG�h%P��I�S('���h��^�wS���T��k�D:����W��^��K�f8|�4��Ǥ���*����`�� I]\/������m���Q�c���I��E���X�Ǘ����V1MJ�
ˡ�
Y��i�-�������p��sԞ��'�Aϥ�:�ݲ��G?�4�8;�ѣ�zE�����5������#���7�9Vk3���\B&��J2=8����|=`T�%�Ų���
i��?껓�ya5���ч�*NfE����M���2�x���FO6�h۲���%m@E�ت6�ߺ�����I�n惠��+7i"u�RR�9��4����4���+��,�Y+�j��*��Л�.4���8z8M����S����7�0�X����R�խ�X{����P��I�"ӯ,;��z�R�B�����x������J�eUx@��v?N�
<�s���()PU|}�nzF�@�x��6�2�)%�c��,�]n3�NS��&� ��v��!��g��˶*�io?'��W$� ���y�,�-pim`�\��8E�<����)�R�4hbL��Tn����j�K�<Q�Zr�:�]	��X�"n�v��q=�a?��d ӋCJ����%�ٱ׵��>;�Z�GŲ%gܬ|��P"3�����5��]t��z�}���o��r���Y] {L�jN�Joߞ����O��Z4�˜iQU��7�r9�[wK�W��A�v]����(��̬̝��HCj�J�]uΤ����y-���aNx��,d�>�	p����#�3�g��7`�t��ep�#����̹���Hui�~�{5�xi�-���eF�媮��`!��"�,���~�>�?�
���{� �Ż�D�ʚ_�ڶ��)�Bir��s�1����.�L/u����~��E o��G��Z.�1<8r�N1�0t� ���[�EC���q�
�C�óY��R��G���g�wH��uЃc����0�V�<���~�f�*Z� K�a N��V�ex����_�V�zx��љ�i��ṥ�T�#E���FK[[�]#�c��ʪa��_��Spƽ�aoDY���s��B*�Fh�G�Ǧw�9L�u���i�NZ ����O�{��� �h����
;��A��}���5I+�/�5,�G_I�):�q���@�d��V�\������a���ʼVBu��95?�f�1�ػ�%a@=���A"�!�R���EI~��qM��t�7��|��7ȃ)7D
��,h�FL���ǜ�M�Q�ty<�/@l_����~��,��J&}H����e����������,|         �  x�͕9nG�c��յv�,Lz�3����ق
f���׿5r�1JխBֈ7�!Y&1*Uk֛��w��R��>�>#>L�H�!�����^?�\=�|��惷D0~2j*~x���C�_�,V��>�v�ʣF�<ry٪2a~���d��ǭ�m���~��t�gݨ*΋e˙(�&����ai��@�|����y1��;�d-�X��M�3=/P f�����ѕ<��ݱ���T���dč3��~9lZ����	�M�ٕ�{G�y����T��>�82c�*+3ɩ�9f�B��'�`,^o8�V(�m,1���p~��B��b{"�� ��Ql�h�wW�U����llV§����)�,f6���#� _�l��f�eR��� )�c퍎���f���>ge�75�G�߭7�O�D>4���?���O!��V��5����kva����z���?��7�]�h���7�����
[OL�t�A`S�H��:�����_�����@C��\�+�*ǚ�51���{}������3V���=������'�.��5�+�X��zb3o�ks���:��':vҲ3Y�-�k��`<<�?8�0W���H;�ď^���:t�1)���������Ư�L?N��P�c�!"�Ӛ!�\R%���B0����+���~a@��d�j��k��l�+��td���V���]3��}%pKі��$�#HD	�h���&#�t�4Ǿ:[��Z T`���Z(�v<�!?�1����"��4��f���0RM�Z1����~/��9:j�~r�hD��	Rj�X�^�ݾЊ&��JQ�j�����D�]��Nݛ��%�4F���Uҧuk�.��]�Fi���0������[ls��������m���      �   �   x�ŏ��0D��T6�E�Cd7�M����H)R�"��É�Z�*{���4�Nd�EmQ��&��J��*P< '_?W��zC��kK�{�f�߇��@%亿��u��������T���_J)����9���Y*            x������ � �      �   L   x�����0k{
z�����$�P3�z�h�N��sb:²�9R�/���<�{m޲���&&����Fx�S���7��      �   R   x��;� �Nao0��������bBc��!52qi�;7D$I�F�����;��9�\�z�/��C�5"s��s��G�      �   ;   x���,ILI����ON���/.�,�425��4�460547��062F222�0����� P�      �   &   x�K�,�425��4�460547322�0�"����� �"	      �   L   x�325��4�46054775�0���,ILI��ML���s���r�s2�K8����YX�
�[�s��qqq �:@      �   j   x���;�@Dk�)�' {�Y/gI�	�wJ(�i���qSv�Ԭ�Ű�u`@&�Iu4��d�y%i9:�]�mߍ��?K�]��pa٣i�\�c)��*�      �   	  x��K��8l]u����y�/�Yz�
p�Y��G���|c�T��uW���d[��Tu]Լ��V��J�ȭ��_�UȿX���ߜ�#�Ъ��(֞����ߏ?�+n��J%T���օ��P��Qw����+t��U�9o��p��:�i�a����U�fJ������W@�i�д�-|㊫JIx^j��]n r�Ri��S�=c�Tw~�x�d���� 	��߀��M5��C���z���n���/���N��A6�ퟹ���������R�*��
`I���+qT�pT�
���=��cQ�H\�T���o��+��d�+�	�Z�?�6�:�E�*��w$��@�P�G�c��҂L�AD�IP�u ����
�Wpq��ܸ'4>�$�F�����$�6����d?�������pׇ.�LKғ.�����	�	�@�/�3�q}A�`Z����`s�޴�B@�$��B��[�RV�r�z� +�z�Я`�����`�Ҳ�y�o����_ \f��W�m,q|��X��C݁ёf�Á��K�%jִ刻5pTO�3|$?P�+��Bvp�N�Fl�>G�SK�ݢv"U��8R���P��e/�A��;qȶ&O�!����I�{"��R���Pj�Z��r1Ю�C;]��ZI~o��9���`;Umz���;~�&F�'+����n���U9%�D'Y�V`D��� o����O�p��o��聲�v>������?�|��d�ex^�2��1?�F7Щ�[��P$���z/�_ݧ�WS�"��׆v7�?q�]�=F�(���5E��;�SN��1�#��о�ܡ�cP'xE�b�C��F������,gp��
1!YG��LTu���2>*E��,'�/�ҋ =/��Ny����EOk���Ii����cc�jۘ�y�"�H
����,܅�p�<�$�">6����4�A[��D	"$�aF1����k��B`���F8%#H.wC���^71k�'_��%�B���`&�q�4���ۃ|2e9Sm�A�vǨ�4������!�D���0�Q~��f���>��m�8=�Ѣ9��YޝU!ƎS���>h�9E�c�w��r�s��f>A"Qn2K�u��;���^5���2L_n���y�iO�gI���<���d���(��砓f~D>e4c�>i�c0p�Iݏ��Q6����>�@��|�H2�L�Y �-�䤑6���L};�X���y	��$3���J�ͣL�l�`Y]��l�����ca�4�?7���|ެx��): w�n�Y�J;�pŭ�D��
��S�o�B~M4hn�ea����T�gv^�AsDi�F4��^�&��zNJ���ԺǳvE���&��2�����Q���Ia�~��\���X���B�d�D��[C0c/��d�y�d]�,H�:�]urkNOn����v��{ŭ:�C���,�/#^��n=��Y��^���n�kڶU�Nn��q�uk��2����+Wx�\aY���2�UM=�Y��O�4�����D1�<S��9�ҕ)I��,r�.N�]>�٧?��,sun��+�u�
��ݓ�*IT�v�u��ӿ&;}�����ffPv�����c���ز��hE;��v���+Fx\#}���2��oi6�l���H��������c"�$�`4"e^Ռ�f��,���K �^���"O���X�8�-��󀱊��8v��گV�x.9_�ړ��L+��|Π+��<+�7Jz��Бp��v-���c� ݊6V���^�b�K��7��VQ�E��;��lz2�p�W�W�0�O��ю�˻3K/��cd������&�Ų�0î]%=���*�smӿ�������U8�/Sg1Ƀ�mͮc,��Vv�}�29A5�\5���G,�؊��iPno\�yzj�u�x��`�:����l,�+���s�����#��j��'�p��#��D���ƙކ�^���cږ�yj_��G��Q�x\�����sԚ<"�=��^������U]��5Wu�U]vU�]�eWu�,���.[���+'�����5hꪋy@z���9w�޵&݊P�U���ayj_2T蜲g�J�yU(yV�sW��ݷ=��$[�I�N�0�F�F�I\��sל��S."'\x'[������l^�}ɋ���r�L!r�A���܂��Gvlm����YU�9�$�~Ht����y�(/oxy�(�w���oh5��y�Gd-���+J���y���_+�pi�fVij��|^o'8%����?����f�k��t�rA{9En:�6s�{NٜWM|�{�������9T�JԨ����:��i�/��]���s�'�in����hOo�9T�*r��-�+�D��VK>�M:��]�ϩ+�1Gy�V���;�u��}�$͆�$�7EZ����=���w�뎟�2��?CN�w?�
�l%�����5��<���Y�A��ɪ��e�z���tI�ւ�H�x�o��r�:Ɏ��Ϲ��Dq�?;9�= U�X�����3�68�����cj��{��}��t1����s�#f�i�#n�'�3$#-��f[��7ޭYl�N�tm~�ܷxڪb����ɇj����[���!�����;�v��0�)(�<����w��}9�p��Ǫb(���''z���*�_�s��F�����)�p���C��B����V{��-�7������v���=�dz<�<�DSK1=gSs�z?y{�������t�y��l���m����k��Z�R�+q.ĨSI߽~����o�t������Y9�      �   �  x��W�n�8>+O�S���ډ����I� m6Xd7آJI�H���b�En�(}���b;CJ�d[nvQ�@�X�pf��ǙOã����t48zy<�O��ᆥ���`0:���W��W��8:<��2|gw4�^z�R��E�}�G�����n	�	-@�����gY��|�υ�d|v�sxx���������i�"`�� $9��������0,��9"ѓdO2�:PO�~i�
��F�V�R}(!]`2z��Z�fw\J�J�0e\�E }vE�0�d�4�6����7�1��ge�G�]�^��	����a���N��a��.��%��o����.CO��\dLb��M .BeXʵ�o�Z��1Ƿ�,�-������|��{���I7F�]s����o�R�˼j˰y���;4�cv�m����B!V�7�ؙ�O�ŋo�E\�Om/H 4�MF�3��"ω"�ewM�=��]p�Aoko�|q�~*W��AtG�8";� %��E��w�a�V��k6�[����@B	����u)�UoJ������[���0��n����e^v���E�^I�U[C`mg�V��#��66����4ſN�2�n CKY�T�����VRt�m�C��*��vf!�q�%���X�D�+~S��u�?����1�t��&v���=l��/���0�Ҳ�SELxA��8��}�����"R,$�L�@�1�b~7���:"����m�EQ��n��J \�*�>V7�U$a��+�BI���	U��M���rp_���د*�Rhn.����KO5T	�Z����Л@��Fr�w�d[�'��)��v�$ �or�5L�Jf՗���Z ��P$4?�ّK�ks7�����=,��|R��Wj�u��=�|opg���h���]qb<h���)�YK�˛��m9C�Y��	8"���]�C�ͼ��%
otK��^>�)���D�A������aCK�Ha�3�?�4kJFJ%��-�șHUKF�]�h����t�Z��'.y�{�ks7����]�=T�D4�P>����[@��
5����f"��g�.�Iv1~w��n�_`sw�'�Q�k��]�lV���S����B�?��}6qQ� �x�޹0��*��p�k�SA��&������|��� �h�1�5:����YT��p��j<��W^bW����M� �N��vY n*l��0Wj��ll�bQQ�x�[蝣n�;��t�&*:HWӾA)��ܬq������g�߸P�����,��`�� �J�I%Kl`Ҹ�WɈ�ZF0Yqq�����+�,*�ӌ�po%_�^nYd6�/,[Ԫ9╵�u��T�j�챛tBsݜ�ݎ���Z�j���� ��R%MɛN��x[�'�����>]!�RU	kT̈�|`�_s��;v/4VK'�{)X�l��%�������НÙ         �   x���=
�@���)�5����n�	<A���B ����Z1�"�����ޠhJ�$�"Z�&4�-P�ÐI2�gbӸh�S3��~��������|��E	T8���>���p�IXƔ�"�E�*��a�H���E�U�zt\��,���nlOKDʜ���F/�%����=5D�s�Rl�         K   x�325��4�460547322�0�4202�50�50U02�26�26�31617��60 $��8l6pr� aW� ��]            x������ � �         T   x�����0�x
z���c�Y�J"@⻻��>2�
�1�8��
���}�O�fj1���wo��Ŕ��Dz��cr6� �#�      �   ^   x���9
�0 ��W�K�f7�[l�
����jg'��0�|J���	>Fa�*�0�U$���&��"ڊ}���Z��^�����R�vvx!�p҈x�@X      �   ]   x�}�1
�0F�=������&�.n
..���,����DH$��@���l$
�_������
L�E��p��|��2mw���E�j�q�#��="�      �      x������ � �      �   f   x�325��4�460547��062�4202�50�50U02�26�26�316Jk��b������9�!�	g�g����gUfIbJj�^N~rbNF~q	W� � �      �   M   x�����0k{
z�����$�P3�z��uw�1������d����b�-��^���c~���\�[��ԣ���lT      �   P   x�����0k{
z�~�q�Y����%H軻�3���ld����b�M��U���
�X����7�w���}S��,            x������ � �      �   �   x���A
�  ��+z/�u��^ĘV0T����r����:�Fڑ�NIsT̓�̬Ԡ����D��ҁ�����>��m�J�/1�lb)���>���Ç��%�p��=֭���B�����.;�            x������ � �      �      x������ � �          }   x����
�@ �ۯ����ݽV�X	��������`g;3�0�N(ځ��u�����X�����)h�n�j�R^�u9ϧ�s�_��]x/��((%6;�5�#j�٭��,ISBϯI�G�
�Gp      �   [   x���1�0����I���[��X�����X<ا��G�za�Ep:��N)�a�p7����?k$�V�q��T�[��Vߣ�oD� �f�      �   �   x����
1���)����O���-K+���2�_z\!z�t3��ǵE ��)$jb�N�	u�ԥv����|�Hi�M6wa����-�����tI�U�k��)�bim��k���M�?Șǘ_��s~2�6            x������ � �            x������ � �            x������ � �            x������ � �         �   x���I� е9E�Q"` g���j��d)�؁��`��̵U`�<��X.L��Udɒ��	�`V��4¶���lE�*��`<H|6��I��>� H� ;P d��� 5'��K��k���	��.;F@A�d4�ϋ;�N��t]RJ7u���            x������ � �            x������ � �      
      x������ � �            x������ � �      	      x������ � �            x������ � �            x������ � �            x������ � �            x������ � �      �   m   x�����0g�+�Q"�/��N|H��"Q)ЁN�z��N:��7�f3�k#a)�YO�'���b����*e��eu��W���ޗۈ}y��ˇ�خ}ܷ�N9�)��<�$Q      �   _   x�325��4�46054775�0��4B2322�0��qtq��tL�����	(@R�b@T�Y������v���r�s2�K8K �b���� y|!�      �      x������ � �      �   K   x�325��4�46054775�0��4B2322�0��,ILI��ML���s���r�s2�K����P	W� X�"�      �   �  x�ř�N1�����}�3�Y�,�$� !!�*��o���ػ˘dm'-��q������T@e�w �������������n|}8��=���z��_�o��n�~�x�7OO����ݳ7��z���o�v�Yw��!}~�� �L�o�;���Q�kC�0z���@QKc[@�����D�DWUt+��+�LƩ�;A���'���j�A��=�5=K��,w�&�K;ji���D�g>��ȇRD":�ʈ��P�(�zj؝`[fOq���{����j��,F9����E;��H�����[wt&��E�`X�мU=�ٵ;���?�<�z���V�z�zO�	��(���bYn1��@χ�^��G��k�m1.[���6f�T��5y��/��tr|)9�����j��V7���9���;9��<M⯻�LT�s:�2Ơ[Y��vug6��1.�]ʸ�ӯ9.<GrXw&?�V��뫹��s&���!�����U%�ΰf�**�Ԕ3����l���9QI�|�/��3�\��<C-4�����i�2G�<���-4��[h�sNK�����{8�_�1C���GFG���*/@�}��Ƙ3L�6���%�e�����.cæ�I��:r�'mZ��|�3&��ZM�U����J�.}`�+U����1^��#���['v���U	I����o@����6�҃Y� '��1U6X�d��/�|�I)��VQ�)�7��?��>C~��Ѳ^9��y��[���u�i-�[��5�P�7�.¤��>����ꌑ�/U�甛MU�s�{���ʈ��	#�s<�b���1m�W�_nՄ��a��\�_��^pa�=S��غ�}އ��.E�*��5���|���s��	3���Yk ݇T��w��Fmw-ze����p-r.���l���k�����YG��޼��ΜTפ�ʔ�9�F�Ҳu=צ�%(�/��7t�͝�;e��~D�����#~Wj�t��n�~��      �   c  x�E�GΣJ ��pFLZ0�l����L��>���-��JU��|���/�?of�����b�3`���vR�ݻb+w�=�c�õOFS�]7\�ɾcC�<|!>�ʄM��lN䮱���=1�L�}��T�`@��Ȉ�A3TLU�����X_e�zv�I;<7��]y9 ы�Ԇ9#�G/�^q#��J	Jѿٍ�B�_/c�e}�T]�O��d���|�O�P�ߓ���B��PU���H�/]��w�6]mCk�`��g�m�aU6H}�⫕�]>�EBj;aC���<ͅ�u:��+��^�G��¼)�����É�w%m�&?/ej򅊧�C$L߫B��/ckG�Ze)�`��'9����UD�xO������^b����[]�hXou!5=}A�e{*8y���q1�O��z~�U�u;x��}9�O���{����6Cd��5OG+듸n�����zz�pۚ��w�&��MP���ʿ\Q�cce�Y��v���x�0�R�No���t R_��EѶN�֛����l�c��B�w�?lS
��[�c��qu�&���H/j��a��NH�~Y<wRk�X����G�c~c�2$W     