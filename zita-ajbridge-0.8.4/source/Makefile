# ----------------------------------------------------------------------------
#
#  Copyright (C) 2012-2018 Fons Adriaensen <fons@linuxaudio.org>
#    
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# ----------------------------------------------------------------------------


PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
MANDIR ?= /usr/share/man/man1

VERSION = 0.8.4
CPPFLAGS +=  -MMD -MP -DVERSION=\"$(VERSION)\"
CXXFLAGS += -O2 -Wall


all:	zita-a2j zita-j2a zita-ajbridge.1.gz zita-a2j.1.gz zita-j2a.1.gz 


ZITA-A2J_O = zita-a2j.o alsathread.o jackclient.o pxthread.o lfqueue.o
$(ZITA-A2J_O):
-include $(ZITA-A2J_O:%.o=%.d)
zita-a2j:	CPPFLAGS += -DAPPNAME=\"zita-a2j\"
zita-a2j:	LDLIBS += -lzita-resampler -lzita-alsa-pcmi -ljack -lasound -lpthread -lm -lrt
zita-a2j:	$(ZITA-A2J_O)
	$(CXX) $(LDFLAGS) -o $@ $(ZITA-A2J_O) $(LDLIBS)


ZITA-J2A_O = zita-j2a.o alsathread.o jackclient.o pxthread.o lfqueue.o
$(ZITA-J2A_O):
-include $(ZITA-J2A_O:%.o=%.d)
zita-j2a:	CPPFLAGS += -DAPPNAME=\"zita-j2a\"
zita-j2a:	LDLIBS += -lzita-resampler -lzita-alsa-pcmi -ljack -lasound -lpthread -lm -lrt
zita-j2a:	$(ZITA-J2A_O)
	$(CXX) $(LDFLAGS) -o $@ $(ZITA-J2A_O) $(LDLIBS)


zita-ajbridge.1.gz:	zita-ajbridge.1
	gzip -c zita-ajbridge.1 > zita-ajbridge.1.gz

zita-a2j.1.gz:	zita-a2j.1
	gzip -c zita-a2j.1 > zita-a2j.1.gz

zita-j2a.1.gz:	zita-j2a.1
	gzip -c zita-j2a.1 > zita-j2a.1.gz


install:	all
	install -d $(DESTDIR)$(BINDIR)
	install -d $(DESTDIR)$(MANDIR)
	install -m 755 zita-a2j $(DESTDIR)$(BINDIR)
	install -m 755 zita-j2a $(DESTDIR)$(BINDIR)
	install -m 644 zita-ajbridge.1.gz $(DESTDIR)$(MANDIR)
	install -m 644 zita-a2j.1.gz $(DESTDIR)$(MANDIR)
	install -m 644 zita-j2a.1.gz $(DESTDIR)$(MANDIR)


uninstall:
	/bin/rm -f  $(DESTDIR)$(BINDIR)/zita-a2j
	/bin/rm -f  $(DESTDIR)$(BINDIR)/zita-j2a
	/bin/rm -f  $(DESTDIR)$(MANDIR)/zita-ajbridge.1.gz
	/bin/rm -f  $(DESTDIR)$(MANDIR)/zita-a2j.1.gz
	/bin/rm -f  $(DESTDIR)$(MANDIR)/zita-j2a.1.gz


clean:
	/bin/rm -f *~ *.o *.a *.d *.so *.gz
	/bin/rm -f zita-a2j zita-j2a

