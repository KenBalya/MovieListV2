# MovieListV2

1. Dalam konteks pengembangan aplikasi Flutter, perbedaan utama antara stateless dan stateful widget terletak pada bagaimana mereka mengelola perubahan dan pembaruan pada tampilan UI:

Stateless Widget:

Tidak memiliki keadaan internal: Stateless widget tidak memiliki data internal yang berubah selama siklus hidup widget. Mereka hanya bergantung pada data yang diberikan saat mereka dibuat dan tidak menyimpan data yang berubah sepanjang waktu.
Tidak dapat diperbarui secara dinamis: Ketika data yang diperlukan untuk tampilan berubah, Anda harus membuat widget stateless baru dengan data yang diperbarui. Ini dapat mengarah pada pembuatan banyak widget baru, tetapi itu juga membuat widget ini lebih mudah dimengerti dan diprediksi dalam perilaku mereka.


Stateful Widget:

Mengelola keadaan internal: Stateful widget memiliki keadaan internal yang dapat berubah selama siklus hidup widget. Mereka dapat memperbarui diri mereka sendiri ketika data yang berkaitan berubah.
Dapat diperbarui secara dinamis: Ketika data yang diperlukan untuk tampilan berubah, stateful widget dapat memperbarui tampilan mereka dengan mengubah keadaan internal. Ini membuat mereka lebih fleksibel dalam mengatasi perubahan data yang berkaitan dengan tampilan.

2. Widget yang saya gunakan pada tugas ini adalah:
   -Row widget: Sebagai pengatur tata letak elemen secara horizontal
   -Column Widget: Sebagai pengatur tata letak elemen secara vertikal
   -Container: Pembungkus elemen-elemen lain yang menjadi child-nya untuk mempermudah penempatan tata letak dll.
   -Text: Untuk menampilkan teks baik yang bersifat statis maupun yang berasal dari variabel
   -Button: Sebagai salah satu komponen yang dapat mentrigger action-event
   -Image: Sebagai frame untuk gambar yang ingin ditampilkan pada app
   
3. Cara saya mengimplementasikan checklist diatas adalah dengan menggunakan UI builder untuk mempermudah pengerjaan, dikarenakan hingga saat ini flutter saya belum bisa berfungsi 100% karena masih ada kendala pada setup android studio yang membuat saya terpaksa menggunakan online flutter IDE yang memiliki emulator dan UI builder. Untuk desainnya sendiri, saya membuatnya secara mandiri hanya dengan sedikit bantuan dari UI builder flutter flow. Setelah tampilan UI selesai, saya mengimplementasikan action-event berupa penampilan snackbar ketika masing-masing komponen yang diinginkan terklik.
   Catatan: Karena android studio saya masih bermasalah, saya akan mencantumkan link project dari UI builder secara langsung agar asdos dapat melihat project saya. Mudah-mudahan kendala ini hanya terjadi pada tugas ini dan tidak pada tugas lainnya, adapun link UI builder saya adalah: https://app.flutterflow.io/project/movie-list-dcu3hf?tab=uiBuilder&page=homePage

Tugas 8:
Navigator.Push berarti kita menambahkan route baru ke dalam stack route saat ini. Dengan Push, kita bisaa kembali lagi ke route sebelumnya dengan melakukan Pop. Navigator.PushReplacement berarti kita menambahkan route baru ke dalam stack route serta menghapus juga route di kondisi sebelumnya. Dengan PushReplacement, kita tidak bisa kembali ke halaman sebelumnya jika menggunakan Pop

Single Child Layout Widget : Widget layout yang hanya memiliki satu child. Biasa digunakan jika hanya ingin menampilkan teks atau mengatur posisi satu widget saja

Multi Child Layout WIdget : Widget layout yang memiliki lebih dari satu child. Biasa digunakan sebagai root dari suatu halaman atau jika ingin mengatur layout dari suatu kumpulan widget

Sliver Widget : Widget untuk memberikan efek scrolling custom

TextFormField. Digunakan untuk menerima input berupa text dari user

Clean Architecture membagi project ke dalam tiga buah layer. Layer pertama adalah Data & Development. Ini merupakan layer terluar yang terdiri dari kode sumber data seperti Rest API, local database, Firebase, atau sumber lainnnya. Layer ini juga berisi kode platform untuk membangun widgets. Yang kedua adalah Layer Presentation. Layer ini terdiri dari kode yang menjembatani komunikasi antara data dengan tampilan aplikasi yang disebut repository. Layer ini juga berisi kode untuk mengatur state management aplikasi seperti provider, controller, BLoC, dan lain sebagainya. Layer ketiga adalah Domain. Pada layer ini terdapat kode untuk business-logic aplikasi seperti entities atau models dan usecases. Masing-masing layer saling bergantung pada layer lainnya kecuali layer Domain yang merupakan kode untuk business-logic

Pertama-tama kita buat file left_drawer.dart sebagai file widget untuk membuat drawer. Drawer yang kita buat ini akan memiliki layout ListView dan akan berisi tombol untuk melakukan direct ke halaman utama, halaman untuk menambah item, dan halaman untuk melihat item. Selanjutnya kita buat file inventory_list_form.dart. File ini akan berisi halaman yang menampilkan filed untuk input sebuah item. Item sendiri memiliki atribut name, price, description, dan value. Untuk memvalidasi form, menyimpan hasil form, serta meng-handle state form, kita buat suatu GlobalKey dengan nama _formKey. Kita juga manfaatkan argumen onChanged yang merupakan argumen dari widget Form yang hal tersebut akan berfungsi untuk mengecek secara real time apa isi dari input field yang dimasukkan user. Lalu kita buat ssuatu tombol yang jika ditekan akan melakukan validasi terhadap GlobalKey kita tadi dan selanjutnya akan menampilkan pop up ringkasan dari atribut item yang kita masukkan tadi serta tombol tambahan yang bertuliskan "Ok", jika tombol "Ok" ditekan, maka akan direct ke halaman utama dengan memanfaatkan PushReplacement. 

Tugas 9:
1. Pengambilan data JSON dan pembuatan model(pada flutter) adalah 2 hal yang saling lepas, dikarenakan data yang diambil melalui JSON bisa dari sumber apa saja, tidak harus database/model. Hal ini membuat pengambilan data JSON tanpa pembuatan model bisa saja dilakukan, tetapi apakah itu lebih baik? Jawabannya adalah tergantung kepada kebutuhan. Apabila kita membutuhkan data JSON tersebut untuk dilakukan manipulasi, perbandingan, dll. Maka lebih baik jika dibuatkan model sehingga data JSON dapat disimpan sebagai instance dari model.
2. Instance CookieRequest yang dibagikan ke semua komponen dalam aplikasi Flutter dapat memberikan konsistensi data dan menghindari pengulangan kode. Dengan memastikan bahwa semua bagian aplikasi menggunakan instance yang sama, perubahan yang dibuat di satu bagian akan terlihat di bagian lainnya, menjaga konsistensi data. Meskipun perlu berhati-hati terhadap kompleksitas dan ketergantungan yang berlebihan, berbagi instance dapat berguna untuk manajemen status global seperti otentikasi pengguna atau preferensi aplikasi.
3. Pertama-tama, flutter akan melakukan request ke server django melalui protokol HTTP. Setelah itu, model dari data yang difetch dari django disimpan dalam bentuk JSON yang dikembalikan melalui response proctocol ke flutter. Setelah itu, data dari json bisa dikonversikan kembali kepada model awal yang didefinisikan di flutter yang kemudian akan ditampilkan pada widget.
4. Mekanisme autentikasi antara aplikasi Flutter dan backend Django melibatkan beberapa langkah. Berikut adalah gambaran umumnya:
-Input Data Akun di Aplikasi Flutter:Pengguna memasukkan informasi akun, seperti nama pengguna dan kata sandi, melalui antarmuka pengguna Flutter.
-Permintaan Autentikasi ke Django: Aplikasi Flutter membuat permintaan HTTP ke backend Django untuk mengautentikasi pengguna. Permintaan ini biasanya berisi informasi kredensial pengguna, seperti nama pengguna dan kata sandi, yang dikirimkan sebagai bagian dari permintaan POST.
-Proses Autentikasi oleh Django: Django menerima permintaan autentikasi dan memeriksa kredensial yang diberikan. Jika kredensial valid, Django menghasilkan token akses atau sesi untuk pengguna. Proses ini dapat melibatkan pemeriksaan terhadap database pengguna.
-Pengembalian Token ke Aplikasi Flutter: Jika autentikasi berhasil, Django mengirimkan token akses atau informasi autentikasi lainnya sebagai tanggapan HTTP ke aplikasi Flutter. Aplikasi Flutter kemudian menyimpan token ini untuk digunakan dalam permintaan berikutnya.
-Otentikasi untuk Permintaan Berikutnya: Aplikasi Flutter menggunakan token yang diterima untuk mengautentikasi permintaan-permintaan berikutnya yang memerlukan otentikasi, seperti mendapatkan data pengguna terautentikasi atau melakukan operasi yang memerlukan hak akses khusus.
-Tampilan Menu pada Aplikasi Flutter: Setelah otentikasi berhasil, aplikasi Flutter menavigasi pengguna ke tampilan menu atau halaman lain yang hanya dapat diakses oleh pengguna yang terautentikasi. Pemanggilan endpoint API Django yang memerlukan otentikasi dapat memberikan data yang dibutuhkan untuk mengisi tampilan menu.  Selama proses ini, penting untuk memastikan bahwa kredensial pengguna tidak dikirimkan dalam bentuk teks biasa melalui jaringan. Penggunaan protokol HTTPS dan penyimpanan token dengan aman di aplikasi Flutter adalah praktik yang umum untuk menjaga keamanan autentikasi. Selain itu, Anda mungkin ingin mempertimbangkan penanganan kasus-kasus khusus, seperti manajemen sesi atau pengelolaan token yang kedaluwarsa.
5. Widget yang saya gunakan pada tugas ini antara lain:
   -Row widget: Sebagai pengatur tata letak elemen secara horizontal
   -Column Widget: Sebagai pengatur tata letak elemen secara vertikal
   -Container: Pembungkus elemen-elemen lain yang menjadi child-nya untuk mempermudah penempatan tata letak dll.
   -Text: Untuk menampilkan teks baik yang bersifat statis maupun yang berasal dari variabel
   -Button/ElevatedButton: Sebagai salah satu komponen yang dapat mentrigger action-event
   -Image: Sebagai frame untuk gambar yang ingin ditampilkan pada app
   -AppBar: Sebagai container pada bagian atas screen
   -TextField: Untuk menerima input dari user
6. Cara saya mengerjakan checklist diatas adalah dengan pertama-tama membuat login form pada flutter dan  membuat sebuah app baru pada django untuk melakukan autentikasi yang datanya diambil dari login form pada flutter. Pada views app tersebut, saya membuat 2 function yaitu login dan logout untuk melakukan autentikasi user yang ingin melakukan login dan logout. Kemudian saya memanfaatkan sebuah function untuk mengembalikan data dalam format JSON yang sudah dibuat pada tugas 3, setelah itu saya membuat beberapa container untuk menampilkan data-data yang difetch dengan mekanisme yang sudah dibuat. Tidak lupa sebelum melakukan request dari flutter, saya juga menginstall beberapa package yang dibutuhkan seperti provider.  
   


