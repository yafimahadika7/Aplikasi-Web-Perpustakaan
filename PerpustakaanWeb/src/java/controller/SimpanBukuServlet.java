package controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "SimpanBukuServlet", urlPatterns = {"/SimpanBukuServlet"})
public class SimpanBukuServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String judul = request.getParameter("judul");
        String penulis = request.getParameter("penulis");
        String penerbit = request.getParameter("penerbit");
        String tahun = request.getParameter("tahun");

        try (Connection conn = KoneksiDB.getConnection()) {
            String sql = "INSERT INTO buku (judul, penulis, penerbit, tahun_terbit) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, judul);
            stmt.setString(2, penulis);
            stmt.setString(3, penerbit);
            stmt.setString(4, tahun);
            stmt.executeUpdate();

            // Kirim modal sukses dengan Bootstrap
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html><head>");
            out.println("<title>Sukses</title>");
            out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' rel='stylesheet'/>");
            out.println("<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js'></script>");
            out.println("</head><body class='bg-light'>");

            out.println("<div class='modal show d-block' tabindex='-1'>");
            out.println("  <div class='modal-dialog modal-dialog-centered'>");
            out.println("    <div class='modal-content shadow'>");
            out.println("      <div class='modal-header bg-success text-white'>");
            out.println("        <h5 class='modal-title'>Sukses</h5>");
            out.println("      </div>");
            out.println("      <div class='modal-body'>");
            out.println("        <p>Data buku berhasil disimpan!</p>");
            out.println("      </div>");
            out.println("      <div class='modal-footer'>");
            out.println("        <a href='form_buku.jsp' class='btn btn-primary'>OK</a>");
            out.println("      </div>");
            out.println("    </div>");
            out.println("  </div>");
            out.println("</div>");

            out.println("</body></html>");

        } catch (SQLException e) {
            throw new ServletException("Gagal menyimpan data buku: " + e.getMessage());
        }
    }
}