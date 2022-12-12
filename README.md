# uHealths

## 👨‍💻 Anggota Kelompok PBP - B09👩‍💻
1. Farras Hafizhudin Indra Wijaya - 2106652682
2. Jihan Syafa Kamila - 2106751303
3. Rikza Kurnia Almujtaba Lubis - 2106701293
4. Syarifah Nur Amalia - 2106751272
5. Yoozu Abiyyu Verisson – 2106751064

 
## 💻Tentang Aplikasi 
Topik yang kami angkat terkait G20 adalah Kesehatan Global, yang berupaya mendidik masyarakat tentang kesehatan global dan dampaknya terhadap dunia. Ide kami berkembang pesat di situs web kesehatan dan kebugaran _online_ yang menawarkan wawasan tentang kesehatan dan kebugaran terkini. Aplikasi kami, bernama uHealths, menyediakan berbagai konten yang dapat membantu pengguna aplikasi kami agar dapat menjalani hidup yang lebih sehat. Selain konten, aplikasi uHealths menyediakan beberapa fitur yang bermanfaat bagi kesehatan para pengguna. Pada aplikasi uHealths juga terdapat forum di mana sesama pengguna dapat bertukar wawasan atau berdiskusi terkait masalah kesehatan. Aplikasi ini dapat diakses secara mobile maupun melalui situs web.
 
## 📃Modul Aplikasi
### 1. Login dan Register 
Pengguna dapat membuat atau memasuki akun agar dapat mengakses semua fitur aplikasi.
### 2. Infografis 
Infografis menyediakan informasi terkait kesehatan dengan pengelompokkannya masing-masing.
### 3. Frequently Asked Questions 
Frequently Asked Question atau FAQ berisi penjelasan terperinci atas pertanyaan yang sering diajukan.
### 4. Forum 
Pada forum, pengguna dapat membuka diskusi baru atau membalas forum pengguna lain. Forum ini disediakan agar antar pengguna dapat saling berinteraksi.
### 5. Health Status Tracker 
Health Status Tracker menghitung dan memperbaharui status kesehatan pengguna secara umum sesuai dengan informasi yang diberikan oleh pengguna itu sendiri. Health status tracker melacak asupan kalori dan melihat status kesehatan pengguna untuk membantu memaksimalkan kebutuhan tubuh pengguna.

## 🖥️ Integrasi Web Service

uHealths Mobile menggunakan Flutter untuk mengintegrasikan front-end aplikasinya. Sementara, back-end dari aplikasi memanfaatkan implementasi REST API pada berkas views.py. Selanjutnya, dilakukan penyimpanan data pada berkas JSON untuk mendapatkan data yang telah dimasukkan pada forms baik lewat situs web atau aplikasi sebagai pengintegrasian data dengan *web service* atas situs web dari uHealths yang dapat diakses pada tautan berikut : [uHealths](https://pbp-midterm-project-b09-production.up.railway.app/uhealths/) .

<p>
Berikut adalah penjelasan lebih rinci terkait alur pengintegrasian dengan web.

1. Menambahkan dependency http ke proyek, dependency ini digunakan untuk bertukar data melalui HTTP request, seperti GET, POST, PUT, dan lain-lain. Hal ini dapat dilakukan dengan menambahkan `flutter pub add http` pada terminal proyek Flutter untuk menambahkan package http. Lalu, pada file `android/app/src/main/AndroidManifest.xml`, ditambahkan kode untuk memperbolehkan akses Internet pada aplikasi Flutter yang sedang dibuat.
2. Membuat model sesuai dengan respons dari data yang berasal dari web service. Untuk membuat model, data JSON dari situs web disalin lalu diubah ke dalam bahasa dart. Potongan kode yang telah dikonversi tersebut ditempel ke file yang berfungsi sebagai model.
3. Membuat http request ke web service menggunakan dependency http.
4. Mengkonversikan objek yang didapatkan dari web service ke model. 
5. Menampilkan data yang telah dikonversi ke aplikasi dengan `FutureBuilder`.
<p>
 
## ✨Peran User

### Pengguna yang tidak login
- Melihat Home atau Landing Page
- Melihat Infografis
- Melihat Forum
- Melihat FAQ

### Pengguna yang login
- Mengakses semua modul dari user yang tidak login
- Membuat forum diskusi baru dan membalas forum pengguna lain
- Mengakses Health Status dan update Health Status

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
