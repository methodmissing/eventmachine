if find_library('dtrace', 'dtrace_open')
  add_define('INSTRUMENT_DTRACE')
  # XXX clean generated probes.h as well
  system("dtrace -v -h -o #{File.dirname(__FILE__)}/../probes.h -s #{File.dirname(__FILE__)}/probes.d")
end