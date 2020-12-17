#include <efi.h>
#include <efilib.h>

EFI_STATUS EFIAPI efi_main(EFI_HANDLE Handle, EFI_SYSTEM_TABLE* SystemTable){
    InitializeLib(Handle, SystemTable);
    Print(L"Hello, World!\r\n");
    for(;;){
        continue;
    }
    return EFI_SUCCESS;
}