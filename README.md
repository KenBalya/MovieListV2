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
