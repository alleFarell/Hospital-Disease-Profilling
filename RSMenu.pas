Program tubes;
uses crt;
const line = '=====================================================';
Type
  pasien = record
  id : string;
  usia: integer;
  sakit: string;
  jenis: string;
end;
///
Type
  penyakit = record
  tipe : string;
  nama : string;
end;

Type ArrPenyakit = array[1..20] of penyakit;
Type ArrPasien = array [1..20] of pasien;
Type ArrHitung = array [1..20] of integer;
Var {Variable Global}
  TabPasien : arrpasien;
  TabPenyakit: ArrPenyakit;
  hitungSakit : ArrHitung;
  N, Np : integer;
  Pilihan : integer;
  ///
  Procedure Judul();
    begin
      clrscr;
      textcolor(10);
      writeln('``````````````````````````````````````````````````````````````````````````````````````````````````');
      writeln('                                          Sickness Profilling                                     ');
      writeln('                                            Creadted By MFA.                                      ');
      writeln('..................................................................................................');
      writeln;
    end;
  ///
  Procedure IsiPenyakit (Np : integer; var TabPenyakit:arrPenyakit);  {Tugas Nomor 1}
  {
  IS tersedia array tabpenyakit 
  FS array tabpenyakit terisi sepanjnag N
}
    var
      i : integer;
    begin
      writeln;
      writeln('Database Penyakit');
      write(line);
      for i := 1 to Np do
      begin
        writeln;
        writeln('Penyakit ',i);
        write('Input tipe penyakit(bawaan/degeneratif): ');
        readln(tabPenyakit[i].tipe);
        write('Input Nama Penyakit: ');
        readln(TabPenyakit[i].nama);
        write(line);
      end;
    end;
  ///
  Procedure isiData(N : integer; var tabpasien : arrpasien); {Tugas Nomor 1}
  {
  IS Tersedia array TabPasien
  FS array tabPasien terisi sepanjang N
}
    var
      i : integer;
    begin
      writeln;
      writeln('Database Pasien');
      write(line);
      for i := 1 to n do
      begin
        writeln;
        writeln('Data Pasien ',i);
        write('Input ID: ');
        readln(TabPasien[i].id);
        write('Input Usia: ');
        readln(TabPasien[i].usia);
        write('Input Nama Penyakit: ');
        readln(TabPasien[i].sakit);
        write(line);
      end;
    end;
  ///
  Procedure isiTipe(N, NP : integer; var tabpasien: arrpasien; tabpenyakit:arrPenyakit); 
  {
  IS tersedia Tabpenyakit dan Tabpasien yang telah terisi sepanjang N
  FS mengisi Tabpasien.jenis sesuai dengan tabpenyakit.tipe
}
    var
      i, j : integer;
    begin
      for i:= 1 to N do
        for j :=1 to NP do
          if (tabpasien[i].sakit = tabpenyakit[j].nama) then
            tabpasien[i].jenis := tabpenyakit[j].tipe
    end;
  ///
 Procedure Hitung5besar (var tabpasien:arrpasien; tabpenyakit : arrPenyakit; var hitungsakit:ArrHitung; N : integer); {Tugas Nomor 2}
 {
  Menghitung Banyak penyakit
}
    var
      i, j, z : integer;
    begin
      for i:= 1 to Np do
      z := 0;
        for j:= 1 to N do
          if TabPenyakit[i].nama = TabPasien[j].sakit then
            z := z + 1;
          hitungsakit[i] := z;
    end;
  ///
  Procedure Sort5Besar (var tabPenyakit:arrPenyakit; var hitungsakit:ArrHitung; N : integer); {Tugas Nomor 2}
  {
  mengurutkan nama penyakit yang terbanyak di derita pasien
}
    var
      pass, max, i : integer;
      tmp: string;
      tmp2 : integer;
    begin
      for pass:= 1 to N-1 do
      begin
        max := pass;
        for i:=pass + 1 to N do
          if (hitungsakit[max] > hitungsakit[i]) then
            max := i;
        ///
        tmp2 := hitungsakit[max];
        hitungsakit[max] := hitungsakit[i];
        hitungsakit[i] := tmp2;
        ///
        tmp := TabPenyakit[max].nama;
        TabPenyakit[max].nama := TabPenyakit[i].nama;
        TabPenyakit[i].nama := tmp;
      end;
    end;
  ///  
  Function CountDeg(tabPasien: arrpasien; TabPenyakit: ArrPenyakit; N: integer): integer;  {Tugas Nomor 3}
  {Mencari kemudian Menghitung banyaknya pasien penyakit degeneratif < 50 tahun}
    var
      i, j, sum : integer;
    begin
      sum := 0;
      for i := 1 to N do
        for j := 1 to N do
          begin
            if(TabPasien[i].sakit = TabPenyakit[j].nama) and (tabpenyakit[j].tipe = 'degeneratif') and (TabPasien[i].Usia < 50 ) then
              sum := sum + 1;
          end;
      CountDeg := sum;
    end;
///
  Function CountBawaan(tabPasien: arrpasien; TabPenyakit: ArrPenyakit; N: integer): integer; {Tugas Nomor 4}
  {Mencari kemudian Menghitung Banyaknya Pasien yang menderita penyakit Bawaan}
    var
      i, j, sum : integer;
    begin
      sum := 0;
      for i := 1 to N do
        for j := 1 to N do
          begin
            if(TabPasien[i].sakit = TabPenyakit[j].nama) and (tabpenyakit[j].tipe = 'bawaan') then
              sum := sum + 1;

          end;
      CountBawaan := sum;
    end;
  ///
  Procedure SortAge(var tabpasien: arrpasien; N: integer); {Tugas Nomor 5}
  {
  IS tersedia array Tabpasein yang telah terisi
  FS Menampilkan data pasien sesuai dengan urutan usia tertua hingga termuda
}
    var
      pass, max, i : integer;
      tmp: pasien;
    begin
      for pass:= 1 to N-1 do
      begin
        max := pass;
        for i:=pass + 1 to N do
          if (tabPasien[i].usia > TabPasien[max].usia) then
            max := i;
        tmp.id := tabPasien[max].id;
        tabPasien[max].id := tabPasien[pass].id;
        tabpasien[pass].id := tmp.id;
        ///
        tmp.usia := tabPasien[max].usia;
        tabPasien[max].usia := tabPasien[pass].usia;
        tabpasien[pass].usia := tmp.usia;
        ///
        tmp.sakit := tabPasien[max].sakit;
        tabPasien[max].sakit := tabPasien[pass].sakit;
        tabpasien[pass].sakit := tmp.sakit;
        ///
        tmp.jenis := tabPasien[max].jenis;
        tabPasien[max].jenis := tabPasien[pass].jenis;
        tabpasien[pass].jenis := tmp.jenis;
      end;

    end;
  ///
  Procedure cetakSortAge(tabpasien: arrpasien; n: integer); {cetak Tugas Nomor 5}
  {
  IS tersedia array tabpasien yang telah terurut berdasarkan usia
  FS mencetak semua data pada array tabPasien}
    var
      i : integer;
    begin
      i := 1;
      writeln;
      writeln('Hasil Urut Berdasarkan Usia Pasien');
      repeat
        writeln('id Pasien: ',tabpasien[i].id);
        writeln('Usia Pasien: ',tabpasien[i].usia);
        writeln('Penyakit Pasien: ',tabpasien[i].sakit);
        writeln;
        i := i + 1;
      until(i > n);
    end;
  ///  
 Procedure Cetak5besar(hitungsakit: ArrHitung; N: integer); {cetak tugas nomor 2}
 {
  Melakukan pencetakan penyakit 5 besar
}
    var
      i :integer;
    begin
      writeln;
      for i:= 1 to N do
      begin
        writeln('Penyakit: ',hitungsakit[i]);
      end;
    end;
///
Procedure CariID (tabPasien:arrpasien; N : integer); {Tugas Tambahan Nomor 6}
  {
  IS tersedia array tabpasien sepanjang N
  PROSES Melakukan pencarian data berdasarkan ID Pasien
  FS Menampilkan data pasien yang di cari jika di temukan
}
  var
    i : integer;
    x : string;
    cek : boolean;
  begin
    i := 1;
    cek := false;
    write('Masukkan ID yang dicari: ');
    readln(X);
    repeat
      if tabpasien[i].id = x then
        begin
          writeln('Id ditemukan');
          writeln(line);
          writeln('ID pasien yang dicari: ',tabPasien[i].id);
          writeln('Usia Pasien yang dicari: ',tabpasien[i].usia);
          writeln('Penyakit Pasien yang dicari: ',tabPasien[i].sakit);
          writeln('Termasuk Golongan Penyakit: ',tabPasien[i].jenis);
          writeln(line);
          cek := true;
        end
      else
        i := i + 1;
    until(i>N) or (cek = true);
    if not cek then
      writeln('ID Tidak Ditemukan');
  end;

///
Procedure menu();
  {
  IS -
  FS Menampilkan Menu yang dapat dipilih oleh user untuk dijalankan
}
  begin
    Judul;
    writeln('  (1) Input Database Penyakit                                                             ');
    writeln('  (2) Input Database Pasien                                                               ');
    writeln('  (3) Tampilkan Jumlah Pasien penderita penyakit degeneratif dengan usia <50 tahn         ');
    writeln('  (4) Tampilkan Jumlah Pasein Penderita Penyakit Bawaan                                   ');
    writeln('  (5) Urut Pasien Berdasarkan Usia tertua                                                 ');
    writeln('  (6) Tampilkan 5 Penyakit Terbanyak Diderita Pasien                                      '); 
    writeln('  (7) Cari Data Pasien Berdasarkan ID                                                     ');
    writeln('  (0) Exit                                                                                '); 
    write('Input Menu Pilihan: '); 
    readln(pilihan);
    case pilihan of
      1 : begin
            Judul;
            write('Masukkan Jumlah Data Penyakit: ');
            readln(np);
            isiPenyakit(np,tabpenyakit);
            write('Tekan <ENTER> Untuk Kembali');
            readln;
          end;
      2 : begin
             Judul;
             write('Masukkan banyak pasien: ');
             readln(n);
             isiData(N, tabPasien);
             isiTipe(n,np,tabpasien,tabpenyakit);
             write('Tekan <ENTER> Untuk Kembali');
            readln;
          end;
      3 : begin
            Judul;
            writeln('Jumlah Pasien Penderita Penyakit Degeneratif dengan usia (<50 tahun): ',CountDeg(tabPasien,Tabpenyakit,n),' Pasien');
            write('Tekan <ENTER> Untuk Kembali');
            readln;
          end;
      4 : begin
            Judul;
            writeln('Jumlah Pasien Penderita Penyakit Bawaan: ',CountBawaan(TabPasien,TabPenyakit,n),' Pasien');  
            write('Tekan <ENTER> Untuk Kembali');
            readln;
          end;
      5 : begin
            judul;
            SortAge(tabpasien,N);
            cetakSortAge(tabpasien,N);  
            write('Tekan <ENTER> Untuk Kembali');
            readln;
          end;
      6 : begin
            judul;
            Hitung5besar(tabpasien, tabpenyakit,hitungSakit,N);
            Sort5Besar(tabPenyakit,hitungSakit,N);
            Cetak5besar(hitungSakit,N);
            write('Tekan <ENTER> Untuk Kembali');
            readln;
          end;
      7 : begin
            judul;
            cariID(tabpasien,N);
            write('Tekan <ENTER> Untuk Kembali');
            readln;
          end;
    end;

  end;
///
begin {Program Utama}
  repeat
    menu;
  until (pilihan = 0);
end.
