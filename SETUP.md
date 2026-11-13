# CSE 4502 OS Lab: setup on Windows 10 / 11 (WSL 2)

On Windows you work inside **WSL 2**, which runs a real Ubuntu Linux system
next to Windows. Do **not** unpack or build the project in Windows itself:
unpack it inside Ubuntu, as described below.

## 1. Install WSL 2 with Ubuntu

Open **PowerShell as administrator** and run:

```
wsl --install -d Ubuntu-24.04
```

Restart the computer when asked. Then open the **Ubuntu** app from the Start
menu; on the first start it asks you to choose a Linux user name and password.

## 2. Install unzip

In the Ubuntu terminal:

```
sudo apt update
sudo apt install unzip
```

## 3. Unpack the archive inside Linux

Your Windows Downloads folder is visible in Ubuntu under `/mnt/c/Users/`.
Replace `YourWindowsName` with your Windows user name:

```
mkdir -p ~/os-lab
cd ~/os-lab
unzip /mnt/c/Users/YourWindowsName/Downloads/CSE4502_OS_Lab_Winter2025-26_Windows-WSL.zip
cd CSE4502_OS_Lab
```

Keep the project in the Linux home directory (`~/os-lab`), not under
`/mnt/c/`: building on the Windows drive is very slow and loses file
permissions.

## 4. Install the tools

```
bash setup.sh
```

The script installs GCC with 32-bit support, GDB, GNU Make, Python 3, QEMU and
Git, and checks the result.

## 5. Check that everything works

```
cd mcertikos
make LAB=1 TEST=1
```

You should see `LAB 1 RESULT: 0 / 3 test groups passed.` (the tests fail
until you write the Lab 1 code). Exit QEMU with **Ctrl-a**, then **x**.
Use `make qemu-nox` (not `make qemu`) to run the kernel in the terminal.

## Speed: KVM in WSL 2

Windows 11 usually gives WSL 2 hardware acceleration (`/dev/kvm`); the setup
script reports whether it is available. Without it, QEMU emulates the CPU:
everything works, but tests take longer. To enable it, turn on
virtualization (Intel VT-x / AMD-V) in the BIOS/UEFI settings and add this to
`C:\Users\YourWindowsName\.wslconfig`, then run `wsl --shutdown`:

```
[wsl2]
nestedVirtualization=true
```

## Editing the code

Visual Studio Code with the **WSL** extension opens the Linux folder
directly: in the Ubuntu terminal, run `code .` inside `mcertikos`.

## Contents

- `mcertikos/`: the project you work on for the whole course
- `CSE4502_Lab_Handout_Book.pdf`: the lab handout (Chapter 2 covers setup;
  Appendix A covers troubleshooting)
