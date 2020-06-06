create or replace package debugmonitor.utils is

  procedure debugMonitor(a_text in varchar2, a_file in varchar2 := null);

end;
/
create or replace package body debugmonitor.utils is

  -------------------------------------------------------------------------------------
  procedure debugMonitor(a_text varchar2, a_file in varchar2 := null) is
    req            utl_http.req;
    res            utl_http.resp;
    base_url       varchar2(4000) := 'http://192.168.1.202:4321/?';
    full_url       varchar2(4000);    
    buffer         varchar2(4000);
    detailed_error varchar2(4000);
  begin
    --/*
    UTL_HTTP.set_response_error_check(false);
  
    full_url := utl_url.escape(base_url || '&msg=' || a_text);
    if a_file is not null then
      full_url := utl_url.escape(base_url || '&msg=' || a_text || '&file=' || a_file);
    end if;
  
    req := utl_http.begin_request(full_url, 'GET', UTL_HTTP.HTTP_VERSION_1_1);
    utl_http.set_header(req, 'user-agent', 'oracle database server');
    res := utl_http.get_response(req);
    utl_http.read_line(res, buffer);
    utl_http.end_response(res);
  exception
    when utl_http.end_of_body then
      utl_http.end_response(res);
    when others then
      select utl_http.get_detailed_sqlerrm into detailed_error from dual;
      raise_application_error(-20001,
                              'An error was encountered - ' || SQLCODE || ' -ERROR- ' || SQLERRM || ' detailed_error=' ||
                               detailed_error);
      --*/                              
      null;
  end debugMonitor;

end;
/
