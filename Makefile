# Ten trinh bien dich C++
CXX = g++

# Co bien dich:
CXXFLAGS = -I../class -std=c++11 -Wall -Wextra -g

# Co lien ket thu vien:
LDFLAGS = -lssl -lcrypto

# Thu muc chua file nguon
SRC_DIR = src

# Ten file thuc thi
EXECUTABLE = E-Wallet
SOURCES = $(SRC_DIR)/main.cpp $(SRC_DIR)/user.cpp $(SRC_DIR)/wallet.cpp

# Tao file object (.o)
OBJECTS = $(SOURCES:.cpp=.o)

all: $(EXECUTABLE)

# Tao file thuc thi
$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(OBJECTS) -o $(EXECUTABLE) $(LDFLAGS)
	@echo "Bien dich hoan tat. Chay chương trinh bang lenh: ./$(EXECUTABLE)"

# Bien dich .cpp thanh .o
$(SRC_DIR)/main.cpp.o: $(SRC_DIR)/main.cpp ../class/user.h ../class/wallet.h
	$(CXX) $(CXXFLAGS) -c $(SRC_DIR)/main.cpp -o $(SRC_DIR)/main.cpp.o

$(SRC_DIR)/user.cpp.o: $(SRC_DIR)/user.cpp ../class/user.h ../class/wallet.h
	$(CXX) $(CXXFLAGS) -c $(SRC_DIR)/user.cpp -o $(SRC_DIR)/user.cpp.o

$(SRC_DIR)/wallet.cpp.o: $(SRC_DIR)/wallet.cpp ../class/wallet.h ../class/user.h
	$(CXX) $(CXXFLAGS) -c $(SRC_DIR)/wallet.cpp -o $(SRC_DIR)/wallet.cpp.o

# Don dep
clean:
	rm -f $(OBJECTS) $(EXECUTABLE) $(SRC_DIR)/*.o
	@echo "Don dep hoan tat."

.PHONY: all clean
