<%-- 
    Document   : admin
    Created on : Jun 28, 2025, 9:16:37 PM
    Author     : Mahadika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Perpustakaan</title>

    <!-- Bootstrap CSS & Icon -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f5f6fa;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .admin-card {
            background: #ffffff;
            padding: 40px 30px;
            border-radius: 20px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        .admin-card h2 {
            font-weight: 700;
            margin-bottom: 30px;
            color: #333;
        }

        .btn-option {
            width: 100%;
            padding: 15px;
            font-size: 16px;
            margin-bottom: 15px;
            border-radius: 10px;
            font-weight: 600;
        }

        .btn-option i {
            margin-right: 8px;
        }

        .btn-primary {
            background-color: #0d6efd;
        }

        .btn-success {
            background-color: #198754;
        }

        .btn-warning {
            background-color: #ffc107;
            color: #000;
        }
    </style>
</head>
<body>

    <div class="admin-card">
        <h2><i class="fas fa-tools me-2 text-secondary"></i>Admin Perpustakaan</h2>
        <a href="form_anggota.jsp" class="btn btn-primary btn-option">
            <i class="fas fa-user-plus"></i> Tambah Anggota
        </a>
        <a href="form_buku.jsp" class="btn btn-success btn-option">
            <i class="fas fa-book-medical"></i> Tambah Buku
        </a>
        <a href="form_transaksi.jsp" class="btn btn-warning btn-option">
            <i class="fas fa-book-reader"></i> Transaksi Peminjaman
        </a>
    </div>

</body>
</html>