# Counter_7
# Tugas 7 PBP 

Nama    :  Maulana Bayu Risma Santoso Sari<br>
NPM     :  2106750401<br>
Kelas   :  B

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya

Stateful widget adalah jenis widget yang menyimpan state/informasi di dalamnya dan dapat mengubah tampilannya jika terdapat interaksi dengan user atau jika menerima data baru. Widget ini dapat dibuat berulang kali selama aplikasi berjalan. Contoh widget jenis ini adalah Checkbox, Radio Button, Slider, InkWell, Form, dan TextField. Method createState() juga perlu untuk dioverride untuk dapat mengembalikan state dari widget ini.

Stateless widget adalah widget yang tidak menyimpan state/data informasi dan tidak akan mengubah tampilannya selama aplikasi berjalan. Widget ini juga tidak meungkinkan untuk dibuat atau dipanggil berulang kali. Contoh stateless widget adalah Icon, IconButton, dan Text. Method build() diperlukan untuk membuat widget ini.

## Widget di dalam proyek tugas ini

- Column untuk menyimpan dua widget text yang akan menampilkan value dan tulisan Ganjil/Genap.
- Text untuk menampilkan value dan tulisan Ganjil/Genap sesuai dengan valuenya.
- Row untuk menampung dua widget button yang digunakan untuk increment dan decrement value.
- Floating Action Button untuk membuat button yang akan melakukan operasi penambahan atau pengurangan pada value saat ditekan.

## setState

Method ini digunakan ketika kita ingin mengubah nilai dari state yang dimiliki oleh widget. Setiap dipanggil, method ini akan mengubah state object yang dimiliki oleh stateful widget dan akan mengupdate tampilan dari widget tersebut.

## Final and Const

Final adalah tipe variable yang akan diinisialisasi saat runtime dan hanya menunjuk pada satu nilai saja selama program itu berjalan atau tidak bisa diubah nilainya. final dapat digunakan untuk deklarasi variabel immutable yang nilainya sudah ataupun belum diketahui pada saat waktu kompilasi berjalan.

Const adalah tipe variabel yang akan diinisialisasi saat compile time. Variable ini akan menunjuk ke objek yang sama selamanya. Const dapat digunakan untuk mendeklarasikan nilai yang sudah diketahui pasti akan konstan.

## Implementasi Checklist

Checklist pertama yaitu mengubah layout aplikasi dengan menambahkan dua FloatingActionButton. Kedua button ini ditempatkan di dalam widget Row agar terletak dalam satu baris yang sama dan mengatur MainAxisAllignment menjadi space between serta margin untuk bagian kiri.

Checklist selanjutnya adalah menambahkan fungsi untuk increment dan decrement pada value ketika button ditekan. Untuk fungsi decrement hanya akan berjalan ketika value > 0.

Checklist yang terakhir yaitu memunculkan tulisan Genap/Ganjil sesuai valuenya. Yang pertama adalah menambahkan getter dengan nama isEven untuk memeriksa apakah nilai counter genap atau ganjil. Kemudian widget Text ditambahkan dengan tulisan Genap berwarna merah ketika isEven bernilai True dan tulisan Ganjil berwarna biru ketika isEven bernilai false.