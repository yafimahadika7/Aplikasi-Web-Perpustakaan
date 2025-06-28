package controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name = "SimpanTransaksiServlet", urlPatterns = {"/SimpanTransaksiServlet"})
public class SimpanTransaksiServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idAnggota = Integer.parseInt(request.getParameter("id_anggota"));
        int idBuku = Integer.parseInt(request.getParameter("id_buku"));
        String tanggalPinjam = request.getParameter("tanggal_pinjam");
        String tanggalKembali = request.getParameter("tanggal_kembali");

        try (Connection conn = KoneksiDB.getConnection()) {
            String sql = "INSERT INTO transaksi (id_anggota, id_buku, tanggal_pinjam, tanggal_kembali) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idAnggota);
            stmt.setInt(2, idBuku);
            stmt.setString(3, tanggalPinjam);
            stmt.setString(4, tanggalKembali);
            stmt.executeUpdate();

            // Menampilkan alert stylish menggunakan Bootstrap
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html><head>");
            out.println("<meta charset='UTF-8'>");
            out.println("<title>Notifikasi</title>");
            out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css' rel='stylesheet'>");
            out.println("<style>");
            out.println("body { background-color: #f8f9fa; display: flex; justify-content: center; align-items: center; height: 100vh; }");
            out.println(".alert-box { padding: 30px; border-radius: 16px; box-shadow: 0 0 20px rgba(0,0,0,0.1); }");
            out.println("</style>");
            out.println("</head><body>");
            out.println("<div class='alert alert-success text-center alert-box'>");
            out.println("<h4 class='mb-3'>Transaksi berhasil disimpan</h4>");
            out.println("<a href='form_transaksi.jsp' class='btn btn-primary'>OK</a>");
            out.println("</div>");
            out.println("</body></html>");

        } catch (SQLException e) {
            throw new ServletException("Gagal menyimpan transaksi: " + e.getMessage());
        }
    }
}