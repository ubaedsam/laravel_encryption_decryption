<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRUD Laravel dengan Enkripsi</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
        }
        .modal-header {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mb-4">Daftar Pengguna</h2>
        <button class="btn btn-primary mb-3" data-toggle="modal" data-target="#userModal" onclick="clearForm()">Tambah Pengguna</button>
        <table class="table" id="userTable">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nama</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                <!-- Data pengguna akan dimuat di sini -->
            </tbody>
        </table>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="userModalLabel">Tambah Pengguna</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="userForm">
                        <div class="form-group">
                            <label for="name">Nama:</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <input type="hidden" id="userId">
                        <button type="submit" class="btn btn-primary">Simpan</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            loadUsers();

            // Fungsi untuk memuat data pengguna
            function loadUsers() {
                $.ajax({
                    url: '/api/users',
                    method: 'GET',
                    success: function(data) {
                        var rows = '';
                        data.forEach(function(user) {
                            var name = user.status_user == 1 ? user.name : 'Encrypted';
                            var email = user.status_user == 1 ? user.email : 'Encrypted';
                            var password = user.status_user == 1 ? user.password : 'Encrypted';
                            rows += '<tr>' +
                                    '<td>' + user.id + '</td>' +
                                    '<td>' + name + '</td>' +
                                    '<td>' + email + '</td>' +
                                    '<td>' + password + '</td>' +
                                    '<td>' +
                                        '<button class="btn btn-warning btn-sm editBtn" data-id="' + user.id + '" data-name="' + user.name + '" data-email="' + user.email + '" data-password="' + user.password + '">Edit</button> ' +
                                        '<button class="btn btn-danger btn-sm deleteBtn" data-id="' + user.id + '">Hapus</button>' +
                                    '</td>' +
                                    '</tr>';
                        });
                        $('#userTable tbody').html(rows);
                        $('#userTable').DataTable();  // Inisialisasi DataTables
                    }
                });
            }

            // Menangani submit form
            $('#userForm').on('submit', function(event) {
                event.preventDefault();
                var formData = $(this).serialize();
                var userId = $('#userId').val();
                var url = userId ? '/api/users/' + userId : '/api/users';
                var method = userId ? 'PUT' : 'POST';
                
                $.ajax({
                    url: url,
                    method: method,
                    data: formData,
                    success: function(response) {
                        alert('Data berhasil disimpan!');
                        $('#userModal').modal('hide');
                        loadUsers();
                        $('#userForm')[0].reset();
                        $('#userId').val('');
                    }
                });
            });

            // Menangani klik tombol Edit
            $(document).on('click', '.editBtn', function() {
                var userId = $(this).data('id');
                $('#name').val($(this).data('name'));
                $('#email').val($(this).data('email'));
                $('#password').val($(this).data('password'));
                $('#userId').val(userId);
                $('#userModalLabel').text('Edit Pengguna');
                $('#userModal').modal('show');
            });

            // Menangani klik tombol Hapus
            $(document).on('click', '.deleteBtn', function() {
                var userId = $(this).data('id');
                if (confirm('Apakah Anda yakin ingin menghapus data ini?')) {
                    $.ajax({
                        url: '/api/users/' + userId,
                        method: 'DELETE',
                        success: function() {
                            alert('Data berhasil dihapus!');
                            loadUsers();
                        }
                    });
                }
            });
        });

        function clearForm() {
            $('#userForm')[0].reset();
            $('#userId').val('');
            $('#userModalLabel').text('Tambah Pengguna');
        }
    </script>
</body>
</html>
