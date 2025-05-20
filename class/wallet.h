#ifndef WALLET_H
#define WALLET_H

#include <string>
#include <vector>

class User;

// Định nghĩa cấu trúc ví điểm thưởng liên kết với người dùng
class Wallet {
public:
    std::string walletID;
    double balance;
    std::vector<std::string> transactionLog;

    Wallet(std::string id, double b = 0.0);  // Constructor khởi tạo ví với ID và số dư
};

// Ghi danh sách ví ra tập tin lưu trữ (bao gồm cả lịch sử giao dịch)
void saveWallets(const std::vector<Wallet>& wallets, const std::string& relativeFilename);


// Tải toàn bộ thông tin ví từ tập tin đã lưu (đọc cả lịch sử giao dịch nếu có)
std::vector<Wallet> loadWallets(const std::string& relativeFilename); // tai danh sach vi

// Chuyển điểm
void transferPoints(User& sender, std::vector<User>& users, std::vector<Wallet>& wallets);

// Xem số dư ví
void viewWallet(const User& user, const std::vector<Wallet>& wallets);

#endif
