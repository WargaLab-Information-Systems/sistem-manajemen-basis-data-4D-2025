<?php include '../koneksi.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Data Dokter</title>
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
    <h2>Data Dokter</h2>
    <div class="table-container">
      <table class="table table-striped table-bordered">
        <thead class="table-primary">
          <tr>
            <th>ID</th>
            <th>Nama Dokter</th>
            <th>Spesialisasi</th>
            <th>Jadwal Praktik</th>
            <th>Nomor Telepon</th>
          </tr>
        </thead>
        <tbody>
          <?php 
          $query = "SELECT * FROM tb_dokter";
          $result = mysqli_query($koneksi, $query);
          while ($row = mysqli_fetch_assoc($result)) {
          ?>
            <tr>
              <td><?= $row['id_dokter']; ?></td>
              <td><?= $row['nama_dokter']; ?></td>
              <td><?= $row['spesialisasi']; ?></td>
              <td><?= $row['jadwal_praktik']; ?></td>
              <td><?= $row['nomor_telepon']; ?></td>
            </tr>
          <?php } ?>
        </tbody>
      </table>
    </div>
  </div>
</body>
</html>
