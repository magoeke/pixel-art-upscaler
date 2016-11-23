$(CXX) = g++
RM=rm -f

TARGET=nearest_neighbor
SOURCES=$(wildcard *.cpp)
HEADERS=$(wildcard *.h)
OBJECTS=$(patsubst %.c, %.o,$(SOURCES))

all: $(TARGET)

# regular pattern
%: %.cpp
	$(CXX) `Magick++-config --cxxflags --cppflags` $< -o $@ `Magick++-config --ldflags --libs`

# target
$(TARGET): $(OBJECTS)
	$(CXX) `Magick++-config --cxxflags --cppflags` -O2 $^ -o $@ `Magick++-config --ldflags --libs`

# clean up
clean:
	$(RM) $(TARGET) $(OBJECTS)

