$(CXX) = g++
# compiler
# ignores -Wall warnings
# -pedantic warns on language extension
# -Werror turns warnings into errors
# -g enable debugging
CFLAGS=-Wall -pedantic -Werror -g
# look in current directory for include files
CPPFLAGS=-I.
LDFLAGS=-lm
# delete without asking
RM=rm -f

TARGET=readpng
SOURCES=$(wildcard *.cpp)
HEADERS=$(wildcard *.h)
OBJECTS=$(patsubst %.c, %.o,$(SOURCES))

all: $(TARGET)

# regular pattern
%: %.cpp
	$(CXX) $(CFLAGS) $(LDFLAGS) $< -o $@ -lpng -lz

# target
$(TARGET): $(OBJECTS)
	$(CXX) $(CFLAGS) $(LDFLAGS) $^ -o $@ -lpng -lz

# clean up
clean:
	$(RM) $(TARGET) $(OBJECTS)

