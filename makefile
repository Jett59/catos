efi/boot/BOOTX64.EFI: boot.efi
	mkdir -p efi/boot
	mv boot.EFI efi/boot/BOOTX64.EFI

boot.efi: boot.o
	clang \
	--target=x86_64-unknown-windows \
	-nostdlib \
	-Wl,-entry:efi_main \
	-Wl,-subsystem:efi_application \
	-fuse-ld=lld \
	*.o
	mv a.* boot.efi

boot.o:
	clang \
	--target=x86_64-unknown-windows \
	-ffreestanding \
	-fshort-wchar \
	-mno-red-zone \
	-c *.c
