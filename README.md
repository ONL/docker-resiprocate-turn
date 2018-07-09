# docker-resiprocate-turn
The reSIProcate TURN Server

## Required config changes
Please edit the following paragraphs in the config file

```
# The starting port number to use for TURN allocations.
# This number MUST be an even number, in order to ensure
# proper operation for allocation of RTP port pairs.
# Default: 49152 (start of the Dynamic and/or Private Port range
#                 - recommended by RFC)
AllocationPortRangeMin = 49152

# The ending port number to use for TURN allocations.
# This number MUST be an odd number, in order to ensure
# proper operation for allocation of RTP port pairs.
# Default: 65535 (end of the Dynamic and/or Private Port range
#                 - recommended by RFC)
AllocationPortRangeMax = 65535
```

You have to bind this port range in `docker run`, because they are not exposed in the image.
