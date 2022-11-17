# Counter_7

Nama : Maulana Bayu Risma Santoso Sari<br>
NPM : 2106750401<br>
Kelas : B

# Tugas 7 PBP

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

# Tugas 8 PBP

## Perbedaan Navigator.push dan Navigator.pushReplacement

Dengan Navigator.push maka route page baru akan ditambahkan ke dalam stack di atas dari route page yang saat ini sedang diakses. Sementara itu, Navigator.pushReplacement akan menambahkan route page baru ke dalam stack dengan menggantikan posisi dari route page yang saat ini sedang diakses. Oleh karena itu, kita tidak bisa kembali ke page sebelumnya dengan metode pop jika menggunakan Navigator.pushReplacement.

## Widget di dalam proyek tugas ini

- Drawer untuk menampilkan menu yang digunakan untuk mengakses halaman lain
- ListTile untuk menambahkan menu dalam bentuk List.
- Navigator untuk menambahkan sistem stack yang berisi kumpulan widget.
- Column untuk menyimpan beberapa widget text yang akan menampilkan value dari form.
- Text untuk menampilkan value dalam tipe String.
- Row untuk menampung dua widget button yang digunakan untuk increment dan decrement value.
- Form untuk membuat template field form.
- DropdownMenu untuk membuat menu dropdown di dalam form.

## Event yang ada di Flutter

- onPressed
- onSaved
- onChanged
- onTap
- onSubmitted

## Cara Kerja Navigator

Widget Navigator bekerja seperti tumpukan layar (stack) yang menggunakan prinsip LIFO (Last-In, First-Out). Bagian teratas dari stack ini adalah halaman yang sedang ditampilkan di layar. Dengan menggunakan metode push halaman baru akan ditambahkan ke stack dan ditampilkan ke layar. Sementara, dengan metode pop halaman akan dihapus dari stack tersebut.

## Implementasi Checkpoint

- Menambahkan draweer dari tutorial lab sebelumnya dengan sedikit modifikasi untuk halaman form dan tampilan item budget.
- Membuat models untuk Budget yang akan berisi judul, nominal, dan tipe budget. Kemudian membuat halaman form di file terpisah berisi 3 input dengan tombol submit. Form dilengkapi dengan validator untuk memvalidasi input yang bertipe String ataupun Integer.
- Membuat list budget yang berisi objek instansiasi dari models Budget yang sudah dibuat. List ini akan ditambahkan dengan item baru ketika tombol submit ditekan.
- Membuat halaman untuk menampilkan data budget dengan mengambil list budget yang telah dibuat sebelumnya di halaman form. Halaman ini akan menampilkan judul, nominal, dan jenis dari item budget yang telah ditambahkan
