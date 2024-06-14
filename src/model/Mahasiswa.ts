export class Mahasiswa {
  public npm: string
  public nama: string
  public ipk: number

  constructor(npm: string, nama: string, ipk: number) {
    this.npm = npm
    this.nama = nama
    this.ipk = ipk
  }
}

// tugas jika subkit menjadi kosong, maksimal ipk 0-4 jika berlebih Data IPK tidak sesuai,
