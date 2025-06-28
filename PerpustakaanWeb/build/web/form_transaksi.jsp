<%-- 
    Document   : form_transaksi
    Created on : Jun 28, 2025, 9:02:56 PM
    Author     : Mahadika
--%>

<%@page import="java.sql.*" %>
<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/perpustakaan", "root", "");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Form Transaksi Penyewaan Buku</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Google Fonts (Opsional agar terlihat modern) -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">

        <style>
            body {
                font-family: 'Inter', sans-serif;
                background-color: #f8f9fa;
                padding-top: 50px;
            }
            .card {
                border-radius: 16px;
            }
            .form-control {
                border-radius: 8px;
            }
            .btn {
                border-radius: 8px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card shadow-lg">
                        <div class="card-header bg-primary text-white text-center">
                            <h4 class="mb-0">📚 Form Input Transaksi Penyewaan Buku</h4>
                        </div>
                        <div class="card-body p-4">
                            <form method="post" action="SimpanTransaksiServlet">
                                <div class="mb-3">
                                    <label class="form-label">ID Anggota</label>
                                    <select name="id_anggota" class="form-control" required>
                                        <option value="">-- Pilih Anggota --</option>
                                        <%
                                            Statement stmt = conn.createStatement();
                                            ResultSet rs = stmt.executeQuery("SELECT id_anggota, nama FROM anggota");
                                            while (rs.next()) {
                                        %>
                                        <option value="<%= rs.getInt("id_anggota")%>">
                                            [<%= rs.getInt("id_anggota")%>] <%= rs.getString("nama")%>
                                        </option>
                                        <%
                                            }
                                            rs.close();
                                            stmt.close();
                                        %>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">ID Buku</label>
                                    <select name="id_buku" class="form-control" required>
                                        <option value="">-- Pilih Buku --</option>
                                        <%
                                            Statement stmt2 = conn.createStatement();
                                            ResultSet rs2 = stmt2.executeQuery("SELECT id_buku, judul FROM buku");
                                            while (rs2.next()) {
                                        %>
                                        <option value="<%= rs2.getInt("id_buku")%>">
                                            [<%= rs2.getInt("id_buku")%>] <%= rs2.getString("judul")%>
                                        </option>
                                        <%
                                            }
                                            rs2.close();
                                            stmt2.close();
                                            conn.close();
                                        %>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Tanggal Pinjam</label>
                                    <input type="date" class="form-control" name="tanggal_pinjam" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Tanggal Kembali</label>
                                    <input type="date" class="form-control" name="tanggal_kembali" required>
                                </div>
                                <div class="d-flex justify-content-between mt-4">
                                    <button type="submit" class="btn btn-success">Simpan</button>
                                    <a href="admin.jsp" class="btn btn-secondary">Kembali</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
