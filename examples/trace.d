#!/usr/sbin/dtrace -Zvqs

struct pinfo{
  uint64_t cpu;
  uint64_t timestamp;
  uint64_t elapsed;
};

struct pinfo p[string];
self string event;

dtrace:::BEGIN
{
  printf("Tracing... Hit Ctrl-C to end.\n");
}

eventmachine$target:::event-entry
{
  self->event = copyinstr(arg1);
  p[self->event].cpu = cpu;
  p[self->event].timestamp = timestamp;
}

eventmachine$target:::event-return
{
  p[self->event].elapsed = timestamp - p[self->event].timestamp;
  @bt[self->event, ustack(10)] = count();
  @num[self->event] = count();
  @eavg[self->event] = avg(p[self->event].elapsed);
  @esum[self->event] = sum(p[self->event].elapsed);
  @edist[self->event] = quantize((p[self->event].elapsed / 1000));
}

dtrace:::END
{
  normalize(@eavg, 1000);
  normalize(@esum, 1000);
  printf("ELAPSED TIME DISTRIBUTION, %s\n", execname);
  printa(@edist);
  setopt("aggsortpos", "2");
  printf("%-24s %6s %10s %12s\n", "FUNC", "COUNT", "AVG(us)", "SUM(us)");
  printa("%-24.24s %@6d %@10d %@12d\n", @num, @eavg, @esum);
  printa(@bt);
}