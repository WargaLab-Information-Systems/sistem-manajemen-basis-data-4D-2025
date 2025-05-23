<?php include '../koneksi.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Data Transaksi</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: #f8fafc;
      padding: 50px 20px;
    }
    .container {
      max-width: 1200px;
      margin: auto;
      background: #ffffff;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }
    h2 {
      font-weight: 600;
      margin-bottom: 30px;
      text-align: center;
    }
    .table-container {
      display: flex;
      justify-content: center;
    }
    table {
      width: 100%;
      max-width: 1000px;
      margin-top: 20px;
    }
    .btn-primary {
      border-radius: 30px;
      padding: 6px 20px;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Data Transaksi</h2>
    <div class="table-container">
      <table class="table table-striped table-bordered">
        <thead class="table-primary">
          <tr>
            <th>ID</th>
            <th>Konsultasi</th>
            <th>Pasien</th>
            <th>Dokter</th>
            <th>Layanan</th>
            <th>Pembayaran</th>
            <th>Tanggal</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <?php 
          $query = "SELECT t.id_tranksaksi, t.id_konsultasi, p.nama_lengkap as pasien, d.nama_dokter as dokter, l.nama_layanan, t.id_pembayaran, t.tanggal_transaksi, t.status_transaksi FROM tb_transaksi t JOIN tb_pasien p ON t.id_pasien = p.id_pasien JOIN tb_dokter d ON t.id_dokter = d.id_dokter JOIN tb_layanan l ON t.id_layanan = l.id_layanan";
          $result = mysqli_query($koneksi, $query);
          while ($row = mysqli_fetch_assoc($result)) {
          ?>
            <tr>
              <td><?= $row['id_tranksaksi']; ?></td>
              <td><?= $row['id_konsultasi']; ?></td>
              <td><?= $row['pasien']; ?></td>
              <td><?= $row['dokter']; ?></td>
              <td><?= $row['nama_layanan']; ?></td>
              <td><?= $row['id_pembayaran']; ?></td>
              <td><?= $row['tanggal_transaksi']; ?></td>
              <td><?= $row['status_transaksi']; ?></td>
            </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>
