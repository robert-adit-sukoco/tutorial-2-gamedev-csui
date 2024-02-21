# Tutorial 2 GameDev - Fasilkom UI 2023/2024 (Genap)

### Robertus Aditya Sukoco - 2006523016

## Playtest

1. Apa saja pesan log yang dicetak pada panel Output?
> Jawaban: Saat game dimulai, `"Platform Initialized!"` tercetak pada output.

2. Coba gerakkan landasan ke batas area bawah, lalu gerakkan kembali ke atas hingga hampir menyentuh batas atas. Apa saja pesan log yang dicetak pada panel Output?
> Jawaban: Saat pesawat mencapai batas atas, output mencetak pesan `"Reached objective!"`. Namun, saat pesawat melewati batas bawah, tidak ada yang tercetak pada output.

3. Buka scene `MainLevel` dengan tampilan workspace 2D. Apakah lokasi scene `ObjectiveArea` memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya?
> Jawaban: `ObjectiveArea` memiliki script yang mencetak "Reached objective!" saat entitas `BlueShip` memasuki `ObjectiveArea`. Berikut adalah script nya
 ```
extends Area2D

func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if (body.name == "BlueShip"):
		print("Reached objective!")
```

## Memanipulasi Node dan Scene

1. Scene BlueShip dan StonePlatform sama-sama memiliki sebuah child node bertipe `Sprite`. Apa fungsi dari node bertipe `Sprite`?
> Jawaban: <i>Sprite</i> adalah gambar atau animasi yang "menempel" pada suatu entitas atau lingkungan dalam sebuah video game. Pada entitas `BlueShip`, gambar dari pesawat luar angkasa adalah sebuah <i>sprite</i>, begitu juga pada gambar platform pada `StonePlatform`.
2. <i>Root node</i> dari scene `BlueShip` dan `StonePlatform` menggunakan tipe yang berbeda. `BlueShip` menggunakan tipe `RigidBody2D`, sedangkan `StonePlatform` menggunakan tipe `StaticBody2D`. Apa perbedaan dari masing-masing tipe node?
> Jawaban: `RigidBody2D` adalah <i>class</i> yang pergerakannya dapat dipengaruhi oleh <i>physics</i> yang terdapat dalam game tersebut, sedangkan `StaticBody2D` adalah <i>class</i> yang tidak bisa digerakan lewat <i>physics</i>, namun tentu saja tetap bisa digerakkan melalui <i>script</i>.
3. Ubah nilai atribut Mass dan Weight pada tipe RigidBody2D secara bebas di scene BlueShip, lalu coba jalankan scene MainLevel. Apa yang terjadi?
> Jawaban: Nilai <i>weight</i> adalah `mass * gravity`, dan 9.8 adalah nilai <i>gravity</i> secara default. Sehingga, jika <i>mass</i> diubah maka nilai weight akan mengikuti, begitu juga sebaliknya jika nilai <i>gravity</i> diubah.
4. Ubah nilai atribut <i>Disabled</i> pada tipe `CollisionShape2D` di scene `StonePlatform`, lalu coba jalankan scene `MainLevel`. Apa yang terjadi?
>Jawaban: `StonePlatform` tidak akan menabrak `BlueShip`, sehingga `BlueShip` akan terjatuh dan melewati `StonePlatform`.
5. Pada scene `MainLevel`, coba manipulasi atribut Position, Rotation, dan <i>Scale</i> milik node `BlueShip` secara bebas. Apa yang terjadi pada visualisasi BlueShip di Viewport?
> Jawaban: Posisi `BlueShip` akan berubah saat nilai <i>position</i> diubah, `BlueShip` akan berputar sesuai <i>rotation</i>. <i>Scale</i> akan mengubah ukuran `BlueShip`.
6. Pada scene MainLevel, perhatikan nilai atribut Position node `PlatformBlue`, `StonePlatform`, dan `StonePlatform2`. Mengapa nilai Position node `StonePlatform` dan `StonePlatform2` tidak sesuai dengan posisinya di dalam scene (menurut Inspector) namun visualisasinya berada di posisi yang tepat?
> Jawaban: Karena `StonePlatform` dan `StonePlatform2` merupakan child dari Node2D, sehingga posisi mereka adalah posisi relatif mereka dari `Node2D`. 