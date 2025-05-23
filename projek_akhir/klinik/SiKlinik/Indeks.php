<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Si Klinik</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
<style>
  body {
    font-family: 'Poppins', sans-serif;
    background: url("assets/background.jpg") no-repeat center center fixed;
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    height: 100vh;
    margin: 0;
    padding: 0;
    color: #333;
  }

  .overlay {
    background-color: rgba(255, 255, 255, 0.85); /* transparan agar bg terlihat */
    min-height: 100vh;
    padding: 40px 20px;
  }

  .container {
    max-width: 1000px; /* lebih ramping supaya bg lebih dominan */
    margin: auto;
  }

  .logo {
    width: 60px;
    height: 60px;
    object-fit: contain;
  }

  .header-title {
    font-weight: 700;
    color: #333;
    display: flex;
    align-items: center;
    gap: 15px;
    margin-bottom: 40px;
    justify-content: center;
  }

  .dashboard-section {
    margin-bottom: 60px;
  }

  .card {
    border: none;
    border-radius: 15px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.15);
    transition: transform 0.3s ease;
    height: 100%;
  }

  .card:hover {
    transform: translateY(-8px);
  }

  .card-body {
    padding: 35px 25px;
  }

  .card-title {
    font-weight: 600;
    font-size: 1.25rem;
    margin-bottom: 20px;
  }

  .btn-custom {
    background-color: #0d6efd;
    border: none;
    padding: 10px 25px;
    border-radius: 30px;
    color: #fff;
  }

  .view-section {
    background-color: #ffffff;
    border-radius: 20px;
    padding: 40px;
    box-shadow: 0 0 20px rgba(0,0,0,0.1);
    text-align: center;
  }

  .view-section h2 {
    font-weight: 600;
    margin-bottom: 20px;
  }
</style>
</head>
<body>
  <div class="overlay">
    <div class="container">
      <div class="header-title text-center mb-5">
        <img src="assets/logoo.png" alt="Logo Klinik" class="logo mb-3">
        <h1>Sistem Informasi Klinik</h1>
      </div>

      <div class="dashboard-section">
        <div class="row row-cols-1 row-cols-md-3 g-4 justify-content-center">
          <!-- Baris pertama -->
          <div class="col">
            <div class="card text-center">
              <div class="card-body">
                <h5 class="card-title">Data Pasien</h5>
                <a href="pages/pasien.php" class="btn btn-custom">Kelola</a>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="card text-center">
              <div class="card-body">
                <h5 class="card-title">Data Dokter</h5>
                <a href="pages/dokter.php" class="btn btn-custom">Kelola</a>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="card text-center">
              <div class="card-body">
                <h5 class="card-title">Data Konsultasi</h5>
                <a href="pages/konsultasi.php" class="btn btn-custom">Kelola</a>
              </div>
            </div>
          </div>

          <!-- Baris kedua -->
          <div class="col">
            <div class="card text-center">
              <div class="card-body">
                <h5 class="card-title">Data Layanan</h5>
                <a href="pages/layanan.php" class="btn btn-custom">Kelola</a>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="card text-center">
              <div class="card-body">
                <h5 class="card-title">Data Pembayaran</h5>
                <a href="pages/pembayaran.php" class="btn btn-custom">Kelola</a>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="card text-center">
              <div class="card-body">
                <h5 class="card-title">Data Transaksi</h5>
                <a href="pages/transaksi.php" class="btn btn-custom">Kelola</a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="view-section mt-5 text-center">
      <h2>Data Ringkasan Klinik</h2>
        <p>Berikut adalah kumpulan tampilan data terintegrasi dari berbagai aktivitas di Klinik, meliputi konsultasi, transaksi, keluhan, hingga rekap dokter.</p>

        <a href="pages/view.php" class="btn btn-custom mt-3">View</a>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
