HDDRIVER will set the IDE flag of the
_MCH cookie on an STE equipped with IDE
drives.

Some software (game patches etc) test
the full longword of _MCH and sometimes
misidentify an STE with IDE as ST/FM.

While normally not a problem, this
sometimes results in STE features being
disabled.

This small program clears the IDE flag.
Execute it before running a game or
copy it to your AUTO folder.

; vim: set ts=4 expandtab cc=40 :
