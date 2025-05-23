<?php include '../koneksi.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Data Pembayaran</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: #f1f5f9;
      padding: 50px 20px;
    }
    .container {
      max-width: 1100px;
      margin: auto;
      background: #ffffff;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 10px 25px rgba(0,0,0,0.1);
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
      max-width: 900px;
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
    <h2>Data Pembayaran</h2>
    <div class="table-container">
      <table class="table table-striped table-bordered">
        <thead class="table-primary">
          <tr>
            <th>ID</th>
            <th>Konsultasi</th>
            <th>Metode</th>
            <th>Total Bayar</th>
            <th>Status</th>
            <th>Tanggal</th>
          </tr>
        </thead>
        <tbody>
          <?php 
          $query = "SELECT b.id_pembayaran, k.id_konsultasi, b.metode_pembayaran, b.total_bayar, b.status_pembayaran, b.tanggal_pembayaran FROM tb_pembayaran b JOIN tb_konsultasi k ON b.id_konsultasi = k.id_konsultasi";
          $result = mysqli_query($koneksi, $query);
          while ($row = mysqli_fetch_assoc($result)) {
          ?>
            <tr>
              <td><?= $row['id_pembayaran']; ?></td>
              <td><?= $row['id_konsultasi']; ?></td>
              <td><?= $row['metode_pembayaran']; ?></td>
              <td><?= $row['total_bayar']; ?></td>
              <td><?= $row['status_pembayaran']; ?></td>
              <td><?= $row['tanggal_pembayaran']; ?></td>
            </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>
