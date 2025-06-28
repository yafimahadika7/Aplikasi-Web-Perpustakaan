package controller;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SimpanAnggotaServlet", urlPatterns = {"/SimpanAnggotaServlet"})
public class SimpanAnggotaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nama = request.getParameter("nama");
        String alamat = request.getParameter("alamat");
        String telepon = request.getParameter("telepon");

        try (Connection conn = KoneksiDB.getConnection()) {
            String sql = "INSERT INTO anggota (nama, alamat, telepon) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nama);
            stmt.setString(2, alamat);
            stmt.setString(3, telepon);
            stmt.executeUpdate();

            // Tampilkan alert sukses dan redirect ke form_anggota.jsp
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html><head>");
            out.println("<title>Sukses</title>");
            out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' rel='stylesheet'/>");
            out.println("<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js'></script>");
            out.println("</head><body>");

            out.println("<div class='modal show d-block' tabindex='-1'>");
            out.println("  <div class='modal-dialog modal-dialog-centered'>");
            out.println("    <div class='modal-content shadow'>");
            out.println("      <div class='modal-header bg-success text-white'>");
            out.println("        <h5 class='modal-title'>Sukses</h5>");
            out.println("      </div>");
            out.println("      <div class='modal-body'>");
            out.println("        <p>Data anggota berhasil disimpan!</p>");
            out.println("      </div>");
            out.println("      <div class='modal-footer'>");
            out.println("        <a href='form_anggota.jsp' class='btn btn-primary'>OK</a>");
            out.println("      </div>");
            out.println("    </div>");
            out.println("  </div>");
            out.println("</div>");

            out.println("</body></html>");

        } catch (SQLException e) {
            throw new ServletException("Gagal menyimpan data: " + e.getMessage());
        }
    }
}
