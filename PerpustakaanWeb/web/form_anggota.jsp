<%-- 
    Document   : form_anggota
    Created on : Jun 28, 2025, 8:29:33 PM
    Author     : Mahadika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Form Anggota</title>
        <meta charset="UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body class="bg-light">
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6 mx-auto">
                    <div class="card shadow-lg">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">Form Input Data Anggota</h4>
                        </div>
                        <div class="card-body">
                            <form method="post" action="SimpanAnggotaServlet">
                                <div class="mb-3">
                                    <label class="form-label">Nama</label>
                                    <input type="text" class="form-control" name="nama" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Alamat</label>
                                    <textarea class="form-control" name="alamat" required></textarea>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Telepon</label>
                                    <input type="text" class="form-control" name="telepon" required>
                                </div>
                                <div class="d-flex justify-content-between">
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

