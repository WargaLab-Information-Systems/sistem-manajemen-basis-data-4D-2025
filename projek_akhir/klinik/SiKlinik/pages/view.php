<?php include '../koneksi.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Data View Klinik</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: #f8fafc;
      padding: 40px 20px;
    }
    .container {
      max-width: 1200px;
      margin: auto;
      background: #fff;
      padding: 30px;
      border-radius: 15px;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
    }
    h2 {
      text-align: center;
      font-weight: 600;
      margin: 40px 0 20px;
      color: #333;
    }
    .table-container {
      margin-bottom: 50px;
    }
    table {
      margin-top: 15px;
    }
    .table th {
      background-color: #007bff;
      color: #fff;
      text-align: center;
    }
    .table td {
      text-align: center;
      vertical-align: middle;
    }
  </style>
</head>
<body>
  <div class="container">

    <div class="table-container">
      <h2>View 1: Data Konsultasi Lengkap</h2>
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>ID</th>
            <th>Nama Pasien</th>
            <th>Dokter</th>
            <th>Layanan</th>
            <th>Tanggal</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <?php
          $result = mysqli_query($koneksi, "SELECT * FROM view_data_konsultasi_lengkap");
          while ($row = mysqli_fetch_assoc($result)) {
              echo "<tr>
                      <td>{$row['id_konsultasi']}</td>
                      <td>{$row['nama_pasien']}</td>
                      <td>{$row['nama_dokter']}</td>
                      <td>{$row['nama_layanan']}</td>
                      <td>{$row['tanggal_konsultasi']}</td>
                      <td>{$row['status']}</td>
                    </tr>";
          }
          ?>
        </tbody>
      </table>
    </div>

    <div class="table-container">
      <h2>View 2: Transaksi Lunas</h2>
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>ID</th>
            <th>Nama Pasien</th>
            <th>Dokter</th>
            <th>Layanan</th>
            <th>Tanggal</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <?php
          $result = mysqli_query($koneksi, "SELECT * FROM view_transaksi_lunas");
          while ($row = mysqli_fetch_assoc($result)) {
              echo "<tr>
                      <td>{$row['id_tranksaksi']}</td>
                      <td>{$row['nama_pasien']}</td>
                      <td>{$row['nama_dokter']}</td>
                      <td>{$row['nama_layanan']}</td>
                      <td>{$row['tanggal_transaksi']}</td>
                      <td>{$row['status_transaksi']}</td>
                    </tr>";
          }
          ?>
        </tbody>
      </table>
    </div>

    <div class="table-container">
      <h2>View 3: Pembayaran Belum Lunas</h2>
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>ID</th>
            <th>Nama Pasien</th>
            <th>Metode</th>
            <th>Total</th>
            <th>Status</th>
            <th>Tanggal</th>
          </tr>
        </thead>
        <tbody>
          <?php
          $result = mysqli_query($koneksi, "SELECT * FROM view_pembayaran_belum_lunas");
          while ($row = mysqli_fetch_assoc($result)) {
              echo "<tr>
                      <td>{$row['id_pembayaran']}</td>
                      <td>{$row['nama_lengkap']}</td>
                      <td>{$row['metode_pembayaran']}</td>
                      <td>{$row['total_bayar']}</td>
                      <td>{$row['status_pembayaran']}</td>
                      <td>{$row['tanggal_pembayaran']}</td>
                    </tr>";
          }
          ?>
        </tbody>
      </table>
    </div>

    <div class="table-container">
      <h2>View 4: Keluhan Pasien</h2>
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>Nama</th>
            <th>Tanggal</th>
            <th>Keluhan</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <?php
          $result = mysqli_query($koneksi, "SELECT * FROM view_keluhan_pasien");
          while ($row = mysqli_fetch_assoc($result)) {
              echo "<tr>
                      <td>{$row['nama_lengkap']}</td>
                      <td>{$row['tanggal_konsultasi']}</td>
                      <td>{$row['keluhan']}</td>
                      <td>{$row['status']}</td>
                    </tr>";
          }
          ?>
        </tbody>
      </table>
    </div>

    <div class="table-container">
      <h2>View 5: Rekap Konsultasi per Dokter</h2>
      <table class="table table-bordered table-striped">
        <thead>
          <tr>
            <th>Dokter</th>
            <th>Status</th>
            <th>Jumlah Konsultasi</th>
          </tr>
        </thead>
        <tbody>
          <?php
          $result = mysqli_query($koneksi, "SELECT * FROM view_rekap_konsultasi");
          while ($row = mysqli_fetch_assoc($result)) {
              echo "<tr>
                      <td>{$row['nama_dokter']}</td>
                      <td>{$row['status']}</td>
                      <td>{$row['jumlah_konsultasi']}</td>
                    </tr>";
          }
          ?>
        </tbody>
      </table>
    </div>

  </div>
</body>
</html>
