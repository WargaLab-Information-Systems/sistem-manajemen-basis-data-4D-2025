<?php
include '../koneksi.php';
mysqli_report(MYSQLI_REPORT_OFF); // Matikan exception agar tidak fatal error


// Tambah pasien
if (isset($_POST['tambah_pasien'])) {
  $nama = $_POST['nama_lengkap'];
  $tgl = $_POST['tanggal_lahir'];
  $jk = $_POST['jenis_kelamin'];
  $alamat = $_POST['alamat'];
  $telp = $_POST['nomor_telepon'];

  $sql = "INSERT INTO tb_pasien (nama_lengkap, tanggal_lahir, jenis_kelamin, alamat, nomor_telepon)
          VALUES ('$nama', '$tgl', '$jk', '$alamat', '$telp')";
  if (!mysqli_query($koneksi, $sql)) {
    $error = mysqli_error($koneksi);
    echo "<script>alert('Gagal menambah pasien: $error');</script>";
  } else {
    echo "<script>alert('Pasien berhasil ditambahkan');</script>";
  }
}

// Update pasien
if (isset($_POST['update_pasien'])) {
  $id = $_POST['id_pasien'];
  $nama = $_POST['nama_lengkap'];
  $tgl = $_POST['tanggal_lahir'];
  $jk = $_POST['jenis_kelamin'];
  $alamat = $_POST['alamat'];
  $telp = $_POST['nomor_telepon'];

  $sql = "UPDATE tb_pasien SET
          nama_lengkap='$nama',
          tanggal_lahir='$tgl',
          jenis_kelamin='$jk',
          alamat='$alamat',
          nomor_telepon='$telp'
          WHERE id_pasien='$id'";
  if (!mysqli_query($koneksi, $sql)) {
    echo "<script>alert('Error: " . mysqli_error($koneksi) . "');</script>";
  } else {
    echo "<script>alert('Pasien berhasil diperbarui');</script>";
  }
}

// Hapus pasien
if (isset($_POST['hapus_pasien'])) {
  $id = $_POST['id_pasien'];
  $sql = "DELETE FROM tb_pasien WHERE id_pasien='$id'";
  if (!mysqli_query($koneksi, $sql)) {
    echo "<script>alert('Error: " . mysqli_error($koneksi) . "');</script>";
  } else {
    echo "<script>alert('Pasien berhasil dihapus');</script>";
  }
}


// Pencarian
$keyword = isset($_GET['cari']) ? $_GET['cari'] : '';
$query = "SELECT * FROM tb_pasien";
if ($keyword != '') {
  $query .= " WHERE nama_lengkap LIKE '%$keyword%'";
}

if (isset($_GET['gender']) && ($_GET['gender'] == 'L' || $_GET['gender'] == 'P')) {
  $gender = $_GET['gender'];
  $data_pasien = mysqli_query($koneksi, "CALL tampil_pasien_by_gender('$gender')");
} else {
  $data_pasien = mysqli_query($koneksi, "SELECT * FROM tb_pasien");
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Data Transaksi</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: #f8fafc;
      padding: 50px 20px;
body {
  position: relative;
}


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
<head>
  <title>Data Pasien</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <script>
    function enableEdit(id) {
      const inputs = document.querySelectorAll('.row-' + id);
      inputs.forEach(el => {
        el.removeAttribute('readonly');
        el.removeAttribute('disabled');
        el.classList.add('border-warning');
      });
    }
  </script>
</head>
<body class="bg-light">
  <a href="../indeks.php" class="btn btn-light shadow-sm position-fixed d-flex align-items-center gap-2"
   style="top: 20px; left: 20px; z-index: 1000;">
  <i class="bi bi-arrow-left-circle-fill" style="font-size: 1.3rem;"></i> Beranda
</a>
  <div class="container py-5">
    <h2 class="mb-4">Kelola Data Pasien</h2>

    
    <!-- Filter berdasarkan jenis kelamin -->
<form method="GET" class="mb-3">
  <div class="input-group">
    <select name="gender" class="form-select" onchange="this.form.submit()">
      <option value="">-- Filter Jenis Kelamin --</option>
      <option value="L" <?= isset($_GET['gender']) && $_GET['gender'] == 'L' ? 'selected' : '' ?>>Laki-laki</option>
      <option value="P" <?= isset($_GET['gender']) && $_GET['gender'] == 'P' ? 'selected' : '' ?>>Perempuan</option>
    </select>
  </div>
</form>

    <!-- Form Pencarian -->
    <form method="GET" class="mb-3">
      <div class="input-group">
        <input type="text" name="cari" class="form-control" placeholder="Cari berdasarkan nama pasien..." value="<?= htmlspecialchars($keyword) ?>">
        <button class="btn btn-outline-secondary" type="submit">Cari</button>
        <a href="pasien.php" class="btn btn-outline-danger">Reset</a>
      </div>
    </form>

    <div class="card">
      <div class="card-body">
        <table class="table table-bordered table-hover">
          <thead class="table-primary text-center">
            <tr>
              <th>Nama Lengkap</th>
              <th>Tanggal Lahir</th>
              <th>Jenis Kelamin</th>
              <th>Alamat</th>
              <th>No. Telepon</th>
              <th colspan="2">Aksi</th>
            </tr>
            <!-- Form Tambah -->
            <tr>
              <form action="" method="POST">
                <td><input type="text" name="nama_lengkap" class="form-control" required></td>
                <td><input type="date" name="tanggal_lahir" class="form-control" required></td>
                <td>
                  <select name="jenis_kelamin" class="form-control" required>
                    <option value="">Pilih</option>
                    <option value="L">Laki-laki</option>
                    <option value="P">Perempuan</option>
                  </select>
                </td>
                <td><input type="text" name="alamat" class="form-control" required></td>
                <td><input type="text" name="nomor_telepon" class="form-control" required></td>
                <td colspan="2" class="text-center">
                  <button type="submit" name="tambah_pasien" class="btn btn-primary btn-sm">Tambah</button>
                </td>
              </form>
            </tr>
          </thead>
          <tbody>
            <?php while($row = mysqli_fetch_assoc($data_pasien)) { ?>
            <tr>
              <form method="POST" action="">
                <td><input type="text" name="nama_lengkap" value="<?= $row['nama_lengkap'] ?>" class="form-control row-<?= $row['id_pasien'] ?>" readonly></td>
                <td><input type="date" name="tanggal_lahir" value="<?= $row['tanggal_lahir'] ?>" class="form-control row-<?= $row['id_pasien'] ?>" readonly></td>
                <td>
                  <select name="jenis_kelamin" class="form-control row-<?= $row['id_pasien'] ?>" disabled>
                    <option value="L" <?= $row['jenis_kelamin']=='L'?'selected':'' ?>>L</option>
                    <option value="P" <?= $row['jenis_kelamin']=='P'?'selected':'' ?>>P</option>
                  </select>
                </td>
                <td><input type="text" name="alamat" value="<?= $row['alamat'] ?>" class="form-control row-<?= $row['id_pasien'] ?>" readonly></td>
                <td><input type="text" name="nomor_telepon" value="<?= $row['nomor_telepon'] ?>" class="form-control row-<?= $row['id_pasien'] ?>" readonly></td>
                <td class="text-center">
                  <input type="hidden" name="id_pasien" value="<?= $row['id_pasien'] ?>">
                  <button type="button" class="btn btn-warning btn-sm" title="Edit" onclick="enableEdit(<?= $row['id_pasien'] ?>)">✏️</button>
                  <button type="submit" name="update_pasien" class="btn btn-success btn-sm" title="Simpan">💾</button>
                </td>
                <td class="text-center">
                  <button type="submit" name="hapus_pasien" class="btn btn-danger btn-sm" title="Hapus" onclick="return confirm('Yakin ingin menghapus pasien ini?')">🗑️</button>
                </td>
              </form>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</body>
</html>