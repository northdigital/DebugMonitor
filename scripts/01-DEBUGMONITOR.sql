-- login as sys

create user DEBUGMONITOR identified externally;

grant execute on utl_http to DEBUGMONITOR with grant option;

/*
BEGIN DBMS_NETWORK_ACL_ADMIN.DROP_ACL(acl => '/sys/acls/DEBUGMONITOR-default.xml'); END;
BEGIN DBMS_NETWORK_ACL_ADMIN.DROP_ACL(acl => '/sys/acls/DEBUGMONITOR-windows.xml'); END;
BEGIN DBMS_NETWORK_ACL_ADMIN.DROP_ACL(acl => '/sys/acls/DEBUGMONITOR-linux.xml'); END;
*/

BEGIN
  DBMS_NETWORK_ACL_ADMIN.create_acl(acl => 'DEBUGMONITOR-default.xml', 
                                    description => 'ACL for GDPR',
                                    PRINCIPAL => 'DEBUGMONITOR', 
                                    is_grant => TRUE, 
                                    privilege => 'connect',
                                    start_date => SYSTIMESTAMP, 
                                    end_date => NULL);
  
  DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(acl => 'DEBUGMONITOR-default.xml', 
                                       principal => 'DEBUGMONITOR', 
                                       is_grant => true,
                                       privilege => 'connect');

  DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(acl => 'DEBUGMONITOR-default.xml', 
                                       principal => 'DEBUGMONITOR', 
                                       is_grant => true,
                                       privilege => 'resolve');

  dbms_network_acl_admin.assign_acl(acl => 'DEBUGMONITOR-default.xml', 
                                    host => /*node host*/ '192.168.1.202', 
                                    lower_port => 4321, 
                                    upper_port => null);
END;

BEGIN
  DBMS_NETWORK_ACL_ADMIN.create_acl(acl => 'DEBUGMONITOR-windows.xml', 
                                    description => 'ACL for GDPR',
                                    PRINCIPAL => 'DEBUGMONITOR', 
                                    is_grant => TRUE, 
                                    privilege => 'connect',
                                    start_date => SYSTIMESTAMP, 
                                    end_date => NULL);
  
  DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(acl => 'DEBUGMONITOR-windows.xml', 
                                       principal => 'DEBUGMONITOR', 
                                       is_grant => true,
                                       privilege => 'connect');

  DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(acl => 'DEBUGMONITOR-windows.xml', 
                                       principal => 'DEBUGMONITOR', 
                                       is_grant => true,
                                       privilege => 'resolve');

  dbms_network_acl_admin.assign_acl(acl => 'DEBUGMONITOR-windows.xml', 
                                    host => /*node host*/ '192.168.1.202', 
                                    lower_port => 4321, 
                                    upper_port => null);
END;

BEGIN
  DBMS_NETWORK_ACL_ADMIN.create_acl(acl => 'DEBUGMONITOR-linux.xml', 
                                    description => 'ACL for GDPR',
                                    PRINCIPAL => 'DEBUGMONITOR', 
                                    is_grant => TRUE, 
                                    privilege => 'connect',
                                    start_date => SYSTIMESTAMP, 
                                    end_date => NULL);
  
  DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(acl => 'DEBUGMONITOR-linux.xml', 
                                       principal => 'DEBUGMONITOR', 
                                       is_grant => true,
                                       privilege => 'connect');

  DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(acl => 'DEBUGMONITOR-linux.xml', 
                                       principal => 'DEBUGMONITOR', 
                                       is_grant => true,
                                       privilege => 'resolve');

  dbms_network_acl_admin.assign_acl(acl => 'DEBUGMONITOR-linux.xml', 
                                    host => /*node host*/ '192.168.1.237', 
                                    lower_port => 4321, 
                                    upper_port => null);
END;

/*
select * from dba_network_acls;
select * from dba_network_acl_privileges;
*/

