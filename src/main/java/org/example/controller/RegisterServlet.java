package org.example.controller;

// Nhập các thư viện cần thiết để xử lý Servlet và truy vấn dữ liệu người dùng
import jakarta.servlet.ServletException; // Xử lý ngoại lệ liên quan đến Servlet
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet; // Định nghĩa URL mà Servlet sẽ xử lý
import jakarta.servlet.http.HttpServlet; // Lớp cơ sở để tạo Servlet xử lý HTTP
import jakarta.servlet.http.HttpServletRequest; // Nhận thông tin yêu cầu từ client (trình duyệt)
import jakarta.servlet.http.HttpServletResponse; // Gửi phản hồi từ server về client
import jakarta.servlet.http.Part;
import org.example.DAO.ProvinceDAO;
import org.example.DAO.ProvinceDAOImpl;
import org.example.model.Provinces;
import org.example.model.User; // Lớp mô hình đại diện cho thông tin người dùng
import org.example.DAO.UserDAO; // Giao diện để truy vấn dữ liệu người dùng
import org.example.DAO.UserDAOImpl; // Lớp triển khai cụ thể của UserDAO

import java.io.BufferedReader;
import java.io.IOException; // Xử lý ngoại lệ liên quan đến đầu vào/đầu ra
import java.io.InputStreamReader;
import java.time.LocalDateTime; // Lớp để lấy thời gian hiện tại cho trường createdAt
import java.util.List;
import java.util.stream.Collectors;

// Định nghĩa Servlet và ánh xạ tới URL "/register" để xử lý yêu cầu đăng ký
@WebServlet("/register")
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    // Phương thức doPost xử lý yêu cầu POST khi người dùng gửi form đăng ký
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Tác dụng: Lấy thông tin username và password từ form đăng ký mà người dùng gửi lên
        String username = getPartAsString(request.getPart("username"));
        String password = getPartAsString(request.getPart("password"));
        String email = getPartAsString(request.getPart("email"));
        Part avatarPart = request.getPart("avatar"); // Handle file upload
        String province = getPartAsString(request.getPart("province"));

        ProvinceDAO provinceDAO = new ProvinceDAOImpl();
        List<Provinces> provinces = provinceDAO.getAllProvinces(); // <-- Load lại danh sách tỉnh
        request.setAttribute("provinces", provinces); // <-- Đặt lại attribute để tránh dropdown bị mất

        // Các phần kiểm tra hợp lệ
        System.out.println("DEBUG: Submitted province = " + province);
        System.out.println("DEBUG: provinces size = " + provinces.size());
        for (Provinces p : provinces) {
            System.out.println("DEBUG: province id = " + p.getIdProvince() + ", name = " + p.getNameProvince());
        }


        if (province == null || province.trim().isEmpty() || province.equals("0")) {
            request.setAttribute("error", "Province không hợp lệ");
            request.setAttribute("username", username);
            request.setAttribute("email", email);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }

        int provinceId = Integer.parseInt(province);

        String avatar = null;
        if (avatarPart != null && avatarPart.getSize() > 0) {
            String fileName = avatarPart.getSubmittedFileName();
            // Save the file to a directory (e.g., "uploads" folder in your project)
            String uploadPath = getServletContext().getRealPath("") + "uploads";
            java.io.File uploadDir = new java.io.File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            String filePath = uploadPath + java.io.File.separator + fileName;
            avatarPart.write(filePath);
            avatar = "/uploads/" + fileName; // Store the relative path
        }

        // Tác dụng: Khởi tạo đối tượng UserDAO để tương tác với cơ sở dữ liệu
        UserDAO userDAO = new UserDAOImpl();

        try {
            // Tác dụng: Kiểm tra xem username đã tồn tại trong cơ sở dữ liệu chưa
            try {
                // userDAO.findByUsername: Tìm người dùng theo username, trả về User nếu tồn tại
                User existingUser = userDAO.findByUsername(username);

                // Tác dụng: Nếu username đã tồn tại, thông báo lỗi và hiển thị lại trang đăng ký
                if (existingUser != null) {
                    request.setAttribute("error", "Username đã tồn tại!");
                    request.setAttribute("username", username);
                    request.setAttribute("email", email);
                    request.setAttribute("province", province);
                    request.getRequestDispatcher("/register.jsp").forward(request, response);
                    return;
                }

                // Kiểm tra xem email đã tồn tại chưa
                boolean isEmailExists = userDAO.checkEmailExists(email);

                if (isEmailExists) {
                    request.setAttribute("error", "Email đã tồn tại!");
                    request.setAttribute("username", username);
                    request.setAttribute("email", email);
                    request.setAttribute("province", province);
                    request.getRequestDispatcher("/register.jsp").forward(request, response);
                    return;
                }
            } catch (ServletException e) {
                throw new RuntimeException(e); // Ném ngoại lệ nếu có lỗi trong quá trình kiểm tra
            } catch (IOException e) {
                throw new RuntimeException(e); // Ném ngoại lệ nếu có lỗi đầu vào/đầu ra
            }

            // Tác dụng: Tạo một đối tượng User mới để lưu thông tin người dùng vừa đăng ký
            User newUser = new User();
            newUser.setUsername(username); // Gán username từ form
            newUser.setPassword(password); // Gán password từ form
            newUser.setEmail(email);  // Set email từ form
            newUser.setAvatar(avatar);  // Set avatar từ form (nếu có)
            newUser.setProvinceId(provinceId);  // Set provinceId cho User
            newUser.setRole("USER"); // Tác dụng: Gán vai trò mặc định là "USER" cho người dùng mới
            newUser.setCreatedAt(LocalDateTime.now()); // Tác dụng: Gán thời gian tạo tài khoản là thời điểm hiện tại

            // Tác dụng: Lưu thông tin người dùng mới vào cơ sở dữ liệu
            userDAO.save(newUser);

            // Tác dụng: Chuyển hướng người dùng đến trang đăng nhập sau khi đăng ký thành công
            response.sendRedirect(request.getContextPath() + "/login");

        } catch (Exception e) {
            // Tác dụng: Xử lý lỗi nếu có vấn đề trong quá trình đăng ký (ví dụ: lỗi cơ sở dữ liệu)
            request.setAttribute("error", "Đã xảy ra lỗi khi đăng ký!"); // Lưu thông báo lỗi
            request.getRequestDispatcher("/register.jsp").forward(request, response); // Chuyển tiếp về trang đăng ký
            e.printStackTrace(); // In chi tiết lỗi ra console để debug
        }
    }

    // Phương thức doGet xử lý yêu cầu GET để hiển thị trang đăng ký
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy danh sách các tỉnh từ database
        ProvinceDAO provinceDAO = new ProvinceDAOImpl();
        List<Provinces> provinces = provinceDAO.getAllProvinces();

        // Gửi danh sách provinces vào request để hiển thị trong register.jsp
        request.setAttribute("provinces", provinces);
        // Tác dụng: Chuyển tiếp (forward) yêu cầu đến file register.jsp để hiển thị giao diện đăng ký
        // Người dùng sẽ thấy form đăng ký khi truy cập URL /register
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    private String getPartAsString(Part part) throws IOException {
        if (part == null) {
            return null;
        }
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(part.getInputStream(), "UTF-8"))) {
            return reader.lines().collect(Collectors.joining(System.lineSeparator()));
        }
    }
}