CXX=g++
CFLAGS=-Wall -std=c++11 -Iinclude
SYS:=$(shell uname -s)
ARCH:= $(shell uname -m)

LDFLAGS=-Llib -lfmod -lfmodL -rpath @executable_path/lib

ARCHFLAGS=-arch x86_64

ifeq ($(SYS),Darwin)
	ifeq ($(ARCH),arm64)
		ARCHFLAGS+=-arch arm64
	endif
endif

# CFLAGS += -v
SRCDIR = src
OBJDIR = obj

SOURCES = $(wildcard $(SRCDIR)/*.cpp)
OBJECTS = $(patsubst $(SRCDIR)/%.cpp,$(OBJDIR)/%.o,$(SOURCES))

$(shell mkdir -p obj)


$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CXX) $(CFLAGS) -c $(ARCHFLAGS) -o $@ $<

fmod_start: $(OBJECTS)
	$(CXX) $(LDFLAGS) -o $@ $^

clean:
	rm -f $(OBJDIR)/*.o fmod_start 