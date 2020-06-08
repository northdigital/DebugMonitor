create or replace package              debugmonitor.utils is

  procedure debugMonitor(a_text in varchar2, a_file in varchar2 := null);

end;