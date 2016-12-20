$(CXX) = g++
#LDFLAGS=-lm
RM=rm -f

TARGET=hq4x
SOURCES=$(wildcard *.cpp)
HEADERS=$(wildcard *.h)
OBJECTS=$(patsubst %.c, %.o,$(SOURCES))

devil_cflags := $(shell pkg-config --cflags IL)
devil_libs := $(shell pkg-config --libs IL)

CXXFLAGS := -O0 -g -Wall -Wextra $(devil_cflags)
LIBS := $(devil_libs)


all: $(TARGET)

# regular pattern
%: %.cpp
	$(CXX) $(LDFLAGS) $< -o $@ $(LIBS)

# target
$(TARGET): $(OBJECTS)
	$(CXX) $(LDFLAGS) $^ -o $@ $(LIBS)

# clean up
clean:
	$(RM) $(TARGET) $(OBJECTS)

