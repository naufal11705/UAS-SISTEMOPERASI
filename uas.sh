clipboard_file="$HOME/.clipboard_history"

while true; do
	echo "============================"
	echo "Clipboard Manager"
	echo "============================"
	echo "1. Simpan teks ke clipboard"
	echo "2. Tampilkan riwayat clipboard"
	echo "3. Copy dari clipboard"
	echo "4. Hapus item tertentu dari riwayat clipboard"
	echo "5. Hapus semua riwayat clipboard"
	echo "6. Atur lokasi penyimpanan clipboard"
	echo "7. Keluar"
	echo "============================"

	read -p "Masukkan Pilihan: " pilihan

	echo "============================"
	case "$pilihan" in
	    1)
		read -p "Masukkan teks untuk disimpan ke clipboard: " clipboard_text
		echo "$clipboard_text" | xclip -selection clipboard
		echo "$clipboard_text" >> "$clipboard_file"
		echo "Teks disimpan ke clipboard dan riwayat."
		;;

	    2)
		cat -n "$clipboard_file"
		;;

	    3)
		cat -n "$clipboard_file"
		read -p "Masukkan nomor baris untuk disalin dari riwayat: " line_number
		clipboard_text=$(sed "${line_number}q;d" "$clipboard_file")
		echo "$clipboard_text" | xclip -selection clipboard
		echo "Disalin ke clipboard: $clipboard_text"
		;;

	    4)
		cat -n "$clipboard_file"
		read -p "Masukkan nomor baris untuk dihapus dari riwayat: " line_number
		sed -i "${line_number}d" "$clipboard_file"
		echo "Item dihapus dari riwayat."
		;;

	    5)
		> "$clipboard_file"
		echo "Semua riwayat clipboard dihapus."
		;;

	    6)
	    	read -p "Masukkan lokasi baru untuk penyimpanan clipboard: " new_location
	    	if [ ! -d "$(dirname "$new_location")" ]; then
			mkdir -p "$(dirname "$new_location")"
	    	fi
	    	clipboard_file="$new_location"
	    	echo "Lokasi penyimpanan clipboard telah diatur ke $clipboard_file"
		;;
		
	    7)
		echo "Keluar dari program."
		break
		;;

	    *)
		echo "Pilihan tidak valid!"
		;;
	esac
	echo "Tekan enter untuk kembali ke menu utama..."
        read
done

