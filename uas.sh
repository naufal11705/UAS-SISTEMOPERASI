echo "1. Cek Direktori"
echo "2. Cari File"

read -p "Masukkan Pilihan: " pilihan
case "$pilihan" in
	1) 
		read -p "-> Masukkan Path Direktori Dari File: " path
		if [ -n "$path" ] && [ -d "$path" ]; then
			ls "$path"
			echo "$path - Tersedia"
		else
			echo "$path - Tidak Tersedia"
			echo "----------------------"
		fi
		;;

	2)
		echo "1. Direktori Spesifik"
		echo "2. Global"
		read -p "Masukkan Pilihan: " pilihan_cari
		case "$pilihan_cari" in
			1)
				read -p "-> Masukkan Path Direktori Dari File: " path
				read -p "-> Masukkan Nama File: " nama_file
				if [ -n "$path" ] && [ -d "$path" ]; then
					find "$path" -name "$nama_file"
				else
					echo "$path - Tidak Tersedia"
					echo "----------------------"
				fi
				;;
			2)
				read -p " -> Masukkan Nama File " file_name
				locate "$file_name"
				;;
		esac
		;;
		
		
esac


