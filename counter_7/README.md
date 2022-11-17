# Tugas 8 PBP

### 1. Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement
--> Navigator.push akan menumpuk route atau halaman terakhir dengan yang baru, karena hanya ditumpuk sehingga Navigator.push tidak menghapus route atau halaman terakhir tersebut sehingga saat di pencet button back dapat kembali ke halaman sebelum ditumpuk. Navigator.pushReplacement akan menggantikan route atau halaman terakhir dengan yang baru, karena digantikan sehingga Navigator.pushReplacement akan menghapus route atau halaman terakhir sehingga saat pencet button back tidak dapat kembali ke halaman sebelum digantikan.

### 2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya
--> 
- Scaffold, sebagai landasan halaman
- AppBar, biasanya menjadi judul (dari sebuah aplikasi atau halaman
- Container, berfungsi untuk membungkus suatu widget dan memberikan pading serta pading
- Column, semua widget yang ada didalam widget ini akan ditampilkan secara vertical
- Padding, berufngsi untuk memebrikan jarak pada widget
- Text, menampilkan teks dan memberikan style pada teksgn
- Row, semua widget yang ada didalam widget ini akan ditampilkan secara horizontal
- Icon, memberikan ikon pada sebuah widget
- DropdownButton, material design button untuk menampung list of item
- showDatePicker, material design untuk menampilkan dialog date picker
- ListTile: row yang menampung teks sebagai leading dan trailing
- Drawer: widget yang berfungsi untuk membuat drawer di sisi kiri layar (untuk navigasi)

### 3. Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed)
--> onTap, onPressed, onChanged, onSaved

### 4. Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter
--> Widget Navigator bekerja dengan menampilkan screen teratas pada stack of route dengan memperhatikan method yang digunakan pada object Navigator. Dalam melakukan navigasi ke layar baru, BuildContext yang menyimpan route widget akan diakses oleh Navigator dengan menggunakan method pada class Navigator seperti push(), pop(), pushReplacement(), dan lain-lain.

### 5. Checklist
-->
- Membuat file drawer.dart untuk menjadi drawernya lalu dihubungkan ke form.dart, data.dart, dan main.dart dengan "drawer: const DrawerApp()"
- Membuat menu yang clickable dengan ListTile pada children widget di drawer.dart, menu yang dibuat ada 3 yaitu Counter_7, Tambah budget, dan Data budget.
- Setiap menu tersebut di Navigator.pushReplacement ke halaman masing masing.
- Membuat file form.dart dengan input judul, nominal, tanggal, dan jenis. Lalu data disimpan di list yang berada di global.dart
- Membuat file data.dart untuk menampilkan data yang disimpan di global.dart dengan menggunakan ListView.builder