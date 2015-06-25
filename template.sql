PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

-- main tables corresponding to sections in the audit log
-- required values have NOT NULL (since they must map to something), values where there may be no match are DEFAULT NULL
CREATE TABLE main                                   (UNIQUE_ID TEXT PRIMARY KEY,    HEADER TEXT,    A TEXT, B TEXT, C TEXT, D TEXT, E TEXT, F TEXT, G TEXT, H TEXT, I TEXT, J TEXT, K TEXT);
CREATE TABLE a                                      (unique_id TEXT PRIMARY KEY,    timestamp TEXT, unixtime TEXT, source_ip_id INTEGER NOT NULL, source_port_id INTEGER NOT NULL, destination_ip_id INTEGER NOT NULL, destination_port_id INTEGER NOT NULL);
CREATE TABLE b                                      (unique_id TEXT PRIMARY KEY,    request_method_id INTEGER NOT NULL, uri_id INTEGER NOT NULL,  http_version_id INTEGER DEFAULT NULL, host_id INTEGER DEFAULT NULL, connection_id INTEGER DEFAULT NULL, accept_id INTEGER DEFAULT NULL, user_agent_id INTEGER DEFAULT NULL, dnt_id INTEGER DEFAULT NULL, referrer_id INTEGER DEFAULT NULL, accept_encoding_id INTEGER DEFAULT NULL, accept_language_id INTEGER DEFAULT NULL, cookie_id INTEGER DEFAULT NULL,x_requested_with_id INTEGER DEFAULT NULL, content_type_id INTEGER DEFAULT NULL, content_length_id INTEGER DEFAULT NULL, proxy_connection_id INTEGER DEFAULT NULL, accept_charset_id INTEGER DEFAULT NULL, ua_cpu_id INTEGER DEFAULT NULL, x_forwarded_for_id INTEGER DEFAULT NULL, cache_control_id INTEGER DEFAULT NULL, via_id INTEGER DEFAULT NULL, if_modified_since_id INTEGER DEFAULT NULL, if_none_match_id INTEGER DEFAULT NULL, pragma_id INTEGER DEFAULT NULL);
CREATE TABLE f                                      (unique_id TEXT PRIMARY KEY,    http_version_id INTEGER DEFAULT NULL,  http_status_code_id INTEGER DEFAULT NULL, http_status_text_id INTEGER DEFAULT NULL, x_powered_by_id INTEGER DEFAULT NULL, expires_id INTEGER DEFAULT NULL, cache_control_id INTEGER DEFAULT NULL, pragma_id INTEGER DEFAULT NULL, vary_id INTEGER DEFAULT NULL, content_encoding_id INTEGER DEFAULT NULL, content_length_id INTEGER DEFAULT NULL, connection_id INTEGER DEFAULT NULL, content_type_id INTEGER DEFAULT NULL, status_id INTEGER DEFAULT NULL, keep_alive_id INTEGER DEFAULT NULL);
CREATE TABLE h                                      (unique_id TEXT PRIMARY KEY,    messages_id INTEGER DEFAULT NULL,  apache_handler_id INTEGER DEFAULT NULL, 	stopwatch TEXT, stopwatch2 TEXT, producer_id INTEGER DEFAULT NULL, server_id INTEGER DEFAULT NULL, engine_mode_id INTEGER DEFAULT NULL, action_id INTEGER DEFAULT NULL, apache_error_id INTEGER DEFAULT NULL, xml_parser_error_id INTEGER DEFAULT NULL);

CREATE TABLE scores                                 (unique_id TEXT PRIMARY KEY, TOTAL_SCORE INTEGER DEFAULT 0, CRS_10_SETUP INTEGER DEFAULT 0, CRS_20_PROTOCOL_VIOLATIONS INTEGER DEFAULT 0, CRS_21_PROTOCOL_ANOMALIES INTEGER DEFAULT 0, CRS_23_REQUEST_LIMITS INTEGER DEFAULT 0, CRS_30_HTTP_POLICY INTEGER DEFAULT 0, CRS_35_BAD_ROBOTS INTEGER DEFAULT 0, CRS_40_GENERIC_ATTACKS INTEGER DEFAULT 0, CRS_41_SQL_INJECTION_ATTACKS INTEGER DEFAULT 0, CRS_41_XSS_ATTACKS INTEGER DEFAULT 0, CRS_42_TIGHT_SECURITY INTEGER DEFAULT 0, CRS_45_TROJANS INTEGER DEFAULT 0, CRS_47_COMMON_EXCEPTIONS INTEGER DEFAULT 0, CRS_48_LOCAL_EXCEPTIONS INTEGER DEFAULT 0, CRS_49_INBOUND_BLOCKING INTEGER DEFAULT 0, CRS_50_OUTBOUND INTEGER DEFAULT 0, CRS_59_OUTBOUND_BLOCKING INTEGER DEFAULT 0, CRS_60_CORRELATION INTEGER DEFAULT 0, CRS_11_BRUTE_FORCE INTEGER DEFAULT 0, CRS_11_DOS_PROTECTION INTEGER DEFAULT 0, CRS_11_PROXY_ABUSE INTEGER DEFAULT 0, CRS_11_SLOW_DOS_PROTECTION INTEGER DEFAULT 0, CRS_16_SCANNER_INTEGRATION INTEGER DEFAULT 0, CRS_25_CC_TRACK_PAN INTEGER DEFAULT 0, CRS_40_APPSENSOR_DETECTION_POINT INTEGER DEFAULT 0, CRS_40_HTTP_PARAMETER_POLLUTION INTEGER DEFAULT 0, CRS_42_CSP_ENFORCEMENT INTEGER DEFAULT 0, CRS_46_SCANNER_INTEGRATION INTEGER DEFAULT 0, CRS_48_BAYES_ANALYSIS INTEGER DEFAULT 0, CRS_55_RESPONSE_PROFILING INTEGER DEFAULT 0, CRS_56_PVI_CHECKS INTEGER DEFAULT 0, CRS_61_IP_FORENSICS INTEGER DEFAULT 0, CRS_10_IGNORE_STATIC INTEGER DEFAULT 0, CRS_11_AVS_TRAFFIC INTEGER DEFAULT 0, CRS_13_XML_ENABLER INTEGER DEFAULT 0, CRS_16_AUTHENTICATION_TRACKING INTEGER DEFAULT 0, CRS_16_SESSION_HIJACKING INTEGER DEFAULT 0, CRS_16_USERNAME_TRACKING INTEGER DEFAULT 0, CRS_25_CC_KNOWN INTEGER DEFAULT 0, CRS_42_COMMENT_SPAM INTEGER DEFAULT 0, CRS_43_CSRF_PROTECTION INTEGER DEFAULT 0, CRS_46_AV_SCANNING INTEGER DEFAULT 0, CRS_47_SKIP_OUTBOUND_CHECKS INTEGER DEFAULT 0, CRS_49_HEADER_TAGGING INTEGER DEFAULT 0, CRS_55_APPLICATION_DEFECTS INTEGER DEFAULT 0, CRS_55_MARKETING INTEGER DEFAULT 0, CRS_59_HEADER_TAGGING INTEGER DEFAULT 0);

-- parameter tables
-- A
-- timestamp
CREATE TABLE source_ip                              (source_ip_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, source_ip TEXT UNIQUE NOT NULL);
CREATE TABLE source_port                            (source_port_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, source_port TEXT UNIQUE NOT NULL);
CREATE TABLE destination_ip                         (destination_ip_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, destination_ip TEXT UNIQUE NOT NULL);
CREATE TABLE destination_port                       (destination_port_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, destination_port TEXT UNIQUE NOT NULL);

-- B
CREATE TABLE request_method                         (request_method_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, request_method TEXT UNIQUE NOT NULL);
CREATE TABLE uri                                    (uri_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, uri TEXT UNIQUE NOT NULL);
CREATE TABLE http_version_b                         (http_version_b_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, http_version_b TEXT UNIQUE NOT NULL);
CREATE TABLE hosts                                  (host_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, host TEXT UNIQUE NOT NULL);
CREATE TABLE connection_b                           (connection_b_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, connection_b TEXT UNIQUE NOT NULL);
CREATE TABLE accept                                 (accept_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, accept TEXT UNIQUE NOT NULL);
CREATE TABLE user_agent                             (user_agent_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, user_agent TEXT UNIQUE NOT NULL);
CREATE TABLE dnt                                    (dnt_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, dnt TEXT UNIQUE NOT NULL);
CREATE TABLE referrer                               (referrer_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, referrer TEXT UNIQUE NOT NULL);
CREATE TABLE accept_encoding                        (accept_encoding_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, accept_encoding TEXT UNIQUE NOT NULL);
CREATE TABLE accept_language                        (accept_language_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, accept_language TEXT UNIQUE NOT NULL);
CREATE TABLE cookie                                 (cookie_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, cookie TEXT UNIQUE NOT NULL);
CREATE TABLE x_requested_with                       (x_requested_with_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, x_requested_with TEXT UNIQUE NOT NULL);
CREATE TABLE content_type_b                         (content_type_b_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, content_type_b TEXT UNIQUE NOT NULL);
CREATE TABLE content_length_b                       (content_length_b_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, content_length_b TEXT UNIQUE NOT NULL);
CREATE TABLE proxy_connection                       (proxy_connection_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, proxy_connection TEXT UNIQUE NOT NULL);
CREATE TABLE accept_charset                         (accept_charset_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, accept_charset TEXT UNIQUE NOT NULL);
CREATE TABLE ua_cpu                                 (ua_cpu_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, ua_cpu TEXT UNIQUE NOT NULL);
CREATE TABLE x_forwarded_for                        (x_forwarded_for_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, x_forwarded_for TEXT UNIQUE NOT NULL);
CREATE TABLE cache_control_b                        (cache_control_b_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, cache_control_b TEXT UNIQUE NOT NULL);
CREATE TABLE via                                    (via_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, via TEXT UNIQUE NOT NULL);
CREATE TABLE if_modified_since                      (if_modified_since_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, if_modified_since TEXT UNIQUE NOT NULL);
CREATE TABLE if_none_match                          (if_none_match_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, if_none_match TEXT UNIQUE NOT NULL);
CREATE TABLE pragma_b                               (pragma_b_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, pragma_b TEXT UNIQUE NOT NULL);

-- F
CREATE TABLE http_version_f                         (http_version_f_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, http_version_f TEXT UNIQUE NOT NULL);
CREATE TABLE http_status_code                       (http_status_code_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, http_status_code TEXT UNIQUE NOT NULL);
CREATE TABLE http_status_text                       (http_status_text_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, http_status_text TEXT UNIQUE NOT NULL);
CREATE TABLE x_powered_by                           (x_powered_by_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, x_powered_by TEXT UNIQUE NOT NULL);
CREATE TABLE expires                                (expires_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, expires TEXT UNIQUE NOT NULL);
CREATE TABLE cache_control_f                        (cache_control_f_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, cache_control_f TEXT UNIQUE NOT NULL);
CREATE TABLE pragma_f                               (pragma_f_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, pragma_f TEXT UNIQUE NOT NULL);
CREATE TABLE vary                                   (vary_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, vary TEXT UNIQUE NOT NULL);
CREATE TABLE content_encoding                       (content_encoding_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, content_encoding TEXT UNIQUE NOT NULL);
CREATE TABLE content_length_f                       (content_length_f_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, content_length_f TEXT UNIQUE NOT NULL);
CREATE TABLE connection_f                           (connection_f_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, connection_f TEXT UNIQUE NOT NULL);
CREATE TABLE content_type_f                         (content_type_f_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, content_type_f TEXT UNIQUE NOT NULL);
CREATE TABLE status                                 (status_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, status TEXT UNIQUE NOT NULL);
CREATE TABLE keep_alive                             (keep_alive_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, keep_alive TEXT UNIQUE NOT NULL);


-- H
CREATE TABLE messages                               (messages_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, messages TEXT UNIQUE NOT NULL);
CREATE TABLE apache_handler                         (apache_handler_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, apache_handler TEXT UNIQUE NOT NULL);
-- stopwatch
-- stopwatch2
CREATE TABLE producer                               (producer_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, producer TEXT UNIQUE NOT NULL);
CREATE TABLE server                                 (server_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, server TEXT UNIQUE NOT NULL);
CREATE TABLE engine_mode                            (engine_mode_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, engine_mode TEXT UNIQUE NOT NULL);
CREATE TABLE action                                 (action_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, action TEXT UNIQUE NOT NULL);
CREATE TABLE apache_error                           (apache_error_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, apache_error TEXT UNIQUE NOT NULL);
CREATE TABLE xml_parser_error                       (xml_parser_error_id INTEGER DEFAULT 0 NOT NULL PRIMARY KEY, xml_parser_error TEXT UNIQUE NOT NULL);






-- rule ID tables

CREATE TABLE CRS_10_IGNORE_STATIC                   (UNIQUE_ID TEXT PRIMARY KEY,    '900040' INTEGER DEFAULT 0 NOT NULL,    '900041' INTEGER DEFAULT 0 NOT NULL,    '900042' INTEGER DEFAULT 0 NOT NULL,    '900043' INTEGER DEFAULT 0 NOT NULL,    '999005' INTEGER DEFAULT 0 NOT NULL,    '999006' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_11_AVS_TRAFFIC                     (UNIQUE_ID TEXT PRIMARY KEY,    '981033' INTEGER DEFAULT 0 NOT NULL,    '981034' INTEGER DEFAULT 0 NOT NULL,    '981035' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_11_BRUTE_FORCE                     (UNIQUE_ID TEXT PRIMARY KEY,    '981036' INTEGER DEFAULT 0 NOT NULL,    '981037' INTEGER DEFAULT 0 NOT NULL,    '981038' INTEGER DEFAULT 0 NOT NULL,    '981039' INTEGER DEFAULT 0 NOT NULL,    '981040' INTEGER DEFAULT 0 NOT NULL,    '981041' INTEGER DEFAULT 0 NOT NULL,    '981042' INTEGER DEFAULT 0 NOT NULL,    '981043' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_11_DOS_PROTECTION                  (UNIQUE_ID TEXT PRIMARY KEY,    '981044' INTEGER DEFAULT 0 NOT NULL,    '981045' INTEGER DEFAULT 0 NOT NULL,    '981046' INTEGER DEFAULT 0 NOT NULL,    '981047' INTEGER DEFAULT 0 NOT NULL,    '981048' INTEGER DEFAULT 0 NOT NULL,    '981049' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_11_PROXY_ABUSE                     (UNIQUE_ID TEXT PRIMARY KEY,    '981050' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_11_SLOW_DOS_PROTECTION             (UNIQUE_ID TEXT PRIMARY KEY,    '981051' INTEGER DEFAULT 0 NOT NULL,    '981052' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_13_XML_ENABLER                     (UNIQUE_ID TEXT PRIMARY KEY,    '981053' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_16_AUTHENTICATION_TRACKING         (UNIQUE_ID TEXT PRIMARY KEY );
CREATE TABLE CRS_46_SCANNER_INTEGRATION             (UNIQUE_ID TEXT PRIMARY KEY,    '999003' INTEGER DEFAULT 0 NOT NULL,    '999004' INTEGER DEFAULT 0 NOT NULL,    '900030' INTEGER DEFAULT 0 NOT NULL,    '900031' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_16_SESSION_HIJACKING               (UNIQUE_ID TEXT PRIMARY KEY,    '981054' INTEGER DEFAULT 0 NOT NULL,    '981055' INTEGER DEFAULT 0 NOT NULL,    '981056' INTEGER DEFAULT 0 NOT NULL,    '981057' INTEGER DEFAULT 0 NOT NULL,    '981058' INTEGER DEFAULT 0 NOT NULL,    '981059' INTEGER DEFAULT 0 NOT NULL,    '981060' INTEGER DEFAULT 0 NOT NULL,    '981061' INTEGER DEFAULT 0 NOT NULL,    '981062' INTEGER DEFAULT 0 NOT NULL,    '981063' INTEGER DEFAULT 0 NOT NULL,    '981064' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_16_USERNAME_TRACKING               (UNIQUE_ID TEXT PRIMARY KEY,    '981075' INTEGER DEFAULT 0 NOT NULL,    '981076' INTEGER DEFAULT 0 NOT NULL,    '981077' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_20_PROTOCOL_VIOLATIONS             (UNIQUE_ID TEXT PRIMARY KEY,    '960911' INTEGER DEFAULT 0 NOT NULL,    '981227' INTEGER DEFAULT 0 NOT NULL,    '960000' INTEGER DEFAULT 0 NOT NULL,    '960912' INTEGER DEFAULT 0 NOT NULL,    '960914' INTEGER DEFAULT 0 NOT NULL,    '960915' INTEGER DEFAULT 0 NOT NULL,    '960016' INTEGER DEFAULT 0 NOT NULL,    '960011' INTEGER DEFAULT 0 NOT NULL,    '960012' INTEGER DEFAULT 0 NOT NULL,    '960902' INTEGER DEFAULT 0 NOT NULL,    '960022' INTEGER DEFAULT 0 NOT NULL,    '960020' INTEGER DEFAULT 0 NOT NULL,    '958291' INTEGER DEFAULT 0 NOT NULL,    '958230' INTEGER DEFAULT 0 NOT NULL,    '958231' INTEGER DEFAULT 0 NOT NULL,    '958295' INTEGER DEFAULT 0 NOT NULL,    '950107' INTEGER DEFAULT 0 NOT NULL,    '950109' INTEGER DEFAULT 0 NOT NULL,    '950108' INTEGER DEFAULT 0 NOT NULL,    '950801' INTEGER DEFAULT 0 NOT NULL,    '950116' INTEGER DEFAULT 0 NOT NULL,    '960014' INTEGER DEFAULT 0 NOT NULL,    '960901' INTEGER DEFAULT 0 NOT NULL,    '960018' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_21_PROTOCOL_ANOMALIES              (UNIQUE_ID TEXT PRIMARY KEY,    '960008' INTEGER DEFAULT 0 NOT NULL,    '960007' INTEGER DEFAULT 0 NOT NULL,    '960015' INTEGER DEFAULT 0 NOT NULL,    '960021' INTEGER DEFAULT 0 NOT NULL,    '960009' INTEGER DEFAULT 0 NOT NULL,    '960006' INTEGER DEFAULT 0 NOT NULL,    '960904' INTEGER DEFAULT 0 NOT NULL,    '960017' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_23_REQUEST_LIMITS                  (UNIQUE_ID TEXT PRIMARY KEY,    '960209' INTEGER DEFAULT 0 NOT NULL,    '960208' INTEGER DEFAULT 0 NOT NULL,    '960335' INTEGER DEFAULT 0 NOT NULL,    '960341' INTEGER DEFAULT 0 NOT NULL,    '960342' INTEGER DEFAULT 0 NOT NULL,    '960343' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_25_CC_KNOWN                        (UNIQUE_ID TEXT PRIMARY KEY,    '981078' INTEGER DEFAULT 0 NOT NULL,    '981079' INTEGER DEFAULT 0 NOT NULL,    '920005' INTEGER DEFAULT 0 NOT NULL,    '920007' INTEGER DEFAULT 0 NOT NULL,    '920009' INTEGER DEFAULT 0 NOT NULL,    '920011' INTEGER DEFAULT 0 NOT NULL,    '920013' INTEGER DEFAULT 0 NOT NULL,    '920015' INTEGER DEFAULT 0 NOT NULL,    '920017' INTEGER DEFAULT 0 NOT NULL,    '981080' INTEGER DEFAULT 0 NOT NULL,    '920020' INTEGER DEFAULT 0 NOT NULL,    '920006' INTEGER DEFAULT 0 NOT NULL,    '920008' INTEGER DEFAULT 0 NOT NULL,    '920010' INTEGER DEFAULT 0 NOT NULL,    '920012' INTEGER DEFAULT 0 NOT NULL,    '920014' INTEGER DEFAULT 0 NOT NULL,    '920016' INTEGER DEFAULT 0 NOT NULL,    '920018' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_25_CC_TRACK_PAN                    (UNIQUE_ID TEXT PRIMARY KEY,    '920021' INTEGER DEFAULT 0 NOT NULL,    '920022' INTEGER DEFAULT 0 NOT NULL,    '920023' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_30_HTTP_POLICY                     (UNIQUE_ID TEXT PRIMARY KEY,    '960032' INTEGER DEFAULT 0 NOT NULL,    '960010' INTEGER DEFAULT 0 NOT NULL,    '960034' INTEGER DEFAULT 0 NOT NULL,    '960035' INTEGER DEFAULT 0 NOT NULL,    '960038' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_35_BAD_ROBOTS                      (UNIQUE_ID TEXT PRIMARY KEY,    '990002' INTEGER DEFAULT 0 NOT NULL,    '990901' INTEGER DEFAULT 0 NOT NULL,    '990902' INTEGER DEFAULT 0 NOT NULL,    '990012' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_40_APPSENSOR_DETECTION_POINT       (UNIQUE_ID TEXT PRIMARY KEY,    '981082' INTEGER DEFAULT 0 NOT NULL,    '981083' INTEGER DEFAULT 0 NOT NULL,    '981084' INTEGER DEFAULT 0 NOT NULL,    '981085' INTEGER DEFAULT 0 NOT NULL,    '981086' INTEGER DEFAULT 0 NOT NULL,    '981087' INTEGER DEFAULT 0 NOT NULL,    '981088' INTEGER DEFAULT 0 NOT NULL,    '981089' INTEGER DEFAULT 0 NOT NULL,    '981090' INTEGER DEFAULT 0 NOT NULL,    '981091' INTEGER DEFAULT 0 NOT NULL,    '981092' INTEGER DEFAULT 0 NOT NULL,    '981093' INTEGER DEFAULT 0 NOT NULL,    '981094' INTEGER DEFAULT 0 NOT NULL,    '981095' INTEGER DEFAULT 0 NOT NULL,    '981096' INTEGER DEFAULT 0 NOT NULL,    '981097' INTEGER DEFAULT 0 NOT NULL,    '981103' INTEGER DEFAULT 0 NOT NULL,    '981104' INTEGER DEFAULT 0 NOT NULL,    '981110' INTEGER DEFAULT 0 NOT NULL,    '981105' INTEGER DEFAULT 0 NOT NULL,    '981098' INTEGER DEFAULT 0 NOT NULL,    '981099' INTEGER DEFAULT 0 NOT NULL,    '981100' INTEGER DEFAULT 0 NOT NULL,    '981101' INTEGER DEFAULT 0 NOT NULL,    '981102' INTEGER DEFAULT 0 NOT NULL,    '981131' INTEGER DEFAULT 0 NOT NULL,    '981132' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_40_GENERIC_ATTACKS                 (UNIQUE_ID TEXT PRIMARY KEY,    '950907' INTEGER DEFAULT 0 NOT NULL,    '960024' INTEGER DEFAULT 0 NOT NULL,    '950008' INTEGER DEFAULT 0 NOT NULL,    '950010' INTEGER DEFAULT 0 NOT NULL,    '950011' INTEGER DEFAULT 0 NOT NULL,    '950018' INTEGER DEFAULT 0 NOT NULL,    '950019' INTEGER DEFAULT 0 NOT NULL,    '950012' INTEGER DEFAULT 0 NOT NULL,    '950910' INTEGER DEFAULT 0 NOT NULL,    '950911' INTEGER DEFAULT 0 NOT NULL,    '950117' INTEGER DEFAULT 0 NOT NULL,    '950118' INTEGER DEFAULT 0 NOT NULL,    '950119' INTEGER DEFAULT 0 NOT NULL,    '950120' INTEGER DEFAULT 0 NOT NULL,    '981133' INTEGER DEFAULT 0 NOT NULL,    '950009' INTEGER DEFAULT 0 NOT NULL,    '950003' INTEGER DEFAULT 0 NOT NULL,    '950000' INTEGER DEFAULT 0 NOT NULL,    '950005' INTEGER DEFAULT 0 NOT NULL,    '950002' INTEGER DEFAULT 0 NOT NULL,    '950006' INTEGER DEFAULT 0 NOT NULL,    '959151' INTEGER DEFAULT 0 NOT NULL,    '958976' INTEGER DEFAULT 0 NOT NULL,    '958977' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_40_HTTP_PARAMETER_POLLUTION        (UNIQUE_ID TEXT PRIMARY KEY,    '900032' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_41_SQL_INJECTION_ATTACKS           (UNIQUE_ID TEXT PRIMARY KEY,    '981231' INTEGER DEFAULT 0 NOT NULL,    '981260' INTEGER DEFAULT 0 NOT NULL,    '981318' INTEGER DEFAULT 0 NOT NULL,    '981319' INTEGER DEFAULT 0 NOT NULL,    '950901' INTEGER DEFAULT 0 NOT NULL,    '981320' INTEGER DEFAULT 0 NOT NULL,    '981300' INTEGER DEFAULT 0 NOT NULL,    '981301' INTEGER DEFAULT 0 NOT NULL,    '981302' INTEGER DEFAULT 0 NOT NULL,    '981303' INTEGER DEFAULT 0 NOT NULL,    '981304' INTEGER DEFAULT 0 NOT NULL,    '981305' INTEGER DEFAULT 0 NOT NULL,    '981306' INTEGER DEFAULT 0 NOT NULL,    '981307' INTEGER DEFAULT 0 NOT NULL,    '981308' INTEGER DEFAULT 0 NOT NULL,    '981309' INTEGER DEFAULT 0 NOT NULL,    '981310' INTEGER DEFAULT 0 NOT NULL,    '981311' INTEGER DEFAULT 0 NOT NULL,    '981312' INTEGER DEFAULT 0 NOT NULL,    '981313' INTEGER DEFAULT 0 NOT NULL,    '981314' INTEGER DEFAULT 0 NOT NULL,    '981315' INTEGER DEFAULT 0 NOT NULL,    '981316' INTEGER DEFAULT 0 NOT NULL,    '981317' INTEGER DEFAULT 0 NOT NULL,    '950007' INTEGER DEFAULT 0 NOT NULL,    '950001' INTEGER DEFAULT 0 NOT NULL,    '959070' INTEGER DEFAULT 0 NOT NULL,    '959071' INTEGER DEFAULT 0 NOT NULL,    '959072' INTEGER DEFAULT 0 NOT NULL,    '950908' INTEGER DEFAULT 0 NOT NULL,    '959073' INTEGER DEFAULT 0 NOT NULL,    '981172' INTEGER DEFAULT 0 NOT NULL,    '981173' INTEGER DEFAULT 0 NOT NULL,    '981272' INTEGER DEFAULT 0 NOT NULL,    '981244' INTEGER DEFAULT 0 NOT NULL,    '981255' INTEGER DEFAULT 0 NOT NULL,    '981257' INTEGER DEFAULT 0 NOT NULL,    '981248' INTEGER DEFAULT 0 NOT NULL,    '981277' INTEGER DEFAULT 0 NOT NULL,    '981250' INTEGER DEFAULT 0 NOT NULL,    '981241' INTEGER DEFAULT 0 NOT NULL,    '981252' INTEGER DEFAULT 0 NOT NULL,    '981256' INTEGER DEFAULT 0 NOT NULL,    '981245' INTEGER DEFAULT 0 NOT NULL,    '981276' INTEGER DEFAULT 0 NOT NULL,    '981254' INTEGER DEFAULT 0 NOT NULL,    '981270' INTEGER DEFAULT 0 NOT NULL,    '981240' INTEGER DEFAULT 0 NOT NULL,    '981249' INTEGER DEFAULT 0 NOT NULL,    '981253' INTEGER DEFAULT 0 NOT NULL,    '981242' INTEGER DEFAULT 0 NOT NULL,    '981246' INTEGER DEFAULT 0 NOT NULL,    '981251' INTEGER DEFAULT 0 NOT NULL,    '981247' INTEGER DEFAULT 0 NOT NULL,    '981243' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_41_XSS_ATTACKS                     (UNIQUE_ID TEXT PRIMARY KEY,    '973336' INTEGER DEFAULT 0 NOT NULL,    '973337' INTEGER DEFAULT 0 NOT NULL,    '973338' INTEGER DEFAULT 0 NOT NULL,    '981136' INTEGER DEFAULT 0 NOT NULL,    '981018' INTEGER DEFAULT 0 NOT NULL,    '958016' INTEGER DEFAULT 0 NOT NULL,    '958414' INTEGER DEFAULT 0 NOT NULL,    '958032' INTEGER DEFAULT 0 NOT NULL,    '958026' INTEGER DEFAULT 0 NOT NULL,    '958027' INTEGER DEFAULT 0 NOT NULL,    '958054' INTEGER DEFAULT 0 NOT NULL,    '958418' INTEGER DEFAULT 0 NOT NULL,    '958034' INTEGER DEFAULT 0 NOT NULL,    '958019' INTEGER DEFAULT 0 NOT NULL,    '958013' INTEGER DEFAULT 0 NOT NULL,    '958408' INTEGER DEFAULT 0 NOT NULL,    '958012' INTEGER DEFAULT 0 NOT NULL,    '958423' INTEGER DEFAULT 0 NOT NULL,    '958002' INTEGER DEFAULT 0 NOT NULL,    '958017' INTEGER DEFAULT 0 NOT NULL,    '958007' INTEGER DEFAULT 0 NOT NULL,    '958047' INTEGER DEFAULT 0 NOT NULL,    '958410' INTEGER DEFAULT 0 NOT NULL,    '958415' INTEGER DEFAULT 0 NOT NULL,    '958022' INTEGER DEFAULT 0 NOT NULL,    '958405' INTEGER DEFAULT 0 NOT NULL,    '958419' INTEGER DEFAULT 0 NOT NULL,    '958028' INTEGER DEFAULT 0 NOT NULL,    '958057' INTEGER DEFAULT 0 NOT NULL,    '958031' INTEGER DEFAULT 0 NOT NULL,    '958006' INTEGER DEFAULT 0 NOT NULL,    '958033' INTEGER DEFAULT 0 NOT NULL,    '958038' INTEGER DEFAULT 0 NOT NULL,    '958409' INTEGER DEFAULT 0 NOT NULL,    '958001' INTEGER DEFAULT 0 NOT NULL,    '958005' INTEGER DEFAULT 0 NOT NULL,    '958404' INTEGER DEFAULT 0 NOT NULL,    '958023' INTEGER DEFAULT 0 NOT NULL,    '958010' INTEGER DEFAULT 0 NOT NULL,    '958411' INTEGER DEFAULT 0 NOT NULL,    '958422' INTEGER DEFAULT 0 NOT NULL,    '958036' INTEGER DEFAULT 0 NOT NULL,    '958000' INTEGER DEFAULT 0 NOT NULL,    '958018' INTEGER DEFAULT 0 NOT NULL,    '958406' INTEGER DEFAULT 0 NOT NULL,    '958040' INTEGER DEFAULT 0 NOT NULL,    '958052' INTEGER DEFAULT 0 NOT NULL,    '958037' INTEGER DEFAULT 0 NOT NULL,    '958049' INTEGER DEFAULT 0 NOT NULL,    '958030' INTEGER DEFAULT 0 NOT NULL,    '958041' INTEGER DEFAULT 0 NOT NULL,    '958416' INTEGER DEFAULT 0 NOT NULL,    '958024' INTEGER DEFAULT 0 NOT NULL,    '958059' INTEGER DEFAULT 0 NOT NULL,    '958417' INTEGER DEFAULT 0 NOT NULL,    '958020' INTEGER DEFAULT 0 NOT NULL,    '958045' INTEGER DEFAULT 0 NOT NULL,    '958004' INTEGER DEFAULT 0 NOT NULL,    '958421' INTEGER DEFAULT 0 NOT NULL,    '958009' INTEGER DEFAULT 0 NOT NULL,    '958025' INTEGER DEFAULT 0 NOT NULL,    '958413' INTEGER DEFAULT 0 NOT NULL,    '958051' INTEGER DEFAULT 0 NOT NULL,    '958420' INTEGER DEFAULT 0 NOT NULL,    '958407' INTEGER DEFAULT 0 NOT NULL,    '958056' INTEGER DEFAULT 0 NOT NULL,    '958011' INTEGER DEFAULT 0 NOT NULL,    '958412' INTEGER DEFAULT 0 NOT NULL,    '958008' INTEGER DEFAULT 0 NOT NULL,    '958046' INTEGER DEFAULT 0 NOT NULL,    '958039' INTEGER DEFAULT 0 NOT NULL,    '958003' INTEGER DEFAULT 0 NOT NULL,    '973300' INTEGER DEFAULT 0 NOT NULL,    '973301' INTEGER DEFAULT 0 NOT NULL,    '973302' INTEGER DEFAULT 0 NOT NULL,    '973303' INTEGER DEFAULT 0 NOT NULL,    '973304' INTEGER DEFAULT 0 NOT NULL,    '973305' INTEGER DEFAULT 0 NOT NULL,    '973306' INTEGER DEFAULT 0 NOT NULL,    '973307' INTEGER DEFAULT 0 NOT NULL,    '973308' INTEGER DEFAULT 0 NOT NULL,    '973309' INTEGER DEFAULT 0 NOT NULL,    '973310' INTEGER DEFAULT 0 NOT NULL,    '973311' INTEGER DEFAULT 0 NOT NULL,    '973312' INTEGER DEFAULT 0 NOT NULL,    '973313' INTEGER DEFAULT 0 NOT NULL,    '973314' INTEGER DEFAULT 0 NOT NULL,    '973331' INTEGER DEFAULT 0 NOT NULL,    '973315' INTEGER DEFAULT 0 NOT NULL,    '973330' INTEGER DEFAULT 0 NOT NULL,    '973327' INTEGER DEFAULT 0 NOT NULL,    '973326' INTEGER DEFAULT 0 NOT NULL,    '973346' INTEGER DEFAULT 0 NOT NULL,    '973345' INTEGER DEFAULT 0 NOT NULL,    '973324' INTEGER DEFAULT 0 NOT NULL,    '973323' INTEGER DEFAULT 0 NOT NULL,    '973322' INTEGER DEFAULT 0 NOT NULL,    '973348' INTEGER DEFAULT 0 NOT NULL,    '973321' INTEGER DEFAULT 0 NOT NULL,    '973320' INTEGER DEFAULT 0 NOT NULL,    '973318' INTEGER DEFAULT 0 NOT NULL,    '973317' INTEGER DEFAULT 0 NOT NULL,    '973347' INTEGER DEFAULT 0 NOT NULL,    '973335' INTEGER DEFAULT 0 NOT NULL,    '973334' INTEGER DEFAULT 0 NOT NULL,    '973333' INTEGER DEFAULT 0 NOT NULL,    '973344' INTEGER DEFAULT 0 NOT NULL,    '973332' INTEGER DEFAULT 0 NOT NULL,    '973329' INTEGER DEFAULT 0 NOT NULL,    '973328' INTEGER DEFAULT 0 NOT NULL,    '973316' INTEGER DEFAULT 0 NOT NULL,    '973325' INTEGER DEFAULT 0 NOT NULL,    '973319' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_42_TIGHT_SECURITY                  (UNIQUE_ID TEXT PRIMARY KEY,    '950103' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_42_COMMENT_SPAM                    (UNIQUE_ID TEXT PRIMARY KEY,    '981137' INTEGER DEFAULT 0 NOT NULL,    '981138' INTEGER DEFAULT 0 NOT NULL,    '981139' INTEGER DEFAULT 0 NOT NULL,    '981140' INTEGER DEFAULT 0 NOT NULL,    '958297' INTEGER DEFAULT 0 NOT NULL,    '999010' INTEGER DEFAULT 0 NOT NULL,    '999011' INTEGER DEFAULT 0 NOT NULL,    '950923' INTEGER DEFAULT 0 NOT NULL,    '950020' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_42_CSP_ENFORCEMENT                 (UNIQUE_ID TEXT PRIMARY KEY,    '981142' INTEGER DEFAULT 0 NOT NULL,    '960001' INTEGER DEFAULT 0 NOT NULL,    '960002' INTEGER DEFAULT 0 NOT NULL,    '960003' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_43_CSRF_PROTECTION                 (UNIQUE_ID TEXT PRIMARY KEY,    '981143' INTEGER DEFAULT 0 NOT NULL,    '981144' INTEGER DEFAULT 0 NOT NULL,    '981145' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_45_TROJANS                         (UNIQUE_ID TEXT PRIMARY KEY,    '950110' INTEGER DEFAULT 0 NOT NULL,    '950921' INTEGER DEFAULT 0 NOT NULL,    '950922' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_46_AV_SCANNING                     (UNIQUE_ID TEXT PRIMARY KEY,    '981033' INTEGER DEFAULT 0 NOT NULL,    '981034' INTEGER DEFAULT 0 NOT NULL,    '981035' INTEGER DEFAULT 0 NOT NULL,    '950115' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_47_COMMON_EXCEPTIONS               (UNIQUE_ID TEXT PRIMARY KEY,    '981020' INTEGER DEFAULT 0 NOT NULL,    '981021' INTEGER DEFAULT 0 NOT NULL,    '981022' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_47_SKIP_OUTBOUND_CHECKS            (UNIQUE_ID TEXT PRIMARY KEY,    '999008' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_48_BAYES_ANALYSIS                  (UNIQUE_ID TEXT PRIMARY KEY,    '900033' INTEGER DEFAULT 0 NOT NULL,    '900034' INTEGER DEFAULT 0 NOT NULL,    '900035' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_48_LOCAL_EXCEPTIONS                (UNIQUE_ID TEXT PRIMARY KEY );
CREATE TABLE CRS_49_HEADER_TAGGING                  (UNIQUE_ID TEXT PRIMARY KEY,    '900044' INTEGER DEFAULT 0 NOT NULL,    '900045' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_49_INBOUND_BLOCKING                (UNIQUE_ID TEXT PRIMARY KEY,    '981175' INTEGER DEFAULT 0 NOT NULL,    '981176' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_50_OUTBOUND                        (UNIQUE_ID TEXT PRIMARY KEY,    '970007' INTEGER DEFAULT 0 NOT NULL,    '970008' INTEGER DEFAULT 0 NOT NULL,    '970009' INTEGER DEFAULT 0 NOT NULL,    '970010' INTEGER DEFAULT 0 NOT NULL,    '970012' INTEGER DEFAULT 0 NOT NULL,    '970903' INTEGER DEFAULT 0 NOT NULL,    '970016' INTEGER DEFAULT 0 NOT NULL,    '970018' INTEGER DEFAULT 0 NOT NULL,    '970901' INTEGER DEFAULT 0 NOT NULL,    '970021' INTEGER DEFAULT 0 NOT NULL,    '970011' INTEGER DEFAULT 0 NOT NULL,    '981177' INTEGER DEFAULT 0 NOT NULL,    '981000' INTEGER DEFAULT 0 NOT NULL,    '981001' INTEGER DEFAULT 0 NOT NULL,    '981003' INTEGER DEFAULT 0 NOT NULL,    '981004' INTEGER DEFAULT 0 NOT NULL,    '981005' INTEGER DEFAULT 0 NOT NULL,    '981006' INTEGER DEFAULT 0 NOT NULL,    '981007' INTEGER DEFAULT 0 NOT NULL,    '981178' INTEGER DEFAULT 0 NOT NULL,    '970014' INTEGER DEFAULT 0 NOT NULL,    '970015' INTEGER DEFAULT 0 NOT NULL,    '970902' INTEGER DEFAULT 0 NOT NULL,    '970002' INTEGER DEFAULT 0 NOT NULL,    '970003' INTEGER DEFAULT 0 NOT NULL,    '970004' INTEGER DEFAULT 0 NOT NULL,    '970904' INTEGER DEFAULT 0 NOT NULL,    '970013' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_55_APPLICATION_DEFECTS             (UNIQUE_ID TEXT PRIMARY KEY,    '981219' INTEGER DEFAULT 0 NOT NULL,    '981220' INTEGER DEFAULT 0 NOT NULL,    '981221' INTEGER DEFAULT 0 NOT NULL,    '981222' INTEGER DEFAULT 0 NOT NULL,    '981223' INTEGER DEFAULT 0 NOT NULL,    '981224' INTEGER DEFAULT 0 NOT NULL,    '981238' INTEGER DEFAULT 0 NOT NULL,    '981235' INTEGER DEFAULT 0 NOT NULL,    '981184' INTEGER DEFAULT 0 NOT NULL,    '981236' INTEGER DEFAULT 0 NOT NULL,    '981185' INTEGER DEFAULT 0 NOT NULL,    '981239' INTEGER DEFAULT 0 NOT NULL,    '900046' INTEGER DEFAULT 0 NOT NULL,    '981400' INTEGER DEFAULT 0 NOT NULL,    '981401' INTEGER DEFAULT 0 NOT NULL,    '981402' INTEGER DEFAULT 0 NOT NULL,    '981403' INTEGER DEFAULT 0 NOT NULL,    '981404' INTEGER DEFAULT 0 NOT NULL,    '981405' INTEGER DEFAULT 0 NOT NULL,    '981406' INTEGER DEFAULT 0 NOT NULL,    '981407' INTEGER DEFAULT 0 NOT NULL,    '900048' INTEGER DEFAULT 0 NOT NULL,    '981180' INTEGER DEFAULT 0 NOT NULL,    '981181' INTEGER DEFAULT 0 NOT NULL,    '981182' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_55_RESPONSE_PROFILING              (UNIQUE_ID TEXT PRIMARY KEY,    '981187' INTEGER DEFAULT 0 NOT NULL,    '981189' INTEGER DEFAULT 0 NOT NULL,    '981190' INTEGER DEFAULT 0 NOT NULL,    '981191' INTEGER DEFAULT 0 NOT NULL,    '981192' INTEGER DEFAULT 0 NOT NULL,    '981193' INTEGER DEFAULT 0 NOT NULL,    '981194' INTEGER DEFAULT 0 NOT NULL,    '981195' INTEGER DEFAULT 0 NOT NULL,    '981196' INTEGER DEFAULT 0 NOT NULL,    '981197' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_55_MARKETING                       (UNIQUE_ID TEXT PRIMARY KEY,    '910008' INTEGER DEFAULT 0 NOT NULL,    '910007' INTEGER DEFAULT 0 NOT NULL,    '910006' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_56_PVI_CHECKS                      (UNIQUE_ID TEXT PRIMARY KEY,    '981198' INTEGER DEFAULT 0 NOT NULL,    '981199' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_59_OUTBOUND_BLOCKING               (UNIQUE_ID TEXT PRIMARY KEY,    '981200' INTEGER DEFAULT 0 NOT NULL);
CREATE TABLE CRS_60_CORRELATION                     (UNIQUE_ID TEXT PRIMARY KEY,    '981201' INTEGER DEFAULT 0 NOT NULL,    '981202' INTEGER DEFAULT 0 NOT NULL,    '981203' INTEGER DEFAULT 0 NOT NULL,    '981204' INTEGER DEFAULT 0 NOT NULL,    '981205' INTEGER DEFAULT 0 NOT NULL	);
CREATE TABLE CRS_61_IP_FORENSICS                    (UNIQUE_ID TEXT PRIMARY KEY,    '900036' INTEGER DEFAULT 0 NOT NULL,    '900037' INTEGER DEFAULT 0 NOT NULL,    '900039' INTEGER DEFAULT 0 NOT NULL	);




COMMIT;
