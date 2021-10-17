package controller;

import models.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer_list")
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Nguyễn Ngọc Lê Phúc", "04-10-2000", "Quảng Bình", "https://i.pinimg.com/236x/8f/49/bb/8f49bb8c373416eb5aade0d44efdeb49.jpg"));
        customerList.add(new Customer("Nguyễn Lê Hoài Như", "19-9-1996", "Quảng Bình", "https://luv.vn/wp-content/uploads/2021/08/hinh-anh-gai-xinh-2.jpg"));
        customerList.add(new Customer("Mai Công Tâm", "10-10-1990", "Quảng Bình", "https://sohanews.sohacdn.com/2017/photo-26-1512916425394.jpg"));
        customerList.add(new Customer("Hồ Quốc Kiên", "10-1-1999", "Quảng Nam", "http://mcvideomd1fr.keeng.net/playnow/images/channel/avatar/20190518/84399908980_20190518174857.jpg"));

        request.setAttribute("customerListServlet", customerList);
        request.getRequestDispatcher("list_customer.jsp").forward(request,response);
    }
}

