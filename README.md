## 1. Perbedaan antara Linux Kernel dan Distro

**Kernel** adalah komponen inti dari sebuah sistem operasi komputer. Kernel menjadi penghubung antara perangkat lunak dan perangkat keras komputer. sedangkan **Distro** adalah sistem operasi komputer yang dibangun dengan Linux kernel sebagai fondasinya.

## 2. Penjelasan dan Contoh Kegunaan Linux FHS

FHS singkatan dari Filesystem Hierarchy Standard adalah standar yang mengatur tata letak folder dan file pada sistem operasi Linux agar tersusun rapi dan konsisten.

| Directory | Explanation                                                                           |
| --------- | ------------------------------------------------------------------------------------- |
| `/bin`    | Berisi program esensial                                                               |
| `/boot`   | Berisi file yang dibutuhkan saat proses booting, seperti kernel dan bootloader (GRUB) |
| `/dev`    | Berisi file device, representasi dari perangkat keras (disk, terminal, dll)           |
| `/etc`    | Berisi file konfigurasi sistem dan aplikasi                                           |
| `/home`   | Berisikan file milik user                                                             |
| `/lib`    | Berisi shared library yang dibutuhkan oleh binary di `/bin` dan `/sbin`               |
| `/media`  | storage untuk media removable seperti flashdisk atau CD                               |
| `/mnt`    | storage yang dipasang secara sementara atau manual                                    |
| `/opt`    | Tempat untuk software tambahan/pihak ketiga yang terpisah dari sistem paket utama     |
| `/root`   | Direktori home untuk user root                                                        |
| `/sbin`   | Berisi binary system untuk keperluan administrasi                                     |
| `/srv`    | Berisi data untuk service yang di-hosting sistem, misal data web server               |
| `/tmp`    | Tempat file sementara, biasanya dibersihkan otomatis saat reboot                      |
| `/usr`    | Berisi program, library, dan dokumentasi untuk semua user (bagian terbesar sistem)    |
| `/var`    | Berisi file tambahan atau pendukung                                                   |

## 3. Sistem Permission dan Owner pada Linux

Setiap file/direktori di Linux punya owner (user), group dan other, serta permission yang mengatur siapa boleh melakukan apa.

Permission terdiri dari 3 tipe: **read (r)**, **write (w)**, **execute (x)**, yang diterapkan ke 3 kategori user: **owner**, **group**, dan **others**.

Contoh representasi:

```
-rwxr-xr--
```

- `rwx` : owner (baca, tulis, eksekusi)
- `r-x` : group (baca, eksekusi)
- `r--` : others (baca saja)

Izin diberikan dengan 2 mode yaitu absolute mode dalam bentuk numerik (`r=4`, `w=2`, `x=1`):

```bash
chmod 754 file/folder
```

dan symbolic mode dalam bentuk simbol:

- Izin direpresentasikan dalam bentuk alfabet(`x`, `w`, `r`)
- Target perubahan direperesentasikan dalam bentuk alfabet (`u`, `g`, `o`, `a`)
- Modifikasi direpresentasikan dalam bentuk simbol aritmatika (`+`, `-`, `=`)

```bash
chmod x+u file/folder
```

Owner dan group bisa diubah dengan:

```bash
chown user:group file/folder
```

## 4. Perbedaan antara Bash, sh, dan Jenis-jenis Shell Lain

`sh` : sh adalah bourne shell paling dasar dan lama, shell ini didefinisikan oleh standar POSIX dan berfungsi sebagai spesifikasi untuk perilaku shell

`bash` : bash adalah bourne again shell dan juga merupakan shell unix. bash adalah perkembangan dari sh. bash menjadi shell default dari sebagian besar distro linux.

`zsh` : Zsh adalah shell Unix yang merupakan alternatif yang lebih baik dan lebih canggih daripada shell Bash. zsh menjadi shell default macOS

`fish` : Fish adalah lingkungan shell UNIX yang menekankan interaktivitas dan kemudahan penggunaan. Tidak seperti Zsh, Fish bertujuan untuk memberikan interaktivitas kepada pengguna secara default

## 5. Prinsip Enkripsi pada SSH

SSH menggunakan kombinasi beberapa jenis enkripsi untuk mengamankan koneksi:

1. **Asymmetric encryption** (public/private key) : metode enkripsi asimetris menggunakan 2 kunci, yang dikenal sebagai private key (yang berada di SSH server) dan public key (yang berada di SSH client). Data yang dipertukarkan dienkripsi dan hanya bisa dibuka menggunakan pasangan public key dan private key, dan tidak bisa menggunakan kunci yang lain.

2. **Symmetric encryption** : Metode enkripsi ini menggunakan satu kunci bersama (shared key) saat melakukan komunikasi. Kunci ini hanya dikenali antara SSH client dan SSH server yang saling berhubungan.

3. **Hashing** :  Teknik enkripsi hashing hanya berjalan satu arah sehingga tidak dapat di dekripsi. Teknik ini juga sering disebut sebagai one way hash. Sedangkan untuk enkripsi one way hash akan membuat enkripsi yang panjang, namun tidak memiliki pola yang jelas. Hal inilah yang membuat teknik enkripsi ini tidak dapat dieksploitasi. Memiliki Sistem Keamanan Yang Baik

## 6. Perbedaan antara HTTP dan HTTPS

**HTTP** (HyperText Transfer Protocol) adalah protokol untuk transfer data di web, tapi data dikirim dalam bentuk plain text (tidak terenkripsi), sehingga rawan disadap.

**HTTPS** (HTTP Secure) adalah HTTP yang dilapisi enkripsi TLS/SSL. Data yang dikirim antara client dan server dienkripsi, sehingga lebih aman dari penyadapan dan manipulasi data.

## 7. Docker OCI Compliance Standard

OCI (**Open Container Initiative**) adalah standar yang mengatur format image container dan runtime, supaya container bisa berjalan konsisten di berbagai platform/tools, tidak terkunci ke satu vendor saja.

OCI punya 2 spesifikasi utama:

- **Image Spec** : mendefinisikan format image container (layer, manifest, config), sehingga image yang dibuat Docker bisa dijalankan oleh runtime lain seperti Podman atau containerd.
- **Runtime Spec** : mendefinisikan bagaimana container dijalankan di level OS (filesystem, proses, namespace).

Docker sejak versi lama sudah OCI-compliant, artinya image yang dibuat dengan `docker build` mengikuti format OCI Image Spec, sehingga portable dan bisa dijalankan tools lain yang juga mendukung OCI.

## 8. Perbedaan antara Container dan VM

- **Container** : Berbagi kernel sistem operasi host. container tidak membutuhkan banya resource seperti virtual machine. Isolasi proses, tidak seketat VM

- **Virtual Machine** : Mengakses hardware komputer fisik melalui hypervisor. virtual machine biasanya memerlukan lebih banyak resource daripada container. Isolasi penuh VM memiliki OS sendiri

## 9. Definisi dan Manfaat Image Layer pada Docker

Docker image tersusun dari beberapa _layer_, di mana tiap instruksi di Dockerfile (`RUN`, `COPY`, `ADD`, dll) menghasilkan satu layer baru yang ditumpuk di atas layer sebelumnya.

Manfaatnya:

- **Caching** : kalau layer tidak berubah, Docker akan pakai cache saat build ulang, sehingga build jadi lebih cepat.
- **Efisiensi storage** : layer yang sama bisa dipakai bersama oleh beberapa image, jadi tidak duplikat data.
- **Efisiensi network** : saat pull/push image, hanya layer yang berubah saja yang perlu ditransfer, bukan seluruh image.

## 10. Kegunaan Docker Volume dan Network Beserta Contohnya

**Volume** digunakan untuk menyimpan data secara persisten di luar lifecycle container, karena data di dalam container akan hilang saat container dihapus.

Contoh:

```bash
docker volume create data-volume
docker run -v data-volume:/var/lib/data myimage
```

Data volume di atas tetap ada walau container-nya dihapus dan dibuat ulang.

**Network** digunakan agar antar container bisa saling berkomunikasi secara terisolasi dari luar.

Contoh:

```bash
docker network create mynet
docker run --network mynet --name mycontainer myimage
docker run --network mynet --name mycontainer1 myimage1
```

Dengan network yang sama, container `mycontainer` bisa akses `mycontainer1`.

## 11. Definisi dan Tujuan Penggunaan Web Server dan Reverse-Proxy

**Web server** adalah software yang bertugas menerima request HTTP/HTTPS dari client dan mengirim response, bisa berupa file statis (HTML, CSS, JS) atau hasil dari aplikasi backend. 

Tujuan penggunaan web server:

- **Menyajikan konten** : melayani file statis (HTML, gambar, video) maupun konten dinamis hasil pemrosesan aplikasi backend kepada client
- **Menangani banyak request secara bersamaan** : dirancang untuk melayani ribuan koneksi klien secara paralel tanpa saling mengganggu
- **Logging dan monitoring** : mencatat access log dan error log untuk keperluan analisis trafik, debugging, serta deteksi aktivitas mencurigakan

Contoh: Nginx, Apache.

**Reverse-proxy** adalah server yang berada di depan satu atau lebih server backend, menerima request dari client lalu meneruskannya ke server yang sesuai di belakangnya.

Tujuan penggunaan reverse-proxy:

- **Load balancing** : membagi traffic ke beberapa instance backend agar beban merata
- **SSL termination** : menangani enkripsi HTTPS di satu titik, backend cukup pakai HTTP biasa
- **Keamanan** : menyembunyikan struktur/IP asli server backend dari client

Contoh tools: Nginx
