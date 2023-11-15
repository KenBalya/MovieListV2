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
